<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li>
                <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
            </li>
        <?php } ?>
    </ul>

    <div class="row">
        <?php echo $column_left; ?>

        <?php
        if ($column_left && $column_right) {
            $content_width = 'col-sm-6';
            $content_left = 'col-sm-6';
            $content_right = 'col-sm-6';
        } elseif ($column_left || $column_right) {
            $content_width = 'col-sm-9';
            $content_left = 'col-sm-5';
            $content_right = 'col-sm-7';
        } else {
            $content_width = 'col-sm-12';
            $content_left = 'col-sm-5 col-lg-7';
            $content_right = 'col-sm-7 col-lg-5';
        } ?>

        <div id="content" class="<?php echo $content_width; ?> product_page"><?php echo $content_top; ?>
            <div class="row product-content-columns">

                <!-- Content left -->
                <div class="<?php echo $content_left; ?> product_page-left">
                    <!-- product image -->
                    <div id="default_gallery" class="product-gallery">
                        <?php if ($thumb || $images) { ?>
                            <?php if ($images || $thumb) { ?>
                                <div class="image-thumb">
                                    <ul id="image-additional" class="image-additional">

                                        <?php if (!empty($thumb)) { ?>
                                            <li>
                                                <a href="#" data-image="<?php echo $thumb; ?>">
                                                    <img src="<?php echo $thumb; ?>" alt=""/>
                                                </a>
                                            </li>
                                        <?php } ?>
                                        <?php foreach ($images as $image) { ?>
                                            <li>
                                                <a href="#" data-image="<?php echo $image['popup']; ?>">
                                                    <img src="<?php echo $image['thumb']; ?>" alt=""/></a>
                                            </li>
                                        <?php } ?>

                                    </ul>
                                </div>
                            <?php } ?>
                            <?php if ($thumb) { ?>
                                <div id="product-image" class="product-image">

                                    <div class="magnificent-wrap">
                                        <div class="magnificent" data-magnificent="product-image">
                                            <div class="polaroid">
                                                <div class="inner">
                                                    <img src="<?php echo $popup; ?>" alt="<?php echo $heading_title; ?>"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="magnificent-viewport-wrap">
                                        <div data-magnificent-viewport="product-image">
                                            <div class="inner">
                                                <img src="<?php echo $popup; ?>" alt="<?php echo $heading_title; ?>"/>
                                            </div>
                                        </div>
                                    </div>

                                    <script class="source">
                                        $(function () {
                                            $('#product-image [data-magnificent]').magnificent();
                                        });
                                    </script>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    </div>



                    <?php $i = 0;
                    if ($thumb || $images) {
                        $i++ ?>
                        <script type="text/javascript">
                            jQuery(document).ready(function () {
                                var myPhotoSwipe = $("#gallery a").photoSwipe({
                                    enableMouseWheel: false,
                                    enableKeyboard: false,
                                    captionAndToolbarAutoHideDelay: 0
                                });
                            });
                        </script>
                        <div id="full_gallery">
                            <ul id="gallery">
                                <?php if (!empty($thumb)) { ?>
                                    <li>
                                    <a href="<?php echo $popup; ?>" data-something="something"
                                       data-another-thing="anotherthing"><img src="<?php echo $popup; ?>"
                                                                              title="<?php echo $heading_title; ?>"
                                                                              alt="<?php echo $heading_title; ?>"/></a>
                                    </li><?php } ?>
                                <?php foreach ($images as $image) { ?>
                                    <li>
                                        <a href="<?php echo $image['popup']; ?>"
                                           data-something="something<?php echo $i ?>"
                                           data-another-thing="anotherthing<?php echo $i ?>"><img
                                                src="<?php echo $image['popup']; ?>"
                                                alt="<?php echo $heading_title; ?>"/></a>
                                    </li>
                                <?php } ?>
                            </ul>
                        </div>
                    <?php } ?>
                </div>

                <!-- Content right -->
                <div class="<?php echo $content_right; ?> product_page-right">
                    <div class="general_info product-info">

                        <h2 class="product-title"><?php echo $heading_title; ?></h2>

                        <!-- Prodyuct rating status -->
                        <div class="rating-section product-rating-status">
                            <?php if ($review_status) { ?>
                                <div class="rating">
                                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                                        <?php if ($rating < $i) { ?>
                                            <span class="fa-stack"><i
                                                    class="fl-bigmug-line-favourites5 fa-stack-1x"></i></span>
                                        <?php } else { ?>
                                            <span class="fa-stack"><i
                                                    class="fl-bigmug-line-favourites5   fa-stack-1x"></i>
                                                <i class="fl-bigmug-line-favourites5 star  fa-stack-1x"></i></span>
                                        <?php } ?>
                                    <?php } ?>

                                    <span class="review-link review-link-show">
                                        <a href="#"><?php echo $reviews; ?></a>
                                    </span>
                                    <span class="review-link review-link-write">
                                        <a href="#"><?php echo $text_write; ?></a>
                                    </span>
                                </div>
                            <?php } ?>
                        </div>

                        <?php if ($price) { ?>
                            <div class="price-section">
                                <span class="price-new"><?php echo $special; ?></span>
                                <?php if (!$special) { ?>
                                    <span class="price-new"><?php echo $price; ?></span>
                                <?php } else { ?>
                                    <span class="price-old"><?php echo $price; ?></span>
                                <?php } ?>
                                <?php if ($tax) { ?>
                                    <span class="tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
                                <?php } ?>
                                <div class="reward-block">
                                    <?php if ($points) { ?>
                                        <span
                                            class="reward"><strong><?php echo $text_points; ?></strong> <?php echo $points; ?></span>
                                    <?php } ?>
                                    <?php if ($discounts) { ?>
                                        <?php foreach ($discounts as $discount) { ?>
                                            <span><strong><?php echo $discount['quantity']; ?><?php echo $text_discount; ?>
                                                    :</strong> <?php echo $discount['price']; ?></span>
                                        <?php } ?>
                                    <?php } ?>
                                </div>
                            </div>
                        <?php } ?>

                        <ul class="list-unstyled product-section">
                            <?php if ($manufacturer) { ?>
                                <li><strong><?php echo $text_manufacturer; ?></strong>
                                    <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a>
                                </li>
                            <?php } ?>
                            <li><strong><?php echo $text_model; ?></strong> <span><?php echo $model; ?></span></li>
                            <?php if ($reward) { ?>
                                <li><strong><?php echo $text_reward; ?> </strong><span><?php echo $reward; ?></span>
                                </li>
                            <?php } ?>
                            <li><strong><?php echo $text_stock; ?> </strong><span
                                    class="<?php echo($stock_status <= 0 ? 'out-stock' : 'stock'); ?>"><?php echo $stock; ?></span>
                            </li>
                        </ul>
                    </div>

                    <div id="product">

                        <!-- Product options -->
                        <?php if ($options) { ?>
                            <div class="product-options form-horizontal">
                                <h3><?php echo $text_option; ?></h3>
                                <?php foreach ($options as $option) { ?>
                                    <?php if ($option['type'] == 'select') { ?>
                                        <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                            <label class="control-label col-sm-12"
                                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                            <div class="col-sm-12">
                                                <select name="option[<?php echo $option['product_option_id']; ?>]"
                                                        id="input-option<?php echo $option['product_option_id']; ?>"
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
                                        <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                            <label
                                                class="control-label col-sm-12"><?php echo $option['name']; ?></label>

                                            <div class="col-sm-12">
                                                <div id="input-option<?php echo $option['product_option_id']; ?>">
                                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                        <div class="radio">
                                                            <label>
                                                                <input type="radio"
                                                                       name="option[<?php echo $option['product_option_id']; ?>]"
                                                                       value="<?php echo $option_value['product_option_value_id']; ?>" />
                                                                <?php echo $option_value['name']; ?>
                                                                <?php if ($option_value['price']) { ?>
                                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                <?php } ?>
                                                                <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name']; ?>"/>
                                                            </label>
                                                        </div>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        </div>
                                    <?php } ?>
                                    <?php if ($option['type'] == 'checkbox') { ?>
                                        <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                            <label
                                                class="control-label col-sm-12"><?php echo $option['name']; ?></label>

                                            <div class="col-sm-12">
                                                <div id="input-option<?php echo $option['product_option_id']; ?>">
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
                                        <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                            <label
                                                class="control-label col-sm-12"><?php echo $option['name']; ?></label>

                                            <div class="col-sm-12">
                                                <div id="input-option<?php echo $option['product_option_id']; ?>">
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
                                        <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                            <label class="control-label col-sm-12"
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
                                        <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                            <label class="control-label col-sm-12"
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
                                        <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                            <label
                                                class="control-label col-sm-12"><?php echo $option['name']; ?></label>

                                            <div class="col-sm-12">
                                                <button type="button"
                                                        id="button-upload<?php echo $option['product_option_id']; ?>"
                                                        data-loading-text="<?php echo $text_loading; ?>"
                                                        class="btn btn-block btn-default"><i
                                                        class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                                                <input type="hidden"
                                                       name="option[<?php echo $option['product_option_id']; ?>]"
                                                       value=""
                                                       id="input-option<?php echo $option['product_option_id']; ?>"/>
                                            </div>
                                        </div>
                                    <?php } ?>
                                    <?php if ($option['type'] == 'date') { ?>
                                        <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                            <label class="control-label col-sm-12"
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
                                        <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                            <label class="control-label col-sm-12"
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
                                        <div class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                            <label class="control-label col-sm-12"
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
                            </div>
                        <?php } ?>

                        <!-- product reccurings -->
                        <div class="product-reccurings">
                            <?php if ($recurrings) { ?>
                                <h3><?php echo $text_payment_recurring ?></h3>
                                <div class="form-group required">
                                    <select name="recurring_id" class="form-control">
                                        <option value=""><?php echo $text_select; ?></option>
                                        <?php foreach ($recurrings as $recurring) { ?>
                                            <option
                                                value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                                        <?php } ?>
                                    </select>

                                    <div class="help-block" id="recurring-description"></div>
                                </div>
                            <?php } ?>
                        </div>

                        <!-- Add to cart form -->
                        <div class="form-group form-horizontal">
                            <div class="form-group">
                                <div class="col-sm-12 quantity">
                                    <label class="control-label"
                                           for="input-quantity"><?php echo $entry_qty; ?></label>
                                    <a class="counter counter-minus material-design-horizontal39" href='#'></a>
                                    <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2"
                                           id="input-quantity" class="form-control"/>
                                    <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
                                    <a class="counter counter-plus material-design-add186" href='#'></a>
                                    <button type="button" id="button-cart"
                                            data-loading-text="<?php echo $text_loading; ?>"
                                            class="product-btn-add"><?php echo $button_cart; ?></button>
                                </div>
                            </div>


                        </div>

                        <ul class="product-buttons">
                            <li>
                                <button class="product-btn" onclick="wishlist.add('<?php echo $product_id; ?>');"><i
                                        class="material-design-favorite21"></i> <span
                                        ><?php echo $button_wishlist; ?></span></button>
                            </li>
                            <li>
                                <button type="button" class="product-btn"
                                        onclick="compare.add('<?php echo $product_id; ?>');"><i
                                        class="material-design-shuffle24"></i>
                                    <span><?php echo $button_compare; ?></span></button>
                            </li>
                        </ul>

                        <?php if ($tags) { ?>
                            <!-- Product tags -->
                            <div class="product-tags">
                                <?php echo $text_tags; ?>
                                <?php for ($i = 0; $i < count($tags); $i++) { ?>
                                    <?php if ($i < (count($tags) - 1)) { ?>
                                        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
                                    <?php } else { ?>
                                        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                                    <?php } ?>
                                <?php } ?>
                            </div>
                        <?php } ?>
                        <div class="product-share">
                            <!-- AddThis Button BEGIN -->

                            <div class="addthis_sharing_toolbox"></div>


                            <!-- Go to www.addthis.com/dashboard to customize your tools -->
                            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-55e053ac02ebd38e" async="async"></script>

                            <!-- AddThis Button END -->
                        </div>

                        <?php if ($minimum > 1) { ?>
                            <div class="alert alert-info"><i
                                    class="material-design-round52"></i> <?php echo $text_minimum; ?>
                            </div>
                        <?php } ?>
                    </div>

                </div>
            </div>

            <div class="product_tabs">
                <ul class="nav nav-tabs">
                    <?php if (strcmp($description,'<p><br></p>') != 0) { ?>
                    <li>
                        <a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a>
                    </li>
                    <?php }?>
                    <?php if ($attribute_groups) { ?>
                        <li>
                            <a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a>
                        </li>
                    <?php } ?>
                    <?php if ($review_status) { ?>
                        <li>
                            <a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a>
                        </li>
                    <?php } ?>
                    <?php if ($video) { ?>
                        <li>
                            <a href="#tab-video" data-toggle="tab"><?php echo $tab_video; ?></a>
                        </li>
                    <?php } ?>
                </ul>

                <div class="tab-content">
                    <?php if (strcmp($description,'<p><br></p>') != 0) { ?>
                    <!-- Product description -->
                    <div id="tab-description" class="tab-pane active product-desc product-section">
                        <?php echo $description; ?>
                        <div class="clearfix"></div>
                    </div>
                    <?php }?>

                    <?php if ($attribute_groups) { ?>
                        <!-- Product specifications -->
                        <div id="tab-specification" class="tab-pane product-spec product-section">
                            <table class="table table-bordered">
                                <?php foreach ($attribute_groups as $attribute_group) { ?>
                                    <tbody>
                                    <tr>
                                        <th colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></th>
                                    </tr>
                                    </tbody>
                                    <tbody>
                                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                        <tr>
                                            <td><?php echo $attribute['name']; ?></td>
                                            <td><?php echo $attribute['text']; ?></td>
                                        </tr>
                                    <?php } ?>
                                    </tbody>
                                <?php } ?>
                            </table>
                        </div>
                    <?php } ?>

                    <!-- Product reviews -->
                    <?php if ($review_status) { ?>
                        <div id="tab-review" class="tab-pane product-reviews product-section">

                            <form class="form-horizontal" id="form-review">

                                <!-- Reviews list -->
                                <div id="review"></div>

                                <!-- Review form -->
                                <div class="review-form-title">
                                    <h3 class="product-section_title"
                                        id="reviews_form_title"><?php echo $text_write; ?></h3>
                                </div>
                                <div class="product-review-form" id="reviews_form">
                                    <?php if ($review_guest) { ?>
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label"
                                                       for="input-name"><?php echo $entry_name; ?></label>
                                                <input type="text" name="name" value="" id="input-name"
                                                       class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label"
                                                       for="input-review"><?php echo $entry_review; ?></label>
                                                <textarea name="text" rows="5" id="input-review"></textarea>

                                                <div class="help-block"><?php echo $text_note; ?></div>
                                            </div>
                                        </div>
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label"><?php echo $entry_rating; ?></label>
                                                &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                                                <input type="radio" name="rating" value="1"/>
                                                &nbsp;
                                                <input type="radio" name="rating" value="2"/>
                                                &nbsp;
                                                <input type="radio" name="rating" value="3"/>
                                                &nbsp;
                                                <input type="radio" name="rating" value="4"/>
                                                &nbsp;
                                                <input type="radio" name="rating" value="5"/>
                                                &nbsp;<?php echo $entry_good; ?></div>
                                        </div>
                                        <?php echo $captcha; ?>
                                        <div class="buttons clearfix">
                                            <div class="pull-right">
                                                <button type="button" id="button-review"
                                                        data-loading-text="<?php echo $text_loading; ?>"
                                                        class="btn btn-primary"><?php echo $button_continue; ?></button>
                                            </div>
                                        </div>
                                    <?php } else { ?>
                                        <?php echo $text_login; ?>
                                    <?php } ?>
                                </div>
                            </form>
                        </div>
                    <?php } ?>
                    <?php if ($video) { ?>
                    <div id="tab-video" class="tab-pane product-video product-section">
                        <div class="r_frame">
                            <?php echo $video; ?>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <?php }?>
                </div>
            </div>

            <!-- Related products -->
            <?php if ($products) { ?>
                <div class="related-products product-section">
                    <h3 class="product-section_title"><?php echo $text_related; ?></h3>

                    <div class="box-carousel">
                        <?php $pr = 10000; foreach ($products as $product) { $pr++;?>

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
                                                                   for="input-option<?php echo $option['product_option_id'] . $pr; ?>"><?php echo $option['name']; ?></label>

                                                            <div class="col-sm-12">
                                                                <select
                                                                    name="option[<?php echo $option['product_option_id']; ?>]"
                                                                    id="input-option<?php echo $option['product_option_id'] . $pr; ?>"
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
                                                                    id="input-option<?php echo $option['product_option_id'] . $pr; ?>">
                                                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                        <div class="radio">
                                                                            <label
                                                                                for="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] . $pr; ?>]">
                                                                                <input type="radio" hidden
                                                                                       name="option[<?php echo $option['product_option_id']; ?>]"
                                                                                       id="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] . $pr; ?>]"
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
                                                                    id="input-option<?php echo $option['product_option_id'] . $pr; ?>">
                                                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                        <div class="checkbox">
                                                                            <label>
                                                                                <input type="checkbox"
                                                                                       name="option[<?php echo $option['product_option_id']; ?>][]"
                                                                                       value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                                <?php echo $option_value['name']; ?>
                                                                                <?php echo $option_value['image']; ?>
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
                                                                    id="input-option<?php echo $option['product_option_id'] . $pr; ?>">
                                                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                        <div class="radio">
                                                                            <label>
                                                                                <input type="radio"
                                                                                       name="option[<?php echo $option['product_option_id']; ?>]"
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
                                                    <?php if ($option['type'] == 'text') { ?>
                                                        <div
                                                            class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                            <label class="control-label col-sm-12
                                            "
                                                                   for="input-option<?php echo $option['product_option_id'] . $pr; ?>"><?php echo $option['name']; ?></label>

                                                            <div class="col-sm-12">
                                                                <input type="text"
                                                                       name="option[<?php echo $option['product_option_id']; ?>]"
                                                                       value="<?php echo $option['value']; ?>"
                                                                       placeholder="<?php echo $option['name']; ?>"
                                                                       id="input-option<?php echo $option['product_option_id'] . $pr; ?>"
                                                                       class="form-control"/>
                                                            </div>
                                                        </div>
                                                    <?php } ?>
                                                    <?php if ($option['type'] == 'textarea') { ?>
                                                        <div
                                                            class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                            <label class="control-label col-sm-12
                                            "
                                                                   for="input-option<?php echo $option['product_option_id'] . $pr; ?>"><?php echo $option['name']; ?></label>

                                                            <div class="col-sm-12">
                                                    <textarea name="option[<?php echo $option['product_option_id']; ?>]"
                                                              rows="5" placeholder="<?php echo $option['name']; ?>"
                                                              id="input-option<?php echo $option['product_option_id'] . $pr; ?>"
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
                                                                        id="button-upload<?php echo $option['product_option_id'] . $pr; ?>"
                                                                        data-loading-text="<?php echo $text_loading; ?>"
                                                                        class="btn btn-block btn-default"><i
                                                                        class="fa fa-upload"></i> <?php echo $button_upload; ?>
                                                                </button>
                                                                <input type="hidden"
                                                                       name="option[<?php echo $option['product_option_id']; ?>]"
                                                                       value=""
                                                                       id="input-option<?php echo $option['product_option_id'] . $pr; ?>"/>
                                                            </div>
                                                        </div>
                                                    <?php } ?>
                                                    <?php if ($option['type'] == 'date') { ?>
                                                        <div
                                                            class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                            <label class="control-label col-sm-12
                                            "
                                                                   for="input-option<?php echo $option['product_option_id'] . $pr; ?>"><?php echo $option['name']; ?></label>

                                                            <div class="col-sm-12">
                                                                <div class="input-group date">
                                                                    <input type="text"
                                                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                                                           value="<?php echo $option['value']; ?>"
                                                                           data-date-format="YYYY-MM-DD"
                                                                           id="input-option<?php echo $option['product_option_id'] . $pr; ?>"
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
                                                                   for="input-option<?php echo $option['product_option_id'] . $pr; ?>"><?php echo $option['name']; ?></label>

                                                            <div class="col-sm-12">
                                                                <div class="input-group datetime">
                                                                    <input type="text"
                                                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                                                           value="<?php echo $option['value']; ?>"
                                                                           data-date-format="YYYY-MM-DD HH:mm"
                                                                           id="input-option<?php echo $option['product_option_id'] . $pr; ?>"
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
                                                                   for="input-option<?php echo $option['product_option_id'] . $pr; ?>"><?php echo $option['name']; ?></label>

                                                            <div class="col-sm-12">
                                                                <div class="input-group time">
                                                                    <input type="text"
                                                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                                                           value="<?php echo $option['value']; ?>"
                                                                           data-date-format="HH:mm"
                                                                           id="input-option<?php echo $option['product_option_id'] . $pr; ?>"
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

                        <?php } ?>
                    </div>
                </div>
            <?php } ?>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>

<script>
    (function ($) {
        $(document).ready(function () {
            $('.review-link a').click(function (e) {
                e.preventDefault();
                $('.product_tabs a[href="#tab-review"').tab('show');

            })
            $('.review-link-show').click(function () {
                $('html, body').animate({
                    'scrollTop': $('.product_tabs').offset().top - ($('#stuck').outerHeight() + 50)
                }, 1000);
            })
            $('.review-link-write').click(function () {
                $('html, body').animate({
                    'scrollTop': $('#reviews_form_title').offset().top - ($('#stuck').outerHeight() + 50)
                }, 1000);
                $('#reviews_form_title').addClass('close-tab').parents('#tab-review').find('#reviews_form').slideDown();
            })
            $('.product_tabs li:first-child a').tab('show');
        });
    })(jQuery);

    document.getElementById('input-quantity').onkeypress = function (e) {

        e = e || event;

        if (e.ctrlKey || e.altKey || e.metaKey) return;

        var chr = getChar(e);

        if (chr == null) return;

        if (chr < '0' || chr > '9') {
            return false;
        }

    }

    function getChar(event) {
        if (event.which == null) {
            if (event.keyCode < 32) return null;
            return String.fromCharCode(event.keyCode) // IE
        }

        if (event.which != 0 && event.charCode != 0) {
            if (event.which < 32) return null;
            return String.fromCharCode(event.which)
        }

        return null;
    }
    jQuery('#reviews_form_title').addClass('close-tab');
    jQuery('#reviews_form_title').on("click", function () {
        if (jQuery(this).hasClass('close-tab')) {
            jQuery(this).removeClass('close').parents('#tab-review').find('#reviews_form').slideToggle();
        }
        else {
            jQuery(this).addClass('close-tab').parents('#tab-review').find('#reviews_form').slideToggle();
        }
    })
</script>

<script type="text/javascript"><!--
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function () {
                $('#recurring-description').html('');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
    //-->
</script>

<script type="text/javascript"><!--
    $('#button-cart').on('click', function () {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function () {
                $('#button-cart').button('loading');
            },
            complete: function () {
                $('#button-cart').button('reset');
            },
            success: function (json) {
                clearTimeout(timer);
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    if (json['error']['quantity']){
                        $('#content').parent().before('<div class="alert alert-danger"><i class="material-design-cancel19"></i>' + json['error']['quantity'] + ' <button type="button" class="close material-design-close47"></button> </div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('#content').parent().before('<div class="alert alert-success"><i class="material-design-verification24"></i> ' + json['success'] + '<button type="button" class="close material-design-close47"></button></div>');


                    $('#cart-total').html(json['total']);
                    $('#cart-total2').html(json['total2']);
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
                timer = setTimeout(function () {
                    $('.alert').addClass('fadeOut');
                }, 4000)
            }
        });
    });
    //-->
</script>

<script type="text/javascript"><!--


    $('button[id^=\'button-upload\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        $('#form-upload input[name=\'file\']').on('change', function () {
            $.ajax({
                url: 'index.php?route=tool/upload',
                type: 'post',
                dataType: 'json',
                data: new FormData($(this).parent()[0]),
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function () {
                    $(node).button('loading');
                },
                complete: function () {
                    $(node).button('reset');
                },
                success: function (json) {
                    $('.text-danger').remove();

                    if (json['error']) {
                        $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                    }

                    if (json['success']) {
                        alert(json['success']);

                        $(node).parent().find('input').attr('value', json['code']);
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });
    });
    //-->
</script>

<script type="text/javascript"><!--
    $('#review').delegate('.pagination a', 'click', function (e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function () {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-review").serialize(),
            beforeSend: function () {
                $('#button-review').button('loading');
            },
            complete: function () {
                $('#button-review').button('reset');
            },
            success: function (json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="material-design-cancel19"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after('<div class="alert alert-success"><i class="material-design-verification24"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                }
            }
        });
    });
    //-->
</script>

<script type="text/javascript">
    /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
    var disqus_shortname = 'thtest123'; // required: replace example with your forum shortname

    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function () {
        var s = document.createElement('script');
        s.async = true;
        s.type = 'text/javascript';
        s.src = '//' + disqus_shortname + '.disqus.com/count.js';
        (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
    }());
</script>

<?php echo $footer; ?>

