<?php
class ControllerProductCategory extends Controller {
	public function index() {
		$this->load->language('product/category');

		$this->load->model('catalog/photodays/product');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.date_added';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['path'])) {
			$_path = explode('_', $this->request->get['path']);
			if (in_array(68, $_path)) {
				$sort = 'p.sort_order';
				$order = 'ASC';
			}
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$detect = new Detect;


		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
		} else {
			if($detect->isMobile()){
				$limit = 6;
			}else{
				$limit = 9;
//				$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
			}
		}

		// OCFilter start
		if (isset($this->request->get['filter_ocfilter'])) {
			$filter_ocfilter = $this->request->get['filter_ocfilter'];
		} else {
			$filter_ocfilter = '';
		}
		// OCFilter end

		
		if($this->customer->isLogged()){
			$data['logged'] = true;
		}else{
			$data['logged'] = false;
		}
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['path'])) {
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path . $url)
					);
				}
			}
		} else {
			$category_id = 0;
		}

		$category_info = $this->model_catalog_category->getCategory($category_id);

		if ($category_info) {
			$this->document->setTitle($category_info['meta_title']);
			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);

			$data['heading_title'] = $category_info['name'];

			$data['text_refine'] = $this->language->get('text_refine');
			$data['text_empty'] = $this->language->get('text_empty');
			$data['text_quantity'] = $this->language->get('text_quantity');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_price'] = $this->language->get('text_price');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$data['text_sort'] = $this->language->get('text_sort');
			$data['text_limit'] = $this->language->get('text_limit');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['button_list'] = $this->language->get('button_list');
			$data['button_grid'] = $this->language->get('button_grid');

			// Set the last category breadcrumb
			$data['breadcrumbs'][] = array(
				'text' => $category_info['name'],
				'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'])
			);

			if ($category_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
			} else {
				$data['thumb'] = '';
			}

			$data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
			$data['compare'] = $this->url->link('product/compare');

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['categories'] = array();

			$results = $this->model_catalog_category->getCategories($category_id);

			foreach ($results as $result) {
				$filter_data = array(
					'filter_category_id'  => $result['category_id'],
					'filter_sub_category' => true
				);

				$data['categories'][] = array(
					'name' => $result['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url)
				);
			}

			$photodays_link = false;

			$data['photodays_link'] = $this->url->link('product/category', 'path=68');
			
			$data['photodays_categories'] = array();

			$categories = $this->model_catalog_category->getCategories(68);

			foreach ($categories as $category) {
				$active = false;

				if ((isset($this->request->get['path'])) && in_array($category['category_id'], explode('_', $this->request->get['path']))) {
					$active = ' active';
					$photodays_link = true;
				}

				$data['photodays_categories'][] = array(
					'category_id' => $category['category_id'],
					'active'      => $active,
					'name'        => $category['name'],
					'href'        => $this->url->link('product/category', 'path=68_' . $category['category_id'])
				);
			}

			if (!$photodays_link) {
				$data['photodays_active'] = ' active';
			} else {
				$data['photodays_active'] = '';
			}

			$data['products'] = array();

			$filter_data = array(
				'filter_category_id' => $category_id,
				'filter_filter'      => $filter,
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);

			// OCFilter start
			$filter_data['filter_ocfilter'] = $filter_ocfilter;
			// OCFilter end

			$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

			$results = $this->model_catalog_product->getProducts($filter_data);

			foreach ($results as $result) {
				$price_buy = false;
				$wishlist_active = $this->itemInWishlist($result['product_id']);
				foreach ($this->model_catalog_product->getProductOptions($result['product_id']) as $option) {
					foreach ($option['product_option_value'] as $option_value) {
						if ($option_value['name'] == 'выкуп') {
							$price_buy = (float)$result['price'] + $option_value['price'];
						}
					}
				}

				if ($result['image']) {
					$image = $this->model_tool_image->cropsize($result['image'], 350, 600);
//					$image = $this->model_tool_image->cropsize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				if ($result['image']) {
					$image_photodays = $this->model_tool_image->cropsize($result['image'], 590, 400);
				} else {
					$image_photodays = $this->model_tool_image->resize('placeholder.png', 590, 400);
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

				if ($result['logo']) {
					$logo = 'image/' . $result['logo'];
				} else {
					$logo = $this->model_tool_image->resize('placeholder.png', 286, 206);
				}

				$symbol = ($this->currency->getSymbolLeft($this->session->data['currency'])) ? $this->currency->getSymbolLeft($this->session->data['currency']) : $this->currency->getSymbolRight($this->session->data['currency']);

				$images = array();

				$images_results = $this->model_catalog_product->getProductImages($result['product_id']);

				foreach ($images_results as $image_result) {
					$images[] = $this->model_tool_image->cropsize($image_result['image'], 350, 600);
				}

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'thumbs'      => $images,
					'thumb_photodays' => $image_photodays,
					'logo'        => $logo,
					'wishlist_cative' => $wishlist_active,
					'city'        => $result['city'],
					'name'        => $result['name'],
					'date' 		  => date('d', strtotime($result['date_action'])) . '<br> ' . date('m', strtotime($result['date_action'])),
					'year' 		  => date('Y', strtotime($result['date_action'])),
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'price_buy'   => ($price_buy) ? number_format((float)$this->currency->format($this->tax->calculate($price_buy, $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), 0, '', '') : $price_buy,
					'symbol'      => $symbol,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url),
					'promotag'	  => $promotag
				);
			}

			$url = '';

			$data['archiveImages'] = array();

			$filter_data = array(
				'filter_photodays_category_id' => 70,
				'sort'               => 'p.sort_order',
				'order'              => 'ASC',
				'start'              => 0,
				'limit'              => 8
			);

			$results = $this->model_catalog_photodays_product->getProducts($filter_data);

			$key_archiveImage = 0;

			foreach ($results as $result) {

				$image = $this->model_tool_image->resize('placeholder.png', 194, 302);
				$width = '318';
				$height = '488';

				switch ($key_archiveImage) {
					case 0:
						$width = '318';
						$height = '488';
						if ($result['image']) {
							$image = $this->model_tool_image->cropsize($result['image'], 318, 488);
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', 318, 488);
						}
						break;
					case 1:
						$width = '194';
						$height = '302';
						if ($result['image']) {
							$image = $this->model_tool_image->cropsize($result['image'], 194, 302);
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', 194, 302);
						}

						break;
					case 2:
						$width = '194';
						$height = '302';
						if ($result['image']) {
							$image = $this->model_tool_image->cropsize($result['image'], 194, 302);
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', 194, 302);
						}

						break;
					case 3:
						$width = '318';
						$height = '488';
						if ($result['image']) {
							$image = $this->model_tool_image->cropsize($result['image'], $width, $height);
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $width, $height);
						}
						break;
					case 4:
						$width = '318';
						$height = '130';
						if ($result['image']) {
							$image = $this->model_tool_image->cropsize($result['image'], $width, $height);
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $width, $height);
						}
						break;
					case 5:
						$width = '194';
						$height = '302';
						if ($result['image']) {
							$image = $this->model_tool_image->cropsize($result['image'], $width, $height);
						} else {
							$image = $this->model_tool_image->cropsize('placeholder.png', $width, $height);
						}
						break;
					case 6:
						$width = '194';
						$height = '302';
						if ($result['image']) {
							$image = $this->model_tool_image->cropsize($result['image'], $width, $height);
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $width, $height);
						}
						break;
					case 7:
						$width = '403';
						$height = '319';
						if ($result['image']) {
							$image = $this->model_tool_image->cropsize($result['image'], $width, $height);
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $width, $height);
						}
						break;
				}

				$data['archiveImages'][$key_archiveImage] = array(
					'thumb' => $image,
					'name' => $result['name'],
					'width' => $width,
					'height' => $height,
					'href' => $this->url->link('product/photodays_product', 'photodays_path=70' . '&photodays_product_id=' . $result['photodays_product_id'] . $url)
				);

				$key_archiveImage++;
			}


			// OCFilter start
			if (isset($this->request->get['filter_ocfilter'])) {
				$url .= '&filter_ocfilter=' . $this->request->get['filter_ocfilter'];
			}
			// OCFilter end

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
			);

