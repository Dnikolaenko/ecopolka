<?php
class ControllerModuleCategory extends Controller {

				private function nthLevelMenu($categories) {
					// get last category id
					$category_id = end($categories);

					$children = $this->model_catalog_category->getCategories($category_id['category_id']);
					$nthlevelmenus=array();
					$i=0;
					foreach ($children as $child) {
						$filter_data = array(
							'filter_category_id'  => $child['category_id'],
							'filter_sub_category' => true
						);

						$path = '';
						foreach($category_id['parents'] as $parents){
							$path .= $parents.'_';
						}
						$path .= $category_id['category_id'];
						$path .= '_'.$child['category_id'];
						
						$nthlevelmenus[$i] = array(
							'category_id' => $child['category_id'],
							'column'   => $child['column'] ? $child['column'] : 1,
							'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
							'href'  => $this->url->link('product/category', 'path=' . $path)
						);
						$subchildren = $this->model_catalog_category->getCategories($child['category_id']);
						if($subchildren){
							$nthlevelmenus[$i] = array_merge($nthlevelmenus[$i] ,array('children' => (array)$this->nthLevelMenu(
								array($child['category_id'] => array( 
								'category_id' =>$child['category_id'] ,
								'parents' => array_merge($category_id['parents'] ,array($category_id['category_id']))
								))
							)));
						}
						$i++;				
					}
					return $nthlevelmenus;
				}
			
	public function index() {
		$this->load->language('module/category');

		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

$data['parts'] = $parts;
		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			$children_data = array();

			if ($category['category_id'] == $data['category_id']) {
				$children = $this->model_catalog_category->getCategories($category['category_id']);


				$i=-1;
			
				foreach($children as $child) {

				$i++;
			
					$filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

					
				$children_data[$i] = array(

				'category_id' => $child['category_id'], 
			
			
						'category_id' => $child['category_id'],
						'name' => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);

				$subchildren = $this->model_catalog_category->getCategories($child['category_id']);
				if($subchildren) {
					$children_data[$i] = array_merge($children_data[$i],array('children' => (array)$this->nthLevelMenu(
						array($child['category_id'] => array( 
						'category_id' =>$child['category_id'] ,
						'parents' => array($category['category_id'])
						))
					)));
				}
			
				}
			}

			$filter_data = array(
				'filter_category_id'  => $category['category_id'],
				'filter_sub_category' => true
			);

			$data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
				'children'    => $children_data,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/category.tpl', $data);
		} else {
			return $this->load->view('default/template/module/category.tpl', $data);
		}
	}
}