<?php

class ControllerModuleTMParallax extends Controller
{
    public function index($setting)
    {
        static $module = 0;

        $this->load->model('design/banner');
        $this->load->model('tool/image');


        $this->document->addScript('catalog/view/javascript/parallax/cherry-fixed-parallax.js');
        $this->document->addStyle('catalog/view/javascript/parallax/css/parallax.css');


        if (isset($setting['description'][$this->config->get('config_language_id')])) {
            $data['description'] = html_entity_decode($setting['description'][$this->config->get('config_language_id')]['description'], ENT_QUOTES, 'UTF-8');
        }

        if (is_file(DIR_IMAGE . $setting['image'])) {
            $data['image'] = $this->model_tool_image->resize($setting['image'], $setting['width'], $setting['height']);
        } else {
            $data['image'] = '';
        }

        if ($setting['css']) {
            $data['class'] = $setting['css'];
        }else{
            $data['class'] = '';
        }


        $this->load->model('extension/module');
        $data['modules'] = array();

        foreach ($setting['module_id'] as $module) {
            $code = $this->model_extension_module->getModuleCode($module);
            $setting_info = $this->model_extension_module->getModule($module);
            if ($setting_info && $setting_info['status']) {
                $data['modules'][] = $this->load->controller('module/' . $code, $setting_info);
            }
        }

        $data['module_counter'] = $module++;

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/tm_parallax.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/tm_parallax.tpl', $data);
        } else {
            return $this->load->view('default/template/module/tm_parallax.tpl', $data);
        }
    }
}