//			$data['sorts'][] = array(
//				'text'  => $this->language->get('text_name_asc'),
//				'value' => 'pd.name-ASC',
//				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
//			);
//
//			$data['sorts'][] = array(
//				'text'  => $this->language->get('text_name_desc'),
//				'value' => 'pd.name-DESC',
//				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
//			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			);

//			if ($this->config->get('config_review_status')) {
//				$data['sorts'][] = array(
//					'text'  => $this->language->get('text_rating_desc'),
//					'value' => 'rating-DESC',
//					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
//				);
//
//				$data['sorts'][] = array(
//					'text'  => $this->language->get('text_rating_asc'),
//					'value' => 'rating-ASC',
//					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
//				);
//			}

//			$data['sorts'][] = array(
//				'text'  => $this->language->get('text_model_asc'),
//				'value' => 'p.model-ASC',
//				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
//			);
//
//			$data['sorts'][] = array(
//				'text'  => $this->language->get('text_model_desc'),
//				'value' => 'p.model-DESC',
//				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
//			);

			$url = '';


			// OCFilter start
			if (isset($this->request->get['filter_ocfilter'])) {
				$url .= '&filter_ocfilter=' . $this->request->get['filter_ocfilter'];
			}
			// OCFilter end

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)
				);
			}

			$url = '';


			// OCFilter start
			if (isset($this->request->get['filter_ocfilter'])) {
				$url .= '&filter_ocfilter=' . $this->request->get['filter_ocfilter'];
			}
			// OCFilter end

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');

			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

			// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
			if ($page == 1) {
				$this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], true), 'canonical');
			} elseif ($page == 2) {
				$this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], true), 'prev');
			} else {
				$this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page='. ($page - 1), true), 'prev');
			}

			if ($limit && ceil($product_total / $limit) > $page) {
				$this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page='. ($page + 1), true), 'next');
			}

			$data['sort'] = $sort;
			$data['order'] = $order;
			$data['limit'] = $limit;

			// OCFilter Start
			$ocfilter_page_info = $this->load->controller('extension/module/ocfilter/getPageInfo');

			if ($ocfilter_page_info) {
				$this->document->setTitle($ocfilter_page_info['meta_title']);

				if ($ocfilter_page_info['meta_description']) {
					$this->document->setDescription($ocfilter_page_info['meta_description']);
				}

				if ($ocfilter_page_info['meta_keyword']) {
					$this->document->setKeywords($ocfilter_page_info['meta_keyword']);
				}

				$data['heading_title'] = $ocfilter_page_info['title'];

				if ($ocfilter_page_info['description'] && !isset($this->request->get['page']) && !isset($this->request->get['sort']) && !isset($this->request->get['order']) && !isset($this->request->get['search']) && !isset($this->request->get['limit'])) {
					$data['description'] = html_entity_decode($ocfilter_page_info['description'], ENT_QUOTES, 'UTF-8');
				}
			} else {
				$meta_title = $this->document->getTitle();
				$meta_description = $this->document->getDescription();
				$meta_keyword = $this->document->getKeywords();

				$filter_title = $this->load->controller('extension/module/ocfilter/getSelectedsFilterTitle');

				if ($filter_title) {
					if (false !== strpos($meta_title, '{filter}')) {
						$meta_title = trim(str_replace('{filter}', $filter_title, $meta_title));
					} else {
						$meta_title .= ' ' . $filter_title;
					}

					$this->document->setTitle($meta_title);

					if ($meta_description) {
						if (false !== strpos($meta_description, '{filter}')) {
							$meta_description = trim(str_replace('{filter}', $filter_title, $meta_description));
						} else {
							$meta_description .= ' ' . $filter_title;
						}

						$this->document->setDescription($meta_description);
					}

					if ($meta_keyword) {
						if (false !== strpos($meta_keyword, '{filter}')) {
							$meta_keyword = trim(str_replace('{filter}', $filter_title, $meta_keyword));
						} else {
							$meta_keyword .= ' ' . $filter_title;
						}

						$this->document->setKeywords($meta_keyword);
					}

					$heading_title = $data['heading_title'];

					if (false !== strpos($heading_title, '{filter}')) {
						$heading_title = trim(str_replace('{filter}', $filter_title, $heading_title));
					} else {
						$heading_title .= ' ' . $filter_title;
					}

					$data['heading_title'] = $heading_title;

					$data['description'] = '';
				} else {
					$this->document->setTitle(trim(str_replace('{filter}', '', $meta_title)));
					$this->document->setDescription(trim(str_replace('{filter}', '', $meta_description)));
					$this->document->setKeywords(trim(str_replace('{filter}', '', $meta_keyword)));

					$data['heading_title'] = trim(str_replace('{filter}', '', $data['heading_title']));
				}
			}
			// OCFilter End

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			/* layout patch - choose template by path */
			$this->load->model ( 'design/layout' );
			if (isset($this->request->get['route'])) {
				$route_ = $this->request->get['route'];

				$route = $route_ . '&amp;path=' . $this->request->get['path'] ;
			} else {
				$route = 'common/home';
			}

			$layout_template = $this->model_design_layout->getLayoutTemplate($route);
			$isLayoutRoute = true;

			if (!$layout_template) {
				$layout_template = 'category';

				$isLayoutRoute = false;
			}

			// get general layout template
			if (!$isLayoutRoute) {
				$layout_id = $this->model_catalog_category->getCategoryLayoutId($category_id);

				if ($layout_id) {
					$tmp_layout_template = $this->model_design_layout->getGeneralLayoutTemplate($layout_id);
					if ($tmp_layout_template) {
						$layout_template =  'category/' . $tmp_layout_template;
					}
				}
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
				'href' => $this->url->link('product/category', $url)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
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
