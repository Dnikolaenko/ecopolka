<?php
class ControllerModuleFeatured extends Controller {
	public function index($setting) {

					static $module = 0;
				
		$this->load->language('module/featured');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');

				$data['text_quick'] = $this->language->get('text_quick');
				$data['text_price'] = $this->language->get('text_price');
				$data['button_wishlist'] = $this->language->get('button_wishlist');
				$data['button_compare'] = $this->language->get('button_compare');
				$data['button_details'] = $this->language->get('button_details');
				$data['text_manufacturer'] = $this->language->get('text_manufacturer');
				$data['text_category'] = $this->language->get('text_category');
				$data['text_model'] = $this->language->get('text_model');
				$data['text_availability'] = $this->language->get('text_availability');
				$data['text_instock'] = $this->language->get('text_instock');
				$data['text_outstock'] = $this->language->get('text_outstock');
				$data['reviews'] = $this->language->get('reviews');
				$data['text_price'] = $this->language->get('text_price');
				$data['text_product'] = $this->language->get('text_product');
				
 
				$data['text_option'] = $this->language->get('text_option');
				$data['text_select'] = $this->language->get('text_select');
				
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

			$data['text_sale'] = $this->language->get('text_sale');
			

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

						$this->load->model('catalog/manufacturer');
						$this->language->load('product/product');
						$this->language->load('product/category');
						$this->load->model('catalog/review');
				

		$data['products'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

		if (!empty($setting['product'])) {
			$products = array_slice($setting['product'], 0, (int)$setting['limit']);

			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);

				$review_total = $this->model_catalog_review->getTotalReviewsByProductId($product_info['product_id']);
				

				if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}

					if ((float)$product_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}


					   $options = array();
                    foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) {
                        $product_option_value_data = array();
                        foreach ($option['product_option_value'] as $option_value) {
                            if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
                                if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
                                    $price_option = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false));
                                } else {
                                    $price_option = false;
                                }
                                $product_option_value_data[] = array(
                                    'product_option_value_id' => $option_value['product_option_value_id'],
                                    'option_value_id'         => $option_value['option_value_id'],
                                    'name'                    => $option_value['name'],
                                    'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
                                    'price'                   => $price_option,
                                    'price_prefix'            => $option_value['price_prefix']
                                );
                            }
                        }
                        $options[] = array(
                            'product_option_id'    => $option['product_option_id'],
                            'product_option_value' => $product_option_value_data,
                            'option_id'            => $option['option_id'],
                            'name'                 => $option['name'],
                            'type'                 => $option['type'],
                            'value'                => $option['value'],
                            'required'             => $option['required']
                        );
                    }
				

				$desc = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
            $pos = strpos($desc,'<iframe');
  			if (is_int($pos)) {
                $pos2 = strpos($desc, '</iframe>') + 9;
                $video = substr($desc, $pos, $pos2);
                $quick_descr = str_replace($video, '', $desc);
            } else{
               $quick_descr = $desc;
            }
				
					$data['products'][] = array(
						'product_id'  => $product_info['product_id'],
						'thumb'       => $image,
 
				'img-width'       => $setting['width'],
				'img-height'       => $setting['height'],
				
						'name'        => $product_info['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'rating'      => $rating,

					'reviews'    => $review_total,
					'author'     => $product_info['manufacturer'],
					'description1' => $quick_descr,
					'manufacturers' =>$data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']),
					'model' => $product_info['model'],
					'text_availability' => $product_info['quantity'],
					'allow' => $product_info['minimum'],
				
						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
,
					  'options'     => $options
				
					);
				}
			}
		}

		if ($data['products']) {

					$data['module'] = $module++;
				
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/featured.tpl', $data);
			} else {
				return $this->load->view('default/template/module/featured.tpl', $data);
			}
		}
	}
}