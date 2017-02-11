<?php
class ControllerAccountDownload extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/download', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		// define('CUSTOMER_DIR', DIR_CUSTOMER . $this->customer->getId() . '/');

		$this->load->language('account/download');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_downloads'),
			'href' => $this->url->link('account/download', '', true)
		);

		$this->load->model('account/download');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_empty'] = $this->language->get('text_empty');

		$data['column_order_id'] = $this->language->get('column_order_id');
		$data['column_name'] = $this->language->get('column_name');
		$data['column_size'] = $this->language->get('column_size');
		$data['column_date_added'] = $this->language->get('column_date_added');

		$data['button_download'] = $this->language->get('button_download');

		$data['histories'] = array();

		$results = $this->model_account_download->getHistories($this->customer->getId());

		foreach ($results as $result) {
			$data['histories'][] = array(
				'history_id' 	=> $result['customer_history_id'],
				'title'    		=> $result['title'],
				'comment'    	=> trim($result['comment']),
				'date_added'	=> date('d', strtotime($result['date_added'])) . ' ' . rus_months($this->session->data['language'], date('m', strtotime($result['date_added']))) . ' ' . date('Y', strtotime($result['date_added']))
			);
		}

		/*
		// Find which protocol to use to pass the full image link back
		if ($this->request->server['HTTPS']) {
			$server = HTTPS_SERVER;
		} else {
			$server = HTTP_SERVER;
		}

		if (isset($this->request->get['filter_name'])) {
			$filter_name = rtrim(str_replace('*', '', $this->request->get['filter_name']), '/');
		} else {
			$filter_name = null;
		}

		// Make sure we have the correct directory
		if (isset($this->request->get['directory'])) {
			$directory = rtrim(CUSTOMER_DIR . 'photodays/' . str_replace('*', '', $this->request->get['directory']), '/');
		} else {
			$directory = CUSTOMER_DIR . 'photodays';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$directories = array();
		$files = array();

		$data['images'] = array();

		$this->load->model('tool/image');

		if (substr(str_replace('\\', '/', realpath($directory . '/' . $filter_name)), 0, strlen(CUSTOMER_DIR . 'photodays')) == CUSTOMER_DIR . 'photodays') {
			// Get directories
			$directories = glob($directory . '/' . $filter_name . '*', GLOB_ONLYDIR);

			if (!$directories) {
				$directories = array();
			}

			// Get files
			$files = glob($directory . '/' . $filter_name . '*.{jpg,jpeg,png,gif,JPG,JPEG,PNG,GIF}', GLOB_BRACE);

			if (!$files) {
				$files = array();
			}
		}

		// Merge directories and files
		$images = array_merge($directories, $files);

		// Get total number of files and directories
		$image_total = count($images);

		// Split the array based on current page number and max number of items per page of 10
		$images = array_splice($images, ($page - 1) * 16, 16);

		foreach ($images as $image) {
			$name = str_split(basename($image), 14);

			if (is_dir($image)) {
				$url = '';

				if (isset($this->request->get['target'])) {
					$url .= '&target=' . $this->request->get['target'];
				}

				if (isset($this->request->get['thumb'])) {
					$url .= '&thumb=' . $this->request->get['thumb'];
				}

				$data['images'][] = array(
					'thumb' => '',
					'name'  => implode(' ', $name),
					'type'  => 'directory',
					'path'  => utf8_substr($image, utf8_strlen(CUSTOMER_DIR)),
					'href'  => $this->url->link('common/filemanager', 'token=' . $this->session->data['token'] . '&directory=' . urlencode(utf8_substr($image, utf8_strlen(CUSTOMER_DIR . 'photodays/'))) . $url, true)
				);
			} elseif (is_file($image)) {
				$data['images'][] = array(
					'thumb' => $this->model_tool_image->resize(utf8_substr($image, utf8_strlen(CUSTOMER_DIR)), 100, 100),
					'name'  => implode(' ', $name),
					'type'  => 'image',
					'path'  => utf8_substr($image, utf8_strlen(CUSTOMER_DIR)),
					'href'  => $server . 'image/' . utf8_substr($image, utf8_strlen(CUSTOMER_DIR . $this->customer->getId() . '/'))
				);
			}
		}
*/
		
