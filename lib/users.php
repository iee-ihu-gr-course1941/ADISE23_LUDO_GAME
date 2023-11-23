<?php
require_once "../lib/game.php"; 
 


function show_users() {
	global $mysqli;
	$sql = 'select username,piece_color from players';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
} 
 

function show_user($b) {
	global $mysqli;
	$sql = 'select username,piece_color from players where piece_color=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('s',$b);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}


function set_user($b, $input) {
	// print_r($input);
	if (!isset($input['username']) || $input['username'] == '') {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg' => "No username given."]);
		exit;
	}
	
    $username = $input['username'];
	global $mysqli;
 
// Start a transaction
    $mysqli->begin_transaction();

    try {
        // Check if the player is already set
	$sql = 'select count(*) as c from players where piece_color=? and username is not null';
	$st = $mysqli->prepare($sql);
	$st->bind_param('s', $b);
	$st->execute();
	$res = $st->get_result();
	$r = $res->fetch_all(MYSQLI_ASSOC);
	
        if ($r[0]['c'] > 0) {
		throw new Exception("Player $b is already set. Please select another color.");
		}

        // Update the player's information
	$sql = 'update players set username=?, token=md5(CONCAT( ?, NOW()))  where piece_color=?';
	$st2 = $mysqli->prepare($sql);
	$st2->bind_param('sss', $username, $username, $b);
	$st2->execute();

// Fetch the player's details
	$sql = 'select * from players where piece_color=?';
	$st3 = $mysqli->prepare($sql);
	$st3->bind_param('s', $b);
	$st3->execute();
	$res = $st3->get_result();

        // Commit the transaction
        $mysqli->commit();
		header('HTTP/1.1 200 OK');
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
	} catch (Exception $e) {
        // Roll back the transaction on error
        $mysqli->rollback();
	
// Return an error response
        header("HTTP/1.1 400 Bad Request");
        print json_encode(['errormesg' => $e->getMessage()]);
    }
}

function handle_user($method, $b,$input) {
	if($method=='GET') {
		show_user($b);
	} else if($method=='PUT') {
        set_user($b,$input);
    } 	else{
		//header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"handle_user"]);}
}

function reset_players(){
	global $mysqli;

    $sql = 'call clean_players()';
    $mysqli->query($sql);
show_users();
}


?>