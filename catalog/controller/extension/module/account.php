<?php
class ControllerExtensionModuleAccount extends Controller {
	public function index() {
		$this->load->language('extension/module/account');

		$data['heading_title'] = $this->language->get('heading_title');

		$this->load->model('account/address');

		$address_id = $this->model_account_address->getFirstAddress();

		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_forgotten'] = $this->language->get('text_forgotten');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_reward'] = $this->language->get('text_reward');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_recurring'] = $this->language->get('text_recurring');

		$data['logged'] = $this->customer->isLogged();
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['forgotten'] = $this->url->link('account/forgotten', '', true);
		$data['account'] = $this->url->link('account/account', '', true);
		$data['edit'] = $this->url->link('account/edit', '', true);
		$data['password'] = $this->url->link('account/password', '', true);
		$data['address'] = $this->url->link('account/address/edit', 'address_id=' . $address_id, true);
		$data['wishlist'] = $this->url->link('account/wishlist');
		$data['order'] = $this->url->link('account/order', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['reward'] = $this->url->link('account/reward', '', true);
		$data['return'] = $this->url->link('account/return', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);
		$data['recurring'] = $this->url->link('account/recurring', '', true);

		$data['nav'] = array(
			'account' 	=> ($this->request->get['route'] == 'account/account') ? 'account-nav__active' : false,
			'edit' 		=> ($this->request->get['route'] == 'account/edit') ? 'account-nav__active' : false,
			'password' 	=> ($this->request->get['route'] == 'account/password') ? 'account-nav__active' : false,
			'address' 	=> ($this->request->get['route'] == 'account/address' || $this->request->get['route'] == 'account/address/edit') ? 'account-nav__active' : false,
			'order' 	=> ($this->request->get['route'] == 'account/order') ? 'account-nav__active' : false,
			'download' 	=> ($this->request->get['route'] == 'account/download') ? 'account-nav__active' : false,
			'wishlist' 	=> ($this->request->get['route'] == 'account/wishlist') ? 'account-nav__active' : false,
		);

		return $this->load->view('extension/module/account', $data);
	}
}