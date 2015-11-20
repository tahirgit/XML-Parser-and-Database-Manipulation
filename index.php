<?php
/**
 * Script Name: ReaXML Parser and Database Manipulation
 * Created: 16-Nov-2015
 * Author: Tahir Hussain 
 * Company: Discretelogix
 * Description: The script will read xml files from each of the agency xml 
 * directories and parse each files and store/update data into the database
 */

// Initialization 
require_once("init.php");
//configuaration
require_once ("config/config.inc");
// REA XML parser
require_once("parser/rea_xml.class.php");

// Execute Script for each Agency $agengyID defined in init.php
foreach ($agencyID as $agency) {
    
    // Directories for each Agency
    $xml_files_dir  = preg_replace("/{agency_id}/", $agency, $xml_files_dir);
    $processed_dir  = preg_replace("/{agency_id}/", $agency, $processed_dir);
    $failed_dir     = preg_replace("/{agency_id}/", $agency, $failed_dir);
    
    // Initiate ReaXML instance
    $rea = new REA_XML($debug = true);
    
    // Read Directory and Parse
    if (is_dir($xml_files_dir)) {
        if ($dh = opendir($xml_files_dir)) {
            $counter = 0;
            while (($file = readdir($dh)) !== false) {
                if (is_file($xml_files_dir . $file)) {
                    $property = $rea->parse_file($xml_files_dir . $file, $file, $processed_dir, $failed_dir);

                    // Save/Update database by One file at a time
                    if (count($property)) {
                        $db = new ManageDatabase( $agency );
                        $flag = $db->managePropertyListing( $property );
                    }
                    $counter++;
                }
            }
            // Directory is empty, no file found    
            if ($counter == 0)
                echo " <br> No file found in " . $xml_files_dir;
            else
                echo $counter . " files processed";
        }
    } else {
        echo " <br> Agency directory doesn't exist: " . $xml_files_dir;
    }
}
