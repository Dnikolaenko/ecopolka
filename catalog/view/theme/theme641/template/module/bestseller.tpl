<div class="box bestsellers">
    <div class="box-heading">
        <h3><?php echo $heading_title; ?></h3>
    </div>
    <div class="box-content">
        <div class="row">
            <?php $b = 4000;
            foreach ($products as $product) {
                $b++; ?>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12  product-layout">
                    <div class="product-thumb transition <?php if ($product['options']) echo 'options'; ?>">
                        <?php if ($product['options']) { ?>
                            <!-- Product options -->
                            <div class="product-option-wrap">
                                <div class="product-options form-horizontal">
                                    <div class="options">
                                        <a class="ajax-overlay_close" href='#'></a>
                                        <h3><?php echo $text_option; ?></h3>

                                        <div class="form-group hidden">
                                            <div class="col-sm-8">
                                                <input type="text"
                                                       name="product_id"
                                                       value="<?php echo $product['product_id'] ?>"
                                                       class="form-control"/>
                                            </div>
                                        </div>

                                        <?php foreach ($product['options'] as $option) { ?>
                                            <?php if ($option['type'] == 'select') { ?>
                                                <div
                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                    <label class="control-label col-sm-12"
                                                           for="input-option<?php echo $option['product_option_id'] . $module . $b; ?>"><?php echo $option['name']; ?></label>

                                                    <div class="col-sm-12">
                                                        <select
                                                            name="option[<?php echo $option['product_option_id']; ?>]"
                                                            id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>"
                                                            class="form-control">
                                                            <option value=""><?php echo $text_select; ?></option>
                                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                <option
                                                                    value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                                    <?php if ($option_value['price']) { ?>
                                                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                    <?php } ?>
                                                                </option>
                                                            <?php } ?>
                                                        </select>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($option['type'] == 'radio') { ?>
                                                <div
                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                    <label
                                                        class="control-label col-sm-12"

                                                        ><?php echo $option['name']; ?></label>

                                                    <div class="col-sm-12">
                                                        <div
                                                            id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>">
                                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                <div class="radio">
                                                                    <label
                                                                        for="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] . $module . $b; ?>]">
                                                                        <input type="radio" hidden
                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                               id="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] . $module . $b; ?>]"
                                                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                        <?php echo $option_value['name']; ?>
                                                                        <?php if ($option_value['price']) { ?>
                                                                            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                        <?php } ?>
                                                                    </label>
                                                                </div>
                                                            <?php } ?>
                                                        </div>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($option['type'] == 'checkbox') { ?>
                                                <div
                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                    <label
                                                        class="control-label col-sm-12
                                                "><?php echo $option['name']; ?></label>

                                                    <div class="col-sm-12">
                                                        <div
                                                            id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>">
                                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox"
                                                                               name="option[<?php echo $option['product_option_id']; ?>][]"
                                                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                        <?php echo $option_value['name']; ?>
                                                                        <?php if ($option_value['price']) { ?>
                                                                            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                        <?php } ?>
                                                                    </label>
                                                                </div>
                                                            <?php } ?>
                                                        </div>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($option['type'] == 'image') { ?>
                                                <div
                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                    <label
                                                        class="control-label col-sm-12
                                                "><?php echo $option['name']; ?></label>

                                                    <div class="col-sm-12">
                                                        <div
                                                            id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>">
                                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                <div class="radio">
                                                                    <label>
                                                                        <input type="radio"
                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                        <img src="<?php echo $option_value['image']; ?>"
                                                                             alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                                                             class="img-thumbnail"/> <?php echo $option_value['name']; ?>
                                                                        <?php if ($option_value['price']) { ?>
                                                                            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                        <?php } ?>
                                                                    </label>
                                                                </div>
                                                            <?php } ?>
                                                        </div>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($option['type'] == 'text') { ?>
                                                <div
                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                    <label class="control-label col-sm-12
                                            "
                                                           for="input-option<?php echo $option['product_option_id'] . $module . $b; ?>"><?php echo $option['name']; ?></label>

                                                    <div class="col-sm-12">
                                                        <input type="text"
                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                               value="<?php echo $option['value']; ?>"
                                                               placeholder="<?php echo $option['name']; ?>"
                                                               id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>"
                                                               class="form-control"/>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($option['type'] == 'textarea') { ?>
                                                <div
                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                    <label class="control-label col-sm-12
                                            "
                                                           for="input-option<?php echo $option['product_option_id'] . $module . $b; ?>"><?php echo $option['name']; ?></label>

                                                    <div class="col-sm-12">
                                                    <textarea name="option[<?php echo $option['product_option_id']; ?>]"
                                                              rows="5" placeholder="<?php echo $option['name']; ?>"
                                                              id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>"
                                                              class="form-control"><?php echo $option['value']; ?></textarea>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($option['type'] == 'file') { ?>
                                                <div
                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                    <label
                                                        class="control-label col-sm-12
                                                "><?php echo $option['name']; ?></label>

                                                    <div class="col-sm-12">
                                                        <button type="button"
                                                                id="button-upload<?php echo $option['product_option_id'] . $module . $b; ?>"
                                                                data-loading-text="<?php echo $text_loading; ?>"
                                                                class="btn btn-block btn-default"><i
                                                                class="fa fa-upload"></i> <?php echo $button_upload; ?>
                                                        </button>
                                                        <input type="hidden"
                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                               value=""
                                                               id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>"/>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($option['type'] == 'date') { ?>
                                                <div
                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                    <label class="control-label col-sm-12
                                            "
                                                           for="input-option<?php echo $option['product_option_id'] . $module . $b; ?>"><?php echo $option['name']; ?></label>

                                                    <div class="col-sm-12">
                                                        <div class="input-group date">
                                                            <input type="text"
                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                   value="<?php echo $option['value']; ?>"
                                                                   data-date-format="YYYY-MM-DD"
                                                                   id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>"
                                                                   class="form-control"/>
											<span class="input-group-btn">
												<button class="btn btn-default" type="button"><i
                                                        class="fa fa-calendar"></i></button>
											</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($option['type'] == 'datetime') { ?>
                                                <div
                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                    <label class="control-label col-sm-12
                                            "
                                                           for="input-option<?php echo $option['product_option_id'] . $module . $b; ?>"><?php echo $option['name']; ?></label>

                                                    <div class="col-sm-12">
                                                        <div class="input-group datetime">
                                                            <input type="text"
                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                   value="<?php echo $option['value']; ?>"
                                                                   data-date-format="YYYY-MM-DD HH:mm"
                                                                   id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>"
                                                                   class="form-control"/>
									<span class="input-group-btn">
									<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i>
                                    </button>
									</span></div>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <?php if ($option['type'] == 'time') { ?>
                                                <div
                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                    <label class="control-label col-sm-12
                                            "
                                                           for="input-option<?php echo $option['product_option_id'] . $module . $b; ?>"><?php echo $option['name']; ?></label>

                                                    <div class="col-sm-12">
                                                        <div class="input-group time">
                                                            <input type="text"
                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                   value="<?php echo $option['value']; ?>"
                                                                   data-date-format="HH:mm"
                                                                   id="input-option<?php echo $option['product_option_id'] . $module . $b; ?>"
                                                                   class="form-control"/>
									<span class="input-group-btn">
									<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i>
                                    </button>
									</span></div>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                        <?php } ?>
                                        <button class="product-btn-add" type="button"
                                                onclick="cart.addPopup($(this),'<?php echo $product['product_id']; ?>');">
                                            <span><?php echo $button_cart; ?></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>
                        <div class="quick_info">
                            <div id="quickview_bestsellers_<?php echo $b . $module ?>" class="quickview-style">
                                <div>
                                    <div class="left col-sm-4">
                                        <div class="quickview_image image">
                                            <a href="<?php echo $product['href']; ?>"><img
                                                    alt="<?php echo $product['name']; ?>"
                                                    title="<?php echo $product['name']; ?>" class="img-responsive"
                                                    src="<?php echo $product['thumb']; ?>"/></a>
                                        </div>
                                    </div>
                                    <div class="right col-sm-8">
                                        <h2><?php echo $product['name']; ?></h2>

                                        <div class="inf">
                                            <?php if ($product['author']) { ?>
                                                <p class="quickview_manufacture manufacture manufacture"><?php echo $text_manufacturer; ?>
                                                    <a href="<?php echo $product['manufacturers']; ?>"><?php echo $product['author']; ?></a>
                                                </p>
                                            <?php } ?>
                                            <?php if ($product['model']) { ?>
                                                <p class="product_model model"><?php echo $text_model; ?> <?php echo $product['model']; ?></p>
                                            <?php } ?>

                                            <?php if ($product['price']) { ?>
                                                <div class="price">
                                                    <?php if (!$product['special']) { ?>
                                                        <?php echo $product['price']; ?>
                                                    <?php } else { ?>
                                                        <span
                                                            class="price-new"><?php echo $product['special']; ?></span>
                                                        <span class="price-old"><?php echo $product['price']; ?></span>
                                                    <?php } ?>
                                                    <?php if ($product['tax']) { ?>
                                                        <span
                                                            class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                                    <?php } ?>
                                                </div>
                                            <?php } ?>
                                        </div>
                                        <div class="rating">
                                            <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                <?php if ($product['rating'] < $i) { ?>
                                                    <span class="fa-stack"><i
                                                            class="fl-bigmug-line-favourites5 fa-stack-1x"></i></span>
                                                <?php } else { ?>
                                                    <span class="fa-stack"><i
                                                            class="fl-bigmug-line-favourites5   fa-stack-1x"></i>
                                                <i class="fl-bigmug-line-favourites5 star  fa-stack-1x"></i></span>
                                                <?php } ?>
                                            <?php } ?>
                                        </div>

                                        <button class="product-btn-add" data-toggle="tooltip"
                                                title="<?php echo $button_cart; ?>" type="button"
                                                onclick="cart.add('<?php echo $product['product_id']; ?>');">
                                            <i class="fa fa-shopping-cart"></i>
                                            <span><?php echo $button_cart; ?></span>
                                        </button>
                                        <ul class="product-buttons">
                                            <li>
                                                <button class="btn btn-icon" type="button" data-toggle="tooltip"
                                                        title="<?php echo $button_wishlist; ?>"
                                                        onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                                                    <i class="fa fa-heart"></i>
                                                    <span><?php echo $button_wishlist; ?></span>
                                                </button>
                                            </li>
                                            <li>
                                                <button class="btn btn-icon" type="button" data-toggle="tooltip"
                                                        title="<?php echo $button_compare; ?>"
                                                        onclick="compare.add('<?php echo $product['product_id']; ?>');">
                                                    <i
                                                        class="fa fa-exchange"></i>
                                                    <span><?php echo $button_compare; ?></span>
                                                </button>
                                            </li>
                                        </ul>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="quickview_description description">
                                            <?php echo $product['description1']; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="image">
                            <a class="lazy"
                               style="padding-bottom: <?php echo($product['img-height'] / $product['img-width'] * 100); ?>%"
                               href="<?php echo $product['href']; ?>">
                                <img alt="<?php echo $product['name']; ?>"
                                     title="<?php echo $product['name']; ?>"
                                     class="img-responsive"
                                     data-src="<?php echo $product['thumb']; ?>"
                                     src="#"/>
                            </a>
                            <a class="quickview" data-rel="details"
                               href="#quickview_bestsellers_<?php echo $b . $module ?>">
                                <?php echo $text_quick; ?>
                            </a>
                        </div>
                        <div class="caption">
                            <div class="name">
                                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                            </div>
                            <div class="description"><?php echo $product['description']; ?></div>
                        <div class="prod-info-block">
                            <?php if ($product['price']) { ?>
                                <div class="price">
                                    <?php if (!$product['special']) { ?>
                                        <?php echo $product['price']; ?>
                                    <?php } else { ?>
                                        <span class="price-new"><?php echo $product['special']; ?></span> <span
                                            class="price-old"><?php echo $product['price']; ?></span>
                                    <?php } ?>
                                    <?php if ($product['tax']) { ?>
                                        <span
                                            class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                             <?php if ($product['rating']) { ?>
                                <div class="rating">
                                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                                        <?php if ($product['rating'] < $i) { ?>
                                            <span class="fa-stack"><i
                                                    class="fl-bigmug-line-favourites5 fa-stack-1x"></i></span>
                                        <?php } else { ?>
                                            <span class="fa-stack"><i
                                                    class="fl-bigmug-line-favourites5   fa-stack-1x"></i>
                                                <i class="fl-bigmug-line-favourites5 star  fa-stack-1x"></i></span>
                                        <?php } ?>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                        </div>
                        </div>
                        <div class="cart-button">
                            <button class="product-btn-add" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="ajaxAdd($(this),<?php echo $product['product_id'] ?>);">
                                <i class="fl-bigmug-line-shopping198"></i>
                            </button>
                            <button class="product-btn" type="button" data-toggle="tooltip"  title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fl-bigmug-line-like51"></i></button>
                            <button class="product-btn" type="button" data-toggle="tooltip"  title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fl-bigmug-line-three142"></i></button>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
    </div>
