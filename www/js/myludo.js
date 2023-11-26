var me={token:null,piece_color:null};
var game_status={};
var board={};
var last_update=new Date().getTime();
var timer=null;


$(function(){
    draw_empty_board();
    fill_board();

    $('#ludo_login').click(login_to_game);
    $('#ludo_reset').click(reset_board);
    $('#players_reset').click(reset_players);


    $('#do_move').click(do_move);
    $('#move_div').hide();
    $('#do_move_roll').click(roll_dice);
    $('#move_div_roll').hide();
});



 
 function reset_players() {
    
        // Send an AJAX request to the server to update the database
        $.ajax({
            url: 'ludo.php/delete_players/', // Adjust the path to your server-side script
            method: 'POST',
dataType: "json",
         
            contentType: 'application/json',
            data: { action: 'reset_players' }, // Pass the action as part of the data
            success: function(response) {
                // Handle the response from the server
                alert('js Database updated successfully!');
            },
            error: function() {
                alert('js Error occurred while updating the database.');
            }
        });
    // game_status_update();

    } 
 

function draw_empty_board(p) {
    if(p!='B'||p!='R'||p!='G') {p='Y';}
	var draw_init = {
		'Y': {i1:11,i2:0,istep:-1,j1:1,j2:12,jstep:1},
		'B': {i1:1,i2:12,istep:1, j1:11,j2:0,jstep:-1}
	};
	var s=draw_init[p];

    var t = '<table id="ludo_table">';

    for(var i=s.i1;i!=s.i2;i+=s.istep) {
		t += '<tr>';
		for(var j=s.j1;j!=s.j2;j+=s.jstep) {
                    t += '<td class="ludo_square" id="square_' + j + '_' + i + '">' + j + ',' + i + '</td>';
        }
        t += '</tr>';
    }
    t += '</table>';

    $('#ludo_board').html(t);
}

 
function fill_board() {
	$.ajax({url: "ludo.php/board/", 
		headers: {"X-Token": me.token},
		success: fill_board_by_data });
}

function reset_board() {
	$.ajax({url: "ludo.php/board/", headers: {"X-Token": me.token}, method: 'POST',  success: fill_board_by_data });
	$('#move_div').hide();
    $('#move_div_roll').hide(); 
	$('#game_initializer').show(2000);
}

function fill_board_by_data(data) {
    board=data;
    for(var i=0;i<data.length;i++) {
		var o = data[i];
		var id = '#square_'+ o.x +'_' + o.y;
		var c = (o.piece!=null)?o.piece_color + o.piece:'';
		var pc= (o.piece!=null)?'piece'+o.piece_color:'';
		var im = (o.piece!=null)?'<img class="piece '+pc+'" src="images/'+c+'.png">':'';
		$(id).addClass(o.b_color+'_square').html(im);}
    }
    
    function login_to_game() {

        if($('#username').val()=='') {
            alert('You have to set a username');
            return;
        }
        var p_color = $('#pcolor').val();
        draw_empty_board(p_color);
        fill_board();
        
        $.ajax({url: "ludo.php/players/"+p_color, 
                method: 'PUT',
                dataType: "json",
                headers: {"X-Token": me.token},
                contentType: 'application/json',
                data: JSON.stringify( {username: $('#username').val(), piece_color: p_color}),
                success: login_result,
                error: login_error});
    } 
 

    function login_result(data) {

        me = data[0];
        $('#game_initializer').hide();
       update_info();
          game_status_update();
    }
    
    
    function login_error(data, y, z, c) {
        var x = data.responseJSON;
     
            alert(x.errormesg);
       
    }
  
   
    function game_status_update() {
	        clearTimeout(timer);
        $.ajax({url: "ludo.php/status/", success: update_status,headers: {"X-Token": me.token} });
    }
    
    function update_status(data) {
        last_update=new Date().getTime();
       var game_stat_old = game_status;
        game_status=data[0];
        update_info();
        clearTimeout(timer);
         if(game_status.p_turn==me.piece_color &&  me.piece_color!=null) {
           x=0;
            // do play
         if(game_stat_old.p_turn!=game_status.p_turn) {
                fill_board();
          }
          $('#move_div_roll').show(1000);
           $('#move_div').show(1000);
           fill_board_by_data(data);
           timer=setTimeout(function() { game_status_update();}, 4000);
          
        } else {
            // must wait for something
            $('#move_div_roll').hide(5000);
          $('#move_div').hide(5000);
            fill_board_by_data(data);
         timer=setTimeout(function() { game_status_update();}, 4000);
         
        }
 

    }
 
      function update_info(){
            $('#game_info').html("I am Player: "+me.piece_color+", my name is "+me.username 
            +'<br>Token='+me.token+'<br>Game state: '+game_status.status+', '+ game_status.p_turn+' must play now.'  );
            
            
        }

       function do_move() {
            var s = $('#the_move').val();
            
            var a = s.trim().split(/[ ]+/);
            if(a.length!=4) {
                alert('Must give 4 numbers');
                return;
            }
            $.ajax({url: "ludo.php/board/piece/"+a[0]+'/'+a[1], 
                    method: 'PUT',
                    dataType: "json",
                    contentType: 'application/json',
                    data: JSON.stringify( {x: a[2], y: a[3]}),
                  // data: JSON.stringify( {x: a[2], y: a[3] , "X-Token": me.token  }),
                  //to token απο ορισμα, το βαζω στους headers(αλλαγη ludo.php)
                    headers: {"X-Token": me.token},
                    success: move_result,
                    error: login_error});
            
        } 

        function roll_dice(data){
        //  last_update=new Date().getTime();
        //  var game_stat_old = game_status;
        //   game_status=data[0];
        //   update_info();
        //   clearTimeout(timer);
              if(game_status.p_turn=='Y' ) {
                roll_dice_Y();
        }else{
            //roll_dice_R();
        }}
