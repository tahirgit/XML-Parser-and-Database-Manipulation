<?php

/**
 * Stores and Update XML related data into the Database 
 */
class ManageDatabase extends Db {
        
    public $db;
    public $listingTradeCode = array(
        "business" => 4,
        'commercial' => 3, 
        'commercialLand' => 3, 
        'holidayRental' => 5, 
        'rental' =>  4, 
        'residential' => 1, 
        'land' => 1, 
        'rural'=> 2);
    public $tenancy = array("vacant"=>2, "tenanted"=>1);
    public $unitAreaCode = array("acre"=>2, "squareMeter"=>1, "hectare"=>3 );
    public $featureHotWaterServiceTypeCode = array("gas"=>1, "electric"=>2, "solar"=>3);
    public $authority = array("auction"=>1, "sale"=>2, "lease"=>3, "conjunctional"=>4, "tender"=>5);
    public $statusCode = array("current"=>1, "sold"=>2, "leased"=>2, "withdrawn"=>7, "offmarket"=>6);
    
    public function __construct() {
       $this->db = Db::instance();
    }
    /**
     * Manage (add, update, delete) property listing in Listing table
     * @param type $property
     */
    public function managePropertyListing( $property ) {
        
       foreach( $property as $item => $records) {
           foreach($records as $fields) {
           //check if the property already exists in our database
           $id = $this->checkPropertyExistAlready($fields["uniqueID"]);
           
           //Save/Update Listings and other related tables
           $this->storePropertyListing($item, $fields, $id[0], $id[1]);
         }
       }
    }
    
    /**
     * Add/Update property List
     * @param string $item Property Item name (Business, Commercial)
     * @param array $fields
     * @param int $id
     */
    private function storePropertyListing( $item, $fields, $id = NULL, $reference_number = 0 ) {
               
           $insert = array();
           $insert['reference_number']  = $reference_number + rand(1, 10);
           $insert['agency_id']  = 4; 
           
           // Save Address
           if(isset($fields["address"])) {
               $addressId = $this->saveLocalityAddress($id, $fields["address"]);
               if($addressId != 0)
                   $insert['locality_address_id'] = $addressId;
           }
                
           $insert['locality_address_visibility_code'] = 1;
           $insert['listing_type_code'] = $this->getListingTypeCode($item, $fields);
           $insert['listing_trade_type_code'] = $this->getListingTradeTypeCode($item);
           $insert["listing_market_status_code"] = $this->getStatusCode($fields["status"]);
           $insert['listing_marketed'] = NULL; 
           $insert['listing_publish_status_code'] = 1;
           $insert['listing_published'] = date("Y-m-d H:i:s");
           $insert['map_publisher_code'] = 0; 
           $insert['map_no'] = null;
           $insert['map_ref'] = NULL;
           $insert['streetview_visibility_code'] = 1; 
           if(isset($fields["headline"])) {
                $insert['headline'] = $fields["headline"];
                $insert['summary']  = $fields["description"];
                $insert['description'] = $fields["description"]; 
                $insert['external_reference_id'] = $fields["uniqueID"];
           }
           $insert['plot_id'] = NULL;
           $insert['status_code'] = 1;
          
           $recordType = "new";
           if(is_null($id)) {
                $insert['created'] = date("Y-m-d H:i:s");
                $this->db->create("listing", $insert);
                $id =  $this->db->id();
                $this->saveListingTypeCode($id, $insert['listing_type_code'],  $fields, $recordType);
           }
           else {
               $insert['modified'] = date("Y-m-d H:i:s");; 
               $this->db->update("listing", $insert, $id);
               $recordType = "modify";
               $this->saveListingTypeCode($id, $insert['listing_type_code'], $fields, $recordType);
           }
           
           // save remaining data into listing_trade_type_code_table for each property   
           if(!is_null($id)) {
               $this->saveListingMedia($id, $item, $fields, $recordType);
               $this->manageInListingTradeTypeCode($id, $item, $fields, $recordType);
           }
    }
    
