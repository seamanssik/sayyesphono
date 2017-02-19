<?php
class ControllerInformationInformation extends Controller {
	private $error = array();

	public function addFaq() {
		$json = array();

		$this->load->model('fido/faq_testimonial');

		if( !empty($this->request->post['key']) ){
			if(($this->request->post['key'] == 'testimonial') && $this->validateFaq()){
				$this->model_fido_faq_testimonial->addFaq($this->request->post);

				$json['success'] = true;
			} else {
				$json['error'] = $this->error;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function addReviews() {
		$json = array();

		$this->load->model('fido/faq_reviews');

		if( !empty($this->request->post['key']) ){
			if(($this->request->post['key'] == 'review') && $this->validateReviews()){
				$this->model_fido_faq_reviews->addFaq($this->request->post);

				$json['success'] = true;
			} else {
				$json['error'] = $this->error;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function index() {
		$this->load->language('information/information');

		$this->load->model('catalog/information');

		$this->load->model('tool/image');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}

		$data['detect'] = new Detect;

		$information_info = $this->model_catalog_information->getInformation($information_id);

		if ($information_info) {
			$this->document->setTitle($information_info['meta_title']);
			$this->document->setDescription($information_info['meta_description']);
			$this->document->setKeywords($information_info['meta_keyword']);

			$data['breadcrumbs'][] = array(
				'text' => $information_info['title'],
				'href' => $this->url->link('information/information', 'information_id=' .  $information_id)
			);

			$data['heading_title'] = $information_info['title'];

			$data['button_continue'] = $this->language->get('button_continue');

			$data['description'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');

			if ($information_id == 9) {
				$data['legends'] = array();
				
				$legends = $this->model_catalog_information->getLegends();
				
				if ($legends) {
					foreach ($legends as $legend) {
						$legend_images = array();

						$images = $this->model_catalog_information->getLegendImages($legend['legend_id']);

						if ($images) {
							foreach ($images as $image) {
								if ($image['image']) {
									$popup = 'image/' . $image['image'];
									$image = 'image/' . $image['image']; //$this->model_tool_image->resize($image['image'], 100, 100);
								} else {
									$popup = $this->model_tool_image->resize('placeholder.png', 100, 100);
									$image = $this->model_tool_image->resize('placeholder.png', 100, 100);
								}

								$legend_images[] = array(
									'thumb' => $image,
									'popup' => $popup,
								);
							}
						}

						$data['legends'][] = array(
							'legend_id' 	=> $legend['legend_id'],
							'year' 			=> $legend['title'],
							'description' 	=> html_entity_decode($legend['description'], ENT_QUOTES, 'UTF-8'),
							'image' 		=> $legend_images
						);
					}
				}
			}
			
			// Start custom_fields
			$data['custom_field'] = array();
			
			if ( !empty($information_info['custom_field']) ) {
				$language_id = $this->config->get('config_language_id');

				$custom_fields = json_decode($information_info['custom_field'], true);

				if ( !empty($custom_fields[$language_id]) ) {
					foreach ($custom_fields[$language_id] as $custom_fields) {
						$data['custom_field'][$custom_fields['name']] = $custom_fields['value'];
					}
				}
			}
			// End custom_fields

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			/* layout patch - choose template by path */
			$this->load->model ('design/layout');

			if (isset ( $this->request->get ['route'] )) {
				$route = ( string ) $this->request->get ['route'];
			} else {
				$route = 'common/home';
			}

			$layout_template = $this->model_design_layout->getLayoutTemplate($route);

			$isLayoutRoute = true;

			if(!$layout_template){
				$layout_template = 'information';
				$isLayoutRoute = false;
			}

			// get general layout template
			if(!$isLayoutRoute){
				$layout_id = $this->model_catalog_information->getInformationLayoutId($information_id);

				if($layout_id){
					$tmp_layout_template = $this->model_design_layout->getGeneralLayoutTemplate($layout_id);
					if($tmp_layout_template) {
						$layout_template = $tmp_layout_template;
					}
				}
			}

			$this->response->setOutput($this->load->view('information/' . $layout_template, $data));
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('information/information', 'information_id=' . $information_id)
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

	public function agree() {
		$this->load->model('catalog/information');

		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}

		$output = '';

		$information_info = $this->model_catalog_information->getInformation($information_id);

		if ($information_info) {
			$output .= html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8') . "\n";
		}

		$this->response->setOutput($output);
	}

	private function validateFaq(){
		if ((strlen(trim(utf8_decode($this->request->post['author_name']))) < 2) || (strlen(trim(utf8_decode($this->request->post['author_name']))) > 20)) {
			$this->error['author_name'] = $this->language->get('error_author_name');
		}

		if ((strlen(utf8_decode($this->request->post['title'])) < 5) || (strlen(utf8_decode($this->request->post['title'])) > 500)) {
			$this->error['title'] = $this->language->get('error_title');
		}

		if (!preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['author_mail'])) {
			$this->error['author_mail'] = $this->language->get('error_email');
		}

		return !$this->error;
	}

	private function validateReviews(){
		if ((strlen(trim(utf8_decode($this->request->post['author_name']))) < 2) || (strlen(trim(utf8_decode($this->request->post['author_name']))) > 20)) {
			$this->error['author_name'] = $this->language->get('error_author_name');
		}

		if ((strlen(utf8_decode($this->request->post['author_review'])) < 5) || (strlen(utf8_decode($this->request->post['author_review'])) > 500)) {
			$this->error['author_review'] = $this->language->get('error_title');
		}

		if (!preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['author_mail'])) {
			$this->error['author_mail'] = $this->language->get('error_email');
		}

		return !$this->error;
	}
}