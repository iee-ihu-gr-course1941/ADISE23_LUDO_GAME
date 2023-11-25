<?php
 // $sql = 'call clean_board()';



function show_piece($x,$y) {
	global $mysqli;
	
	$sql = 'select * from board where x=? and y=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('ii',$x,$y);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function move_piece($x,$y,$x2,$y2,$token) {
	//ελεγχος αν εχει στειλει token ο χρηστης
	if($token==null || $token=='') {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"token is not set."]);
		exit;
	}
	
//current_color -> βρισκεται στo users.php
//επιστρεφει το row του χρωματος εαν υπαρχει
	$color = current_color($token);
	if($color==null ) {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"You are not a player of this game."]);
		exit;
	}

	//το στατους πρεπει να ναι started για να γινει μια κινηση
	//read_status()->βρισκεται στο game.php και επιστρεφει το status
		$status = read_status();
	if($status['status']!='started') {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"Game is not in action."]);
		exit;
	}

//εαν το p_turn δε ταιριαζει με το χρωμα του παικτη επιστρεφω μνμα λαθους
	if($status['p_turn']!=$color) {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"It is not your turn."]);
		exit;
	}
//	$orig_board=read_board();
///	$board=convert_board($orig_board);

//ελεγχος κινησεων του συγκεκριμενου πιονιου(για n=0->πιονι δε μπορει να κινηθει)
//add_valid_moves_to_piece->θα προσθεσω στο πινακα τις νομιμες κινησεις του καθε πιονιου και ελεγχω
//εαν ναι τοτε do move
//	$n = add_valid_moves_to_piece($board,$color,$x,$y);

	//if($n==0) {
//		header("HTTP/1.1 400 Bad Request");
//		print json_encode(['errormesg'=>"This piece cannot move."]);
//		exit;
//	}
//	foreach($board[$x][$y]['moves'] as $i=>$move) {
	//	if($x2==$move['x'] && $y2==$move['y']) {
	 //	do_move($x,$y,$x2,$y2);
		 do_move_yellow();
	 	show_board();	
		exit;
	//	}
//	}
 	header("HTTP/1.1 400 Bad Request");
 	print json_encode(['errormesg'=>"This move is illegal."]);
 	exit;
	// do_move($x,$y,$x2,$y2);
	// show_board();
}

function do_move($x,$y,$x2,$y2) {
	global $mysqli;

	$sql = 'call move_piece(?,?,?,?)';
	$st = $mysqli->prepare($sql);
	$st->bind_param('iiii',$x,$y,$x2,$y2 );
	$st->execute();
//header("HTTP/1.1 200 OK.");
	//print json_encode(['errormesg'=>"INSIDE DO MOVE."]);
	//header('Content-type: application/json');
	//print json_encode(read_board(), JSON_PRETTY_PRINT);
	// show_board();
}

function do_move_yellow() {
	global $mysqli;
	// Assuming you have a database connection in $conn
$sql = "CALL move_y_path()";
$mysqli->query($sql);
show_board();

	 
}
  

function show_board(){
  global $mysqli;

  $sql = 'select * from board';
  $st = $mysqli -> prepare($sql);

  $st -> execute();
  $res = $st -> get_result();

  header('Content-type: application/json');
  print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}



//ελεγχος ποιος χρηστης μας ζηταει το Board & ποιος εχει σειρα να παιξει
function show_board_by_player($b) {

	global $mysqli;

	//orig_board->ολος ο πινακας απο την βαση(read_board: select * from board)
	$orig_board=read_board();
	$board=convert_board($orig_board);
	$status = read_status();
	//p_turn=$b -> ειναι η σειρα του παικτη που εκανε την αιτηση να παιξει
	if($status['status']=='started' && $status['p_turn']==$b && $b!=null) {
		// It my turn !!!!
		$n = add_valid_moves_to_board($board,$b);
		
		// Εάν n==0, τότε έχασα !!!!!
		// Θα πρέπει να ενημερωθεί το game_status.
	}
	header('Content-type: application/json');
	print json_encode($orig_board, JSON_PRETTY_PRINT);
}
function add_valid_moves_to_piece(&$board,$b,$x,$y) {
	$number_of_moves=0;
	//ελεγχος εαν το χρωμα του πιονιου ανηκει στον παικτη που κανει την κινηση
	if($board[$x][$y]['piece_color']==$b) {
		switch($board[$x][$y]['piece']){
			case 'Y1': $number_of_moves+=pawn_moves($board,$b,$x,$y);break;
			case 'Y2': $number_of_moves+=king_moves($board,$b,$x,$y);break;
			case 'Y3': $number_of_moves+=queen_moves($board,$b,$x,$y);break;
			case 'Y4': $number_of_moves+=rook_moves($board,$b,$x,$y);break;
			case 'R1': $number_of_moves+=knight_moves($board,$b,$x,$y);break;
			case 'R2': $number_of_moves+=bishop_moves($board,$b,$x,$y);break;
			case 'R3': $number_of_moves+=bishop_moves($board,$b,$x,$y);break;
			case 'R4': $number_of_moves+=bishop_moves($board,$b,$x,$y);break;
		}
	} 
	return($number_of_moves);
}

//call by reference: τα στοιχεια του νεου πινακα δεν υπαρχουν στην πραγματικοτητα σαν obj
//δειχνουν στην αντιστοιχη θεση του αρχικου πινακα
function convert_board(&$orig_board) {
	$board=[];
	foreach($orig_board as $i=>&$row) {
		$board[$row['x']][$row['y']] = &$row;
	} 
	return($board);
}


function reset_board(){
  global $mysqli;

  $sql = 'call clean_board()';
  $mysqli->query($sql);
  show_board();
} 

function read_board() {
	global $mysqli;
	$sql = 'select * from board';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	return($res->fetch_all(MYSQLI_ASSOC));
}
 
?>