    /**
     *  Save data in Property related tables. (business or commercials or residentials)
     *  @param int $id Listing ID
     *  @param string $item Name of the property type
     *  @param array $fields XML file fields/nodes
     */
    private function manageInListingTradeTypeCode($id, $item, $fields, $recordType) {
        
        switch($item) {
            case "business":
                $this->savePropertyBusiness($id, $fields, $recordType);
                break;
            case "commercial":
                $this->savePropertyCommercial($id, $fields, $recordType);
                break;
              case "residential":
                $this->savePropertyResidential($id, $fields, $recordType);
                break;
             case "rural":
                $this->savePropertyRural($id, $fields, $recordType);
                break;
            case "holidayRental":
                $this->savePropertyHolidayRental($id, $fields, $recordType);
                break;
                       
            default :
                //do nothing
                break;
        }
        return;
    }
    
    /** 1. Business
     * Save In business Trade table
     * @param int $id Listing ID
     * @param array $fields Business nodes and values
     * @param string $recordType new/modify
     */
    private function savePropertyBusiness($id, $fields, $recordType) {
        $add = array();
        $add['listing_id'] = $id;
        if(isset($fields["businessCategory"][0]["id"]))
            $add['listing_trade_business_property_type_code'] = $this->getPropertyCategoryID($fields["businessCategory"][0]["id"], "listing_trade_business_property_type_code");
        $add['listing_trade_business_sub_type_code'] = 1;
        if(isset($fields["buildingDetails"]["area"]) )
            $add['building_area'] =   $fields["buildingDetails"]["area"];
        if(isset($fields["buildingDetails"]["energyRating"]) )
            $add['energy_rating'] =  $fields["buildingDetails"]["energyRating"];   
        if(isset($fields["takings"]))
            $add['takings'] =  $fields["takings"];
        if(isset($fields["address"]["site"]))
            $add['site'] = $fields["address"]["site"]; 
        if(isset($fields["terms"]))
            $add['terms'] = $fields["terms"]; 
        if(isset($fields["franchise"]))
            $add['franchise'] = $fields["franchise"];
        $add['status_code'] = 1; 
        
           if( $recordType == "new" ) {
                $add['created'] = date("Y-m-d H:i:s");
                $this->db->create("listing_trade_business", $add);
           }
           else {
               $add['modified'] = date("Y-m-d H:i:s");; 
               $this->db->update("listing_trade_business", $add, "listing_id = ".$id);
           }
           return;
    }
    /** 2. Commercial
     * Save In Commercial Trade table
     * @param int $id Listing ID
     * @param array $fields commercial nodes and values
     * @param string $recordType new/modify
     */
    private function savePropertyCommercial($id, $fields, $recordType) {
        $tenancy = $this->tenancy;
        $add = array();
        $add['listing_id'] = $id;
        if(isset($fields["commercialCategory"]))
            $add['listing_trade_commercial_property_type_code'] = $this->getPropertyCategoryID($fields["commercialCategory"], "listing_trade_commercial_property_type_code");
        if(isset($fields["buildingDetails"]["area"]))
            $add['building_area'] = $fields["buildingDetails"]["area"];
        if(isset($fields["buildingDetails"]["energyRating"]) )
            $add['energy_rating'] = $fields["buildingDetails"]["energyRating"];    
        if(isset($fields["carSpaces"]))
            $add['car_space'] = $fields["carSpaces"];
        if( isset($fields["tenancy"]) )
            $add['tenanted_code'] = isset($tenancy[$fields["tenancy"]]) ? $tenancy[$fields["tenancy"]]:"0"; 
        if(isset($fields["outgoings"]))
            $add['outgoings'] = 1;
        if(isset($fields["estate"]))
            $add['estate'] = $fields["estate"];
        if(isset($fields["address"]["site"]))
            $add['site'] = $fields["address"]["site"]; 
        $add['status_code'] = 1; 
        // Save record
        if( $recordType == "new" ) {
                $add['created'] = date("Y-m-d H:i:s");
                $this->db->create("listing_trade_commercial", $add);
           }
           else {
               $add['modified'] = date("Y-m-d H:i:s");
               $this->db->update("listing_trade_commercial", $add, "listing_id = ".$id);
           }
           return;
    }
    
