<script>
    <?php if ($tabs == '1') {?>
    $(document).ready(function ($) {
        $('#single-category<?php echo $module; ?> #module-tabs a:first').tab('show')
        $('.module_tab').tabCollapse();
    });
    <?php }else{?>
    $(document).ready(function ($) {
        $('#single-category<?php echo $module; ?> .tab-content > .tab-pane').css({
            'display': 'block',
            'visibility': 'visible'
        })
    });
    <?php }?>

</script>

<div class="box single-category">
    <div class="box-heading"><h2><?php echo $category_name ?></h2></div>
    <div class="box-content">
        <div role="tabpanel" class="module_tab" id="single-category<?php echo $module; ?>">
            <?php if ($tabs == '1') { ?>
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist" id="module-tabs">
                    <?php if ($featured_products) { ?>
                        <li>
                            <a href="#tab-featured-<?php echo $module; ?>" role="tab"
                               data-toggle="tab"><?php echo $heading_featured; ?></a>
                        </li>
                    <?php } ?>
                    <?php if ($latest_products) { ?>
                        <li>
                            <a href="#tab-latest-<?php echo $module; ?>" role="tab"
                               data-toggle="tab"><?php echo $heading_latest; ?></a>
                        </li>
                    <?php } ?>
                    <?php if ($special_products) { ?>
                        <li>
                            <a href="#tab-specials-<?php echo $module; ?>" role="tab"
                               data-toggle="tab"><?php echo $heading_specials; ?></a>
                        </li>
                    <?php } ?>
                    <?php if ($bestseller_products) { ?>
                        <li>
                            <a href="#tab-bestsellers-<?php echo $module; ?>" role="tab"
                               data-toggle="tab"><?php echo $heading_bestsellers; ?></a>
                        </li>
                    <?php } ?>
                </ul>
            <?php } else { ?>
                <?php if ($featured_products) { ?>
                    <h3><?php echo $heading_featured; ?></h3>
                <?php } ?>
                <?php if ($latest_products) { ?>
                    <h3><?php echo $heading_latest; ?></h3>
                <?php } ?>
                <?php if ($special_products) { ?>
                    <h3><?php echo $heading_specials; ?></h3>
                <?php } ?>
                <?php if ($bestseller_products) { ?>
                    <h3><?php echo $heading_bestsellers; ?></h3>
                <?php } ?>
            <?php } ?>

            <!-- Tab panes -->
            <div class="tab-content">
                <?php if ($featured_products) { ?>
                    <div role="tabpanel" class="tab-pane" id="tab-featured-<?php echo $module; ?>">
                        <div class="box clearfix">
                            <div class="tab-carousel">
                                <?php $tf = 30;
                                foreach ($featured_products as $product) {
                                    $tf++ ?>
                                    <div
                                        class="product-thumb transition <?php if ($product['options']) echo 'options'; ?>">
                                        <?php if ($product['options']) { ?>
                                            <!-- Product options -->
                                            <div class="product-option-wrap">
                                                <div class="product-options form-horizontal">
                                                    <div class="options">
                                                        <a class="ajax-overlay_close" href='#'></a>
                                                        <h3><?php echo $text_option; ?></h3>

                                                        <div class="form-group hidden">
                                                            <label class="control-label col-sm-4"
                                                                   for="product_id"></label>

                                                            <div class="col-sm-8">
                                                                <input type="text"
                                                                       name="product_id"
                                                                       value="<?php echo $product['product_id'] ?>"
                                                                       id="product_id"
                                                                       class="form-control"/>
                                                            </div>
                                                        </div>

                                                        <?php foreach ($product['options'] as $option) { ?>
                                                            <?php if ($option['type'] == 'select') { ?>
                                                                <div
                                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label col-sm-12"
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <select
                                                                            name="option[<?php echo $option['product_option_id']; ?>]"
                                                                            id="input-option<?php echo $option['product_option_id']; ?>"
                                                                            class="form-control">
                                                                            <option
                                                                                value=""><?php echo $text_select; ?></option>
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
                                                                        class="control-label col-sm-12"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <div
                                                                            id="input-option<?php echo $option['product_option_id']; ?>">
                                                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                                <div class="radio">
                                                                                    <label
                                                                                        for="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id']; ?>]">
                                                                                        <input type="radio" hidden
                                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                               id="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id']; ?>]"
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
                                                                        class="control-label col-sm-12"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <div
                                                                            id="input-option<?php echo $option['product_option_id']; ?>">
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
                                                                        class="control-label col-sm-12"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <div
                                                                            id="input-option<?php echo $option['product_option_id']; ?>">
                                                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                                <div class="radio">
                                                                                    <label>
                                                                                        <input type="radio"
                                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                                        <img
                                                                                            src="<?php echo $option_value['image']; ?>"
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
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <input type="text"
                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                               value="<?php echo $option['value']; ?>"
                                                                               placeholder="<?php echo $option['name']; ?>"
                                                                               id="input-option<?php echo $option['product_option_id']; ?>"
                                                                               class="form-control"/>
                                                                    </div>
                                                                </div>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'textarea') { ?>
                                                                <div
                                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label col-sm-12
                                            "
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                    <textarea name="option[<?php echo $option['product_option_id']; ?>]"
                                                              rows="5" placeholder="<?php echo $option['name']; ?>"
                                                              id="input-option<?php echo $option['product_option_id']; ?>"
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
                                                                                id="button-upload<?php echo $option['product_option_id']; ?>"
                                                                                data-loading-text="<?php echo $text_loading; ?>"
                                                                                class="btn btn-block btn-default"><i
                                                                                class="fa fa-upload"></i> <?php echo $button_upload; ?>
                                                                        </button>
                                                                        <input type="hidden"
                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                               value=""
                                                                               id="input-option<?php echo $option['product_option_id']; ?>"/>
                                                                    </div>
                                                                </div>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'date') { ?>
                                                                <div
                                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label col-sm-12
                                            "
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <div class="input-group date">
                                                                            <input type="text"
                                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                   value="<?php echo $option['value']; ?>"
                                                                                   data-date-format="YYYY-MM-DD"
                                                                                   id="input-option<?php echo $option['product_option_id']; ?>"
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
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <div class="input-group datetime">
                                                                            <input type="text"
                                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                   value="<?php echo $option['value']; ?>"
                                                                                   data-date-format="YYYY-MM-DD HH:mm"
                                                                                   id="input-option<?php echo $option['product_option_id']; ?>"
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
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <div class="input-group time">
                                                                            <input type="text"
                                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                   value="<?php echo $option['value']; ?>"
                                                                                   data-date-format="HH:mm"
                                                                                   id="input-option<?php echo $option['product_option_id']; ?>"
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
                                            <div id="quickview_<?php echo $tf ?>" class="quickview-style">
                                                <div>
                                                    <div class="left col-sm-4">
                                                        <div class="quickview_image image">
                                                            <a href="<?php echo $product['href']; ?>"><img
                                                                    alt="<?php echo $product['name']; ?>"
                                                                    title="<?php echo $product['name']; ?>"
                                                                    class="img-responsive"
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
                                                                        <span
                                                                            class="price-old"><?php echo $product['price']; ?></span>
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
                                                                            class="material-icons-star fa-stack-1x"></i></span>
                                                                <?php } else { ?>
                                                                    <span class="fa-stack"><i
                                                                            class="material-icons-star   fa-stack-1x"></i>
                                                <i class="material-icons-star star  fa-stack-1x"></i></span>
                                                                <?php } ?>
                                                            <?php } ?>
                                                        </div>

                                                        <button class="product-btn-add" data-toggle="tooltip"
                                                                title="<?php echo $button_cart; ?>" type="button"
                                                                onclick="cart.add('<?php echo $product['product_id']; ?>');">
                                                            <i class="material-icons-add_shopping_cart"></i>
                                                            <span><?php echo $button_cart; ?></span>
                                                        </button>
                                                        <ul class="product-buttons">
                                                            <li>
                                                                <button class="product-btn" type="button"
                                                                        data-toggle="tooltip"
                                                                        title="<?php echo $button_wishlist; ?>"
                                                                        onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                                                                    <i class="material-icons-favorite_border"></i>
                                                                    <span><?php echo $button_wishlist; ?></span>
                                                                </button>
                                                            </li>
                                                            <li>
                                                                <button class="product-btn" type="button"
                                                                        data-toggle="tooltip"
                                                                        title="<?php echo $button_compare; ?>"
                                                                        onclick="compare.add('<?php echo $product['product_id']; ?>');">
                                                                    <i
                                                                        class="material-icons-equalizer"></i>
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

                                        <?php if ($product['special']) { ?>
                                            <div class="sale"><span><?php echo $text_sale; ?></span></div>
                                        <?php } ?>
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
                                            <a class="quickview" data-rel="details" href="#quickview_<?php echo $tf ?>">
                                                <?php echo $text_quick; ?>
                                            </a>
                                        </div>
                                        <div class="caption">
                                            <div class="name name__aside">
                                                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                            </div>
                                            <?php if ($product['price']) { ?>
                                                <div class="price">
                                                    <?php if (!$product['special']) { ?>
                                                        <?php echo $product['price']; ?>
                                                    <?php } else { ?>
                                                        <span
                                                            class="price-new"><?php echo $product['special']; ?></span>
                                                        <span
                                                            class="price-old"><?php echo $product['price']; ?></span>
                                                    <?php } ?>
                                                    <?php if ($product['tax']) { ?>
                                                        <span
                                                            class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                                    <?php } ?>
                                                </div>
                                            <?php } ?>
                                            <div class="name">
                                                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                            </div>
                                            <?php if ($product['rating']) { ?>
                                                <div class="rating">
                                                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                        <?php if ($product['rating'] < $i) { ?>
                                                            <span class="fa-stack"><i
                                                                    class="material-icons-star fa-stack-1x"></i></span>
                                                        <?php } else { ?>
                                                            <span class="fa-stack"><i
                                                                    class="material-icons-star   fa-stack-1x"></i>
                                                <i class="material-icons-star star  fa-stack-1x"></i></span>
                                                        <?php } ?>
                                                    <?php } ?>
                                                </div>
                                            <?php } ?>
                                        </div>
                                        <div class="cart-button">
                                            <button class="product-btn-add" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>"
                                                    onclick="ajaxAdd($(this),<?php echo $product['product_id'] ?>);">
                                                <i class="material-icons-add_shopping_cart"></i>
                                            </button>
                                            <button class="product-btn" type="button" data-toggle="tooltip"
                                                    title="<?php echo $button_wishlist; ?>"
                                                    onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i
                                                    class="material-icons-favorite_border"></i></button>
                                            <button class="product-btn" type="button" data-toggle="tooltip"
                                                    title="<?php echo $button_compare; ?>"
                                                    onclick="compare.add('<?php echo $product['product_id']; ?>');"><i
                                                    class="material-icons-equalizer"></i></button>
                                        </div>
                                    </div>

                                <?php } ?>
                            </div>
                        </div>
                    </div>
                <?php } ?>
                <?php if ($latest_products) { ?>
                    <div role="tabpanel" class="tab-pane" id="tab-latest-<?php echo $module; ?>">
                        <div class="box clearfix">
                            <div class="tab-carousel">
                                <?php $tl = 30;
                                foreach ($latest_products as $product) {
                                    $tl++ ?>
                                    <div
                                        class="product-thumb transition <?php if ($product['options']) echo 'options'; ?>">
                                        <?php if ($product['options']) { ?>
                                            <!-- Product options -->
                                            <div class="product-option-wrap">
                                                <div class="product-options form-horizontal">
                                                    <div class="options">
                                                        <a class="ajax-overlay_close" href='#'></a>
                                                        <h3><?php echo $text_option; ?></h3>

                                                        <div class="form-group hidden">
                                                            <label class="control-label col-sm-4"
                                                                   for="product_id"></label>

                                                            <div class="col-sm-8">
                                                                <input type="text"
                                                                       name="product_id"
                                                                       value="<?php echo $product['product_id'] ?>"
                                                                       id="product_id"
                                                                       class="form-control"/>
                                                            </div>
                                                        </div>

                                                        <?php foreach ($product['options'] as $option) { ?>
                                                            <?php if ($option['type'] == 'select') { ?>
                                                                <div
                                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label col-sm-12"
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <select
                                                                            name="option[<?php echo $option['product_option_id']; ?>]"
                                                                            id="input-option<?php echo $option['product_option_id']; ?>"
                                                                            class="form-control">
                                                                            <option
                                                                                value=""><?php echo $text_select; ?></option>
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
                                                                            id="input-option<?php echo $option['product_option_id']; ?>">
                                                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                                <div class="radio">
                                                                                    <label
                                                                                        for="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id']; ?>]">
                                                                                        <input type="radio" hidden
                                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                               id="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id']; ?>]"
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
                                                                            id="input-option<?php echo $option['product_option_id']; ?>">
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
                                                                            id="input-option<?php echo $option['product_option_id']; ?>">
                                                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                                <div class="radio">
                                                                                    <label>
                                                                                        <input type="radio"
                                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                                        <img
                                                                                            src="<?php echo $option_value['image']; ?>"
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
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <input type="text"
                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                               value="<?php echo $option['value']; ?>"
                                                                               placeholder="<?php echo $option['name']; ?>"
                                                                               id="input-option<?php echo $option['product_option_id']; ?>"
                                                                               class="form-control"/>
                                                                    </div>
                                                                </div>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'textarea') { ?>
                                                                <div
                                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label col-sm-12
                                            "
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                    <textarea name="option[<?php echo $option['product_option_id']; ?>]"
                                                              rows="5" placeholder="<?php echo $option['name']; ?>"
                                                              id="input-option<?php echo $option['product_option_id']; ?>"
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
                                                                                id="button-upload<?php echo $option['product_option_id']; ?>"
                                                                                data-loading-text="<?php echo $text_loading; ?>"
                                                                                class="btn btn-block btn-default"><i
                                                                                class="fa fa-upload"></i> <?php echo $button_upload; ?>
                                                                        </button>
                                                                        <input type="hidden"
                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                               value=""
                                                                               id="input-option<?php echo $option['product_option_id']; ?>"/>
                                                                    </div>
                                                                </div>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'date') { ?>
                                                                <div
                                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label col-sm-12
                                            "
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <div class="input-group date">
                                                                            <input type="text"
                                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                   value="<?php echo $option['value']; ?>"
                                                                                   data-date-format="YYYY-MM-DD"
                                                                                   id="input-option<?php echo $option['product_option_id']; ?>"
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
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <div class="input-group datetime">
                                                                            <input type="text"
                                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                   value="<?php echo $option['value']; ?>"
                                                                                   data-date-format="YYYY-MM-DD HH:mm"
                                                                                   id="input-option<?php echo $option['product_option_id']; ?>"
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
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <div class="input-group time">
                                                                            <input type="text"
                                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                   value="<?php echo $option['value']; ?>"
                                                                                   data-date-format="HH:mm"
                                                                                   id="input-option<?php echo $option['product_option_id']; ?>"
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
                                            <div id="quickview_latest_<?php echo $tl ?>" class="quickview-style">
                                                <div>
                                                    <div class="left col-sm-4">
                                                        <div class="quickview_image image">
                                                            <a href="<?php echo $product['href']; ?>"><img
                                                                    alt="<?php echo $product['name']; ?>"
                                                                    title="<?php echo $product['name']; ?>"
                                                                    class="img-responsive"
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
                                                                        <span
                                                                            class="price-old"><?php echo $product['price']; ?></span>
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
                                                                            class="material-design-bookmark45 fa-stack-1x"></i></span>
                                                                <?php } else { ?>
                                                                    <span class="fa-stack"><i
                                                                            class="material-design-bookmark45   fa-stack-1x"></i>
                                                <i class="material-design-bookmark45 star  fa-stack-1x"></i></span>
                                                                <?php } ?>
                                                            <?php } ?>
                                                        </div>

                                                        <button class="product-btn-add" data-toggle="tooltip"
                                                                title="<?php echo $button_cart; ?>" type="button"
                                                                onclick="cart.add('<?php echo $product['product_id']; ?>');">
                                                            <i class="material-icons-add_shopping_cart"></i>
                                                            <span><?php echo $button_cart; ?></span>
                                                        </button>
                                                        <ul class="product-buttons">
                                                            <li>
                                                                <button class="product-btn" type="button"
                                                                        data-toggle="tooltip"
                                                                        title="<?php echo $button_wishlist; ?>"
                                                                        onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                                                                    <i class="material-icons-favorite_border"></i>
                                                                    <span><?php echo $button_wishlist; ?></span>
                                                                </button>
                                                            </li>
                                                            <li>
                                                                <button class="product-btn" type="button"
                                                                        data-toggle="tooltip"
                                                                        title="<?php echo $button_compare; ?>"
                                                                        onclick="compare.add('<?php echo $product['product_id']; ?>');">
                                                                    <i
                                                                        class="material-icons-equalizer"></i>
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

                                        <?php if ($product['special']) { ?>
                                            <div class="sale"><span><?php echo $text_sale; ?></span></div>
                                        <?php } ?>
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
                                            <a class="quickview" data-rel="details" href="#quickview_latest_<?php echo $tl ?>">
                                                <?php echo $text_quick; ?>
                                            </a>
                                        </div>
                                        <div class="caption">
                                            <div class="name name__aside">
                                                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                            </div>
                                            <?php if ($product['price']) { ?>
                                                <div class="price">
                                                    <?php if (!$product['special']) { ?>
                                                        <?php echo $product['price']; ?>
                                                    <?php } else { ?>
                                                        <span
                                                            class="price-new"><?php echo $product['special']; ?></span>
                                                        <span
                                                            class="price-old"><?php echo $product['price']; ?></span>
                                                    <?php } ?>
                                                    <?php if ($product['tax']) { ?>
                                                        <span
                                                            class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                                    <?php } ?>
                                                </div>
                                            <?php } ?>
                                            <div class="name">
                                                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                            </div>
                                            <?php if ($product['rating']) { ?>
                                                <div class="rating">
                                                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                        <?php if ($product['rating'] < $i) { ?>
                                                            <span class="fa-stack"><i
                                                                    class="material-icons-star fa-stack-1x"></i></span>
                                                        <?php } else { ?>
                                                            <span class="fa-stack"><i
                                                                    class="material-icons-star   fa-stack-1x"></i>
                                                <i class="material-icons-star star  fa-stack-1x"></i></span>
                                                        <?php } ?>
                                                    <?php } ?>
                                                </div>
                                            <?php } ?>
                                        </div>
                                        <div class="cart-button">
                                            <button class="product-btn-add" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>"
                                                    onclick="ajaxAdd($(this),<?php echo $product['product_id'] ?>);">
                                                <i class="material-icons-add_shopping_cart"></i>
                                            </button>
                                            <button class="product-btn" type="button" data-toggle="tooltip"
                                                    title="<?php echo $button_wishlist; ?>"
                                                    onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i
                                                    class="material-icons-favorite_border"></i></button>
                                            <button class="product-btn" type="button" data-toggle="tooltip"
                                                    title="<?php echo $button_compare; ?>"
                                                    onclick="compare.add('<?php echo $product['product_id']; ?>');"><i
                                                    class="material-icons-equalizer"></i></button>
                                        </div>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                <?php } ?>
                <?php if ($special_products) { ?>
                    <div role="tabpanel" class="tab-pane" id="tab-specials-<?php echo $module; ?>">
                        <div class="box clearfix">
                            <div class="tab-carousel">
                                <?php $tc = 30;
                                foreach ($special_products as $product) {
                                    $tc++ ?>
                                    <div
                                        class="product-thumb transition  <?php if ($product['options']) echo 'options' ?>">
                                        <?php if ($product['options']) { ?>
                                            <!-- Product options -->
                                            <div class="product-option-wrap">
                                                <div class="product-options form-horizontal">
                                                    <div class="options">
                                                        <a class="ajax-overlay_close" href='#'></a>
                                                        <h3><?php echo $text_option; ?></h3>

                                                        <div class="form-group hidden">
                                                            <label class="control-label col-sm-4"
                                                                   for="product_id"></label>

                                                            <div class="col-sm-8">
                                                                <input type="text"
                                                                       name="product_id"
                                                                       value="<?php echo $product['product_id'] ?>"
                                                                       id="product_id"
                                                                       class="form-control"/>
                                                            </div>
                                                        </div>

                                                        <?php foreach ($product['options'] as $option) { ?>
                                                            <?php if ($option['type'] == 'select') { ?>
                                                                <div
                                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label col-sm-12"
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <select
                                                                            name="option[<?php echo $option['product_option_id']; ?>]"
                                                                            id="input-option<?php echo $option['product_option_id']; ?>"
                                                                            class="form-control">
                                                                            <option
                                                                                value=""><?php echo $text_select; ?></option>
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
                                                                            id="input-option<?php echo $option['product_option_id']; ?>">
                                                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                                <div class="radio">
                                                                                    <label
                                                                                        for="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id']; ?>]">
                                                                                        <input type="radio" hidden
                                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                               id="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id']; ?>]"
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
                                                                            id="input-option<?php echo $option['product_option_id']; ?>">
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
                                                                            id="input-option<?php echo $option['product_option_id']; ?>">
                                                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                                <div class="radio">
                                                                                    <label>
                                                                                        <input type="radio"
                                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                                        <img
                                                                                            src="<?php echo $option_value['image']; ?>"
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
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <input type="text"
                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                               value="<?php echo $option['value']; ?>"
                                                                               placeholder="<?php echo $option['name']; ?>"
                                                                               id="input-option<?php echo $option['product_option_id']; ?>"
                                                                               class="form-control"/>
                                                                    </div>
                                                                </div>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'textarea') { ?>
                                                                <div
                                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label col-sm-12
                                            "
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                    <textarea name="option[<?php echo $option['product_option_id']; ?>]"
                                                              rows="5" placeholder="<?php echo $option['name']; ?>"
                                                              id="input-option<?php echo $option['product_option_id']; ?>"
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
                                                                                id="button-upload<?php echo $option['product_option_id']; ?>"
                                                                                data-loading-text="<?php echo $text_loading; ?>"
                                                                                class="btn btn-block btn-default"><i
                                                                                class="fa fa-upload"></i> <?php echo $button_upload; ?>
                                                                        </button>
                                                                        <input type="hidden"
                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                               value=""
                                                                               id="input-option<?php echo $option['product_option_id']; ?>"/>
                                                                    </div>
                                                                </div>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'date') { ?>
                                                                <div
                                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label col-sm-12
                                            "
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <div class="input-group date">
                                                                            <input type="text"
                                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                   value="<?php echo $option['value']; ?>"
                                                                                   data-date-format="YYYY-MM-DD"
                                                                                   id="input-option<?php echo $option['product_option_id']; ?>"
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
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <div class="input-group datetime">
                                                                            <input type="text"
                                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                   value="<?php echo $option['value']; ?>"
                                                                                   data-date-format="YYYY-MM-DD HH:mm"
                                                                                   id="input-option<?php echo $option['product_option_id']; ?>"
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
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <div class="input-group time">
                                                                            <input type="text"
                                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                   value="<?php echo $option['value']; ?>"
                                                                                   data-date-format="HH:mm"
                                                                                   id="input-option<?php echo $option['product_option_id']; ?>"
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
                                            <div id="quickview_specials_<?php echo $tc ?>" class="quickview-style">
                                                <div>
                                                    <div class="left col-sm-4">
                                                        <div class="quickview_image image">
                                                            <a href="<?php echo $product['href']; ?>"><img
                                                                    alt="<?php echo $product['name']; ?>"
                                                                    title="<?php echo $product['name']; ?>"
                                                                    class="img-responsive"
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
                                                                        <span
                                                                            class="price-old"><?php echo $product['price']; ?></span>
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
                                                                            class="material-design-bookmark45 fa-stack-1x"></i></span>
                                                                <?php } else { ?>
                                                                    <span class="fa-stack"><i
                                                                            class="material-design-bookmark45   fa-stack-1x"></i>
                                                <i class="material-design-bookmark45 star  fa-stack-1x"></i></span>
                                                                <?php } ?>
                                                            <?php } ?>
                                                        </div>

                                                        <button class="product-btn-add" data-toggle="tooltip"
                                                                title="<?php echo $button_cart; ?>" type="button"
                                                                onclick="cart.add('<?php echo $product['product_id']; ?>');">
                                                            <i class="material-icons-add_shopping_cart"></i>
                                                            <span><?php echo $button_cart; ?></span>
                                                        </button>
                                                        <ul class="product-buttons">
                                                            <li>
                                                                <button class="product-btn" type="button"
                                                                        data-toggle="tooltip"
                                                                        title="<?php echo $button_wishlist; ?>"
                                                                        onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                                                                    <i class="material-icons-favorite_border"></i>
                                                                    <span><?php echo $button_wishlist; ?></span>
                                                                </button>
                                                            </li>
                                                            <li>
                                                                <button class="product-btn" type="button"
                                                                        data-toggle="tooltip"
                                                                        title="<?php echo $button_compare; ?>"
                                                                        onclick="compare.add('<?php echo $product['product_id']; ?>');">
                                                                    <i
                                                                        class="material-icons-equalizer"></i>
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

                                        <?php if ($product['special']) { ?>
                                            <div class="sale"><span><?php echo $text_sale; ?></span></div>
                                        <?php } ?>
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
                                            <a class="quickview" data-rel="details" href="#quickview_specials_<?php echo $tc ?>">
                                                <?php echo $text_quick; ?>
                                            </a>
                                        </div>
                                        <div class="caption">
                                            <div class="name name__aside">
                                                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                            </div>
                                            <?php if ($product['price']) { ?>
                                                <div class="price">
                                                    <?php if (!$product['special']) { ?>
                                                        <?php echo $product['price']; ?>
                                                    <?php } else { ?>
                                                        <span
                                                            class="price-new"><?php echo $product['special']; ?></span>
                                                        <span
                                                            class="price-old"><?php echo $product['price']; ?></span>
                                                    <?php } ?>
                                                    <?php if ($product['tax']) { ?>
                                                        <span
                                                            class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                                    <?php } ?>
                                                </div>
                                            <?php } ?>
                                            <div class="name">
                                                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                            </div>
                                            <?php if ($product['rating']) { ?>
                                                <div class="rating">
                                                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                        <?php if ($product['rating'] < $i) { ?>
                                                            <span class="fa-stack"><i
                                                                    class="material-icons-star fa-stack-1x"></i></span>
                                                        <?php } else { ?>
                                                            <span class="fa-stack"><i
                                                                    class="material-icons-star   fa-stack-1x"></i>
                                                <i class="material-icons-star star  fa-stack-1x"></i></span>
                                                        <?php } ?>
                                                    <?php } ?>
                                                </div>
                                            <?php } ?>
                                        </div>
                                        <div class="cart-button">
                                            <button class="product-btn-add" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>"
                                                    onclick="ajaxAdd($(this),<?php echo $product['product_id'] ?>);">
                                                <i class="material-icons-add_shopping_cart"></i>
                                            </button>
                                            <button class="product-btn" type="button" data-toggle="tooltip"
                                                    title="<?php echo $button_wishlist; ?>"
                                                    onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i
                                                    class="material-icons-favorite_border"></i></button>
                                            <button class="product-btn" type="button" data-toggle="tooltip"
                                                    title="<?php echo $button_compare; ?>"
                                                    onclick="compare.add('<?php echo $product['product_id']; ?>');"><i
                                                    class="material-icons-equalizer"></i></button>
                                        </div>

                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                <?php } ?>
                <?php if ($bestseller_products) { ?>
                    <div role="tabpanel" class="tab-pane" id="tab-bestsellers-<?php echo $module; ?>">
                        <div class="box clearfix">
                            <div class="tab-carousel">
                                <?php $tb = 30;
                                foreach ($bestseller_products as $product) {
                                    $tb++; ?>
                                    <div
                                        class="product-thumb transition <?php if ($product['options']) echo 'options'; ?>">
                                        <?php if ($product['options']) { ?>
                                            <!-- Product options -->
                                            <div class="product-option-wrap">
                                                <div class="product-options form-horizontal">
                                                    <div class="options">
                                                        <a class="ajax-overlay_close" href='#'></a>
                                                        <h3><?php echo $text_option; ?></h3>

                                                        <div class="form-group hidden">
                                                            <label class="control-label col-sm-4"
                                                                   for="product_id"></label>

                                                            <div class="col-sm-8">
                                                                <input type="text"
                                                                       name="product_id"
                                                                       value="<?php echo $product['product_id'] ?>"
                                                                       id="product_id"
                                                                       class="form-control"/>
                                                            </div>
                                                        </div>

                                                        <?php foreach ($product['options'] as $option) { ?>
                                                            <?php if ($option['type'] == 'select') { ?>
                                                                <div
                                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label col-sm-12"
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <select
                                                                            name="option[<?php echo $option['product_option_id']; ?>]"
                                                                            id="input-option<?php echo $option['product_option_id']; ?>"
                                                                            class="form-control">
                                                                            <option
                                                                                value=""><?php echo $text_select; ?></option>
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
                                                                            id="input-option<?php echo $option['product_option_id']; ?>">
                                                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                                <div class="radio">
                                                                                    <label
                                                                                        for="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id']; ?>]">
                                                                                        <input type="radio" hidden
                                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                               id="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id']; ?>]"
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
                                                                            id="input-option<?php echo $option['product_option_id']; ?>">
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
                                                                            id="input-option<?php echo $option['product_option_id']; ?>">
                                                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                                <div class="radio">
                                                                                    <label>
                                                                                        <input type="radio"
                                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                                        <img
                                                                                            src="<?php echo $option_value['image']; ?>"
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
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <input type="text"
                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                               value="<?php echo $option['value']; ?>"
                                                                               placeholder="<?php echo $option['name']; ?>"
                                                                               id="input-option<?php echo $option['product_option_id']; ?>"
                                                                               class="form-control"/>
                                                                    </div>
                                                                </div>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'textarea') { ?>
                                                                <div
                                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label col-sm-12
                                            "
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                    <textarea name="option[<?php echo $option['product_option_id']; ?>]"
                                                              rows="5" placeholder="<?php echo $option['name']; ?>"
                                                              id="input-option<?php echo $option['product_option_id']; ?>"
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
                                                                                id="button-upload<?php echo $option['product_option_id']; ?>"
                                                                                data-loading-text="<?php echo $text_loading; ?>"
                                                                                class="btn btn-block btn-default"><i
                                                                                class="fa fa-upload"></i> <?php echo $button_upload; ?>
                                                                        </button>
                                                                        <input type="hidden"
                                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                                               value=""
                                                                               id="input-option<?php echo $option['product_option_id']; ?>"/>
                                                                    </div>
                                                                </div>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'date') { ?>
                                                                <div
                                                                    class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                                    <label class="control-label col-sm-12
                                            "
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <div class="input-group date">
                                                                            <input type="text"
                                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                   value="<?php echo $option['value']; ?>"
                                                                                   data-date-format="YYYY-MM-DD"
                                                                                   id="input-option<?php echo $option['product_option_id']; ?>"
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
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <div class="input-group datetime">
                                                                            <input type="text"
                                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                   value="<?php echo $option['value']; ?>"
                                                                                   data-date-format="YYYY-MM-DD HH:mm"
                                                                                   id="input-option<?php echo $option['product_option_id']; ?>"
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
                                                                           for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                                    <div class="col-sm-12">
                                                                        <div class="input-group time">
                                                                            <input type="text"
                                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                   value="<?php echo $option['value']; ?>"
                                                                                   data-date-format="HH:mm"
                                                                                   id="input-option<?php echo $option['product_option_id']; ?>"
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
                                            <div id="quickview_bestsellers_<?php echo $tb ?>" class="quickview-style">
                                                <div>
                                                    <div class="left col-sm-4">
                                                        <div class="quickview_image image">
                                                            <a href="<?php echo $product['href']; ?>"><img
                                                                    alt="<?php echo $product['name']; ?>"
                                                                    title="<?php echo $product['name']; ?>"
                                                                    class="img-responsive"
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
                                                                        <span
                                                                            class="price-old"><?php echo $product['price']; ?></span>
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
                                                                            class="material-design-bookmark45 fa-stack-1x"></i></span>
                                                                <?php } else { ?>
                                                                    <span class="fa-stack"><i
                                                                            class="material-design-bookmark45   fa-stack-1x"></i>
                                                <i class="material-design-bookmark45 star  fa-stack-1x"></i></span>
                                                                <?php } ?>
                                                            <?php } ?>
                                                        </div>

                                                        <button class="product-btn-add" data-toggle="tooltip"
                                                                title="<?php echo $button_cart; ?>" type="button"
                                                                onclick="cart.add('<?php echo $product['product_id']; ?>');">
                                                            <i class="material-icons-add_shopping_cart"></i>
                                                            <span><?php echo $button_cart; ?></span>
                                                        </button>
                                                        <ul class="product-buttons">
                                                            <li>
                                                                <button class="product-btn" type="button"
                                                                        data-toggle="tooltip"
                                                                        title="<?php echo $button_wishlist; ?>"
                                                                        onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                                                                    <i class="material-icons-favorite_border"></i>
                                                                    <span><?php echo $button_wishlist; ?></span>
                                                                </button>
                                                            </li>
                                                            <li>
                                                                <button class="product-btn" type="button"
                                                                        data-toggle="tooltip"
                                                                        title="<?php echo $button_compare; ?>"
                                                                        onclick="compare.add('<?php echo $product['product_id']; ?>');">
                                                                    <i
                                                                        class="material-icons-equalizer"></i>
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

                                        <?php if ($product['special']) { ?>
                                            <div class="sale"><span><?php echo $text_sale; ?></span></div>
                                        <?php } ?>
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
                                            <a class="quickview" data-rel="details" href="#quickview_bestsellers_<?php echo $tb ?>">
                                                <?php echo $text_quick; ?>
                                            </a>
                                        </div>
                                        <div class="caption">
                                            <div class="name name__aside">
                                                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                            </div>
                                            <?php if ($product['price']) { ?>
                                                <div class="price">
                                                    <?php if (!$product['special']) { ?>
                                                        <?php echo $product['price']; ?>
                                                    <?php } else { ?>
                                                        <span
                                                            class="price-new"><?php echo $product['special']; ?></span>
                                                        <span
                                                            class="price-old"><?php echo $product['price']; ?></span>
                                                    <?php } ?>
                                                    <?php if ($product['tax']) { ?>
                                                        <span
                                                            class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                                    <?php } ?>
                                                </div>
                                            <?php } ?>
                                            <div class="name">
                                                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                            </div>
                                            <?php if ($product['rating']) { ?>
                                                <div class="rating">
                                                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                        <?php if ($product['rating'] < $i) { ?>
                                                            <span class="fa-stack"><i
                                                                    class="material-icons-star fa-stack-1x"></i></span>
                                                        <?php } else { ?>
                                                            <span class="fa-stack"><i
                                                                    class="material-icons-star   fa-stack-1x"></i>
                                                <i class="material-icons-star star  fa-stack-1x"></i></span>
                                                        <?php } ?>
                                                    <?php } ?>
                                                </div>
                                            <?php } ?>
                                        </div>
                                        <div class="cart-button">
                                            <button class="product-btn-add" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>"
                                                    onclick="ajaxAdd($(this),<?php echo $product['product_id'] ?>);">
                                                <i class="material-icons-add_shopping_cart"></i>
                                            </button>
                                            <button class="product-btn" type="button" data-toggle="tooltip"
                                                    title="<?php echo $button_wishlist; ?>"
                                                    onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i
                                                    class="material-icons-favorite_border"></i></button>
                                            <button class="product-btn" type="button" data-toggle="tooltip"
                                                    title="<?php echo $button_compare; ?>"
                                                    onclick="compare.add('<?php echo $product['product_id']; ?>');"><i
                                                    class="material-icons-equalizer"></i></button>
                                        </div>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                <?php } ?>
                <div class="view-all">
                    <a href='<?php echo $category_link ?>'><?php echo $text_view; ?></a>
                </div>
            </div>
        </div>
    </div>
</div>

