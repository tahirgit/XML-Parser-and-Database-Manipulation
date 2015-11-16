<?php
// Database connection setting
$host = "localhost";
$user = "root";
$pass = "";
$database = "realestate2";

require_once("lib/Db.php");
Db::config( 'driver',   'mysql' );
Db::config( 'host',     $host );
Db::config( 'database', $database );
Db::config( 'user',     $user );
Db::config( 'password', $pass );
require_once ("lib/class.manageDatabase.php");

//
// $db = Db::instance();
// $select = $db->select("agency");
// while($r = $select->fetch()) {
//     echo "<pre>"; print_r($r);
//  
// }
// print_r($data);
// exit;
           


