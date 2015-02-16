
<?php
# This file uses spaces, not tab characters. Adjust accordingly, please.
  $navList = [
    'Home' => 'index.html',
    'Events' => 'index.html#events',
    'Contact' => 'index.html#contact',
    'Blog' => 'blog.html',
    'IRC' => 'https://www.nixcode.us/irc'
  ];

  $newTab = [
    'Home' => false,
    'Events' => false,
    'Contact' => false,
    'Blog' => false,
    'IRC' => true,
  ];

  echo "<ul class='nav-list-wrapper'>";

  foreach($navList as $key => $value) {
    echo "<li onclick=\"link('" . $value . "'";
    if($newTab[$key] == true)
    {
      echo ", true";
    }
    else
    {
      echo ", false";
    }
    echo ");\">";
    #echo (($newTab[$key] == true) ? "target='_blank'>" : ">");
    echo $key . "</li>";
  }
  
  echo "</ul>";

?>

