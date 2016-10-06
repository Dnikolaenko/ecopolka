<?php

class ControllerModuleTMProgressBars extends Controller
{
    private $error = array();


    public function index($setting)
    {
        static $module = 0;
        $this->load->language('module/tm_progress_bars');
        $this->document->addStyle('catalog/view/javascript/tmprogressbars/progress-bars.css');

        if ($setting['type'] == 0){
            $this->document->addScript('catalog/view/javascript/tmprogressbars/progressbar.min.js');
        }else{
            $this->document->addScript('catalog/view/javascript/tmprogressbars/jquery.counter.js');
        }

        $data['type'] = $setting['type'];


        $data['heading_title'] = $this->language->get('heading_title');

        $data['percentage'] = $setting['percentage'];
        $data['progress'] = $setting['tm_progress_bars'][$this->config->get('config_language_id')];

        $data['action'] = $this->url->link('module/tm_progress_bars', '', 'SSL');

        $data['module'] = $module++;


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/tm_progress_bars.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/tm_progress_bars.tpl', $data);
        } else {
            return $this->load->view('default/template/module/tm_progress_bars.tpl', $data);
        }
    }
}