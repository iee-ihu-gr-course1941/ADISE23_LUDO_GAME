<?php
    include_once "header.php";
?>

    <div id="h1Name">
        <h1 id="name">Lobby</h1>
    </div>

    <section id='main_body'>
        <div id="players"></div> 
        <div id="input-container">
            <input id='username'>
            <select id='pcolor'>
                <option value='R'>Red</option>
                <option value='B'>Blue</option>
                <option value='G'>Green</option>
                <option value='Y'>Yellow</option>
            </select>
            <br><button id='ludo_login' class='btn btn-primary'>ΕΙΣΟΔΟΣ ΣΤΟ ΠΑΙΧΝΙΔΙ</button>      
        </div>
            

    </section>

    <div id="gameButton">
        <button id='players_reset' class='btn btn-primary'>ΤΟΟΟ ΚΟΥΜΠΙ NULL(100% ΔΟΥΛΕΥΕΙ)</button>
    </div>

    <footer id="footer">
        <p>&copy; 2023 ADISE23_LUDO_GAME. Dimitris, Blue, Kapten</p>
    </footer>

</html>