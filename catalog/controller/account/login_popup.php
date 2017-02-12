<?php
class ControllerAccountLoginPopup extends Controller {
	private $error = array();

	public function login() {
		$json = array();

		$this->load->model('account/customer');

		$this->load->language('account/login');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			// Unset guest
			unset($this->session->data['guest']);

			// Default Shipping Address
			$this->load->model('account/address');

			if ($this->config->get('config_tax_customer') == 'payment') {
				$this->session->data['payment_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
			}

			if ($this->config->get('config_tax_customer') == 'shipping') {
				$this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
			}

			// Wishlist
			if (isset($this->session->data['wishlist']) && is_array($this->session->data['wishlist'])) {
				$this->load->model('account/wishlist');

				foreach ($this->session->data['wishlist'] as $key => $product_id) {
					$this->model_account_wishlist->addWishlist($product_id);

					unset($this->session->data['wishlist'][$key]);
				}
			}

			// Add to activity log
			if ($this->config->get('config_customer_activity')) {
				$this->load->model('account/activity');

				$activity_data = array(
					'customer_id' => $this->customer->getId(),
					'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
				);

				$this->model_account_activity->addActivity('login', $activity_data);
			}

			$json['success'] = 'success';
		} elseif($this->request->server['REQUEST_METHOD'] == 'POST' && !$this->validate()) {
			$json['error'] = $this->error;
		}

		$this->response->addHeader('Content-Type: application/json');
		echo json_encode($json);
	}

	public function index() {
		$this->load->model('account/customer');

		$this->load->language('account/login');

		$data['button_login'] = $this->language->get('button_login');

		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_password'] = $this->language->get('entry_password');

		$data['action'] = $this->url->link('account/login', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['forgotten'] = $this->url->link('account/forgotten', '', true);

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

		return $this->load->view('account/login_popup', $data);
	}

	protected function validate() {
		// Check how many login attempts have been made.
//		$login_info = $this->model_account_customer->getLoginAttempts($this->request->post['email']);
//
//		if ($login_info && ($login_info['total'] >= $this->config->get('config_login_attempts')) && strtotime('-1 hour') < strtotime($login_info['date_modified'])) {
//			$this->error['warning'] = $this->language->get('error_attempts');
//		}

		// Check if customer has been approved.

		// $this->request->post['email'] - THIS PHONE HERE
//		$customer_info = $this->model_account_customer->getCustomerByEmail($this->request->post['email']);
		$customer_phone = preg_replace( '/[^0-9]/', '', $this->request->post['email'] );
		$customer_info = $this->model_account_customer->getCustomerByPhone($customer_phone);

		if ($customer_info && !$customer_info['approved']) {
			$this->error['warning'] = $this->language->get('error_approved');
		}

		if (!$this->error) {
			if (!$this->customer->loginByPhone($customer_phone, $this->request->post['password'])) {

				$this->error['warning'] = $this->language->get('error_login');

				$this->model_account_customer->addLoginAttempt($this->request->post['email']);
			} else {

				$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);
			}
		}

		return !$this->error;
	}
}
