<?php echo $header; ?>
<?php echo $column_left; ?>

    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" form="form-simple-blog" data-toggle="tooltip"
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
                          id="form-simple-blog" class="form-horizontal">

                        <div class="form-group">
                            <label
                                class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"
                                for="input-status"><?php echo $entry_status; ?></label>

                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
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
                            <label
                                class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><?php echo $entry_article_limit; ?></label>

                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <input type="text"
                                       name="article_limit"
                                       value="<?php echo $article_limit; ?>" class="form-control"
                                       placeholder="<?php echo $entry_article_limit ?>"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label
                                class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"
                                for="input-show-readmore"><?php echo $entry_readmore; ?></label>

                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <select name="show_readmore" id="input-show-readmore" class="form-control">
                                    <?php if ($show_readmore) { ?>
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
                            <label
                                class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"
                                for="input-show-date"><?php echo $entry_date; ?></label>

                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <select name="show_date" id="input-show-date" class="form-control">
                                    <?php if ($show_date) { ?>
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
                            <label
                                class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"
                                for="input-show-author"><?php echo $entry_author; ?></label>

                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <select name="show_author" id="input-show-author" class="form-control">
                                    <?php if ($show_author) { ?>
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
                            <label
                                class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"
                                for="input-show-comments"><?php echo $entry_comments; ?></label>

                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <select name="show_comments" id="input-show-comments" class="form-control">
                                    <?php if ($show_comments) { ?>
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
                            <label
                                class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"
                                for="input-image"><?php echo $entry_image; ?></label>

                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <select name="show_image" id="input-image" class="form-control">
                                    <?php if ($show_image) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>

                        <div id="image-size">
                            <div class="form-group">
                                <label
                                    class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><?php echo $entry_image_width; ?></label>

                                <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                    <input type="text"
                                           name="image_width"
                                           value="<?php echo $image_width; ?>" class="form-control"
                                           placeholder="<?php echo $entry_image_width ?>"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label
                                    class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><?php echo $entry_image_height; ?></label>

                                <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                    <input type="text"
                                           name="image_height"
                                           value="<?php echo $image_height; ?>" class="form-control"
                                           placeholder="<?php echo $entry_image_height ?>"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label
                                class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><?php echo $entry_description_limit; ?></label>

                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <input type="text"
                                       name="description_limit"
                                       value="<?php echo $description_limit; ?>" class="form-control"
                                       placeholder="<?php echo $entry_description_limit ?>"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label
                                class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><?php echo $entry_category; ?></label>

                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <select name="category_id"
                                        class="form-control">
                                    <option value="" disabled="disabled"
                                            style="font-weight: bold;"><?php echo $text_category_label; ?></option>
                                    <option value="all" <?php if ($category_id == 'all') {
                                        echo "selected='selected'";
                                    } ?>><?php echo $text_latest_article; ?></option>
                                    <option value="popular" <?php if ($category_id == 'popular') {
                                        echo "selected='selected'";
                                    } ?>><?php echo $text_popular_article; ?></option>
                                    <option value="" disabled="disabled"
                                            style="font-weight: bold;"><?php echo $entry_category; ?></option>
                                    <?php foreach ($categories as $category) { ?>
                                        <option
                                            value="<?php echo $category['simple_blog_category_id']; ?>" <?php if ($category['simple_blog_category_id'] == $category_id) {
                                            echo "selected='selected'";
                                        } ?>><?php echo $category['name']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>

    </div>

    <script>
        function showSize(val){
            if (val == '1') {
                $('#image-size').show();
            } else {
                $('#image-size').hide();
            }
        }

        $(window).load(showSize($('select[name=\'show_image\']').val()));

        $('select[name=\'show_image\']').change(function () {
            showSize($(this).val());
        });
    </script>

<?php echo $footer; ?>