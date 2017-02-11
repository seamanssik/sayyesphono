<?php
class ControllerCatalogPromoTags extends Controller {
	private $error = array();

  	public function index() {
		$this->load->language('catalog/promotags');

		$this->document->setTitle($this->language->get('heading_title')); 

		$this->load->model('catalog/promotags');

		$this->getList();
  	}

  	public function add() {
    	$this->load->language('catalog/promotags');

    	$this->document->setTitle($this->language->get('heading_title')); 

		$this->load->model('catalog/promotags');

    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_promotags->addPromoTags($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/promotags', 'token=' . $this->session->data['token'] . $url, 'SSL'));
    	}

    	$this->getForm();
  	}

  	public function edit() {
    	$this->load->language('catalog/promotags');

    	$this->document->setTitle($this->language->get('heading_title')); 

		$this->load->model('catalog/promotags');

    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_promotags->editPromoTags($this->request->get['promo_tags_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/promotags', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

    	$this->getForm();
  	}

  	public function delete() {
    	$this->load->language('catalog/promotags');

    	$this->document->setTitle($this->language->get('heading_title')); 

		$this->load->model('catalog/promotags');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $promo_tags_id) {
				$this->model_catalog_promotags->deletePromoTags($promo_tags_id);
	  		}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/promotags', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

    	$this->getList();
  	}

	public function repair() {
		$this->load->language('catalog/promotags');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/promotags');

		if ($this->validateRepair()) {
			$this->model_catalog_promotags->repairPromotags();

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('catalog/promotags', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getList();
	}


	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/promotags', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['add'] = $this->url->link('catalog/promotags/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('catalog/promotags/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['repair'] = $this->url->link('catalog/promotags/repair', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['promotags'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$this->load->model('tool/image');
		$promotags_total = $this->model_catalog_promotags->getTotalPromoTags($data);
		$results = $this->model_catalog_promotags->getPromoTags($data);

		foreach ($results as $result) {
			$_images = $this->model_catalog_promotags->getPromoTagsImages($result['promo_tags_id']);
			$images = array();
			foreach($_images as $image){
				if (file_exists(DIR_IMAGE . $image['image'])) {
					$images[] = $this->model_tool_image->resize($image['image'], 50, 50);
				} else {
					$image = $this->model_tool_image->resize('no_image.jpg', 50, 50);
				}
			}
			
			$data['promotags'][] = array(
				'promo_tags_id' 	=> $result['promo_tags_id'],
				'promo_text'    	=> $result['promo_text'],
				'images'			=> $images,
				'sort_order'    	=> $result['sort_order'],
		    	'selected'   		=> isset($this->request->post['selected']) && in_array($result['promo_tags_id'], $this->request->post['selected']),
				'edit'        => $this->url->link('catalog/promotags/edit', 'token=' . $this->session->data['token'] . '&promo_tags_id=' . $result['promo_tags_id'] . $url, 'SSL'),
				'delete'      => $this->url->link('catalog/promotags/delete', 'token=' . $this->session->data['token'] . '&promo_tags_id=' . $result['promo_tags_id'] . $url, 'SSL')
			);
    	}
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_image_manager'] = $this->language->get('text_image_manager');

		$data['column_image'] = $this->language->get('column_image');
		$data['column_pimage'] = $this->language->get('column_pimage');
		$data['column_image_position'] = $this->language->get('column_image_position');
		$data['column_promo_text'] = $this->language->get('column_promo_text');
    	$data['column_promo_link'] = $this->language->get('column_promo_link');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_edit'] = $this->language->get('button_edit');
	
 		$data['token'] = $this->session->data['token'];

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
		
		if (isset($this->request->get['filter_promo_text'])) {
			$filter_promo_text = $this->request->get['filter_promo_text'];
		} else {
			$filter_promo_text = NULL;
		}

		if (isset($this->request->get['filter_promo_link'])) {
			$filter_promo_link = $this->request->get['filter_promo_link'];
		} else {
			$filter_promo_link = NULL;
		}

		if (isset($this->request->get['filter_sort_order'])) {
			$filter_sort_order = $this->request->get['filter_sort_order'];
		} else {
			$filter_sort_order = NULL;
		}

		$url = '';

		if (isset($this->request->get['filter_promo_text'])) {
			$url .= '&filter_promo_text=' . $this->request->get['filter_promo_text'];
		}
		
		if (isset($this->request->get['filter_promo_link'])) {
			$url .= '&filter_promo_link=' . $this->request->get['filter_promo_link'];
		}

		if (isset($this->request->get['filter_sort_order'])) {
			$url .= '&filter_sort_order=' . $this->request->get['filter_sort_order'];
		} 

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_promo_text'] = $this->url->link('catalog/promotags', 'token=' . $this->session->data['token'] . '&sort=pt.promo_text' . $url, 'SSL');
		$data['sort_sort_order'] = $this->url->link('catalog/promotags', 'token=' . $this->session->data['token'] . '&sort=pt.sort_order' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
		
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $promotags_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog//promotags', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($promotags_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($promotags_total - $this->config->get('config_limit_admin'))) ? $promotags_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $promotags_total, ceil($promotags_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/promotags_list.tpl', $data));
	}

	protected function getForm() {
    	$data['heading_title'] = $this->language->get('heading_title');

    	$data['text_enabled'] = $this->language->get('text_enabled');
    	$data['text_disabled'] = $this->language->get('text_disabled');
    	$data['text_default'] = $this->language->get('text_default');
		$data['text_image_manager'] = $this->language->get('text_image_manager');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_browse'] = $this->language->get('text_browse');
		$data['text_clear'] = $this->language->get('text_clear');
		$data['text_confirm'] = $this->language->get('text_confirm');
	
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

 		if (isset($this->error['promo_text'])) {
			$data['error_promo_text'] = $this->error['promo_text'];
		} else {
			$data['error_promo_text'] = '';
		}
		
		if (isset($this->error['promo_link'])) {
			$data['error_promo_link'] = $this->error['promo_link'];
		} else {
			$data['error_promo_link'] = '';
		}

   		if (isset($this->error['sort_order'])) {
			$data['error_sort_order'] = $this->error['sort_order'];
		} else {
			$data['error_sort_order'] = '';
		}

		$url = '';

		if (isset($this->request->get['filter_promo_text'])) {
			$url .= '&filter_promo_text=' . $this->request->get['filter_promo_text'];
		}

		if (isset($this->request->get['filter_promo_link'])) {
			$url .= '&filter_promo_link=' . $this->request->get['filter_promo_link'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/promotags', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['add'] = $this->url->link('catalog/promotags/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('catalog/promotags/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['repair'] = $this->url->link('catalog/promotags/repair', 'token=' . $this->session->data['token'] . $url, 'SSL');
   		
   		$this->load->model('localisation/language');
   		$languages = $this->model_localisation_language->getLanguages();
   		$data['languages'] = $languages;

		if (!isset($this->request->get['promo_tags_id'])) {
			$data['action'] = $this->url->link('catalog/promotags/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('catalog/promotags/edit', 'token=' . $this->session->data['token'] . '&promo_tags_id=' . $this->request->get['promo_tags_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link('catalog/promotags', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->get['promo_tags_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$promotags_info = $this->model_catalog_promotags->getPromoTag($this->request->get['promo_tags_id']);
    	}
		
		if (isset($this->request->post['promo_text'])) {
      		$data['promo_text'] = $this->request->post['promo_text'];
    	} elseif (isset($promotags_info)) {
			$data['promo_text'] = $promotags_info['promo_text'];
		} else {	
      		$data['promo_text'] = '';
    	}
		
				
		if (isset($this->request->post['sort_order'])) {
      		$data['sort_order'] = $this->request->post['sort_order'];
    	} elseif (isset($promotags_info)) {
			$data['sort_order'] = $promotags_info['sort_order'];
		} else {	
      		$data['sort_order'] = '';
    	}

		$this->load->model('tool/image');

		$images = array();

		if (isset($promotags_info)) {
			$promo_images = $this->model_catalog_promotags->getPromoTagsImages($this->request->get['promo_tags_id']);
			foreach($languages as $language){
				if(isset($promo_images[$language['language_id']]) && file_exists(DIR_IMAGE . $promo_images[$language['language_id']]['image'])){
					$images[$language['language_id']] = $this->model_tool_image->resize($promo_images[$language['language_id']]['image'], 100, 100);
					$images_values[$language['language_id']] = $promo_images[$language['language_id']]['image'];
				} else {
					$images[$language['language_id']] = $this->model_tool_image->resize('no_image.png', 100, 100);
					$images_values[$language['language_id']] = '';
				}
			}
		} else {
			foreach($languages as $language){
				$images[$language['language_id']] = $this->model_tool_image->resize('no_image.png', 100, 100);
				$images_values[$language['language_id']] = '';
			}
		}
		$data['images'] = $images;
		$data['images_values'] = $images_values;

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/promotags_form.tpl', $data));
  	}

	protected function validateForm() {
    	if (!$this->user->hasPermission('modify', 'catalog/promotags')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}

    	if ((strlen(utf8_decode($this->request->post['promo_text'])) < 1) || (strlen(utf8_decode($this->request->post['promo_text'])) > 64)) {
      		$this->error['promo_text'] = $this->language->get('error_promo_text');
    	}

    	if (!$this->error) {
			return TRUE;
    	} else {
			if (!isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_required_data');
			}
      		return FALSE;
    	}
  	}

	protected function validateDelete() {
    	if (!$this->user->hasPermission('modify', 'catalog/promotags')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}
		
		$this->load->model('catalog/promotags');

		foreach ($this->request->post['selected'] as $promotags_id) {
  			$promotags_top_right = $this->model_catalog_promotags->getTotalProductsByPromoTagsTopRightId($promotags_id);

			if ($promotags_top_right) {
	  			$this->error['warning'] = sprintf($this->language->get('error_promotags'), $promotags_top_right);	
			}
	  	} 
		
		if (!$this->error) {
	  		return TRUE;
		} else {
	  		return FALSE;
		}
  	}

	protected function validateRepair() {
		if (!$this->user->hasPermission('modify', 'catalog/promotags')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

}
?>