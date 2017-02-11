<?php
class ControllerExtensionModuleFeatured extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/featured');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

		$language_id = $this->config->get('config_language_id');

		$data['filed_1'] = html_entity_decode($this->config->get('config_fields')[$language_id]['filed_1'], ENT_QUOTES, 'UTF-8');

		if (!empty($setting['product'])) {
			$products = array_slice($setting['product'], 0, (int)$setting['limit']);

			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);

				if ($product_info) {
					$price_buy = false;

					foreach ($this->model_catalog_product->getProductOptions($product_info['product_id']) as $option) {
						foreach ($option['product_option_value'] as $option_value) {
							if ($option_value['name'] == 'выкуп') {
								$price_buy = (float)$product_info['price'] + $option_value['price'];
							}
						}
					}

					if (isset($product_info['image']) && is_file(DIR_IMAGE . $product_info['image'])) {
						$image = $this->model_tool_image->cropsize($product_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
						$price = number_format((float)$this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), 0, '', '');
					} else {
						$price = false;
					}

					if ((float)$product_info['special']) {
						$special = number_format((float)$this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), 0, '', '');
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}
					
					$symbol = ($this->currency->getSymbolLeft($this->session->data['currency'])) ? $this->currency->getSymbolLeft($this->session->data['currency']) : $this->currency->getSymbolRight($this->session->data['currency']);

					$data['products'][] = array(
						'product_id'  => $product_info['product_id'],
						'thumb'       => $image,
						'name'        => $product_info['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
						'price'       => $price,
						'price_buy'   => ($price_buy) ? number_format((float)$this->currency->format($this->tax->calculate($price_buy, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), 0, '', '') : $price_buy,
						'symbol'      => $symbol,
						'special'     => $special,
						'tax'         => $tax,
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
					);
				}
			}
		}

		$file_tpl = 'featured';
		if ( !empty($setting['name_tpl']) ) {
			$file_tpl = 'featured/' . $setting['name_tpl'];
		}

		if ($data['products']) {
			return $this->load->view('extension/module/' . $file_tpl, $data);
		}
	}
}