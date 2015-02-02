<?php
    $navList = [
        'Home' => 'index.php',
        'Blog / News' => 'blog.php',
        'Toy Box' => 'index.php',
        'IRC' => 'http://www.nixcode.us/irc'
    ];

    $newTab = [
        'Home' => false,
        'Blog / News' => false,
        'Toy Box' => false,
        'IRC' => true
    ];

    echo "<nav><ul>";

    foreach($navList as $key => $value) {
        echo "<li><a href='" . $value . "' ";
        echo (($newTab[$key] == true) ? "target='_blank'>" : ">");
        echo $key . "</a></li>";
    }
    
    echo "</ul></nav>";

?>

