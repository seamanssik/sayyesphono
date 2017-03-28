<?php
class ControllerAccountCheckPhone extends Controller
{
    public function index()
    {
        $this->load->model('account/customer');
        $customer_data = $this->model_account_customer->getCustomer($this->customer->getId());
        if(!$this->customer->isLogged() || $customer_data['phone_approved'] == 1){
            $this->response->redirect($this->url->link('account/edit'));
        }

        if($customer_data['sms_code'] == ''){
            $short_code = $this->generateShortCode();
            $this->db->query("UPDATE " . DB_PREFIX . "customer SET sms_code = '" . $short_code . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
        }else{
            $short_code = $customer_data['sms_code'];
        }

        $data['short_code'] = $short_code;

        if(!isset($this->session->data['already_send'])){
            $sms = new SMS();
            $sms->send($customer_data['telephone'], 'Ваш код регистрации на сайте: ' . $short_code . ' sayyesphoto.com');
        }
        $this->session->data['already_send'] = true;


        $data['action'] = $this->url->link('account/check_phone/checker', '', true);
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('account/check_phone', $data));
    }

    public function generateShortCode()
    {
        return mt_rand(100000,999999);
    }

    public function checker()
    {
        $this->load->model('account/customer');
        $customer_data = $this->model_account_customer->getCustomer($this->customer->getId());
        $sms_code = $customer_data['sms_code'];
        if($this->request->post['validation_code'] == $sms_code){
            $this->db->query("UPDATE " . DB_PREFIX . "customer SET phone_approved = '" . 1 . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
            $respoonse = array(
                'answer' => 'done'
            );
//            $this->response->redirect($this->url->link('common/home'));
        }else{
            $respoonse = array(
                'answer' => 'fail'
            );
//            $this->response->redirect($this->url->link('account/edit'));
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($respoonse));
    }
}