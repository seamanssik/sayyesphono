<?php
class ControllerExtensionModuleFaqReviews extends Controller {

	private $error = array();

	public function index() {
		$this->language->load('extension/module/faq_reviews');

		$this->load->model('tool/image');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
		} else {
			$limit = 8;
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_success'] = $this->language->get('text_success');

		$data['error_email'] = $this->language->get('error_email');
		
		$data['entry_author_name'] = $this->language->get('entry_author_name');
		$data['entry_author_mail'] = $this->language->get('entry_author_mail');
		$data['entry_faq'] = $this->language->get('entry_faq');

		$data['button_submit'] = $this->language->get('button_submit');

		$data['action'] = $this->url->link('information/information', 'information_id=8', true);

		$data['faq_key'] = false;

		if ( isset($this->request->get['faq']) ) {
			$data['faq_key'] = (int)$this->request->get['faq'];
		}

		$this->load->model('fido/faq_reviews');

		/*
		if(($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()){
			$this->model_fido_faq_reviews->addFaq($this->request->post);
			$this->session->data['success'] = true;
			$this->response->redirect($this->url->link('information/information', 'information_id=8', 'SSL'));
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

		$data['topics'] = array();

		$topic_total = 0;

		$topics = $this->model_fido_faq_reviews->getTopicList();

		foreach ($topics as $topic) {

			$children_data = array();

			$filter_data = array(
				'topic_id'       	 => $topic['topic_id'],
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);

			$topic_total = $this->model_fido_faq_reviews->getTotalTopics($filter_data);

			$children = $this->model_fido_faq_reviews->getTopics($filter_data);

			foreach ($children as $child) {

				if (isset($child['image']) && is_file(DIR_IMAGE . $child['image'])) {
					$image = $this->model_tool_image->cropsize($child['image'], 320, 480);
				} else {
					$image = $this->model_tool_image->cropsize('placeholder.png', 320, 480);
				}

				$children_data[] = array(
					'faq_id'      	=> $child['faq_id'],
					'image'			=> $image,
					'author_name'	=> $child['author_name'],
					'author_review'	=> html_entity_decode($child['description'], ENT_QUOTES, 'UTF-8'),
					'date' 			=> date("d", strtotime($child['date_added'])) . '<br>' . date("m", strtotime($child['date_added'])),
					'year' 			=> date("Y", strtotime($child['date_added']))
				);
			}

			$data['topics'][] = array(
				'topic_id'	=> $topic['topic_id'],
				'faqs'		=> $children_data,
				'name'		=> strip_tags(html_entity_decode($topic['name'], ENT_QUOTES, 'UTF-8')),
			);
		}

		$pagination = new Pagination();
		$pagination->total = $topic_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('information/information', 'information_id=8' . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($topic_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($topic_total - $limit)) ? $topic_total : ((($page - 1) * $limit) + $limit), $topic_total, ceil($topic_total / $limit));

		// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
		if ($page == 1) {
			$this->document->addLink($this->url->link('information/information', 'information_id=8', true), 'canonical');
		} elseif ($page == 2) {
			$this->document->addLink($this->url->link('information/information', 'information_id=8', true), 'prev');
		} else {
			$this->document->addLink($this->url->link('information/information', 'information_id=8' . '&page='. ($page - 1), true), 'prev');
		}

		if ($limit && ceil($topic_total / $limit) > $page) {
			$this->document->addLink($this->url->link('information/information', 'information_id=8' . '&page='. ($page + 1), true), 'next');
		}

		return $this->load->view('extension/module/faq_reviews', $data);

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