//		if (isset($this->request->get['page'])) {
//			$page = $this->request->get['page'];
//		} else {
//			$page = 1;
//		}
//
//		$data['download'] = array();
//
//		$download_total = $this->model_account_download->getTotalDownloads();
//
//		$results = $this->model_account_download->getDownloads(($page - 1) * $this->config->get($this->config->get('config_theme') . '_product_limit'), $this->config->get($this->config->get('config_theme') . '_product_limit'));
//
//		foreach ($results as $result) {
//			if (file_exists(DIR_DOWNLOAD . $result['filename'])) {
//				$size = filesize(DIR_DOWNLOAD . $result['filename']);
//
//				$i = 0;
//
//				$suffix = array(
//					'B',
//					'KB',
//					'MB',
//					'GB',
//					'TB',
//					'PB',
//					'EB',
//					'ZB',
//					'YB'
//				);
//
//				while (($size / 1024) > 1) {
//					$size = $size / 1024;
//					$i++;
//				}
//
//				$data['downloads'][] = array(
//					'order_id'   => $result['order_id'],
//					'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
//					'name'       => $result['name'],
//					'size'       => round(substr($size, 0, strpos($size, '.') + 4), 2) . $suffix[$i],
//					'href'       => $this->url->link('account/download/download', 'download_id=' . $result['download_id'], true)
//				);
//			}
//		}
//
//		$pagination = new Pagination();
//		$pagination->total = $download_total;
//		$pagination->page = $page;
//		$pagination->limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
//		$pagination->url = $this->url->link('account/download', 'page={page}', true);
//
//		$data['pagination'] = $pagination->render();
//
//		$data['results'] = sprintf($this->language->get('text_pagination'), ($download_total) ? (($page - 1) * $this->config->get($this->config->get('config_theme') . '_product_limit')) + 1 : 0, ((($page - 1) * $this->config->get($this->config->get('config_theme') . '_product_limit')) > ($download_total - $this->config->get($this->config->get('config_theme') . '_product_limit'))) ? $download_total : ((($page - 1) * $this->config->get($this->config->get('config_theme') . '_product_limit')) + $this->config->get($this->config->get($this->config->get('config_theme') . '_theme') . '_product_limit')), $download_total, ceil($download_total / $this->config->get($this->config->get('config_theme') . '_product_limit')));
//
//		$data['continue'] = $this->url->link('account/account', '', true);

		$data['button_continue'] = $this->language->get('button_continue');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/download', $data));
	}

	public function download() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/download', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->model('account/download');

		if (isset($this->request->get['download_id'])) {
			$download_id = $this->request->get['download_id'];
		} else {
			$download_id = 0;
		}

		$download_info = $this->model_account_download->getDownload($download_id);

		if ($download_info) {
			$file = DIR_DOWNLOAD . $download_info['filename'];
			$mask = basename($download_info['mask']);

			if (!headers_sent()) {
				if (file_exists($file)) {
					header('Content-Type: application/octet-stream');
					header('Content-Disposition: attachment; filename="' . ($mask ? $mask : basename($file)) . '"');
					header('Expires: 0');
					header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
					header('Pragma: public');
					header('Content-Length: ' . filesize($file));

					if (ob_get_level()) {
						ob_end_clean();
					}

					readfile($file, 'rb');

					exit();
				} else {
					exit('Error: Could not find file ' . $file . '!');
				}
			} else {
				exit('Error: Headers already sent out!');
			}
		} else {
			$this->response->redirect($this->url->link('account/download', '', true));
		}
	}
}