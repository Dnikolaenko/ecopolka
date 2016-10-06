<?php

class ControllerModuleTMCountdown extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->language('module/tm_countdown');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('extension/module');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            if (!isset($this->request->get['module_id'])) {
                $this->model_extension_module->addModule('tm_countdown', $this->request->post);
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
        $data['text_simple'] = $this->language->get('text_simple');
        $data['text_radial'] = $this->language->get('text_radial');
        $data['text_smooth'] = $this->language->get('text_smooth');
        $data['text_tick'] = $this->language->get('text_tick');
        $data['text_clockwise'] = $this->language->get('text_clockwise');
        $data['text_counter_clockwise'] = $this->language->get('text_counter_clockwise');

        $data['help_date'] = $this->language->get('help_date');
        $data['help_fg_width'] = $this->language->get('help_fg_width');
        $data['help_bg_width'] = $this->language->get('help_bg_width');

        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_type'] = $this->language->get('entry_type');
        $data['entry_date'] = $this->language->get('entry_date');
        $data['entry_show_days'] = $this->language->get('entry_show_days');
        $data['entry_show_hours'] = $this->language->get('entry_show_hours');
        $data['entry_show_minutes'] = $this->language->get('entry_show_minutes');
        $data['entry_show_seconds'] = $this->language->get('entry_show_seconds');
        $data['entry_description'] = $this->language->get('entry_description');
        $data['entry_days_title'] = $this->language->get('entry_days_title');
        $data['entry_hours_title'] = $this->language->get('entry_hours_title');
        $data['entry_minutes_title'] = $this->language->get('entry_minutes_title');
        $data['entry_seconds_title'] = $this->language->get('entry_seconds_title');
        $data['entry_animation'] = $this->language->get('entry_animation');
        $data['entry_animation_direction'] = $this->language->get('entry_animation_direction');
        $data['entry_days_color'] = $this->language->get('entry_days_color');
        $data['entry_hours_color'] = $this->language->get('entry_hours_color');
        $data['entry_minutes_color'] = $this->language->get('entry_minutes_color');
        $data['entry_seconds_color'] = $this->language->get('entry_seconds_color');
        $data['entry_fg_width'] = $this->language->get('entry_fg_width');
        $data['entry_bg_width'] = $this->language->get('entry_bg_width');
        $data['entry_bg_color'] = $this->language->get('entry_bg_color');

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
        if (isset($this->error['date'])) {
            $data['error_date'] = $this->error['date'];
        } else {
            $data['error_date'] = '';
        }
        if (isset($this->error['bg_color'])) {
            $data['error_bg_color'] = $this->error['bg_color'];
        } else {
            $data['error_bg_color'] = '';
        }
        if (isset($this->error['days_color'])) {
            $data['error_days_color'] = $this->error['days_color'];
        } else {
            $data['error_days_color'] = '';
        }
        if (isset($this->error['hours_color'])) {
            $data['error_hours_color'] = $this->error['hours_color'];
        } else {
            $data['error_hours_color'] = '';
        }
        if (isset($this->error['minutes_color'])) {
            $data['error_minutes_color'] = $this->error['minutes_color'];
        } else {
            $data['error_minutes_color'] = '';
        }
        if (isset($this->error['seconds_color'])) {
            $data['error_seconds_color'] = $this->error['seconds_color'];
        } else {
            $data['error_seconds_color'] = '';
        }
        if (isset($this->error['bg_width'])) {
            $data['error_bg_width'] = $this->error['bg_width'];
        } else {
            $data['error_bg_width'] = '';
        }
        if (isset($this->error['fg_width'])) {
            $data['error_fg_width'] = $this->error['fg_width'];
        } else {
            $data['error_fg_width'] = '';
        }

