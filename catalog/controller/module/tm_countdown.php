<?php

class ControllerModuleTMCountDown extends Controller
{
    private $error = array();

    public function index($setting)
    {
        static $module = 0;
        $this->load->language('module/tm_countdown');
        $this->document->addStyle('catalog/view/javascript/tmcountdown/countdown.css');

        if ($setting['type'] == 1) {
            $this->document->addScript('catalog/view/javascript/tmcountdown/TimeCircles.min.js');

            $data['animation'] = ($setting['animation']) ? 'ticks' : 'smooth';
            $data['direction'] = ($setting['animation_direction']) ? 'Counter-clockwise' : 'Clockwise';

            $data['days_color'] = ($setting['days_color']) ? $setting['days_color'] : '#C0C8CF';
            $data['hours_color'] = ($setting['hours_color']) ? $setting['hours_color'] : '#C0C8CF';
            $data['minutes_color'] = ($setting['minutes_color']) ? $setting['minutes_color'] : '#C0C8CF';
            $data['seconds_color'] = ($setting['seconds_color']) ? $setting['seconds_color'] : '#C0C8CF';

            $data['show_days'] = ($setting['show_days']) ? 'true' : 'false';
            $data['show_hours'] = ($setting['show_hours']) ? 'true' : 'false';
            $data['show_minutes'] = ($setting['show_minutes']) ? 'true' : 'false';
            $data['show_seconds'] = ($setting['show_seconds']) ? 'true' : 'false';

            $data['bg_color'] = ($setting['bg_color']) ? $setting['bg_color'] : '#60686F';
            $data['fg_width'] = $setting['fg_width'];
            $data['bg_width'] = $setting['bg_width'];
            $data['count'] = $setting['show_days'] + $setting['show_hours'] + $setting['show_minutes'] + $setting['show_seconds'];
        }else{
            $this->document->addScript('catalog/view/javascript/tmcountdown/jquery.countdown.min.js');
        }

        $data['type'] = $setting['type'];
        $data['date'] = $setting['date'];

        $data['heading_title'] = $this->language->get('heading_title');

        $data['days_title'] = ($setting['description'][$this->config->get('config_language_id')]['days_title']) ? $setting['description'][$this->config->get('config_language_id')]['days_title'] : 'Days';
        $data['hours_title'] = ($setting['description'][$this->config->get('config_language_id')]['hours_title']) ? $setting['description'][$this->config->get('config_language_id')]['hours_title'] : 'Hours';
        $data['minutes_title'] = ($setting['description'][$this->config->get('config_language_id')]['minutes_title']) ? $setting['description'][$this->config->get('config_language_id')]['minutes_title'] : 'Minutes';
        $data['seconds_title'] = ($setting['description'][$this->config->get('config_language_id')]['seconds_title']) ? $setting['description'][$this->config->get('config_language_id')]['seconds_title'] : 'Seconds';

        $description = html_entity_decode($setting['description'][$this->config->get('config_language_id')]['description']);
        if (strip_tags($description)) {
            $data['description'] = html_entity_decode($setting['description'][$this->config->get('config_language_id')]['description']);
        }else{
            $data['description'] = '';
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['action'] = $this->url->link('module/tm_countdown', '', 'SSL');

        $data['module'] = $module++;

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/tm_countdown.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/tm_countdown.tpl', $data);
        } else {
            return $this->load->view('default/template/module/tm_countdown.tpl', $data);
        }
    }
}