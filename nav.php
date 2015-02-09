<?php
    $navList = [
        'Home' => 'index.php#logo',
		'Events' => 'index.php#events',
		'Contact' => 'index.php#contact',
        'Blog' => 'blog.php',
        'IRC' => 'http://www.nixcode.us/irc'
    ];

    $newTab = [
        'Home' => false,
		'Events' => false,
		'Contact' => false,
        'Blog' => false,
        'IRC' => true,
    ];

    echo "<nav><ul>";

    foreach($navList as $key => $value) {
        echo "<li><a href='" . $value . "' ";
        echo (($newTab[$key] == true) ? "target='_blank'>" : ">");
        echo $key . "</a></li>";
    }
    
    echo "</ul></nav>";

?>

