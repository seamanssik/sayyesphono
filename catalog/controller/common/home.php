<?php
class ControllerCommonHome extends Controller {
	public function index() {

		$this->load->model('tool/image');

		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$language_id = $this->config->get('config_language_id');


		if ($this->config->get('config_fields')[$language_id]['img_legend_1']) {
			$legend_image_1 = $this->model_tool_image->resize($this->config->get('config_fields')[$language_id]['img_legend_1'], 521, 756);
		} else {
			$legend_image_1 = $this->model_tool_image->resize('placeholder.png', 521, 756);
		}

		$data['legend_fields'] = array(
			'image_1' 	=> $legend_image_1,
			'field_1' 	=> $this->config->get('config_fields')[$language_id]['filed_legend_1'],
			'field_2' 	=> $this->config->get('config_fields')[$language_id]['filed_legend_2'],
			'field_3' 	=> $this->config->get('config_fields')[$language_id]['filed_legend_3'],
			'field_4' 	=> html_entity_decode($this->config->get('config_fields')[$language_id]['filed_legend_4'], ENT_QUOTES, 'UTF-8'),
			'field_5' 	=> $this->config->get('config_fields')[$language_id]['filed_legend_5']
		);

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
