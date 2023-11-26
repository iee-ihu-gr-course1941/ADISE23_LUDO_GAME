
<?php
    include_once "header.php";
?>
    <div id="h1Name"><h1 id="name">Login</h1></div>
    <section id='main_body'>
        <div id='form'>
            <form action="../lib/login.inc.php" method="post">
                <?php
                    if(isset($_GET["error"])){
                        if($_GET["error"] == "emptyinput"){
                            echo "<p>Fill in all fields!</p>";
                        }
                        else if($_GET["error"] == "wronglogin"){
                            echo "<p>Wrong login!</p>";
                        }
                    }
                ?> 
                <input type="text" name="username" placeholder="Username/Email"><br>
                <input type="password" name="pwd" placeholder="Passworld"><br>
                <button id='submit' type="submit" name="submit">Login</button>
            </form>
        </div>
    </section>
    <div id="gameButton"></div>
    <footer id="footer">
        <p>&copy; 2023 ADISE23_LUDO_GAME. Dimitris, Blue, Kapten</p>
    </footer>

</html>