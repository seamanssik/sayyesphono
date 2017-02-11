<?php
class ControllerExtensionModuleSlideshow extends Controller {
	public function index($setting) {
		static $module = 0;		

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8'),
					'field_1' 	=> html_entity_decode($result['field_1'], ENT_QUOTES, 'UTF-8'),
					'field_2' 	=> html_entity_decode($result['field_2'], ENT_QUOTES, 'UTF-8'),
					'field_3' 	=> html_entity_decode($result['field_3'], ENT_QUOTES, 'UTF-8'),
					'field_4' 	=> html_entity_decode($result['field_4'], ENT_QUOTES, 'UTF-8'),
					'field_5' 	=> html_entity_decode($result['field_5'], ENT_QUOTES, 'UTF-8'),
					'field_6' 	=> html_entity_decode($result['field_6'], ENT_QUOTES, 'UTF-8'),
					'link'  	=> $result['link'],
					'thumb' 	=> 'image/' . $result['image'],
					'image' 	=> $this->model_tool_image->cropsize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}

		$data['module'] = $module++;

		$file_tpl = 'slideshow';
		if ( !empty($setting['name_tpl']) ) {
			$file_tpl = 'slideshow/' . $setting['name_tpl'];
		}

		return $this->load->view('extension/module/' . $file_tpl, $data);
	}
}
