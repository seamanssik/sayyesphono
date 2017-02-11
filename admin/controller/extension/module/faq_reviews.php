<?php
class ControllerExtensionModuleFaqReviews extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/faq_reviews');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('faq_reviews', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_name'] = $this->language->get('entry_name');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/faq_reviews', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/faq_reviews', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('extension/module/faq_reviews', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('extension/module/faq_reviews', $data));
	}

	public function insert() {
		$this->load->language('extension/module/faq_reviews');
		$this->load->model('fido/faq_reviews');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validateForm())) {
			$this->model_fido_faq_reviews->addFaq($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			$this->response->redirect($this->url->link('extension/module/faq_reviews/listing', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->load->language('extension/module/faq_reviews');
		$this->load->model('fido/faq_reviews');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validateForm())) {
			$this->model_fido_faq_reviews->editFaq($this->request->get['faq_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			$this->response->redirect($this->url->link('extension/module/faq_reviews/listing', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('extension/module/faq_reviews');
		$this->load->model('fido/faq_reviews');

		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $faq_id) {
				$this->model_fido_faq_reviews->deleteFaq($faq_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			$this->response->redirect($this->url->link('extension/module/faq_reviews/listing', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function listing() {
		$this->load->language('extension/module/faq_reviews');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->getList();
	}

	private function getModule() {
		$this->load->language('extension/module/faq_reviews');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('testimonial', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->cache->delete('product');

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_content_top'] = $this->language->get('text_content_top');
		$data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$data['text_column_left'] = $this->language->get('text_column_left');
		$data['text_column_right'] = $this->language->get('text_column_right');

		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_position'] = $this->language->get('entry_position');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['button_faqs'] = $this->language->get('button_faqs');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_module'] = $this->language->get('button_add_module');
		$data['button_remove'] = $this->language->get('button_remove');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('text_home'),
			'separator' => FALSE
		);

		$data['breadcrumbs'][] = array(
			'href'      => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('text_module'),
			'separator' => ' :: '
		);

		$data['breadcrumbs'][] = array(
			'href'      => $this->url->link('extension/module/faq_reviews', 'token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('heading_title'),
			'separator' => ' :: '
		);

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/faq_reviews', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('extension/module/faq_reviews', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		$data['faqs'] = $this->url->link('extension/module/faq_reviews/listing', 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');
				
		$this->load->model('design/layout');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/faq_reviews', $data));
	}

	private function getList() {
		$this->load->language('extension/module/faq_reviews');
		
		$this->load->model('fido/faq_reviews');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['column_author'] = $this->language->get('column_author');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_module'] = $this->language->get('button_module');
		$data['button_insert'] = $this->language->get('button_insert');
		$data['button_delete'] = $this->language->get('button_delete');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('text_home'),
			'separator' => FALSE
		);

		$data['breadcrumbs'][] = array(
			'href'      => $this->url->link('extension/module/faq_reviews/listing', 'token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('heading_title'),
			'separator' => ' :: '
		);

		$data['module'] = $this->url->link('extension/module/faq_reviews', 'token=' . $this->session->data['token'], 'SSL');
		$data['insert'] = $this->url->link('extension/module/faq_reviews/insert', 'token=' . $this->session->data['token'], 'SSL');
		$data['delete'] = $this->url->link('extension/module/faq_reviews/delete', 'token=' . $this->session->data['token'], 'SSL');

		$data['topics'] = array();

		$faq_total = $this->model_fido_faq_reviews->getTotalFaqs();

		$results = $this->model_fido_faq_reviews->getFaqs();

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('extension/module/faq_reviews/update', 'token=' . $this->session->data['token'] . '&faq_id=' . $result['faq_id'], 'SSL')
			);

			$data['topics'][] = array(
				'faq_id'     	=> $result['faq_id'],
				'author_name'	=> $result['author_name'],
				'description'  	=> strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')),
				'status'     	=> ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'sort_order' 	=> $result['sort_order'],
				'selected'   	=> isset($this->request->post['selected']) && in_array($result['faq_id'], $this->request->post['selected']),
				'action'     	=> $action
			);
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/faq_reviews/list', $data));
	}

	private function getForm() {
		$this->load->language('extension/module/faq_reviews');
		
		$this->load->model('fido/faq_reviews');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_image_manager'] = $this->language->get('text_image_manager');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_browse'] = $this->language->get('text_browse');
		$data['text_clear'] = $this->language->get('text_clear');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_none'] = $this->language->get('text_none');

		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_topic'] = $this->language->get('entry_topic');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_promo_text'] = $this->language->get('entry_promo_text');
		$data['entry_promo_link'] = $this->language->get('entry_promo_link');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_pimage'] = $this->language->get('entry_pimage');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_edit'] = $this->language->get('button_edit');

		$data['tab_general'] = $this->language->get('tab_general');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = '';
		}

		if (isset($this->error['author_name'])) {
			$data['error_author_name'] = $this->error['author_name'];
		} else {
			$data['error_author_name'] = '';
		}

		if (isset($this->error['description'])) {
			$data['error_description'] = $this->error['description'];
		} else {
			$data['error_description'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('text_home'),
			'separator' => FALSE
		);

		$data['breadcrumbs'][] = array(
			'href'      => $this->url->link('extension/module/faq_reviews/listing', 'token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('heading_title'),
			'separator' => ' :: '
		);

		if (!isset($this->request->get['faq_id'])) {
			$data['action'] = $this->url->link('extension/module/faq_reviews/insert', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('extension/module/faq_reviews/update', 'token=' . $this->session->data['token'] . '&faq_id=' . $this->request->get['faq_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module/faq_reviews/listing', 'token=' . $this->session->data['token'], 'SSL');

		if ((isset($this->request->get['faq_id'])) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
     		$faq_info = $this->model_fido_faq_reviews->getFaq($this->request->get['faq_id']);
    	}

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['faq_description'])) {
			$data['faq_description'] = $this->request->post['faq_description'];
		} elseif (isset($faq_info)) {
			$data['faq_description'] = $this->model_fido_faq_reviews->getFaqDescriptions($this->request->get['faq_id']);
		} else {
			$data['faq_description'] = array();
		}

		$data['topics'] = $this->model_fido_faq_reviews->getTopicList(0);

		if (isset($this->request->post['topic_id'])) {
			$data['topic_id'] = $this->request->post['topic_id'];
		} elseif (isset($faq_info)) {
			$data['topic_id'] = $faq_info['topic_id'];
		} else {
			$data['topic_id'] = '';
		}

		$this->load->model('setting/store');

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (isset($faq_info)) {
			$data['status'] = $faq_info['status'];
		} else {
			$data['status'] = '';
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (isset($faq_info)) {
			$data['sort_order'] = $faq_info['sort_order'];
		} else {
			$data['sort_order'] = '';
		}

		if (isset($this->request->post['date_added'])) {
			$data['date_added'] = $this->request->post['date_added'];
		} elseif (!empty($faq_info)) {
			$data['date_added'] = ($faq_info['date_added'] != '0000-00-00') ? date('Y-m-d', strtotime($faq_info['date_added'])) : '';
		} else {
			$data['date_added'] = date('Y-m-d');
		}

		// Image
		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($faq_info)) {
			$data['image'] = $faq_info['image'];
		} else {
			$data['image'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($faq_info) && is_file(DIR_IMAGE . $faq_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($faq_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		$data['token'] = $this->session->data['token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/faq_reviews/form', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/faq_reviews')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 256)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		return !$this->error;
	}

	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'extension/module/faq_reviews')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['faq_description'] as $language_id => $value) {
			if (strlen($value['author_name']) < 3 || (utf8_strlen($value['author_name']) > 32)) {
				$this->error['author_name'][$language_id] = $this->language->get('error_author_name');
			}

			if (strlen($value['description']) < 3) {
				$this->error['description'][$language_id] = $this->language->get('error_description');
			}
		}

		return !$this->error;
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'extension/module/faq_reviews')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}
?>