   /** 3. Residential
     * Save In Residential Trade table
     * @param int $id Listing ID
     * @param array $fields residential nodes and values
     * @param string $recordType new/modify
     */
    private function savePropertyResidential($id, $fields, $recordType) {
        
        $add = array();
        $add['listing_id'] = $id;
        if(isset($fields["category"][0]["name"]))
            $add['listing_trade_residential_property_type_code'] = $this->getPropertyCategoryID($fields["category"][0]["name"], "listing_trade_residential_property_type_code");
        if(isset($fields["features"]["bedrooms"]))
            $add['bed'] =  $fields["features"]["bedrooms"];
        if(isset($fields["features"]["bathrooms"]))
            $add['bath'] = $fields["features"]["bathrooms"]; 
        if(isset($fields["features"]["ensuite"]))
            $add['ensuite'] = $fields["features"]["ensuite"];
        if(isset($fields["features"]["carports"]))
            $add['car'] = $add['car_space'] = $add['car_port'] =  $fields["features"]["carports"]; 
        if(isset($fields["features"]["garages"]))
            $add['garage'] = $fields["features"]["garages"];
        if(isset($fields["buildingDetails"]["energyRating"]))
            $add['energy_rating'] = $fields["buildingDetails"]["energyRating"];
        if(isset($fields["buildingDetails"]["area"]))
            $add['building_area'] =  $fields["buildingDetails"]["area"];
        if( isset($fields["landDetails"]["area"]["area"]) )
            $add['land_area'] = $fields["landDetails"]["area"]["area"]; 
       // $add['land_area_display_unit_code'] = isset($fields["landDetails"]["area"]["unit"]) ? $this->unitAreaCode[$fields["landDetails"]["area"]["unit"]] :""; 
        if( isset($fields["landDetails"]["frontage"]) )
            $add['land_frontage'] =  $fields["landDetails"]["frontage"]; 
        $add['listing_land_code'] = 1; 
        $add['status_code'] = 1; 
        // Save Record
        if ($recordType == "new") {
            $add['created'] = date("Y-m-d H:i:s");
            $this->db->create("listing_trade_residential", $add);
        } else {
            $add['modified'] = date("Y-m-d H:i:s");
            $this->db->update("listing_trade_residential", $add, "listing_id = " . $id);
        }
        return;
    }
    
   /** 4. Rural
     * Save In Rural Trade table
     * @param int $id Listing ID
     * @param array $fields Rural nodes and values
     * @param string $recordType new/modify
     */
    private function savePropertyRural($id, $fields, $recordType) {
      
        $add = array();
        $add['listing_id'] = $id;
        if(isset($fields["ruralCategory"][0]["name"]))
            $add['listing_trade_rural_property_type_code'] = $this->getPropertyCategoryID($fields["ruralCategory"][0]["name"], "listing_trade_rural_property_type_code");
        if(isset($fields["features"]["bedrooms"]))
            $add['bed'] =  $fields["features"]["bedrooms"];
        if(isset($fields["features"]["bathrooms"]))
            $add['bath'] =  $fields["features"]["bathrooms"];
        if(isset($fields["features"]["ensuite"]) )
            $add['ensuite'] = $fields["features"]["ensuite"]; 
        if(isset($fields["features"]["carports"]))
            $add['car'] = $add['car_space'] = $add['car_port'] =  $fields["features"]["carports"];
        if(isset($fields["features"]["garages"]))
            $add['garage'] =  $fields["features"]["garages"];
        if(isset($fields["buildingDetails"]["energyRating"]))
            $add['energy_rating'] =  $fields["buildingDetails"]["energyRating"];
        if(isset($fields["buildingDetails"]["area"]))
            $add['building_area'] =  $fields["buildingDetails"]["area"];
        if(isset($fields["landDetails"]["area"]["area"]))
            $add['land_area'] =  $fields["landDetails"]["area"]["area"];  
       // $add['land_area_display_unit_code'] = isset($fields["landDetails"]["area"]["unit"]) ? $this->unitAreaCode[$fields["landDetails"]["area"]["unit"]] :""; 
        $add['status_code'] = 1;  
       // Save Record
        if ($recordType == "new") {
            $add['created'] = date("Y-m-d H:i:s");
            $this->db->create("listing_trade_rural", $add);
        } else {
            $add['modified'] = date("Y-m-d H:i:s");
            $this->db->update("listing_trade_rural", $add, "listing_id = " . $id);
        }
        return;
    }
    
