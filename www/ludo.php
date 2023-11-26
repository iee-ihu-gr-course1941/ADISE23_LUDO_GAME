<?php

//ludo.php dilosh path me ton server


//print_r("HERE!!!!!!");
require_once "../lib/dbconnect.php";
require_once "../lib/board.php";
require_once "../lib/game.php"; 
require_once "../lib/users.php";
 

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
// $request = explode('/', trim($_SERVER['SCRIPT_NAME'],'/'));
// Σε περίπτωση που τρέχουμε php –S 
$input = json_decode(file_get_contents('php://input'),true);
if($input==null) {
    $input=[];
}
if(isset($_SERVER['HTTP_X_TOKEN'])) {
    $input['token']=$_SERVER['HTTP_X_TOKEN'];
} else {
    $input['token']='';
}

// print_r($request );

 switch ($r=array_shift($request)) {
    case 'board' :
	switch ($b=array_shift($request)) {
		case '': 
		case null: handle_board($method);break;
 	case 'piece': handle_piece($method, $request[0],$request[1],$input);
 				break;
	// case 'player': handle_player($method, $request[0],$input);
					//break;
					default: header("HTTP/1.1 404 Not Found");
                            break;
			
 
	}
		break;
	case 'status': 
		if(sizeof($request)==0) {handle_status($method);}
		else {header("HTTP/1.1 404 Not Found");}
		break;
 	case 'players': handle_player($method, $request,$input);
  			break;
	case 'delete_players': handle_delete_players($method);
	break;
	 case 'roll': 
	 switch ($b=array_shift($request)) {
		case 'Y': handle_roll_Y($method);
		//case 'R':handle_roll_R($method);
	break;}
	break;
	//case 'move_y':handle_move_y($method);
   // default: 	
	header("HTTP/1.1 404 Not Found");
    print "<h1>not FOUND</h1>";
	exit;
}


function handle_delete_players($method) {
    if($method=='GET') {
		header('HTTP/1.1 405 Method Not Allowed');
    } else if ($method=='POST') {
		reset_players();
    }  else {header('HTTP/1.1 405 Method Not Allowed');}
    
}
 function handle_roll_Y($method) {
    if($method=='GET') {
		roll_dice_Y1();
 
     }    else {header('HTTP/1.1 405 Method Not Allowed');}
    
 }
 function handle_roll_R($method) {
    if($method=='GET') {
 		roll_dice_R();
 
     }    else {header('HTTP/1.1 405 Method Not Allowed');}
    
 }
 
 
 

function handle_board($method) {
    if($method=='GET') {
            show_board();
    } else if ($method=='POST') {
		reset_board();
    } else {
        header('HTTP/1.1 405 Method Not Allowed');
    }
    
}

function handle_piece($method, $x,$y,$input) {
	if($method=='GET') {
		show_piece($x,$y);
	} else if ($method=='PUT') {
		move_piece($x,$y,$input['x'],$input['y'],  
				   $input['token']);
	}    


}
function handle_player($method, $p,$input) {
    switch ($b=array_shift($p)) {
	 	//case '':
	 //case null: if($method=='GET') {show_users($method);}
	 	//		   else {header("HTTP/1.1 400 Bad Request"); 
 		//			 print json_encode(['errormesg'=>"Method $method not allowed here."]);}
   
		
		
		          
        case 'R':  handle_user($method, $b,$input);
		break;
			case 'B':  handle_user($method, $b,$input);
			break;
		case 'G':  handle_user($method, $b,$input);
		break;
			case 'Y': handle_user($method, $b,$input);
					break;
		default: header("HTTP/1.1 404 Not Found");
				 print json_encode(['errormesg'=>"Player $b not found."]);
                 break;
	}
}


function handle_status($method) {
    if($method=='GET') {
        show_status();
    } else {
        header('HTTP/1.1 405 Method Not Allowed');
    }
}
?>