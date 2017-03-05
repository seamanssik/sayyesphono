<?php
class ControllerProductProduct extends Controller {
	private $error = array();

	protected function getPath($parent_id, $current_path = '') {
		$this->load->model('catalog/category');

		$category_info = $this->model_catalog_category->getCategory($parent_id);

		if ($category_info) {
			if (!$current_path) {
				$new_path = $category_info['category_id'];
			} else {
				$new_path = $category_info['category_id'] . '_' . $current_path;
			}

			$path = $this->getPath($category_info['parent_id'], $new_path);

			if ($path) {
				return $path;
			} else {
				return $new_path;
			}
		} else {
			return false;
		}
	}

	protected function getTrueUrl($product_id) {
		$path_true = false;

		$categories = $this->model_catalog_product->getCategoriesByProductId($product_id);

		if ($categories) {

			foreach ($categories as $category) {
				$path_true = $this->getPath($category['category_id']);

				$category_info = $this->model_catalog_category->getCategory($category['category_id']);

				if ($path_true) {
					$cat_path = $path_true;
				} else {
					if(isset($category_info['category_id'])){
						$cat_path = $category_info['category_id'];
					}else{
						$cat_path = '';
					}
				}

				if ($category_info) {
					$path_true = '';

					foreach (explode('_', $cat_path) as $path_true_id) {

						if (!$path_true) {
							$path_true = $path_true_id;
						} else {
							$path_true .= '_' . $path_true_id;
						}

						$category_info = $this->model_catalog_category->getCategory($path_true_id);

						if ($category_info) {
							$data['breadcrumbs'][] = array(
								'text' => $category_info['name'],
								'href' => $this->url->link('product/category', '&path=' . $path_true),
								'separator' => $this->language->get('text_separator')
							);
						}
					}
					break;
				}
			}

			return $path_true;
		} else {
			return false;
		}
	}

	public function index() {
		$this->load->language('product/product');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$this->load->model('catalog/manufacturer');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['detect'] = new Detect;
		
		if($this->customer->isLogged()){
			$data['logged'] = true;
		}else{
			$data['logged'] = false;
		}

		$path = '';

		$is_photoday = false;

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);

			$is_photoday = (in_array('68', $parts)) ? true : false;

