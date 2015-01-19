<?php
class ControllerAccountConnect extends Controller {

    public function index() {
        if ($this->customer->isLogged()) {
            $this->response->redirect($this->url->link('account/account', '', 'SSL'));
        }
        require_once( DIR_APPLICATION. "model/account/social_connect/Hybrid/Auth.php" );
        $provider = "facebook";

        if (isset($_REQUEST['hauth_start']) || isset($_REQUEST['hauth_done']))
        {
            require_once( DIR_APPLICATION. "model/account/social_connect/Hybrid/Endpoint.php" );
            Hybrid_Endpoint::process();
        }

        $this->load->model('account/connect');
        try {
            $config = $this->model_account_connect->getFacebookConfig();
            $hybridAuth = new Hybrid_Auth($config);
            $adapter = $hybridAuth->authenticate( $provider);
            $adapter = $hybridAuth->getAdapter($provider);
            $userProfile = $adapter->getUserProfile();
            if (!empty($userProfile)) {
                $this->load->model('account/customer');

                if (!$this->customer->login($userProfile->email, $userProfile->identifier)) {
                    $data = array();
                    $data['customer_group_id'] = 1;
                    $data['firstname'] = $userProfile->firstName;
                    $data['email'] = $userProfile->email;
                    $data['telephone'] = $userProfile->phone;
                    $data['password'] = $userProfile->identifier;
                    $data['confirm'] = $userProfile->identifier;

                    $this->model_account_customer->addCustomer($data);

                    $this->customer->login($userProfile->email, $userProfile->identifier);

                    unset($this->session->data['guest']);

                    // Add to activity log
                    $this->load->model('account/activity');

                    $activity_data = array(
                        'customer_id' => $this->customer->getId(),
                        'name'        => $userProfile->firstName . ' ' . $userProfile->lastName
                    );

                    $this->model_account_activity->addActivity('register', $activity_data);

                    $this->response->redirect($this->url->link('account/success'));
                } else {
                    unset($this->session->data['guest']);

                    // Add to activity log
                    $this->load->model('account/activity');

                    $activity_data = array(
                        'customer_id' => $this->customer->getId(),
                        'name'        => $userProfile->firstName . ' ' . $userProfile->lastName
                    );

                    $this->model_account_activity->addActivity('login', $activity_data);

                    // Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
                    if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
                        $this->response->redirect(str_replace('&amp;', '&', $this->request->post['redirect']));
                    } else {
                        //----$this->response->redirect($this->url->link('account/account', '', 'SSL'));
                        $this->response->redirect($this->url->link('common/home', '', 'SSL'));
                    }
                }
            }
        }
        catch( Exception $e ){

            // User not connected?
            if( $e->getCode() == 6 || $e->getCode() == 7 ){
                // log the user out (erase his session locally)
                $adapter->logout();
                // try to authenticate again
                $adapter = $hybridAuth->authenticate( $provider );
                $this->response->redirect($this->url->link('common/home', '', 'SSL'));
            }
        }
        $this->response->redirect($this->url->link('common/home', '', 'SSL'));
    }
}