   /** 5. HolidayRental
     * Save In HolidayRental Trade table
     * @param int $id Listing ID
     * @param array $fields Holiday Rental  nodes and values
     * @param string $recordType new/modify
     */
    private function savePropertyHolidayRental($id, $fields, $recordType) {
            
        $add = array();
        $add['listing_id'] = $id;
        if(isset($fields["holidayCategory"][0]["name"]))
            $add['listing_trade_holiday_property_type_code'] = $this->getPropertyCategoryID($fields["holidayCategory"][0]["name"], "listing_trade_holiday_property_type_code");
        if( isset($fields["features"][13]["@attributes"]["type"]) )
            $add['feature_hot_water_service_type_code'] = $this->featureHotWaterServiceTypeCode[$fields["features"][13]["@attributes"]["type"]]; 
        if(isset($fields["features"]["bedrooms"]))
            $add['bed'] = $fields["features"]["bedrooms"];
        if( isset($fields["features"]["bathrooms"]) )
            $add['bath'] = $fields["features"]["bathrooms"];
        if(isset($fields["features"]["carports"]))
            $add['car_port'] = $fields["features"]["carports"];
        if(isset($fields["features"]["garages"]))
            $add['garage'] =  $fields["features"]["garages"];
        if(isset($fields["buildingDetails"]["energyRating"]) )
            $add['energy_rating'] = $fields["buildingDetails"]["energyRating"];
        if(isset($fields["buildingDetails"]["area"]))
            $add['building_area'] =  $fields["buildingDetails"]["area"];
        if(isset($fields["landDetails"]["area"]["area"]))
            $add['land_area'] = $fields["landDetails"]["area"]["area"];  
       // $add['land_area_display_unit_code'] = isset($fields["landDetails"]["area"]["unit"]) ? $this->unitAreaCode[$fields["landDetails"]["area"]["unit"]] :""; 
        $add['status_code'] = 1;  
       // Save Record
        if ($recordType == "new") {
            $add['created'] = date("Y-m-d H:i:s");
            $this->db->create("listing_trade_holiday", $add);
        } else {
            $add['modified'] = date("Y-m-d H:i:s");
            $this->db->update("listing_trade_holiday", $add, "listing_id = " . $id);
        }
        return;
    }
    
