<?php
class ControllerCommonFaqReviewsTopic extends Controller {
    private $error = array();

    public function index() {

        $this->load->language('module/faq_reviews');

        $this->load->model('fido/faq_reviews');

        $this->getForm($this->request->post);
        
    }

    public function listing() {

        $this->load->language('module/faq_reviews');

        $this->load->model('fido/faq_reviews');

        $this->getList();
        
    }

    public function add() {

        $json = array();

        $this->load->language('module/faq_reviews');

        $this->load->model('fido/faq_reviews');

        if ( ($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate() ) {

            $this->model_fido_faq_reviews->addTopic($this->request->post);

            $json['success'] = $this->language->get('text_success');
        }

        if (isset($this->error['warning'])) {
            $json['error'] = $this->error['warning'];
        } else {
            $json['error'] = false;
        }

        if (isset($this->error['name'])) {
            $json['error'] = $this->error['name'];
        } else {
            $json['error'] = false;
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));

    }

    public function edit() {

        $json = array();

        $this->load->language('module/faq_reviews');

        $this->load->model('fido/faq_reviews');

        if ( ($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate() ) {

            $this->model_fido_faq_reviews->editTopic($this->request->get['topic_id'], $this->request->post);

            $json['success'] = $this->language->get('text_success');
        }

        if (isset($this->error['warning'])) {
            $json['error'] = $this->error['warning'];
        } else {
            $json['error'] = false;
        }

        if (isset($this->error['name'])) {
            $json['error'] = $this->error['name'];
        } else {
            $json['error'] = false;
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));

    }

    public function delete() {

        $json = array();

        $this->load->language('module/faq_reviews');

        $this->load->model('fido/faq_reviews');

        if ( ($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateDelete() ) {

            $this->model_fido_faq_reviews->deleteTopic($this->request->post['topic_id']);

            $json['success'] = $this->language->get('text_success_delete');
        }

        if (isset($this->error['warning'])) {
            $json['error'] = $this->error['warning'];
        } else {
            $json['error'] = false;
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));

    }

    private function getList() {

        $data = array();

        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();

        $data['token'] = $this->session->data['token'];

        $data['topics'] = array();

        $results = $this->model_fido_faq_reviews->getTopicList();
        if ($results) {

            foreach ($results as $result) {
                $data['topics'][] = array(
                    'topic_id'      => $result['topic_id'],
                    'name'          => $result['name'],
                    'sort_order'    => $result['sort_order']
                );
            }

        }

        $this->response->setOutput($this->load->view('extension/module/faq_reviews/topic_list.tpl', $data));
    }

    private function getForm($request = array()) {

        $data = array();

        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();

        $data['heading_title'] = ( empty($request['topic_id']) ) ? $this->language->get('topic_text_add') : $this->language->get('topic_text_edit');

        $data['token'] = $this->session->data['token'];

        if ( !empty($request['topic_id']) ) {

            $topic_info = $this->model_fido_faq_reviews->getTopicById($request['topic_id']);

            if ($topic_info) {
                $data['topic_id'] = $topic_info['topic_id'];
                $data['topic'] = $this->model_fido_faq_reviews->getTopicDescriptionById($request['topic_id']);
                $data['sort_oder'] = $topic_info['sort_order'];
            }
            
        } else {

            $data['topic_id'] = 0;
            $data['topic'] = array();
            $data['sort_oder'] = 0;

        }

        if ( empty($request['topic_id']) ) {
            $data['action'] = $this->url->link('common/faq_reviews_topic/add', '', 'SSL');
        } else {
            $data['action'] = $this->url->link('common/faq_reviews_topic/edit', '', 'SSL');
        }

        return $this->response->setOutput($this->load->view('extension/module/faq_reviews/topic_form.tpl', $data));

    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'common/faq_reviews_topic')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        foreach ($this->request->post['topic'] as $language_id => $value) {
            if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 64)) {
                $this->error['name'] = $this->language->get('topic_error_name');
            }
        }

        return !$this->error;
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'common/faq_reviews_topic')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

}