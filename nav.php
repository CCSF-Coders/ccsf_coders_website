<?php
    $navList = [
        'Home' => 'index.html',
        'Blog / News' => 'index.html',
        'Toy Box' => 'index.html',
        'IRC' => 'http://www.nixcode.us/irc',
        'Williams Github' => 'https://github.com/williamrmyers'
    ];

    $newTab = [
        'Home' => false,
        'Blog / News' => false,
        'Toy Box' => false,
        'IRC' => true,
        'Williams Github' => true
    ];

    echo "<nav><ul>";

    foreach($navList as $key => $value) {
        echo "<li><a href='" . $value . "' ";
        echo (($newTab[$key] == true) ? "target='_blank'>" : ">");
        echo $key . "</a></li>";
    }
    
    echo "</ul></nav>";

?>