			$k = count($parts) - 1;

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path)
					);
				}
			}

			/*
			$category_id = $parts[$k];

			// Set the last category breadcrumb
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
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

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}

				$data['breadcrumbs'][] = array(
					'text' => $category_info['name'],
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
				);
			}
			*/
		}

		// Fixed SEO url
		$path_true = $this->getTrueUrl((int)$this->request->get['product_id']);

		if (array_key_exists('search', $this->request->get)) {

		} elseif (array_key_exists('manufacturer_id', $this->request->get)) {

		} elseif (array_key_exists('path', $this->request->get)) {
			if (!empty($path_true)) {
				if ($path != $path_true) {
					$this->response->redirect($this->url->link('product/product', '&path=' . $path_true . '&product_id=' . $this->request->get['product_id']), '301');
				}
			}
		} else {
			if (!empty($path_true)) {
				if ($path != $path_true) {
					$this->response->redirect($this->url->link('product/product', '&path=' . $path_true . '&product_id=' . $this->request->get['product_id']), '301');
				}
			}
		}

		if (isset($this->request->get['manufacturer_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_brand'),
				'href' => $this->url->link('product/manufacturer')
			);

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

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {
				$data['breadcrumbs'][] = array(
					'text' => $manufacturer_info['name'],
					'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
				);
			}
		}

		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_search'),
				'href' => $this->url->link('product/search', $url)
			);
		}

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		$data['wishlist_active'] = $this->itemInWishlist($product_id);

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info && !$is_photoday) {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $product_info['name'],
				'href' => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id'])
			);

			$this->document->setTitle($product_info['meta_title']);
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');
//			$this->document->addScript('/javascript/jquery/datetimepicker/moment.js');
//			$this->document->addScript('/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
//			$this->document->addStyle('/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

			$data['heading_title'] = $product_info['name'];

			$data['text_select'] = $this->language->get('text_select');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_reward'] = $this->language->get('text_reward');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_discount'] = $this->language->get('text_discount');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_option'] = $this->language->get('text_option');
			$data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$data['text_write'] = $this->language->get('text_write');
			$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
			$data['text_note'] = $this->language->get('text_note');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_related'] = $this->language->get('text_related');
			$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
			$data['text_loading'] = $this->language->get('text_loading');

			$data['entry_qty'] = $this->language->get('entry_qty');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_review'] = $this->language->get('entry_review');
			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_good'] = $this->language->get('entry_good');
			$data['entry_bad'] = $this->language->get('entry_bad');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['button_continue'] = $this->language->get('button_continue');

			$this->load->model('catalog/review');

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_attribute'] = $this->language->get('tab_attribute');
			$data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);

			$data['product_id'] = (int)$this->request->get['product_id'];
			$data['manufacturer'] = $product_info['manufacturer'];
			$data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$data['model'] = $product_info['model'];
			$data['reward'] = $product_info['reward'];
			$data['points'] = $product_info['points'];
			$data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');

			if ($product_info['quantity'] <= 0) {
				$data['stock'] = $product_info['stock_status'];
			} elseif ($this->config->get('config_stock_display')) {
				$data['stock'] = $product_info['quantity'];
			} else {
				$data['stock'] = $this->language->get('text_instock');
			}

			$this->load->model('tool/image');

			if ($product_info['image']) {
				$data['popup'] = 'image/' . $product_info['image'];
			} else {
				$data['popup'] = '';
			}

			if ($product_info['image']) {
				$data['thumb'] = $this->model_tool_image->cropsize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'));
			} else {
				$data['thumb'] = '';
			}

			$data['images'] = array();

			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

			foreach ($results as $result) {
				$data['images'][] = array(
					'popup' => 'image/' . $result['image'],
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
				);
			}

			$data['product_reviews'] = array();

			$results = $this->model_catalog_product->getProductReviews($this->request->get['product_id']);

			foreach ($results as $result) {
				$data['product_reviews'][] = array(
					'expert' 	=> $result['expert'],
					'position' 	=> $result['position'],
					'review' 	=> html_entity_decode($result['review'], ENT_QUOTES, 'UTF-8'),
					'thumb' 	=> $this->model_tool_image->cropsize($result['image'], 399, 579)
				);
			}

			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$data['price'] = number_format((float)$this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), 0, '', ''); // $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['price'] = false;
			}

			if ((float)$product_info['special']) {
				$data['special'] = number_format((float)$this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), 0, '', '');
			} else {
				$data['special'] = false;
			}

			if ($this->config->get('config_tax')) {
				$data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
			} else {
				$data['tax'] = false;
			}

			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

			$data['discounts'] = array();

			foreach ($discounts as $discount) {
				$data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
				);
			}

			$data['price_value'] = $product_info['price'];
			$data['special_value'] = $product_info['special'];
			$data['tax_value'] = (float)$product_info['special'] ? $product_info['special'] : $product_info['price'];

			$data['symbol'] = ($this->currency->getSymbolLeft($this->session->data['currency'])) ? $this->currency->getSymbolLeft($this->session->data['currency']) : $this->currency->getSymbolRight($this->session->data['currency']);

			$var_currency = array();
			$var_currency['value'] = $this->currency->getValue($this->session->data['currency']);
			$var_currency['symbol_left'] = $this->currency->getSymbolLeft($this->session->data['currency']);
			$var_currency['symbol_right'] = $this->currency->getSymbolRight($this->session->data['currency']);
			$var_currency['decimals'] = $this->currency->getDecimalPlace($this->session->data['currency']);
			$var_currency['decimal_point'] = $this->language->get('decimal_point');
			$var_currency['thousand_point'] = $this->language->get('thousand_point');
			$data['currency'] = $var_currency;

			$data['dicounts_unf'] = $discounts;

			$data['tax_class_id'] = $product_info['tax_class_id'];
			$data['tax_rates'] = $this->tax->getRates(0, $product_info['tax_class_id']);

			$data['options'] = array();

			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
						} else {
							$price = false;
						}

						$product_option_value_data[] = array(
							'price_value' 	=> $option_value['price'],
							'points_value' 	=> intval($option_value['points_prefix'] . $option_value['points']),
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id' => $option_value['option_value_id'],
							'name' 			=> $option_value['name'],
							'image' 		=> (!empty($option_value['product_option_image']) && $option_value['product_option_image'] != 'no_image.png') ? $this->model_tool_image->cropsize($option_value['product_option_image'], 130, 130) : $this->model_tool_image->cropsize($option_value['image'], 130, 130),
							//'product_option_image' => $this->model_tool_image->cropsize($option_value['product_option_image'], 130, 130),
							//'product_option_image_popup' => $this->model_tool_image->cropsize($option_value['product_option_image'], 130, 130),
							'price' 		=> $price,
							'price_prefix' 	=> $option_value['price_prefix']
						);
					}
				}

				$data['options'][] = array(
					'product_option_id' => $option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id' 		=> $option['option_id'],
					'name' 				=> $option['name'],
					'product_page' 		=> isset($option['product_page']) ? ((int)$option['product_page']) : 1,
					'type' 				=> $option['type'],
					'value' 			=> $option['value'],
					'multiple_date' 	=> $option['multiple_date'],
					'required' 			=> $option['required']
				);
			}

			if ($product_info['minimum']) {
				$data['minimum'] = $product_info['minimum'];
			} else {
				$data['minimum'] = 1;
			}

			$data['review_status'] = $this->config->get('config_review_status');

			if ($this->config->get('config_review_guest') || $this->customer->isLogged()) {
				$data['review_guest'] = true;
			} else {
				$data['review_guest'] = false;
			}

			if ($this->customer->isLogged()) {
				$data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
			} else {
				$data['customer_name'] = '';
			}

			$data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
			$data['rating'] = (int)$product_info['rating'];

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'));
			} else {
				$data['captcha'] = '';
			}

			$data['share'] = $this->url->link('product/product', 'product_id=' . (int)$this->request->get['product_id']);

			$data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);

			$data['products'] = array();

			$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->cropsize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = number_format((float)$this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), 0, '', '');
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = number_format((float)$this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), 0, '', '');
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

				/*code start*/
				if((strtotime(date('Y-m-d')) >= strtotime($result['promo_date_start'])) && (strtotime(date('Y-m-d')) <= strtotime($result['promo_date_end'])) || (($result['promo_date_start'] == '0000-00-00') && ($result['promo_date_end'] == '0000-00-00'))) {
					$promo_on = TRUE;
				} else {
					$promo_on = FALSE;
				}

				$promo = $this->model_catalog_product->getPromo($result['product_id'], $result['promo']);
				if ( !empty($promo_on) && !empty($promo) ) {
					$promotag = '<img src="' . 'image/' . $promo['image'] . '" />';
				} else {
					$promotag = '';
				}
				/*code end*/

				$symbol = ($this->currency->getSymbolLeft($this->session->data['currency'])) ? $this->currency->getSymbolLeft($this->session->data['currency']) : $this->currency->getSymbolRight($this->session->data['currency']);

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'symbol'      => $symbol,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'promotag'	  => $promotag
				);
			}

			$data['tags'] = array();

			if ($product_info['tag']) {
				$tags = explode(',', $product_info['tag']);

				foreach ($tags as $tag) {
					$data['tags'][] = array(
						'tag'  => trim($tag),
						'href' => $this->url->link('product/search', 'tag=' . trim($tag))
					);
				}
			}

			$data['recurrings'] = $this->model_catalog_product->getProfiles($this->request->get['product_id']);

			$this->model_catalog_product->updateViewed($this->request->get['product_id']);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			/* layout patch - choose template by path */
			$this->load->model('design/layout');
			if ( isset($this->request->get['route']) ) {
				$route_ = $this->request->get['route'];

				$route = $route_ . '&amp;path=' . $this->request->get['path'] ;
			} else {
				$route = 'common/home';
			}

			$layout_template = $this->model_design_layout->getLayoutTemplate($route);

			if (!$layout_template) {
				$layout_template = 'product';
			}

			$this->response->setOutput($this->load->view('product/' . $layout_template, $data));
		} elseif ($is_photoday && $product_info) {
			$data['product_id'] = (int)$this->request->get['product_id'];

			if ($product_info['minimum']) {
				$data['minimum'] = $product_info['minimum'];
			} else {
				$data['minimum'] = 1;
			}

			$data['text_select'] = $this->language->get('text_select');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_reward'] = $this->language->get('text_reward');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_discount'] = $this->language->get('text_discount');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_option'] = $this->language->get('text_option');
			$data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$data['text_write'] = $this->language->get('text_write');
			$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
			$data['text_note'] = $this->language->get('text_note');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_related'] = $this->language->get('text_related');
			$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
			$data['text_loading'] = $this->language->get('text_loading');

			$data['entry_qty'] = $this->language->get('entry_qty');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_review'] = $this->language->get('entry_review');
			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_good'] = $this->language->get('entry_good');
			$data['entry_bad'] = $this->language->get('entry_bad');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['button_continue'] = $this->language->get('button_continue');

			$data['options'] = array();

			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
						} else {
							$price = false;
						}

						$product_option_value_data[] = array(
							'price_value' 	=> $option_value['price'],
							'points_value' 	=> intval($option_value['points_prefix'] . $option_value['points']),
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id' => $option_value['option_value_id'],
							'name' 			=> $option_value['name'],
							'image' 		=> $this->model_tool_image->cropsize($option_value['image'], 130, 130),
							'product_option_image' => $this->model_tool_image->cropsize($option_value['product_option_image'], 194, 300),
							'product_option_image_popup' => $this->model_tool_image->cropsize($option_value['product_option_image'], 194, 300),
							'price' 		=> $price,
							'price_prefix' 	=> $option_value['price_prefix']
						);
					}
				}

				$data['options'][] = array(
					'product_option_id' => $option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id' 		=> $option['option_id'],
					'name' 				=> $option['name'],
					'product_page' 		=> isset($option['product_page']) ? ((int)$option['product_page']) : 1,
					'type' 				=> $option['type'],
					'value' 			=> $option['value'],
					'multiple_date' 	=> $option['multiple_date'],
					'required' 			=> $option['required']
				);
			}
			
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $product_info['name'],
				'href' => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id'])
			);

			$this->document->setTitle($product_info['meta_title']);
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');
//			$this->document->addScript('/javascript/jquery/datetimepicker/moment.js');
//			$this->document->addScript('/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
//			$this->document->addStyle('/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

			$data['heading_title'] = $product_info['name'];

			$data['history_title'] = $product_info['history_title'];
			$data['history_signature'] = $product_info['history_signature'];
			$data['history_text'] = html_entity_decode($product_info['history_text'], ENT_QUOTES, 'UTF-8');
			$data['history_link'] = html_entity_decode($product_info['history_link'], ENT_QUOTES, 'UTF-8');
			$data['history_video'] = html_entity_decode($product_info['history_video'], ENT_QUOTES, 'UTF-8');

			$data['model'] = $product_info['model'];

			if ($product_info['quantity'] <= 0) {
				$data['stock'] = $product_info['stock_status'];
			} elseif ($this->config->get('config_stock_display')) {
				$data['stock'] = $product_info['quantity'];
			} else {
				$data['stock'] = $this->language->get('text_instock');
			}

			if ($product_info['image']) {
				$thumb = $this->model_tool_image->cropsize($product_info['image'], 928, 610);
			} else {
				$thumb = $this->model_tool_image->resize('placeholder.png', 928, 610);
			}

			if ($product_info['image_history']) {
				$history_thumb = $this->model_tool_image->cropsize($product_info['image_history'], 507, 673);
			} else {
				$history_thumb = $this->model_tool_image->resize('placeholder.png', 507, 673);
			}

			if ($product_info['logo']) {
				$logo = 'image/' . $product_info['logo'];
			} else {
				$logo = $this->model_tool_image->resize('placeholder.png', 286, 206);
			}

			$images = array();

			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

			if ($results) {
				$i_images = 1;

				foreach ($results as $result) {
					$additional_width = 233;
					$additional_height = 363;

					if ($i_images == 3) {
						$additional_width = 391;
						$additional_height = 673;
					}

					$images[] = array(
						'popup' => 'http://sayyesphoto.com/image/' . $result['image'],
						'thumb' => ($data['detect']->isMobile()) ? $this->model_tool_image->cropsize($result['image'], 391, 673) : $this->model_tool_image->cropsize($result['image'], $additional_width, $additional_height)
					);

					if ($i_images == 3) {
						$i_images = 1;
					} else {
						$i_images++;
					}
				}
			}

			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$price = number_format((float)$this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), 0, '', '');
			} else {
				$price = false;
			}

