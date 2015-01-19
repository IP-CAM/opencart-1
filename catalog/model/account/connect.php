<?php
class ModelAccountConnect extends Model {

// ----------------------------------------------------------------------------------------
//	HybridAuth Config file: http://hybridauth.sourceforge.net/userguide/Configuration.html
// ----------------------------------------------------------------------------------------
    public function getFacebookConfig() {
        $fbAppId = $this->config->get('fb_app_id');
        $fbAppSecret = $this->config->get('fb_app_secret');
        return
            array(
                "base_url" => $this->url->link('account/connect/', '', 'SSL') ,
                "providers" => array (
                    "Facebook" => array (
                        "enabled" => true,
                        "keys"    => array ( "id" => $fbAppId, "secret" => $fbAppSecret ),
                        "trustForwarded" => false
                    ),
                ),
                "debug_mode" => false,
                "debug_file" => "",
            );
    }
}