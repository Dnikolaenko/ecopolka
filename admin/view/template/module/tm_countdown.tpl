<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-tm_newsletter_status" data-toggle="tooltip"
                        title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
                      id="form-tm_newsletter_status" class="form-horizontal">
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
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>

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

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-date"><span data-toggle="tooltip"
                                                                                     title="<?php echo $help_date; ?>"><?php echo $entry_date; ?></span></label>

                        <div class="col-sm-10">
                            <input type="text" name="date" id="input-date" class="form-control"
                                   value="<?php if ($date) {
                                       echo $date;
                                   } else {
                                       echo '';
                                   } ?>">
                            <?php if ($error_date) { ?>
                                <div class="text-danger"><?php echo $error_date; ?></div>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-type"><?php echo $entry_type; ?></label>

                        <div class="col-sm-10">
                            <select name="type" id="input-type" class="form-control">
                                <?php if ($type) { ?>
                                    <option value="1" selected="selected"><?php echo $text_radial; ?></option>
                                    <option value="0"><?php echo $text_simple; ?></option>
                                <?php } else { ?>
                                    <option value="1"><?php echo $text_radial; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_simple; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <div class="tab-pane">
                        <div class="row">
                            <div class="col-sm-10 col-sm-offset-2">
                                <ul class="nav nav-tabs" id="language">
                                    <?php foreach ($languages as $language) { ?>
                                        <li>
                                            <a href="#language<?php echo $language['language_id']; ?>"
                                               data-toggle="tab"><img
                                                    src="view/image/flags/<?php echo $language['image']; ?>"
                                                    title="<?php echo $language['name']; ?>"/> <?php echo $language['name']; ?>
                                            </a>
                                        </li>
                                    <?php } ?>
                                </ul>
                            </div>
                        </div>
                        <div class="tab-content">
                            <?php foreach ($languages as $language) { ?>
                                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"
                                               for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>

                                        <div class="col-sm-10">
                                            <textarea
                                                name="description[<?php echo $language['language_id']; ?>][description]"
                                                placeholder="<?php echo $entry_description; ?>"
                                                id="input-description<?php echo $language['language_id']; ?>"
                                                class="form-control"><?php echo isset($description[$language['language_id']]['description']) ? $description[$language['language_id']]['description'] : ''; ?></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"
                                               for="input-days-title<?php echo $language['language_id']; ?>"><?php echo $entry_days_title; ?></label>

                                        <div class="col-sm-10">
                                            <input
                                                name="description[<?php echo $language['language_id']; ?>][days_title]"
                                                placeholder="<?php echo $entry_days_title; ?>"
                                                id="input-days-title<?php echo $language['language_id']; ?>"
                                                class="form-control"
                                                value="<?php echo isset($description[$language['language_id']]['days_title']) ? $description[$language['language_id']]['days_title'] : ''; ?>"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"
                                               for="input-hours-title<?php echo $language['language_id']; ?>"><?php echo $entry_hours_title; ?></label>

                                        <div class="col-sm-10">
                                            <input
                                                name="description[<?php echo $language['language_id']; ?>][hours_title]"
                                                placeholder="<?php echo $entry_hours_title; ?>"
                                                id="input-hours-title<?php echo $language['language_id']; ?>"
                                                class="form-control"
                                                value="<?php echo isset($description[$language['language_id']]['hours_title']) ? $description[$language['language_id']]['hours_title'] : ''; ?>"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"
                                               for="input-minutes-title<?php echo $language['language_id']; ?>"><?php echo $entry_minutes_title; ?></label>

                                        <div class="col-sm-10">
                                            <input
                                                name="description[<?php echo $language['language_id']; ?>][minutes_title]"
                                                placeholder="<?php echo $entry_minutes_title; ?>"
                                                id="input-minutes-title<?php echo $language['language_id']; ?>"
                                                class="form-control"
                                                value="<?php echo isset($description[$language['language_id']]['minutes_title']) ? $description[$language['language_id']]['minutes_title'] : ''; ?>"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"
                                               for="input-seconds-title<?php echo $language['language_id']; ?>"><?php echo $entry_seconds_title; ?></label>

                                        <div class="col-sm-10">
                                            <input
                                                name="description[<?php echo $language['language_id']; ?>][seconds_title]"
                                                placeholder="<?php echo $entry_seconds_title; ?>"
                                                id="input-seconds-title<?php echo $language['language_id']; ?>"
                                                class="form-control"
                                                value="<?php echo isset($description[$language['language_id']]['seconds_title']) ? $description[$language['language_id']]['seconds_title'] : ''; ?>"/>
                                        </div>
                                    </div>
                                </div>
                            <?php } ?>
                        </div>
                    </div>

                    <div id="radial">

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><?php echo $entry_show_days; ?></label>

                            <div class="col-sm-10">
                                <?php if ($show_days) { ?>
                                    <label class="radio-inline">
                                        <input type="radio" name="show_days" value="1" checked="checked"/>
                                        <?php echo $text_enabled; ?>
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="show_days" value="0"/>
                                        <?php echo $text_disabled; ?>
                                    </label>
                                <?php } else { ?>
                                    <label class="radio-inline">
                                        <input type="radio" name="show_days" value="1"/>
                                        <?php echo $text_enabled; ?>
                                    </label>
                                    <label class="radio-inline">

                                        <input type="radio" name="show_days" value="0" checked="checked"/>
                                        <?php echo $text_disabled; ?>

                                    </label>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><?php echo $entry_show_hours; ?></label>

                            <div class="col-sm-10">
                                <?php if ($show_hours) { ?>
                                    <label class="radio-inline">
                                        <input type="radio" name="show_hours" value="1" checked="checked"/>
                                        <?php echo $text_enabled; ?>
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="show_hours" value="0"/>
                                        <?php echo $text_disabled; ?>
                                    </label>
                                <?php } else { ?>
                                    <label class="radio-inline">
                                        <input type="radio" name="show_hours" value="1"/>
                                        <?php echo $text_enabled; ?>
                                    </label>
                                    <label class="radio-inline">

                                        <input type="radio" name="show_hours" value="0" checked="checked"/>
                                        <?php echo $text_disabled; ?>

                                    </label>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><?php echo $entry_show_minutes; ?></label>

                            <div class="col-sm-10">
                                <?php if ($show_minutes) { ?>
                                    <label class="radio-inline">
                                        <input type="radio" name="show_minutes" value="1" checked="checked"/>
                                        <?php echo $text_enabled; ?>
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="show_minutes" value="0"/>
                                        <?php echo $text_disabled; ?>
                                    </label>
                                <?php } else { ?>
                                    <label class="radio-inline">
                                        <input type="radio" name="show_minutes" value="1"/>
                                        <?php echo $text_enabled; ?>
                                    </label>
                                    <label class="radio-inline">

                                        <input type="radio" name="show_minutes" value="0" checked="checked"/>
                                        <?php echo $text_disabled; ?>

                                    </label>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><?php echo $entry_show_seconds; ?></label>

                            <div class="col-sm-10">
                                <?php if ($show_seconds) { ?>
                                    <label class="radio-inline">
                                        <input type="radio" name="show_seconds" value="1" checked="checked"/>
                                        <?php echo $text_enabled; ?>
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="show_seconds" value="0"/>
                                        <?php echo $text_disabled; ?>
                                    </label>
                                <?php } else { ?>
                                    <label class="radio-inline">
                                        <input type="radio" name="show_seconds" value="1"/>
                                        <?php echo $text_enabled; ?>
                                    </label>
                                    <label class="radio-inline">

                                        <input type="radio" name="show_seconds" value="0" checked="checked"/>
                                        <?php echo $text_disabled; ?>

                                    </label>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><?php echo $entry_animation; ?></label>

                            <div class="col-sm-10">
                                <?php if ($animation) { ?>
                                    <label class="radio-inline">
                                        <input type="radio" name="animation" value="1" checked="checked"/>
                                        <?php echo $text_tick; ?>
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="animation" value="0"/>
                                        <?php echo $text_smooth; ?>
                                    </label>
                                <?php } else { ?>
                                    <label class="radio-inline">
                                        <input type="radio" name="animation" value="1"/>
                                        <?php echo $text_tick; ?>
                                    </label>
                                    <label class="radio-inline">

                                        <input type="radio" name="animation" value="0" checked="checked"/>
                                        <?php echo $text_smooth; ?>

                                    </label>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><?php echo $entry_animation_direction; ?></label>

                            <div class="col-sm-10">
                                <?php if ($animation_direction) { ?>
                                    <label class="radio-inline">
                                        <input type="radio" name="animation_direction" value="1" checked="checked"/>
                                        <?php echo $text_counter_clockwise; ?>
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="animation_direction" value="0"/>
                                        <?php echo $text_clockwise; ?>
                                    </label>
                                <?php } else { ?>
                                    <label class="radio-inline">
                                        <input type="radio" name="animation_direction" value="1"/>
                                        <?php echo $text_counter_clockwise; ?>
                                    </label>
                                    <label class="radio-inline">

                                        <input type="radio" name="animation_direction" value="0" checked="checked"/>
                                        <?php echo $text_clockwise; ?>

                                    </label>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="input-bg-color"><?php echo $entry_bg_color; ?></label>

                            <div class="col-sm-10">
                                <input type="text" name="bg_color"
                                       value="<?php echo ($bg_color) ? $bg_color : '#000'; ?>"
                                       placeholder="<?php echo $entry_bg_color; ?>" id="input-days_color"
                                       class="form-control"/>
                                <?php if ($error_bg_color) { ?>
                                    <div class="text-danger"><?php echo $error_bg_color; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="input-days_color"><?php echo $entry_days_color; ?></label>

                            <div class="col-sm-10">
                                <input type="text" name="days_color"
                                       value="<?php echo ($days_color) ? $days_color : '#000'; ?>"
                                       placeholder="<?php echo $entry_days_color; ?>" id="input-days_color"
                                       class="form-control"/>
                                <?php if ($error_days_color) { ?>
                                    <div class="text-danger"><?php echo $error_days_color; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="input-hours_color"><?php echo $entry_hours_color; ?></label>

                            <div class="col-sm-10">
                                <input type="text" name="hours_color"
                                       value="<?php echo ($hours_color) ? $hours_color : '#000'; ?>"
                                       placeholder="<?php echo $entry_hours_color; ?>" id="input-hours_color"
                                       class="form-control"/>
                                <?php if ($error_hours_color) { ?>
                                    <div class="text-danger"><?php echo $error_hours_color; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="input-minutes_color"><?php echo $entry_minutes_color; ?></label>

                            <div class="col-sm-10">
                                <input type="text" name="minutes_color"
                                       value="<?php echo ($minutes_color) ? $minutes_color : '#000'; ?>"
                                       placeholder="<?php echo $entry_minutes_color; ?>" id="input-minutes_color"
                                       class="form-control"/>
                                <?php if ($error_minutes_color) { ?>
                                    <div class="text-danger"><?php echo $error_minutes_color; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="input-seconds_color"><?php echo $entry_seconds_color; ?></label>

                            <div class="col-sm-10">
                                <input type="text" name="seconds_color"
                                       value="<?php echo ($seconds_color) ? $seconds_color : '#000'; ?>"
                                       placeholder="<?php echo $entry_seconds_color; ?>" id="input-seconds_color"
                                       class="form-control"/>
                                <?php if ($error_seconds_color) { ?>
                                    <div class="text-danger"><?php echo $error_seconds_color; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-fg-width"><span data-toggle="tooltip"
                                                                                             title="<?php echo $help_fg_width; ?>"><?php echo $entry_fg_width; ?></span></label>

                            <div class="col-sm-10">
                                <input type="text" name="fg_width" id="input-fg_width" class="form-control"
                                       value="<?php if ($fg_width) {
                                           echo $fg_width;
                                       } else {
                                           echo '0.1';
                                       } ?>">
                                <?php if ($error_fg_width) { ?>
                                    <div class="text-danger"><?php echo $error_fg_width; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-bg-width"><span data-toggle="tooltip"
                                                                                             title="<?php echo $help_bg_width; ?>"><?php echo $entry_bg_width; ?></span></label>

                            <div class="col-sm-10">
                                <input type="text" name="bg_width" id="input-bg_width" class="form-control"
                                       value="<?php if ($bg_width) {
                                           echo $bg_width;
                                       } else {
                                           echo '1';
                                       } ?>">
                                <?php if ($error_bg_width) { ?>
                                    <div class="text-danger"><?php echo $error_bg_width; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>


<script type="text/javascript"><!--
    <?php foreach ($languages as $language) { ?>
    $('#input-description<?php echo $language['language_id']; ?>').summernote({height: 300});
    <?php } ?>
    $('#language a:first').tab('show');

    showBlocks($('select[name=\'type\']').val());

    $('select[name=\'type\']').change(function () {
        showBlocks($(this).val());
    });

    function showBlocks(val){
        if (val == 1){
            $('#radial').css('display', 'block');
//            $('#simple').css('display: none');
        }else{
            $('#radial').css('display', 'none');
//            $('#simple').css('display: block');
        }
    }
    //--></script>