<!-- Begin header.php -->

<head>

  <title>CCSF Coders Club</title>

  <!-- Styles begin-->
    <!-- Bootstrap is the CSS/JavaScript framework that helps us to be mobile-first. -->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <!-- Font Awesome is for the icons on the sidebar. -->
    <link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet'>
    <!-- This is the font we chose to use across the board. -->
    <link href='https://fonts.googleapis.com/css?family=Share+Tech+Mono:400' rel='stylesheet' type='text/css'>
    <!-- This is the stylesheet we want to apply everywhere. -->
    <link href='../styles/header-style.css' rel='stylesheet' type='text/css'>

    <link href='../styles/quicklinks.css' rel='stylesheet' type='text/css'>
    <link href='../styles/meetingtimes.css' rel='stylesheet' type='text/css'>
  <!-- Styles end -->

  <!-- Scripts are found in the footer.php partial -->

  <?php 

    // php needs relative path
    $templateDirectory = '../partials/';

    // Disable the logo for now until we decide on a different one
    //require_once($templateDirectory.'logo.php');
    require_once($templateDirectory . 'nav.php');
    //require_once($templateDirectory . 'quicklinks.php');
    require_once($templateDirectory . 'meetingtimes.php');

  ?>

</head>

<!-- End header.php -->
