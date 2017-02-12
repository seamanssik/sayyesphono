<?php
class ControllerAccountCheckSocial extends Controller
{
    public function registe_account() {
        $data = file_get_contents('http://ulogin.ru/token.php?token=' . $this->request->post['token'] .
            '&host=' . $_SERVER['HTTP_HOST']);
        $user = json_decode($data, true);

        $user_data = array(
            'firstname' => $user['first_name'],
            'lastname'  => $user['last_name'],
            'email'     => $user['email'],
            'telephone' => $user['phone'],
            'password'  => $this->rand_passwd(),
            'city'      => $user['city'],
            'fax'      => '',
            'company'   => '',
            'address_1' => '',
            'address_2' => '',
            'postcode'  => '',
            'country_id'=> '',
            'zone_id'   => '',
        );

        $this->load->model('account/customer');

        $customer_exist = $this->model_account_customer->getCustomerByEmail($user_data['email']);
        if(!$customer_exist){
            $customer_id = $this->model_account_customer->addCustomer($user_data);
        }else{
            $customer_id = $customer_exist['customer_id'];
        }


        $customer_social_data_exist = $this->model_account_customer->getCustomerSocialData($customer_id);

        if(!$customer_social_data_exist){
            if($user['network'] == 'vkontakte'){
                $this->db->query("INSERT INTO " . DB_PREFIX . "customer_social_data SET customer_id = '" . $customer_id . "', vk_uid = '" . $user['uid'] . "', vk_link = '" . $user['identity'] . "'");
            }

            if($user['network'] == 'facebook'){
                $this->db->query("INSERT INTO " . DB_PREFIX . "customer_social_data SET customer_id = '" . $customer_id . "', fb_uid = '" . $user['uid'] . "', fb_link = '" . $user['identity'] . "'");
            }

            if($user['network'] == 'google'){
                $this->db->query("INSERT INTO " . DB_PREFIX . "customer_social_data SET customer_id = '" . $customer_id . "', google_uid = '" . $user['uid'] . "', google_link = '" . $user['identity'] . "'");
            }
        }else{
            if($user['network'] == 'vkontakte'){
                $this->db->query("UPDATE " . DB_PREFIX . "customer_social_data SET vk_uid = '" . $user['uid'] . "', vk_link = '" . $user['identity'] . "' WHERE customer_id = '" . $customer_id . "'");
            }

            if($user['network'] == 'facebook'){
                $this->db->query("UPDATE " . DB_PREFIX . "customer_social_data SET fb_uid = '" . $user['uid'] . "', fb_link = '" . $user['identity'] . "' WHERE customer_id = '" . $customer_id . "'");
            }

            if($user['network'] == 'google'){
                $this->db->query("UPDATE " . DB_PREFIX . "customer_social_data SET google_uid = '" . $user['uid'] . "', google_link = '" . $user['identity'] . "' WHERE customer_id = '" . $customer_id . "'");
           }
        }
        
        $this->customer->login($user_data['email'], '', true);

        $this->response->redirect($this->url->link('account/account', '', true));
    }

    public function login_account()
    {
        $data = file_get_contents('http://ulogin.ru/token.php?token=' . $this->request->post['token'] .
            '&host=' . $_SERVER['HTTP_HOST']);
        $user = json_decode($data, true);

        $this->load->model('account/customer');

        $customer_exist = $this->model_account_customer->getCustomerByEmail($user['email']);

        if($user['network'] == 'vkontakte'){
            $this->db->query("UPDATE " . DB_PREFIX . "customer_social_data SET vk_uid = '" . $user['uid'] . "', vk_link = '" . $user['identity'] . "' WHERE customer_id = '" . $customer_exist['customer_id'] . "'");
        }

        if($user['network'] == 'facebook'){
            $this->db->query("UPDATE " . DB_PREFIX . "customer_social_data SET fb_uid = '" . $user['uid'] . "', fb_link = '" . $user['identity'] . "' WHERE customer_id = '" . $customer_exist['customer_id'] . "'");
        }

        if($user['network'] == 'google'){
            $this->db->query("UPDATE " . DB_PREFIX . "customer_social_data SET google_uid = '" . $user['uid'] . "', google_link = '" . $user['identity'] . "' WHERE customer_id = '" . $customer_exist['customer_id'] . "'");
        }

        if($customer_exist){
            $this->customer->login($user['email'], '', true);
            $this->response->redirect($this->url->link('account/account', '', true));
        }

//        $customer_data = array();
//
//        if($user['network'] == 'vkontakte'){
//            $customer_data = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_social_data WHERE vk_uid = '" . $user['uid'] . "'")->row;
//        }
//
//        if($user['network'] == 'facebook'){
//            $customer_data = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_social_data WHERE fb_uid = '" . $user['uid'] . "'")->row;
//        }
//
//        if($user['network'] == 'google'){
//            $customer_data = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_social_data WHERE google_uid = '" . $user['uid'] . "'")->row;
//        }
//
//        $customer_id = $customer_data['customer_id'];
//
//        $customer_email = $this->db->query("SELECT email FROM " . DB_PREFIX . "customer WHERE customer_id = '" . $customer_id . "'")->row;
//
//
    }

    public function rand_passwd( $length = 6, $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789' ) {
        return substr( str_shuffle( $chars ), 0, $length );
    }
}