//			$photodays_description = strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8'));
//
//			$photodays_description = substr($photodays_description, 0, 480);
//
//			$photodays_description = rtrim($photodays_description, "!,.-");
//
//			$photodays_description = substr($photodays_description, 0, strrpos($photodays_description, ' '));

			$data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);


//			$data['desc_parts'] = mb_substr($product_info['description'], 500);
			
			$data['photodays'] = array(
				'symbol_left'	=> $this->currency->getSymbolLeft($this->session->data['currency']),
				'symbol_right'	=> $this->currency->getSymbolRight($this->session->data['currency']),
				'price'			=> $price,
				'history_thumb'	=> $history_thumb,
				'thumb' 		=> $thumb,
				'logo' 			=> $logo,
				'name' 			=> $product_info['name'],
				'city'        	=> $product_info['city'],
				'date' 		  	=> date('d', strtotime($product_info['date_action'])) . '<br> ' . date('m', strtotime($product_info['date_action'])),
				'year' 		  	=> date('Y', strtotime($product_info['date_action'])),
				'description' 	=> html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8'),
				'images' 		=> $images
			);


			$data['images'] = array();

			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

			foreach ($results as $result) {
				$data['images'][] = array(
					'popup' => 'image/' . $result['image'],
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
				);
			}

			$data['product_reviews'] = array();

			$results = $this->model_catalog_product->getProductReviews($this->request->get['product_id']);

			foreach ($results as $result) {
				$data['product_reviews'][] = array(
					'expert' 	=> $result['expert'],
					'position' 	=> $result['position'],
					'review' 	=> html_entity_decode($result['review'], ENT_QUOTES, 'UTF-8'),
					'thumb' 	=> $this->model_tool_image->cropsize($result['image'], 399, 579)
				);
			}

			$data['product_reviews'] = array();

			$results = $this->model_catalog_product->getProductStudios($this->request->get['product_id']);

			foreach ($results as $result) {
				$data['product_studios'][] = array(
					'title' 	=> $result['title'],
					'name' 		=> $result['name'],
					'text' 		=> html_entity_decode($result['text'], ENT_QUOTES, 'UTF-8'),
					'thumb' 	=> $this->model_tool_image->cropsize($result['image'], 1920, 772)
				);
			}

			$this->model_catalog_product->updateViewed($this->request->get['product_id']);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			/* layout patch - choose template by path */
			$this->load->model('design/layout');
			if ( isset($this->request->get['route']) ) {
				$route_ = $this->request->get['route'];

				$route = $route_ . '&amp;path=' . $this->request->get['path'] ;
			} else {
				$route = 'common/home';
			}

			$layout_template = $this->model_design_layout->getLayoutTemplate($route);

			if (!$layout_template) {
				$layout_template = 'product';
			}

			$this->response->setOutput($this->load->view('product/' . $layout_template, $data));
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/product', $url . '&product_id=' . $product_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

