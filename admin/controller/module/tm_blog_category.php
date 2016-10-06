<?php
	class ControllerModuleTMBlogCategory extends Controller {
	   
        private $error = array();
       
        public function index() {
            $url = $this->request->get['route'];
            if($this->checkDatabase()) {
                
                $this->language->load('simple_blog/install');
                
                $this->document->setTitle($this->language->get('error_database'));
                
                $data['install_database'] = $this->url->link('simple_blog/install/installDatabase', 'token=' . $this->session->data['token'] . '&url=' . $url, 'SSL');
                
                $data['text_install_message'] = $this->language->get('text_install_message');
                
                $data['text_upgread'] = $this->language->get('text_upgread');
                
                $data['error_database'] = $this->language->get('error_database');
                
                $data['breadcrumbs'] = array();

    	   		$data['breadcrumbs'][] = array(
    	       		'text'      => $this->language->get('text_home'),
    				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
    	      		'separator' => false
    	   		);
                
                $data['header'] = $this->load->controller('common/header');
      		    $data['column_left'] = $this->load->controller('common/column_left');
                $data['footer'] = $this->load->controller('common/footer');
        
                $this->response->setOutput($this->load->view('simple_blog/notification.tpl', $data));
                
            } else {
                $this->getData();
            }	
		}
		
        public function checkDatabase() {
            $database_not_found = $this->load->controller('simple_blog/install/validateTable');
            
            if(!$database_not_found) {
                return true;
            } 
            
            return false;
        }
       
		public function getData() {
			$this->language->load('module/tm_blog_category');

			$this->document->setTitle($this->language->get('heading_title'));

            $this->load->model('extension/module');
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
                if (!isset($this->request->get['module_id'])) {
                    $this->model_extension_module->addModule('tm_blog_category', $this->request->post);
                } else {
                    $this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
                }
	
				$this->session->data['success'] = $this->language->get('text_success');
	
				$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			}
			
			$data['heading_title'] = $this->language->get('heading_title');
			
			$data['text_enabled'] = $this->language->get('text_enabled');
			$data['text_disabled'] = $this->language->get('text_disabled');
            $data['text_edit'] = $this->language->get('text_edit');
			
            $data['help_search_article'] = $this->language->get('help_search_article');
            
			$data['entry_search_article'] = $this->language->get('entry_search_article');
			$data['entry_status'] = $this->language->get('entry_status');
			$data['entry_name'] = $this->language->get('entry_name');

			$data['button_save'] = $this->language->get('button_save');
			$data['button_cancel'] = $this->language->get('button_cancel');
			
			$data['token'] = $this->session->data['token'];
			
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

			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false
			);
	
			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_module'),
				'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
			);
	
			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('module/blog_category', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
			);

            if (!isset($this->request->get['module_id'])) {
                $data['action'] = $this->url->link('module/tm_blog_category', 'token=' . $this->session->data['token'], 'SSL');
            } else {
                $data['action'] = $this->url->link('module/tm_blog_category', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
            }

			$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

            if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
                $module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
            }

            if (isset($this->request->post['status'])) {
                $data['status'] = $this->request->post['status'];
            } elseif (!empty($module_info)) {
                $data['status'] = $module_info['status'];
            } else {
                $data['status'] = '';
            }

            if (isset($this->request->post['name'])) {
                $data['name'] = $this->request->post['name'];
            } elseif (!empty($module_info)) {
                $data['name'] = $module_info['name'];
            } else {
                $data['name'] = '';
            }
            
			if (isset($this->request->post['category_search_article'])) {
				$data['category_search_article'] = $this->request->post['category_search_article'];
			} elseif ($this->config->get('category_search_article')) {
				$data['category_search_article'] = $this->config->get('category_search_article');
			}
			
            $data['header'] = $this->load->controller('common/header');
  		    $data['column_left'] = $this->load->controller('common/column_left');
            $data['footer'] = $this->load->controller('common/footer');
    
            $this->response->setOutput($this->load->view('module/tm_blog_category.tpl', $data));
		}

		protected function validate() {
			if (!$this->user->hasPermission('modify', 'module/tm_blog_category')) {
				$this->error['warning'] = $this->language->get('error_permission');
			}

            if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
                $this->error['name'] = $this->language->get('error_name');
            }
	
			if (!$this->error) {
				return true;
			} else {
				return false;
			}	
		}
	}
?>