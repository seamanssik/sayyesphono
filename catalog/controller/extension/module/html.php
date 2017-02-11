<?php
class ControllerExtensionModuleHTML extends Controller {
	public function index($setting) {
		if (isset($setting['module_description'][$this->config->get('config_language_id')])) {

			$data['heading_title'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['title'], ENT_QUOTES, 'UTF-8');
			$data['html'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['description'], ENT_QUOTES, 'UTF-8');

			$file_tpl = 'html';
			if ( !empty($setting['name_tpl']) ) {
				$file_tpl = 'html/' . $setting['name_tpl'];
			}

			return $this->load->view('extension/module/' . $file_tpl, $data);
		}
	}
}