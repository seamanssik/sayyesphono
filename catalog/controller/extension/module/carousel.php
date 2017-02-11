<?php
class ControllerExtensionModuleCarousel extends Controller {
	public function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' 	=> html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8'),
					'field_1' 	=> $result['field_1'],
					'field_2' 	=> $result['field_2'],
					'field_3' 	=> $result['field_3'],
					'field_4' 	=> $result['field_4'],
					'field_5' 	=> $result['field_5'],
					'field_6' 	=> $result['field_6'],
					'link'  	=> $result['link'],
					'image' 	=> $this->model_tool_image->cropsize($result['image'], $setting['width'], $setting['height']),
					'popup' 	=> 'image/' . $result['image']
				);
			}
		}

		$data['module'] = $module++;

		$file_tpl = 'carousel';
		if ( !empty($setting['name_tpl']) ) {
			$file_tpl = 'carousel/' . $setting['name_tpl'];
		}

		return $this->load->view('extension/module/' . $file_tpl, $data);
	}
}