$(function(){
    draw_empty_board();
    fill_board();
});

function draw_empty_board() {
    var t = '<table id="ludo_square">';

    for (var i = 11; i > 0; i--) {
        t += '<tr>';
        for (var j = 1; j < 12; j++) {
            t += '<td class="ludo_square" id="square_' + j + '_' + i + '">' + j + ',' + i + '</td>';
        }
        t += '</tr>';
    }
    t += '</table>';

    $('#ludo_board').html(t);
}

 
function fill_board(){
    $.ajax(
        {url:"ludo.php/board/",
    success: fill_board_by_data
    }
    );
}
function fill_board_by_data(data) {
	
	for(var i=0;i<data.length;i++) {
		var o = data[i];
		var id = '#square_'+ o.x +'_' + o.y;
        $(id).addClass(o.b)
		 var c = (o.piece!=null)?o.piece_color + o.piece:'';
	 var im = c;
        var im =(o.piece!=null)?'<img class="piece '+c+'" src="images/'+c+'.png">':'';
	 	$(id).addClass(o.b_color+'_square').html(im);
	}
}