//
      function roll_dice_Y() {
          // Make an AJAX call to the server to perform the move
          $.ajax({
              url: "ludo.php/roll/Y",
              method: 'GET',
              dataType: "json",
              contentType: 'application/json',
              data: { action: 'roll_dice_Y1' },
              headers: { "X-Token": me.token },
              success: function (data) {
                  // Handle the success response
                  console.log("Success Response:", data);
      
                  // Access the 'dice' property of the last element
                  if (Array.isArray(data) && data.length > 0 && 'dice' in data[data.length - 1]) {
                      $("#diceResult").text("Dice Result: " + data[data.length - 1].dice);
                      
                    $("#the_move").val(
                        " " + data[data.length - 1].prev_x +
                        " " + data[data.length - 1].prev_y +
                        " " + data[data.length - 1].new_x +
                        "  " + data[data.length - 1].new_y
                    );
                } else {
                    console.error("Invalid dice result:", data);
                    // Handle the case where 'dice' is not present or invalid
                }
            },
            error: function (xhr, status, error) {
                // Handle the error response
                console.error("Error Response:", xhr.responseText);
                // You might want to handle errors and display an appropriate message
            }
        }); }


//      function roll_dice_R() {
//          // Make an AJAX call to the server to perform the move
//          $.ajax({
//              url: "ludo.php/roll/R",
//              method: 'GET',
//              dataType: "json",
//              contentType: 'application/json',
//              data: { action: 'roll_dice_R' },
//              headers: { "X-Token": me.token },
//              success: function (data) {
//                  // Handle the success response
//                  console.log("Success Response:", data);
//      
//                  // Access the 'dice' property of the last element
//                  if (Array.isArray(data) && data.length > 0 && 'dice' in data[data.length - 1]) {
//                      $("#diceResult").text("Dice Result: " + data[data.length - 1].dice);
//                      
//                    $("#the_move").val(
//                        " " + data[data.length - 1].prev_x +
//                        " " + data[data.length - 1].prev_y +
//                        " " + data[data.length - 1].new_x +
//                        "  " + data[data.length - 1].new_y
//                    );
//                } else {
//                    console.error("Invalid dice result:", data);
//                    // Handle the case where 'dice' is not present or invalid
//                }
//            },
//            error: function (xhr, status, error) {
//                // Handle the error response
//                console.error("Error Response:", xhr.responseText);
//                // You might want to handle errors and display an appropriate message
//            }
//        }); }
 //
 //        $.ajax({
 //           url: "ludo.php/move_y/",
 //           method: 'PUT',
 //           dataType: "json",
 //           contentType: 'application/json',
 //           data: { action: 'do_move_yellow' },
 //           headers: { "X-Token": me.token },
 //           success:  fill_board_by_data,
 //           error: function (xhr, status, error) {
 //               // Handle the error response
 //               console.error("Error Response:", xhr.responseText);
 //               // You might want to handle errors and display an appropriate message
 //           }
 //       });}
 //
 //            /*     // Use the fetched coordinates in the PUT request
 //               $.ajax({
 //                   url: "ludo.php/board/piece/" + data.prev_x + '/' + data.prev_y,
 //                   method: 'PUT',
 //                   dataType: "json",
 //                   contentType: 'application/json',
 //                   data: JSON.stringify({ x: data.new_x, y: data.new_y }),
 //                   headers: { "X-Token": me.token },
 //                   success: move_result,
 //                   error: login_error
 //               });
 //          
 //           }*/
 //  
 //

        function move_result(data){
          //  fill_board_by_data
         
            fill_board_by_data(data);
            game_status_update();
        }
        

        