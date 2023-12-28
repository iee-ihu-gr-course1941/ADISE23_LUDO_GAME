<?php
  
require_once 'dbconnect.php';

function getPlayerStatus() {
    global $conn; // Assuming $conn is your database connection variable

    $query = "SELECT * FROM players";
    $result = mysqli_query($conn, $query);

    if (!$result) {
        die(mysqli_error($conn)); // Output any database errors
    }

    return $result;
}

?>