    /**
     * Save Property Images and Floor plans
     * @param int $id listing ID
     * @param strin $item Property Name
     * @param array $fields Property fields
     * @param string $recordType New/Modify
     */
    private function saveListingMedia($id, $item, $fields, $recordType) {
        
        $add = array();
        $add["listing_id"] = $id;
        $add['status_code'] = 1;  
        // Store Images Medium
        if( isset($fields["img_m"])) {
            $add["path"] = $add["path_original"] = $fields["img_m"];
            $add["listing_asset_type_code"] = 1;
            if ($recordType == "new") {
                $add['created'] = date("Y-m-d H:i:s");
                $this->db->create("listing_asset", $add);
            }  
        }
        //////////////////////////////
        $add = array();
        $add["listing_id"] = $id;
        $add['status_code'] = 1; 
        if (isset($fields["img_a"])) {
            $add["path"] = $add["path_original"] = $fields["img_a"];
            $add["listing_asset_type_code"] = 1;
            if ($recordType == "new") {
                $add['created'] = date("Y-m-d H:i:s");
                $this->db->create("listing_asset", $add);
            }
        }

        // Store Floor plans
        $ins = array();
        $ins['status_code'] = 1;  
        $ins["listing_id"] = $id;
        if( isset($fields["floorplan_1"])) {
            $ins["path"] = $ins["path_original"] = $fields["floorplan_1"];
            $ins["listing_asset_type_code"] = 2;
             if ($recordType == "new") {
                $ins['created'] = date("Y-m-d H:i:s");
                $this->db->create("listing_asset", $ins);
            }  
        }
        ///////////
        $ins = array();
        $ins['status_code'] = 1;  
        $ins["listing_id"] = $id;
         if( isset($fields["floorplan_2"])) {
            $ins["path"] = $ins["path_original"] = $fields["floorplan_2"];
            $ins["listing_asset_type_code"] = 2;
            if ($recordType == "new") {
                $ins['created'] = date("Y-m-d H:i:s");
                $this->db->create("listing_asset", $ins);
            }  
        }  
        return;
    }
    /**
     * Store Price related data in listing_type_(sale, lease, share, auction, tender) table
     * @param int $id listing ID
     * @param int $code code of the Listing type 
     * @param array fields 
     * @param string new/modify recordType
     * 
     */
    private function saveListingTypeCode($id, $code, $fields, $recordType) {
        
        $add = array();
        $add['listing_id'] = $id;
        if( isset($fields["price"]) ) {
            $add['price_display'] = $fields["priceView"];
            $add['price_numeric'] = $fields["price"];
            $add['price_search_numeric_from'] = $fields["price"];
            $add['price_search_numeric_to'] = ($fields["price"] + 1000);
        } elseif( isset($fields["rent"]) ) {
            $add['price_display'] = $fields["rent"][1];
            $add['price_numeric'] = $fields["rent"][1];
            $add['price_search_numeric_from'] = $fields["rent"][1];
            $add['price_search_numeric_to'] = $fields["rent"][1];
        }
         $add['price_visibility_code'] = 1;
         $add['status_code'] = 1;
                    
        switch ($code) {
            case "1": // Auction
                if(isset($fields["auction"][0]["date"]))
                    $add['auction_from'] = $fields["auction"][0]["date"];
                $table = "listing_type_auction";
                if( isset($fields["soldDetails"]["price"]) ) {
                    $add['price_sold_display'] = "$".number_format($fields["soldDetails"]["price"], 2);
                    $add['price_sold_numeric'] = $fields["soldDetails"]["price"]; 
                }
                break;
            case "2": // Sale
                $table = "listing_type_sale";
                 if( isset($fields["soldDetails"]["price"]) ) {
                    $add['price_sold_display'] = "$".number_format($fields["soldDetails"]["price"], 2);
                    $add['price_sold_numeric'] = $fields["soldDetails"]["price"];  
                 }
                 break;
            case "3": // Lease
                $table = "listing_type_lease";
                if( isset($fields["currentLeaseEndDate"]) )  
                    $add["lease_available"] = $add['lease_expiry'] = $fields["currentLeaseEndDate"];
                $add["price_lease_duration_code"] = $this->getLeaseDurationCode($fields);
                if(isset($fields["status"]) && $fields["status"] == "leased")
                    $add['price_leased_display'] =  "LEASED";
                break;
            // share and tender tables don't exist in DB
            
            default :
                return 0;
                break;
        }
        
        if(isset($table)) {
            // Save Record
            if ($recordType == "new") {
                $add['created'] = date("Y-m-d H:i:s");
                $this->db->create($table, $add);
            } else {
                $add['modified'] = date("Y-m-d H:i:s");
                $this->db->update($table, $add, "listing_id = " . $id);
            }
        }
        return;
    }
    
    /**
     * Get lease duration code 
     */
    private function getLeaseDurationCode ($fields) {
        $duration_code = array("week"=>1,"fortnight"=>2, "month"=>3, "annual"=>4);
        
        if(isset($fields["rent"][0]["period"]))
            return $duration_code[$fields["rent"][0]["period"]];
        elseif( isset($fields["businessLease"][0]["period"]) )
            return $duration_code[$fields["businessLease"][0]["period"]];
        elseif(isset($fields["commercialRent"][0]["period"]))
            return $duration_code[$fields["commercialRent"][0]["period"]];
        else
            return NULL;
            
    }

