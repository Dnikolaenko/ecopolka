<?php echo $header; ?><?php echo $column_left; ?>
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" form="form-tm_module_tab" data-toggle="tooltip"
                            title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>
                    </button>
                    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                       class="btn btn-default"><i class="fa fa-reply"></i></a>
                </div>
                <h1><?php echo $heading_title; ?></h1>
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li>
                            <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                        </li>
                    <?php } ?>
                </ul>
            </div>
        </div>
        <div class="container-fluid">
            <?php if ($error_warning) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <?php } ?>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
                </div>
                <div class="panel-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"
                          id="form-tm_module_tab" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>

                            <div class="col-sm-10">
                                <input type="text" name="name" value="<?php echo $name; ?>"
                                       placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control"/>
                                <?php if ($error_name) { ?>
                                    <div class="text-danger"><?php echo $error_name; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-category"><?php echo $entry_category; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="path" value="<?php echo $path; ?>" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
                                <input type="hidden" name="category" value="<?php echo $category; ?>" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-tabs"><?php echo $entry_tabs; ?></label>

                            <div class="col-sm-10">
                                <select name="tabs" id="input-tabs" class="form-control">
                                    <?php if ($tabs) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>

                        <div class="show-type" <?php if (isset($tabs) && $tabs == 1){echo 'style="display:none;"';}?>>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-products"><?php echo $entry_products; ?></label>

                                <div class="col-sm-10">
                                    <select name="type" id="input-products" class="form-control">

                                        <?php if ($type){
                                        switch ($type) {
                                            case 0: ?>
                                                <option value="3"><?php echo $entry_featured; ?></option>
                                                <option value="2"><?php echo $entry_latest; ?></option>
                                                <option value="1"><?php echo $entry_bestseller; ?></option>
                                                <option value="0" selected="selected"><?php echo $entry_special; ?></option>
                                            <?php break;
                                            case 1: ?>
                                                <option value="3"><?php echo $entry_featured; ?></option>
                                                <option value="2"><?php echo $entry_latest; ?></option>
                                                <option value="1"selected="selected"><?php echo $entry_bestseller; ?></option>
                                                <option value="0"><?php echo $entry_special; ?></option>
                                            <?php break;
                                            case 2: ?>
                                                <option value="3"><?php echo $entry_featured; ?></option>
                                                <option value="2" selected="selected"><?php echo $entry_latest; ?></option>
                                                <option value="1"><?php echo $entry_bestseller; ?></option>
                                                <option value="0"><?php echo $entry_special; ?></option>
                                            <?php break;
                                            case 3: ?>
                                                <option value="3" selected="selected"><?php echo $entry_featured; ?></option>
                                                <option value="2"><?php echo $entry_latest; ?></option>
                                                <option value="1"><?php echo $entry_bestseller; ?></option>
                                                <option value="0"><?php echo $entry_special; ?></option>
                                             <?php break; }}else{ ?>
                                            <option value="3" selected="selected"><?php echo $entry_featured; ?></option>
                                            <option value="2"><?php echo $entry_latest; ?></option>
                                            <option value="1"><?php echo $entry_bestseller; ?></option>
                                            <option value="0"><?php echo $entry_special; ?></option>
                                        <?php } ?>

                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="show-tabs" <?php if (!isset($tabs)){ echo 'style="display:none;"';}elseif ($tabs == 0){echo 'style="display:none;"';}?>>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-special"><?php echo $entry_special; ?></label>

                                <div class="col-sm-10">
                                    <select name="special" id="input-special" class="form-control">
                                        <?php if ($special) { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-bestseller"><?php echo $entry_bestseller; ?></label>

                                <div class="col-sm-10">
                                    <select name="bestseller" id="input-bestseller" class="form-control">
                                        <?php if ($bestseller) { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-latest"><?php echo $entry_latest; ?></label>

                                <div class="col-sm-10">
                                    <select name="latest" id="input-latest" class="form-control">
                                        <?php if ($latest) { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-featured"><?php echo $entry_featured; ?></label>

                                <div class="col-sm-10">
                                    <select name="featured" id="input-featured" class="form-control">
                                        <?php if ($featured) { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="featured">
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="input-product"><?php echo $entry_product; ?></label>

                            <div class="col-sm-10">
                                <input type="text" name="product" value="" placeholder="<?php echo $entry_product; ?>"
                                       id="input-product" class="form-control"/>

                                <div id="featured-product" class="well well-sm"
                                     style="height: 150px; overflow: auto;">
                                    <?php if ($products){ foreach ($products as $product) { ?>
                                        <div id="featured-product<?php echo $product['product_id']; ?>"><i
                                                class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
                                            <input type="hidden" name="product[]"
                                                   value="<?php echo $product['product_id']; ?>"/>
                                        </div>
                                    <?php }} ?>
                                </div>
                            </div>
                        </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>

                            <div class="col-sm-10">
                                <input type="text" name="limit" value="<?php echo $limit; ?>"
                                       placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>

                            <div class="col-sm-10">
                                <input type="text" name="width" value="<?php echo $width; ?>"
                                       placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control"/>
                                <?php if ($error_width) { ?>
                                    <div class="text-danger"><?php echo $error_width; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="input-height"><?php echo $entry_height; ?></label>

                            <div class="col-sm-10">
                                <input type="text" name="height" value="<?php echo $height; ?>"
                                       placeholder="<?php echo $entry_height; ?>" id="input-height"
                                       class="form-control"/>
                                <?php if ($error_height) { ?>
                                    <div class="text-danger"><?php echo $error_height; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="input-status"><?php echo $entry_status; ?></label>

                            <div class="col-sm-10">
                                <select name="status" id="input-status" class="form-control">
                                    <?php if ($status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $('input[name=\'product\']').autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: 'index.php?route=module/tm_single_category_product/autocomplete&token=<?php echo $token; ?>&category_id=' +  $('input[name=\'category\']').val(),
                        dataType: 'json',
                        success: function (json) {
                            response($.map(json, function (item) {
                                return {
                                    label: item['name'],
                                    value: item['product_id']
                                }
                            }));
                        }
                    });
                },
                select: function (item) {
                    $('input[name=\'product\']').val('');

                    $('#featured-product' + item['value']).remove();

                    $('#featured-product').append('<div id="featured-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product[]" value="' + item['value'] + '" /></div>');
                }
            });


            $('input[name=\'path\']').autocomplete({
                'source': function(request, response) {
                    $.ajax({
                        url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                        dataType: 'json',
                        success: function(json) {
                            json.unshift({
                                category_id: 0,
                                name: '<?php echo $text_none; ?>'
                            });

                            response($.map(json, function(item) {
                                return {
                                    label: item['name'],
                                    value: item['category_id']
                                }
                            }));
                        }
                    });
                },
                'select': function(item) {
                    $('input[name=\'path\']').val(item['label']);
                    $('input[name=\'category\']').val(item['value']);
                }
            });


            $('#featured-product').delegate('.fa-minus-circle', 'click', function () {
                $(this).parent().remove();
            });


            $('select[name=\'tabs\']').change(function () {
                if ($(this).val() == '1') {
                    $('.show-tabs').show();
                    $('.show-type').hide();
                } else {
                    $('.show-tabs').hide();
                    $('.show-type').show();
                }
            })
            featuredShow();

            $('select[name=\'tabs\'], select[name=\'featured\'], select[name=\'type\']').change(featuredShow);

            function featuredShow(){
                var featured = $('.featured');
                if ($('select[name=\'tabs\'').val() == 0 && $('select[name=\'type\']').val() == 3){
                    featured.css('display','block');
                }else if ($('select[name=\'tabs\'').val() == 1 && $('select[name=\'featured\']').val() == 1) {
                    featured.css('display','block');
                }else{
                    featured.css('display','none');
                }
            }

        </script>
    </div>
<?php echo $footer; ?>