        $this->error['seconds_color'] = $this->language->get('error_seconds_color');

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
            'href' => $this->url->link('module/tm_countdown', 'token=' . $this->session->data['token'], 'SSL')
        );

        if (!isset($this->request->get['module_id'])) {
            $data['action'] = $this->url->link('module/tm_countdown', 'token=' . $this->session->data['token'], 'SSL');
        } else {
            $data['action'] = $this->url->link('module/tm_countdown', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
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


        if (isset($this->request->post['date'])) {
            $data['date'] = $this->request->post['date'];
        } elseif (!empty($module_info)) {
            $data['date'] = $module_info['date'];
        } else {
            $data['date'] = '';
        }
        if (isset($this->request->post['type'])) {
            $data['type'] = $this->request->post['type'];
        } elseif (!empty($module_info)) {
            $data['type'] = $module_info['type'];
        } else {
            $data['type'] = '';
        }
        if (isset($this->request->post['show_days'])) {
            $data['show_days'] = $this->request->post['show_days'];
        } elseif (!empty($module_info)) {
            $data['show_days'] = $module_info['show_days'];
        } else {
            $data['show_days'] = '';
        }
        if (isset($this->request->post['show_hours'])) {
            $data['show_hours'] = $this->request->post['show_hours'];
        } elseif (!empty($module_info)) {
            $data['show_hours'] = $module_info['show_hours'];
        } else {
            $data['show_hours'] = '';
        }
        if (isset($this->request->post['show_minutes'])) {
            $data['show_minutes'] = $this->request->post['show_minutes'];
        } elseif (!empty($module_info)) {
            $data['show_minutes'] = $module_info['show_minutes'];
        } else {
            $data['show_minutes'] = '';
        }
        if (isset($this->request->post['show_seconds'])) {
            $data['show_seconds'] = $this->request->post['show_seconds'];
        } elseif (!empty($module_info)) {
            $data['show_seconds'] = $module_info['show_seconds'];
        } else {
            $data['show_seconds'] = '';
        }
        if (isset($this->request->post['description'])) {
            $data['description'] = $this->request->post['description'];
        } elseif (!empty($module_info)) {
            $data['description'] = $module_info['description'];
        } else {
            $data['description'] = '';
        }
        if (isset($this->request->post['animation'])) {
            $data['animation'] = $this->request->post['animation'];
        } elseif (!empty($module_info)) {
            $data['animation'] = $module_info['animation'];
        } else {
            $data['animation'] = '';
        }
        if (isset($this->request->post['animation_direction'])) {
            $data['animation_direction'] = $this->request->post['animation_direction'];
        } elseif (!empty($module_info)) {
            $data['animation_direction'] = $module_info['animation_direction'];
        } else {
            $data['animation_direction'] = '';
        }
        if (isset($this->request->post['bg_color'])) {
            $data['bg_color'] = $this->request->post['bg_color'];
        } elseif (!empty($module_info)) {
            $data['bg_color'] = $module_info['bg_color'];
        } else {
            $data['bg_color'] = '';
        }
        if (isset($this->request->post['days_color'])) {
            $data['days_color'] = $this->request->post['days_color'];
        } elseif (!empty($module_info)) {
            $data['days_color'] = $module_info['days_color'];
        } else {
            $data['days_color'] = '';
        }
        if (isset($this->request->post['hours_color'])) {
            $data['hours_color'] = $this->request->post['hours_color'];
        } elseif (!empty($module_info)) {
            $data['hours_color'] = $module_info['hours_color'];
        } else {
            $data['hours_color'] = '';
        }
        if (isset($this->request->post['minutes_color'])) {
            $data['minutes_color'] = $this->request->post['minutes_color'];
        } elseif (!empty($module_info)) {
            $data['minutes_color'] = $module_info['minutes_color'];
        } else {
            $data['minutes_color'] = '';
        }
        if (isset($this->request->post['seconds_color'])) {
            $data['seconds_color'] = $this->request->post['seconds_color'];
        } elseif (!empty($module_info)) {
            $data['seconds_color'] = $module_info['seconds_color'];
        } else {
            $data['seconds_color'] = '';
        }
        if (isset($this->request->post['fg_width'])) {
            $data['fg_width'] = $this->request->post['fg_width'];
        } elseif (!empty($module_info)) {
            $data['fg_width'] = $module_info['fg_width'];
        } else {
            $data['fg_width'] = '';
        }
        if (isset($this->request->post['bg_width'])) {
            $data['bg_width'] = $this->request->post['bg_width'];
        } elseif (!empty($module_info)) {
            $data['bg_width'] = $module_info['bg_width'];
        } else {
            $data['bg_width'] = '';
        }

        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();


        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/tm_countdown.tpl', $data));
    }

    protected function validate()
    {
        if (!$this->user->hasPermission('modify', 'module/tm_countdown')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
            $this->error['name'] = $this->language->get('error_name');
        }

        $date_regexp = '/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])\s([0-1][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$/';
        if (empty($this->request->post['date']) || !preg_match($date_regexp, $this->request->post['date'])) {
            $this->error['date'] = $this->language->get('error_date');
        }

        if ($this->request->post['type'] == 1) {
            $color_regexp = '/^#([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})?\b$/';

            if (empty($this->request->post['bg_color']) || preg_match($color_regexp, $this->request->post['bg_color']) != 1) {
                    $this->error['bg_color'] = $this->language->get('error_bg_color');
            }
            if (empty($this->request->post['days_color']) || preg_match($color_regexp, $this->request->post['days_color']) != 1) {
                    $this->error['days_color'] = $this->language->get('error_days_color');
            }
            if (empty($this->request->post['hours_color']) || !preg_match($color_regexp, $this->request->post['hours_color'])) {
                    $this->error['hours_color'] = $this->language->get('error_hours_color');
            }
            if (empty($this->request->post['minutes_color']) || !preg_match($color_regexp, $this->request->post['minutes_color'])) {
                    $this->error['minutes_color'] = $this->language->get('error_minutes_color');
            }
            if (empty($this->request->post['seconds_color']) || !preg_match($color_regexp, $this->request->post['seconds_color'])) {
                    $this->error['seconds_color'] = $this->language->get('error_seconds_color');
            }
            if (empty($this->request->post['fg_width']) || !is_numeric($this->request->post['fg_width'])) {
                $this->error['fg_width'] = $this->language->get('error_width');
            }
            if (empty($this->request->post['bg_width']) || !is_numeric($this->request->post['bg_width'])) {
                $this->error['bg_width'] = $this->language->get('error_width');
            }
        }
        return !$this->error;
    }
}