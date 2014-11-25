<?php
class ControllerCustomOrder extends Controller {
    public function index() {

        $this->load->language('custom/order');

        $this->document->setTitle($this->language->get('heading_title'));

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_custom_order'),
            'href' => $this->url->link('custom/order')
        );

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $data['action'] = $this->url->link('custom/order', '', 'SSL');

        //Form fields
        //link
        if (isset($this->request->post['link'])) {
            $data['link'] = $this->request->post['link'];
        } else {
            $data['link'] = '';
        }
        $data['text_link'] = $this->language->get('text_link');
        if (isset($this->error['error_link'])) {
            $data['error_link'] = $this->error['error_link'];
        } else {
            $data['error_link'] = '';
        }
        //message
        if (isset($this->request->post['message'])) {
            $data['message'] = $this->request->post['message'];
        } else {
            $data['message'] = '';
        }
        $data['text_message'] = $this->language->get('text_message');
        if (isset($this->error['error_message'])) {
            $data['error_message'] = $this->error['error_message'];
        } else {
            $data['error_message'] = '';
        }
        //submit button
        $data['button_submit'] = $this->language->get('button_submit');


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/custom/order.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/custom/order.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/custom/order.tpl', $data));
        }
    }
}