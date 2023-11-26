
<?php
    include_once "header.php";
?>
    <!--body-->

        <div id="h1Name"><h1 id="name">γκρινιαρης</h1></div>
<<<<<<< Updated upstream

    <section id='main_body'>

        <div id='ludo_board'></div>
        <div id='players_board'></div>
        <div id='ui_Chat'>
            <a id='game_info'>
           
        </div>
    </section>

    <div id="gameButton">
        <button id='ludo_reset' class='btn btn-primary'>Restart</button><br><!--το κουμπι reset board βημα 1-->
        <button id='ludo_roll' class='btn btn-primary'>ΡΙΞΕ ΖΑΡΙ</button><br>
        <div id='game_initializer'>
            <input id='username'> 
            <select id='pcolor'>
            <option value='R'>R</option>
            <option value='B'>B</option>
            <option value='G'>G</option>
            <option value='Y'>Y</option>
            </select>    
        </div>      
        <button id='ludo_login' class='btn btn-primary'>ΕΙΣΟΔΟΣ ΣΤΟ ΠΑΙΧΝΙΔΙ</button><br>
        <button id='players_reset' class='btn btn-primary'>ΤΟΟΟ ΚΟΥΜΠΙ NULL(100% ΔΟΥΛΕΥΕΙ)</button><br>

    </div>


<?php

    include_once "footer.php";

?>
=======
        <section id='main_body'>
            <div id='ludo_board'></div>
            <div id='ui_Chat'>
                <div id='game_initializer'>
                <a id='game_info'> 
            </div>     
            </div>
        </section>
        <div id="gameButton">
            <button id='ludo_reset' class='btn btn-primary'>Restart</button>
            <div id='move_div_roll'>            
                <button id='do_move_roll' class='btn btn-primary'>ΡΙΞΕ ΖΑΡΙ</button>
                Έτυχες: <span id='the_move_roll'> </span>
            </div>
            <div id='move_div'>    
                Δώσε κίνηση (x1 y1 x2 y2): <input id='the_move'> 
                <button id='do_move' class='btn btn-primary'>ΚΑΝΕ ΤΗΝ ΚΙΝΗΣΗ</button> 
            </div>
        </div>

    </body>

    <footer id="footer">
        <p>&copy; 2023 ADISE23_LUDO_GAME. Dimitris, Blue, Kapten</p>
    </footer>

</html>
>>>>>>> Stashed changes
