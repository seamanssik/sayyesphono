<?php
class ControllerProductPhotodaysProduct extends Controller {
	private $error = array();

	protected function getPath($parent_id, $current_path = '') {
		$this->load->model('catalog/photodays/category');

		$category_info = $this->model_catalog_photodays_category->getCategory($parent_id);

		if ($category_info) {
			if (!$current_path) {
				$new_path = $category_info['photodays_category_id'];
			} else {
				$new_path = $category_info['photodays_category_id'] . '_' . $current_path;
			}

			$path = $this->getPath($category_info['photodays_parent_id'], $new_path);

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

		$categories = $this->model_catalog_photodays_product->getCategoriesByProductId($product_id);

		if ($categories) {

			foreach ($categories as $category) {
				$path_true = $this->getPath($category['photodays_category_id']);

				$category_info = $this->model_catalog_photodays_category->getCategory($category['photodays_category_id']);

				if ($path_true) {
					$cat_path = $path_true;
				} else {
					$cat_path = $category_info['photodays_category_id'];
				}

				if ($category_info) {
					$path_true = '';

					foreach (explode('_', $cat_path) as $path_true_id) {

						if (!$path_true) {
							$path_true = $path_true_id;
						} else {
							$path_true .= '_' . $path_true_id;
						}

						$category_info = $this->model_catalog_photodays_product->getCategory($path_true_id);

						if ($category_info) {
							$data['breadcrumbs'][] = array(
								'text' => $category_info['name'],
								'href' => $this->url->link('product/photodays_category', '&photodays_path=' . $path_true),
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
		$this->load->language('product/photodays/product');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$this->load->model('catalog/photodays/category');

		$this->load->model('catalog/photodays/product');

		$data['detect'] = new Detect;

		$path = '';

		if (isset($this->request->get['photodays_path'])) {
			$parts = explode('_', (string)$this->request->get['photodays_path']);

			$k = count($parts) - 1;

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_catalog_photodays_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/photodays_category', 'photodays_path=' . $path)
					);
				}
			}
		}

		// Fixed SEO url
		$path_true = $this->getTrueUrl((int)$this->request->get['photodays_product_id']);

		if (array_key_exists('search', $this->request->get)) {

		} elseif (array_key_exists('photodays_path', $this->request->get)) {
			if (!empty($path_true)) {
				if ($path != $path_true) {
					$this->response->redirect($this->url->link('product/photodays_product', '&photodays_path=' . $path_true . '&photodays_product_id=' . $this->request->get['photodays_product_id']), '301');
				}
			}
		} else {
			if (!empty($path_true)) {
				if ($path != $path_true) {
					$this->response->redirect($this->url->link('product/photodays_product', '&photodays_path=' . $path_true . '&photodays_product_id=' . $this->request->get['photodays_product_id']), '301');
				}
			}
		}

		if (isset($this->request->get['photodays_product_id'])) {
			$photodays_product_id = (int)$this->request->get['photodays_product_id'];
		} else {
			$photodays_product_id = 0;
		}

		$product_info = $this->model_catalog_photodays_product->getProduct($photodays_product_id);

		if ($product_info) {
			$url = '';

			if (isset($this->request->get['photodays_path'])) {
				$url .= '&photodays_path=' . $this->request->get['photodays_path'];
			}

			if (isset($this->request->get['photodays_category_id'])) {
				$url .= '&photodays_category_id=' . $this->request->get['photodays_category_id'];
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
				'href' => $this->url->link('product/photodays_product', $url . '&photodays_product_id=' . $this->request->get['photodays_product_id'])
			);

			$this->document->setTitle($product_info['meta_title']);
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/photodays_product', 'photodays_product_id=' . $this->request->get['photodays_product_id']), 'canonical');

			$data['heading_title'] = $product_info['name'];

			$data['symbol'] = ($this->currency->getSymbolLeft($this->session->data['currency'])) ? $this->currency->getSymbolLeft($this->session->data['currency']) : $this->currency->getSymbolRight($this->session->data['currency']);
			$data['text_select'] = $this->language->get('text_select');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_reward'] = $this->language->get('text_reward');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_discount'] = $this->language->get('text_discount');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_option'] = $this->language->get('text_option');
			$data['text_write'] = $this->language->get('text_write');
			$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
			$data['text_note'] = $this->language->get('text_note');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_related'] = $this->language->get('text_related');
			$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
			$data['text_loading'] = $this->language->get('text_loading');

			$data['city'] = $product_info['city'];
			$data['name'] = $product_info['name'];
			$data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
			$data['date'] = date('d', strtotime($product_info['date_action'])) . '<br>' . date('m', strtotime($product_info['date_action']));
			$data['year'] = date('Y', strtotime($product_info['date_action']));
			
			$this->load->model('tool/image');

			if ($product_info['image']) {
				$data['popup'] = 'image/' . $product_info['image'];
			} else {
				$data['popup'] = '';
			}

			if ($product_info['image']) {
				$data['thumb'] = $this->model_tool_image->cropsize($product_info['image'], 912, 610);
			} else {
				$data['thumb'] = '';
			}

			if ($product_info['logo']) {
				$data['logo'] = 'image/' . $product_info['logo'];
			} else {
				$data['logo'] = $this->model_tool_image->resize('placeholder.png', 286, 206);
			}

			$data['images'] = array();

			$results = $this->model_catalog_photodays_product->getProductImages($this->request->get['photodays_product_id']);

			foreach ($results as $result) {
				$data['images'][] = array(
					'popup' => 'image/' . $result['image'],
					'thumb' => $this->model_tool_image->onesizeWidth($result['image'], 345)
				);
			}

			/*
			$data['images'] = array();

			$results = $this->model_catalog_photodays_product->getProductImages($this->request->get['photodays_product_id']);

			if ($results) {
				$i_images = 1;

				foreach ($results as $result) {
					$additional_width = 233;
					$additional_height = 363;

					if ($i_images == 3) {
						$additional_width = 391;
						$additional_height = 673;
					}

					$data['images'][] = array(
						'popup' => 'image/' . $result['image'],
						'thumb' => ($data['detect']->isMobile()) ? $this->model_tool_image->cropsize($result['image'], 391, 673) : $this->model_tool_image->cropsize($result['image'], $additional_width, $additional_height)
					);

					if ($i_images == 3) {
						$i_images = 1;
					} else {
						$i_images++;
					}
				}
			}
			*/

			if ($this->customer->isLogged()) {
				$data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
			} else {
				$data['customer_name'] = '';
			}

			$filter_pagination['photodays_product_id'] = (int)$product_info['photodays_product_id'];

			if (!empty($this->request->get['photodays_path'])) {
				$photodays_path = explode('_', $this->request->get['photodays_path']);

				$filter_pagination['photodays_path'] = array_pop($photodays_path);
			}

			$url = false;

			$category_article = $this->model_catalog_photodays_product->getCategoriesByProductId($product_info['photodays_product_id']);

			if ($category_article) {
				$category_id = array_pop($category_article)['photodays_category_id'];
				$url = 'photodays_path=' . $category_id;
			}

			$results_pagination = $this->model_catalog_photodays_product->getProductPagination($filter_pagination);

			$news_pagination = array();

			if ($results_pagination) {
				$news_pagination = array();

				foreach ($results_pagination as $result_pagination) {
					$news_pagination[] = $result_pagination['photodays_product_id'];
				}
			}

			// массив с ID
			$ar_ElementID = $news_pagination;

			// текущий ID (должен присутствовать в $ar_ElementID)
			$i_CurrentID = $product_info['photodays_product_id'];

			// находим текущий ключ
			$i_KeyCurrent = array_search($i_CurrentID, $ar_ElementID);

			// кол-во элементов в массиве
			$i_CountElement = count($ar_ElementID);

			// предыдущий ID
			if ($i_KeyCurrent !== ($i_CountElement - 1)) {
				if (!empty($ar_ElementID[$i_KeyCurrent - 1])) {
					$i_PrevID = $ar_ElementID[$i_KeyCurrent - 1];
				} else {
					$i_PrevID = 0;
				}
			} elseif ( $i_KeyCurrent ) {
				$i_PrevID = $ar_ElementID[$i_KeyCurrent - 1];
			}

			// слудеющий ID
			if ($i_KeyCurrent !== ($i_CountElement - 1)) {
				if (!empty($ar_ElementID[$i_KeyCurrent + 1])) {
					$i_NextID = $ar_ElementID[$i_KeyCurrent + 1];
				} else {
					$i_NextID = 0;
				}
			} else {
				$i_NextID = 0;
			}

			$data['pagination_prev'] = false;
			if (!empty($i_PrevID)) {
				$data['pagination_prev'] = $this->url->link('product/photodays_product', $url . '&photodays_product_id=' . $i_PrevID);
			}

			$data['pagination_next'] = false;
			if (!empty($i_NextID)) {
				$data['pagination_next'] = $this->url->link('product/photodays_product', $url . '&photodays_product_id=' . $i_NextID);
			}

			$data['share'] = $this->url->link('product/photodays_product', 'photodays_product_id=' . (int)$this->request->get['photodays_product_id']);

			$this->model_catalog_photodays_product->updateViewed($this->request->get['photodays_product_id']);

			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			/* layout patch - choose template by path */
			$this->load->model('design/layout');
			if ( isset($this->request->get['route']) && !empty($this->request->get['photodays_path']) ) {
				$route_ = $this->request->get['route'];

				$route = $route_ . '&amp;photodays_path=' . $this->request->get['photodays_path'] ;
			} else {
				$route = 'common/home';
			}

			$data['photodays'] = $this->url->link('product/category', 'path=68', true);

			$layout_template = $this->model_design_layout->getLayoutTemplate($route);

			if (!$layout_template) {
				$layout_template = 'product';
			}

			$this->response->setOutput($this->load->view('product/photodays/' . $layout_template, $data));
		} else {
			$url = '';

			if (isset($this->request->get['photodays_path'])) {
				$url .= '&photodays_path=' . $this->request->get['photodays_path'];
			}

			if (isset($this->request->get['photodays_category_id'])) {
				$url .= '&photodays_category_id=' . $this->request->get['photodays_category_id'];
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
				'href' => $this->url->link('product/photodays_product', $url . '&photodays_product_id=' . $photodays_product_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}
}
