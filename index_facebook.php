<?php
  // Remember to copy files from the SDK's src/ directory to a
  // directory in your application on the server, such as php-sdk/
  require_once('facebook-php-sdk/src/facebook.php');

  $config = array(
    'appId' => '680421298655992',
    'secret' => 'f83a643b7cf2d4203e0d5dd6fbf7dc45',
    'allowSignedRequest' => false, // optional but should be set to false for non-canvas apps
    'cookie'  => true
  );

  $facebook = new Facebook($config);
  $user_id = $facebook->getUser();

  echo $user_id;
?>

<html>
  <head></head>
  <body>

  <?php

    if($user_id) {

      // We have a user ID, so probably a logged in user.
      // If not, we'll get an exception, which we handle below.
      try {

        $user_profile = $facebook->api('/me','GET');
        echo "Name: " . $user_profile['name'];

      } catch(FacebookApiException $e) {
        // If the user is logged out, you can have a 
        // user ID even though the access token is invalid.
        // In this case, we'll get an exception, so we'll
        // just ask the user to login again here.
        $login_url = $facebook->getLoginUrl(); 
        echo 'Please <a href="' . $login_url . '">login.</a>';
        error_log($e->getType());
        error_log($e->getMessage());
      }   
    } else {

      // No user, print a link for the user to login
      $login_url = $facebook->getLoginUrl();
      echo 'Please <a href="' . $login_url . '&access_token=6a39176fdababeebd9cf2a643f17a0ad">login.</a>';

    }

  ?>

  </body>
</html>
