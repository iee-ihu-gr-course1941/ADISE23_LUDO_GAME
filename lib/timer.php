<?php

function get_timer_value() {
    global $mysqli;
// Call the stored procedure
$sql = "CALL timer_value()";
$result = $mysqli ->query($sql);

// Check if the query was successful
if ($result) {
    // Fetch the result as an associative array
    $row = $result->fetch_assoc();

    // Return the result as JSON
    header('Content-Type: application/json');
    echo json_encode($row);
} else {
    // Handle the error if the query fails
    echo "Error: " . $sql . "<br>" . $mysqli->error;
}}

?>