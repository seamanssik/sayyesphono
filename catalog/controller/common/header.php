<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// Analytics
		$this->load->model('extension/extension');
		
		$this->load->model('common/header');

		$data['menusLeft'] = array();

		$menus_informationLeft = $this->model_common_header->getInformationsLeft();

		if ($menus_informationLeft) {
			foreach ($menus_informationLeft as $menu_informationLeft) {
				$data['menusLeft'][] = array(
					'href' 			=> $this->url->link('information/information', 'information_id=' . $menu_informationLeft['information_id'], true),
					'name' 			=> $menu_informationLeft['title'],
					'sort_order' 	=> $menu_informationLeft['sort_order']
				);
			}
		}

		$menus_categoriesLeft = $this->model_common_header->getCategoriesLeft();

		if ($menus_categoriesLeft) {
			foreach ($menus_categoriesLeft as $menus_categoryLeft) {
				$data['menusLeft'][] = array(
					'href' 			=> $this->url->link('product/category', 'path=' . $menus_categoryLeft['category_id'], true),
					'name' 			=> $menus_categoryLeft['name'],
					'sort_order' 	=> $menus_categoryLeft['sort_order']
				);
			}
		}

		$menus_categories_archiveLeft = $this->model_common_header->getCategoriesArchiveLeft();

		if($menus_categories_archiveLeft) {
			foreach ($menus_categories_archiveLeft as $menus_category_archiveLeft) {
				$data['menusLeft'][] = array(
					'href' 			=> $this->url->link('product/photodays_category', 'photodays_path=' . $menus_category_archiveLeft['photodays_category_id'], true),
					'name' 			=> $menus_category_archiveLeft['name'],
					'sort_order' 	=> $menus_category_archiveLeft['sort_order']
				);
			}
		}

		$data['menus'] = array();

		$menus_categories = $this->model_common_header->getCategories();

		if ($menus_categories) {
			foreach ($menus_categories as $menus_category) {
				$data['menus'][] = array(
					'href' 			=> $this->url->link('product/category', 'path=' . $menus_category['category_id'], true),
					'name' 			=> $menus_category['name'],
					'sort_order' 	=> $menus_category['sort_order']
				);
			}
		}

		$menus_categories_archive = $this->model_common_header->getCategoriesArchive();

		if($menus_categories_archive) {
			foreach ($menus_categories_archive as $menus_category_archive) {
				$data['menus'][] = array(
					'href' 			=> $this->url->link('product/photodays_category', 'photodays_path=' . $menus_category_archive['photodays_category_id'], true),
					'name' 			=> $menus_category_archive['name'],
					'sort_order' 	=> $menus_category_archive['sort_order']
				);
			}
		}

		$menus_information = $this->model_common_header->getInformations();

		if ($menus_information) {
			foreach ($menus_information as $menu_information) {
				$data['menus'][] = array(
					'href' 			=> $this->url->link('information/information', 'information_id=' . $menu_information['information_id'], true),
					'name' 			=> $menu_information['title'],
					'sort_order' 	=> $menu_information['sort_order']
				);
			}
		}

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		if ($this->cart->getTotal()) {
			$data['total_cart'] = $this->currency->format($this->cart->getTotal(), $this->session->data['currency']);
		} else {
			$data['total_cart'] = false;
		}

		if ($this->cart->countProducts()) {
			$data['total_cart_count'] = $this->cart->countProducts();
		} else {
			$data['total_cart_count'] = false;
		}


		if(isset($this->request->get['route']) && $this->request->get['route'] != 'account/check_phone'){
			unset($this->session->data['already_send']);
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();

		// OCFilter start
		$data['noindex'] = $this->document->isNoindex();
		// OCFilter end

		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		$data['languages'] = array(
			'contact_page' => array(
				'error_name' 		=> $this->language->get('contact_error_name'),
				'error_email' 		=> $this->language->get('contact_error_email'),
				'error_enquiry' 	=> $this->language->get('contact_error_enquiry')
			),
			'faq_page' => array(
				'error_name' 		=> $this->language->get('faq_error_name'),
				'error_email' 		=> $this->language->get('faq_error_email'),
				'error_title' 		=> $this->language->get('faq_error_title')
			),
			'review_page' => array(
				'error_name' 		=> $this->language->get('review_error_name'),
				'error_email' 		=> $this->language->get('review_error_email'),
				'error_title' 		=> $this->language->get('review_error_title')
			),
			'login_form' => array(
				'error_email' 		=> $this->language->get('login_error_email'),
				'error_password' 	=> $this->language->get('login_error_password')
			),
			'request_form' => array(
				'error_name' 		=> $this->language->get('request_error_name'),
				'error_tel' 	=> $this->language->get('request_error_tel')
			),
			'question_form' => array(
				'error_name' 		=> $this->language->get('question_error_name'),
				'error_tel' 	=> $this->language->get('question_error_tel')
			)
		);

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');

		if ($this->customer->isLogged()) {
			$this->load->model('account/customer');
			$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
			if($customer_info['phone_approved'] == 1){
				$data['already_approve'] = true;
			}else{
				$data['already_approve'] = false;
			}
		}

		$data['action_phone'] = $this->url->link('account/check_phone', '', true);



		// Wishlist
		$this->load->model('account/wishlist');
		if ($this->customer->isLogged()) {

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}
		
		$wishlist_total_count = $this->model_account_wishlist->getTotalWishlist();
		if($wishlist_total_count > 0){
			$data['wishlist_total_count'] = $wishlist_total_count;
		}else{
			$data['wishlist_total_count'] = '';
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['photodays'] = $this->url->link('product/category', 'path=68', true);
		$data['showroom'] = $this->url->link('product/category', 'path=59', true);
		$data['archive_photodays'] = $this->url->link('product/photodays_category', 'photodays_path=70', true);
		$data['legend'] = $this->url->link('information/information', 'information_id=9', true);
		$data['contact'] = $this->url->link('information/contact');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['customer_name'] = $this->customer->getFirstName();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);

		$data['telephone'] = $this->config->get('config_telephone');
		$data['telephone_2'] = $this->config->get('config_telephone_2');

		$data['link_vk'] = $this->config->get('config_vk');
		$data['link_fb'] = $this->config->get('config_fb');
		$data['link_you'] = $this->config->get('config_you');
		$data['link_in'] = $this->config->get('config_in');

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}
		
		$data['aside'] = array(
			$this->url->link('information/information', 'information_id=4', true),
			$this->url->link('information/information', 'information_id=7', true),
			$this->url->link('news/ncategory'),
			$this->url->link('information/information', 'information_id=8', true),
			$this->url->link('information/information', 'information_id=3', true)
		);

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		$data['login'] = $this->load->controller('account/login_popup');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		$data['detect'] = new Detect;

		return $this->load->view('common/header', $data);
	}
}
