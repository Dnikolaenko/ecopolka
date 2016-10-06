<?php

class ControllerModuleTMProgressBars extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->language('module/tm_progress_bars');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('extension/module');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            if (!isset($this->request->get['module_id'])) {
                $this->model_extension_module->addModule('tm_progress_bars', $this->request->post);
            } else {
                $this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_add_bar'] = $this->language->get('text_add_bar');
        $data['text_remove_bar'] = $this->language->get('text_remove_bar');
        $data['text_horizontal'] = $this->language->get('text_horizontal');
        $data['text_vertical'] = $this->language->get('text_vertical');
        $data['text_radial'] = $this->language->get('text_radial');

        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_type'] = $this->language->get('entry_type');
        $data['entry_title'] = $this->language->get('entry_title');
        $data['entry_percentage'] = $this->language->get('entry_percentage');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
        if (isset($this->error['name'])) {
            $data['error_name'] = $this->error['name'];
        } else {
            $data['error_name'] = '';
        }
        if (isset($this->error['percentage'])) {
            $data['error_percentage'] = $this->error['percentage'];
        } else {
            $data['error_percentage'] = '';
        }
        if (isset($this->error['title'])) {
            $data['error_title'] = $this->error['title'];
        } else {
            $data['error_title'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/tm_progress_bars', 'token=' . $this->session->data['token'], 'SSL')
        );

        if (!isset($this->request->get['module_id'])) {
            $data['action'] = $this->url->link('module/tm_progress_bars', 'token=' . $this->session->data['token'], 'SSL');
        } else {
            $data['action'] = $this->url->link('module/tm_progress_bars', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
        }

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
        }

        if (isset($this->request->post['name'])) {
            $data['name'] = $this->request->post['name'];
        } elseif (!empty($module_info)) {
            $data['name'] = $module_info['name'];
        } else {
            $data['name'] = '';
        }

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($module_info)) {
            $data['status'] = $module_info['status'];
        } else {
            $data['status'] = '';
        }


        if (isset($this->request->post['type'])) {
            $data['type'] = $this->request->post['type'];
        } elseif (!empty($module_info)) {
            $data['type'] = $module_info['type'];
        } else {
            $data['type'] = '';
        }
        if (isset($this->request->post['percentage'])) {
            $data['percentage'] = $this->request->post['percentage'];
        } elseif (!empty($module_info)) {
            $data['percentage'] = $module_info['percentage'];
        } else {
            $data['percentage'] = '';
        }

        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();


        if (isset($this->request->post['tm_progress_bars'])) {
            $data['tm_progress_bars'] = $this->request->post['tm_progress_bars'];
        } elseif (!empty($module_info)) {
            $data['tm_progress_bars'] = $module_info['tm_progress_bars'];
        } else {
            $data['tm_progress_bars'] = '';
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/tm_progress_bars.tpl', $data));
    }

    protected function validate()
    {
        if (!$this->user->hasPermission('modify', 'module/tm_progress_bars')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
            $this->error['name'] = $this->language->get('error_name');
        }

        foreach ($this->request->post['percentage'] as $percentage) {
            $int = intval($percentage);
            if (!is_numeric($percentage) || !($int >= 0) || !($int <= 100)) {
                $this->error['percentage'] = $this->language->get('error_percentage');
                break;
            }
        }

        foreach ($this->request->post['tm_progress_bars'] as $lang){
            foreach ($lang['title'] as $title){
                if (empty($title)){
                    $this->error['title'] = $this->language->get('error_title');
                    break;
                }
            }
        }






        return !$this->error;
    }
}