//			$data['column_left'] = $this->load->controller('common/column_left');
//			$data['column_right'] = $this->load->controller('common/column_right');
//			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}

	public function review() {
		$this->load->language('product/product');

		$this->load->model('catalog/review');

		$data['text_no_reviews'] = $this->language->get('text_no_reviews');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['reviews'] = array();

		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);

		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 5, 5);

		foreach ($results as $result) {
			$data['reviews'][] = array(
				'author'     => $result['author'],
				'text'       => nl2br($result['text']),
				'rating'     => (int)$result['rating'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 5;
		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));

		$this->response->setOutput($this->load->view('product/review', $data));
	}

	public function write() {
		$this->load->language('product/product');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
				$json['error'] = $this->language->get('error_rating');
			}

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error'] = $captcha;
				}
			}

			if (!isset($json['error'])) {
				$this->load->model('catalog/review');

				$this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function getRecurringDescription() {
		$this->load->language('product/product');
		$this->load->model('catalog/product');

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		if (isset($this->request->post['recurring_id'])) {
			$recurring_id = $this->request->post['recurring_id'];
		} else {
			$recurring_id = 0;
		}

		if (isset($this->request->post['quantity'])) {
			$quantity = $this->request->post['quantity'];
		} else {
			$quantity = 1;
		}

		$product_info = $this->model_catalog_product->getProduct($product_id);
		$recurring_info = $this->model_catalog_product->getProfile($product_id, $recurring_id);

		$json = array();

		if ($product_info && $recurring_info) {
			if (!$json) {
				$frequencies = array(
					'day'        => $this->language->get('text_day'),
					'week'       => $this->language->get('text_week'),
					'semi_month' => $this->language->get('text_semi_month'),
					'month'      => $this->language->get('text_month'),
					'year'       => $this->language->get('text_year'),
				);

				if ($recurring_info['trial_status'] == 1) {
					$price = $this->currency->format($this->tax->calculate($recurring_info['trial_price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$trial_text = sprintf($this->language->get('text_trial_description'), $price, $recurring_info['trial_cycle'], $frequencies[$recurring_info['trial_frequency']], $recurring_info['trial_duration']) . ' ';
				} else {
					$trial_text = '';
				}

				$price = $this->currency->format($this->tax->calculate($recurring_info['price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

				if ($recurring_info['duration']) {
					$text = $trial_text . sprintf($this->language->get('text_payment_description'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				} else {
					$text = $trial_text . sprintf($this->language->get('text_payment_cancel'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				}

				$json['success'] = $text;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function itemInWishlist($product_id)
	{
		$this->load->model('account/wishlist');
		$results = $this->model_account_wishlist->getWishlist();
		foreach ($results as $item){
			if($item['product_id'] == $product_id){
				return 'active';
				break;
			}
		}
		return false;
	}
}
