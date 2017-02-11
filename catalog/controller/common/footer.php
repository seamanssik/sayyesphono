<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$this->load->model('common/footer');

		$data['menus'] = array();

		$menus_categories = $this->model_common_footer->getCategories();

		if ($menus_categories) {
			foreach ($menus_categories as $menus_category) {
				$data['menus'][] = array(
					'href' 			=> $this->url->link('product/category', 'path=' . $menus_category['category_id'], true),
					'name' 			=> $menus_category['name'],
					'sort_order' 	=> $menus_category['sort_order']
				);
			}
		}

		$menus_categories_archive = $this->model_common_footer->getCategoriesArchive();

		if($menus_categories_archive) {
			foreach ($menus_categories_archive as $menus_category_archive) {
				$data['menus'][] = array(
					'href' 			=> $this->url->link('product/photodays_category', 'photodays_path=' . $menus_category_archive['photodays_category_id'], true),
					'name' 			=> $menus_category_archive['name'],
					'sort_order' 	=> $menus_category_archive['sort_order']
				);
			}
		}

		$menus_information = $this->model_common_footer->getInformations();

		if ($menus_information) {
			foreach ($menus_information as $menu_information) {
				$data['menus'][] = array(
					'href' 			=> $this->url->link('information/information', 'information_id=' . $menu_information['information_id'], true),
					'name' 			=> $menu_information['title'],
					'sort_order' 	=> $menu_information['sort_order']
				);
			}
		}

		$data['scripts'] = $this->document->getScripts();
		// $data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		
		$this->language->load('extension/module/news_latest');

		$data['blog_url'] = $this->url->link('news/ncategory');
		$data['blog_name'] = $this->language->get('text_blogpage');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		$information = $this->model_catalog_information->getInformations();

		if ($information) {
			foreach ($information as $result) {
				if ($result['bottom']) {
					$data['informations'][] = array(
						'title' => $result['title'],
						'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
					);
				}
			}
		}

		$data['photodays'] = $this->url->link('product/category', 'path=68', true);
		$data['showroom'] = $this->url->link('product/category', 'path=59', true);
		$data['archive_photodays'] = $this->url->link('product/photodays_category', 'photodays_path=70', true);
		
		$data['legend'] = $this->url->link('information/information', 'information_id=9', true);
		$data['reviews'] = $this->url->link('information/information', 'information_id=8', true);
		$data['faq'] = $this->url->link('information/information', 'information_id=7', true);
		$data['franchise'] = $this->url->link('information/information', 'information_id=3', true);
		$data['about_us'] = $this->url->link('information/information', 'information_id=4', true);
		$data['contact'] = $this->url->link('information/contact', '', true);
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

		$data['telephone'] = $this->config->get('config_telephone');
		$data['telephone_2'] = $this->config->get('config_telephone_2');
		$data['email'] = $this->config->get('config_email');

		$data['link_vk'] = $this->config->get('config_vk');
		$data['link_fb'] = $this->config->get('config_fb');
		$data['link_you'] = $this->config->get('config_you');
		$data['link_in'] = $this->config->get('config_in');

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		return $this->load->view('common/footer', $data);
	}
}
