<?php
class ControllerModuleFacebookLogin extends Controller {
    private $error = array();

    public function index() {
        $this->language->load('module/facebook_login');

        $this->load->model('setting/setting');
        $this->document->setTitle($this->language->get('heading_title'));

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('fb', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_fb_app_id'] = $this->language->get('entry_fb_app_id');
        $data['entry_fb_app_secret'] = $this->language->get('entry_fb_app_secret');
        $data['entry_fb_app_page'] = $this->language->get('entry_fb_app_page');
        $data['entry_status'] = $this->language->get('entry_status');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_module_add'] = $this->language->get('button_module_add');
        $data['button_remove'] = $this->language->get('button_remove');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['fb_app_id'])) {
            $data['error_fb_app_id'] = $this->error['app_id'];
        } else {
            $data['error_fb_app_id'] = '';
        }

        if (isset($this->error['fb_app_secret'])) {
            $data['error_fb_app_secret'] = $this->error['fb_app_secret'];
        } else {
            $data['error_fb_app_secret'] = '';
        }

        if (isset($this->error['fb_app_page'])) {
            $data['error_fb_app_page'] = $this->error['fb_app_page'];
        } else {
            $data['error_fb_app_page'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/facebook_login', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['action'] = $this->url->link('module/facebook_login', 'token=' . $this->session->data['token'], 'SSL');

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->post['fb_app_id'])) {
            $data['fb_app_id'] = $this->request->post['fb_app_id'];
        } else {
            $data['fb_app_id'] = $this->config->get('fb_app_id');
        }

        if (isset($this->request->post['fb_app_secret'])) {
            $data['fb_app_secret'] = $this->request->post['fb_app_secret'];
        } else {
            $data['fb_app_secret'] = $this->config->get('fb_app_secret');
        }

        if (isset($this->request->post['fb_app_page'])) {
            $data['fb_app_page'] = $this->request->post['fb_app_page'];
        } else {
            $data['fb_app_page'] = $this->config->get('fb_app_page');
        }

        if (isset($this->request->post['fb_app_status'])) {
            $data['fb_app_status'] = $this->request->post['fb_app_status'];
        } else {
            $data['fb_app_status'] = $this->config->get('fb_app_status');
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/facebook_login.tpl', $data));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/facebook_login')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->request->post['fb_app_id']) {
            $this->error['fb_app_id'] = $this->language->get('fb_app_id');
        }

        if (!$this->request->post['fb_app_secret']) {
            $this->error['fb_app_secret'] = $this->language->get('fb_app_secret');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
}