    /**
     * Check if a property is already exists in our DB
     * 
     * @param string unique ID of the property
     * @return int id of from the listing table
     */
    public function checkPropertyExistAlready($uniqueId) {
       $query = $this->db->select("listing", array("id", "reference_number"), array("external_reference_id" => $uniqueId)); 
       if($query){
           $row = $query->fetch();
           if($row)
             return array($row->id, $row->reference_number);
           else
               return NULL;
       } else {
           return NULL;
       } 
                     
    }
    /**
     * Save Locality Address
     * 
     * @param array $address Array of address.
     * @return int address ID
     */
    public function saveLocalityAddress($id, $address) {
        
        $ins = array();
        $ins["address"]  = isset($address["subNumber"]) ? $address["subNumber"]." ":"";
        $ins["address"] .= isset($address["street"]) ? $address["street"]." ":"";
        $ins["address"] .= isset($address["suburb"]) ? $address["suburb"].", ":"";
        $ins["address"] .= isset($address["state"]) ? $address["state"]." ":"";
        $ins["address"] .= isset($address["region"]) ? $address["region"]." ":"";
        $ins["address"] .= isset($address["postcode"]) ? $address["postcode"].", ":"";
        $ins["address"] .= isset($address["country"]) ? $address["country"]:"";
        
        $ins["lot_number"] = isset($address["lotNumber"])?$address["lotNumber"]:"";
        $ins["sub_number"] = isset($address["subNumber"])?$address["subNumber"]:"";
        $ins["street_number"] = isset($address["streetNumber"])?$address["streetNumber"]:"";
        $ins["street"] = isset($address["street"])?$address["street"]:"";
        $ins["locality_street_type_id"] = 0; //blank
        
        $ins["locality_suburb_id"] = isset($address["suburb"]) ? $this->getSuburbID($address["suburb"]): NULL;
        $ins["locality_region_id"] = isset($address["region"]) ? $this->getRegionID($address["region"]) : NULL;
        $ins["locality_state_id"]  = isset($address["state"]) ? $this->getStateID($address["state"]) : NULL;
        $ins["status_code"] = 1;
        
         if (is_null($id)) {
                $ins['created'] = date("Y-m-d H:i:s");
                $this->db->create("locality_address", $ins);
                 return $this->db->id();
            } else {
                $addressResult = $this->db->select("listing", array("locality_address_id"), array("id"=>$id));
                $row = $addressResult->fetch();
                $ins['modified'] = date("Y-m-d H:i:s");
                $this->db->update("locality_address", $ins, "id = " . $row->locality_address_id);
            }
            return 0;
           
    }
    
    /**
     * Get Subsurb ID from by Suburb name
     * @param string $suburb Name of the suburb
     * @return int suburbID
     */
    public function getSuburbID($suburb) {
        if(!empty($suburb)) {
            $select = $this->db->select("locality_suburb", array("id"), array("suburb"=>$suburb));
            $row = $select->fetch();
            return isset($row->id) ? $row->id : NULL;
        } else {
            return NULL;
        }
            
    }
    
     /**
     * Get Region ID from by Suburb name
     * @param string $region Name of the region
     * @return int RegionID
     */
    public function getRegionID($region) {
        if(!empty($region)) {
            $select = $this->db->select("locality_region", array("id"), array("region"=>$region));
            $row = $select->fetch();
            return isset($row->id) ? $row->id : null;
        } else {
            return null;
        }
            
    }
    
    /**
     * Get Region ID from by State name
     * @param string $region Name of the region
     * @return int RegionID
     */
    public function getStateID($state) {
        if(!empty($state)) {
            $select = $this->db->select("locality_state", array("id"), array("state = :stateValue OR state_abbr = :stateValue" => array("stateValue" => $state)));
            $row = $select->fetch();
            return isset($row->id) ? $row->id : null;
        } else {
            return null;
        }
            
    }
    
    /**
     * Get Listing Type code (Auction, for sale etc)
     * @param type $item
     * @param type $fields
     * @return id
     */
    private function getListingTypeCode($item, $fields) {
        
        $authority = isset($fields["authority"])?$fields["authority"]:"";
        if(empty($authority))
            $authority = isset($fields["commercialAuthority"]) ? $fields["commercialAuthority"]:"";
        
        if(empty($authority))
            return 2; // For Sale
        return  $this->authority[$authority];          
    }
    /**
     * Get Listing Trade Type Code (business, comercial, residential etc)
     * @param type $item
     */
    private function getListingTradeTypeCode($item) {
        
        if( isset($this->listingTradeCode[$item]))
            return $this->listingTradeCode[$item];
        else
            return NULL;
    }
    
    
    /**
     * Get category code
     * @param type $Category
     * @return null
     */
    private function getPropertyCategoryID($Category, $table) {
            
        if(!empty($Category)) {
            $select = $this->db->select($table, array("code"), array("name"=>$Category));
            $row = $select->fetch();
            return isset($row->code) ? $row->code : null;
        } else {
            return null;
        }
    }
    /**
     * Get Next Reference number from database
     */
    private function getReferenceNumber() {
        $select = $this->db->select("listing", array("code"), array("name"=>$Category));
        $row = $select->fetch();
        return isset($row->code) ? $row->code : null;
    }
    
    /**
     * Get Status code of the property
     * @param string status of the listing
     * @return int code of the lising in 
     */
    private function getStatusCode($status) {
        
        if(!empty($status)) {
            
            return isset($this->statusCode[$status]) ? $this->statusCode[$status]:1;
        }
    }
}
