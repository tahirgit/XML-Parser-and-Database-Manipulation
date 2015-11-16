<?php

// Initialization
require_once("init.php");
//configuaration
require_once ("config/config.inc");
// REA XML parser
require_once("parser/rea_xml.class.php");

$rea = new REA_XML($debug=true); //uses default fields

// Read XML files from the directory 
if (is_dir($xml_files_dir)) {
    if ($dh = opendir($xml_files_dir)) {
        $counter = 0;
        while (($file = readdir($dh)) !== false) {
            if(is_file($xml_files_dir.$file) )  {
                $property = $rea->parse_file($xml_files_dir.$file, $file, $processed_dir, $failed_dir);
                 
                // Save/Update database by One file at a time
                if(count($property))  {
                    $db = new ManageDatabase();
                    $flag = $db->managePropertyListing($property);
                }
                 $counter++;
            }
        }
        // Directory is empty, no file found    
        if( $counter  == 0 )
            echo " No file found in ".$xml_files_dir;
        else
            echo $counter." files processed";
    } 
}
