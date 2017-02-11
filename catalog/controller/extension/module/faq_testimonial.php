<?php
class ControllerExtensionModuleFaqTestimonial extends Controller {

	private $error = array();

	public function index() {
		$this->language->load('extension/module/faq_testimonial');

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_success'] = $this->language->get('text_success');

		$data['error_email'] = $this->language->get('error_email');
		
		$data['entry_author_name'] = $this->language->get('entry_author_name');
		$data['entry_author_mail'] = $this->language->get('entry_author_mail');
		$data['entry_faq'] = $this->language->get('entry_faq');

		$data['button_submit'] = $this->language->get('button_submit');

		$data['action'] = $this->url->link('information/information', 'information_id=7', true);

		$data['faq_key'] = false;

		if ( isset($this->request->get['faq']) ) {
			$data['faq_key'] = (int)$this->request->get['faq'];
		}

		$this->load->model('fido/faq_testimonial');

		/*
		if(($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()){
			$this->model_fido_faq_testimonial->addFaq($this->request->post);
			$this->session->data['success'] = true;
			$this->response->redirect($this->url->link('information/information', 'information_id=7', 'SSL'));
		}
		*/

		$data['error_author_name'] = '';
		if (isset($this->error['author_name']))
			$data['error_author_name'] = $this->error['author_name'];

		$data['error_author_email'] = '';
		if (isset($this->error['author_mail']))
			$data['error_author_email'] = $this->error['author_mail'];

		$data['error_title'] = '';
		if (isset($this->error['title']))
			$data['error_title'] = $this->error['title'];

		$data['success'] = false;
		if (isset($this->session->data['success'])){
			$data['success'] = true;
			unset($this->session->data['success']);
		}

		if (isset($this->request->post['author_name']))
			$data['author_name'] = $this->request->post['author_name'];
		else
			$data['author_name'] = $this->customer->getFirstName();

		if (isset($this->request->post['author_mail']))
			$data['author_mail'] = $this->request->post['author_mail'];
		else
			$data['author_mail'] = $this->customer->getEmail();

		$data['title'] = '';
		if (isset($this->request->post['title']))
			$data['title'] = $this->request->post['title'];

		if (isset($this->request->post['captcha'])) {
			$data['captcha'] = $this->request->post['captcha'];
		} else {
			$data['captcha'] = '';
		}

		if (isset($this->request->get['topic'])) {
			$parts = explode('_', (string)$this->request->get['topic']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['topic_id'] = $parts[0];
		} else {
			$data['topic_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

		// Get topic #START
		// ================
		$data['topics'] = array();

		$topics = $this->model_fido_faq_testimonial->getTopicList();

		foreach ($topics as $topic) {

			$children_data = array();

			$children = $this->model_fido_faq_testimonial->getTopics($topic['topic_id']);

			foreach ($children as $child) {
				$children_data[] = array(
					'faq_id'      	=> $child['faq_id'],
					'title'       	=> strip_tags(html_entity_decode($child['title'], ENT_QUOTES, 'UTF-8')),
					'description'	=> html_entity_decode($child['description'], ENT_QUOTES, 'UTF-8'),
				);
			}

			$data['topics'][] = array(
				'topic_id'	=> $topic['topic_id'],
				'faqs'		=> $children_data,
				'name'		=> strip_tags(html_entity_decode($topic['name'], ENT_QUOTES, 'UTF-8')),
			);
		}
		// ==============
		// Get topic #END

		$data['faqs'] = array();

		$faqs = $this->model_fido_faq_testimonial->getTopics(0);

		foreach ($faqs as $faq) {
			$children_data = array();

			$children = $this->model_fido_faq_testimonial->getTopics($faq['faq_id']);

			foreach ($children as $child) {
				$data = array(
					'filter_faq_id'  => $child['faq_id'],
					'filter_sub_faq' => true
				);

				$children_data[] = array(
					'faq_id'      => $child['faq_id'],
					'title'       => strip_tags(html_entity_decode($child['title'], ENT_QUOTES, 'UTF-8')),
					'href'        => $this->url->link('information/faq', 'topic=' . $faq['faq_id'] . '_' . $child['faq_id'])
				);
			}

			$data['faqs'][] = array(
				'faq_id'		=> $faq['faq_id'],
				'description'	=> html_entity_decode($faq['description'], ENT_QUOTES, 'UTF-8'),
				'title'			=> strip_tags(html_entity_decode($faq['title'], ENT_QUOTES, 'UTF-8')),
				'author_name'	=> $faq['author_name'],
				'moderator_name'=> $faq['moderator_name'],
				'children'		=> $children_data,
				'href'			=> $this->url->link('information/faq_testimonial', 'topic=' . $faq['faq_id'])
			);
		}

		return $this->load->view('extension/module/faq_testimonial', $data);

  	}

	private function validate(){
		if ((strlen(trim(utf8_decode($this->request->post['author_name']))) < 2) || (strlen(trim(utf8_decode($this->request->post['author_name']))) > 20)) {
			$this->error['author_name'] = $this->language->get('error_author_name');
		}
		if ((strlen(utf8_decode($this->request->post['title'])) < 5) || (strlen(utf8_decode($this->request->post['title'])) > 500)) {
			$this->error['title'] = $this->language->get('error_title');
		}
		if (!preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['author_mail'])) {
			$this->error['author_mail'] = $this->language->get('error_email');
		}

		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}
	
}