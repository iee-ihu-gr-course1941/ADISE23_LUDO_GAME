
<?php

    include_once "header.php";

?>


        <div id="h1Name"><h1 id="name">γκρινιαρης</h1></div>

    <section id='main_body'>

        <div id='ludo_board'></div>

    </section>

    <div id='players_board'></div>

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
                
            <button id='ludo_login' class='btn btn-primary'>ΕΙΣΟΔΟΣ ΣΤΟ ΠΑΙΧΝΙΔΙ</button><br>
           </div>              
            <div id='game_info'>
            </div>
            <button id='players_reset' class='btn btn-primary'>ΤΟΟΟ ΚΟΥΜΠΙ NULL(100% ΔΟΥΛΕΥΕΙ)</button><br>
    </div>

<?php

    include_once "footer.php";

?>