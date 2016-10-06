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
        <?php if ($error_percentage) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_percentage; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>

        <?php if ($error_title) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_title; ?>
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
                        <label class="col-sm-2 control-label" for="input-type"><?php echo $entry_type; ?></label>

                        <div class="col-sm-10">
                            <select name="type" id="input-type" class="form-control">
                                <?php if ($type == 2) { ?>
                                    <option value="2" selected="selected"><?php echo $text_horizontal; ?></option>
                                    <option value="1"><?php echo $text_vertical; ?></option>
                                    <option value="0"><?php echo $text_radial; ?></option>
                                <?php } elseif ($type == 1) { ?>
                                    <option value="2"><?php echo $text_horizontal; ?></option>
                                    <option value="1" selected="selected"><?php echo $text_vertical; ?></option>
                                    <option value="0"><?php echo $text_radial; ?></option>
                                <?php } else { ?>
                                    <option value="2"><?php echo $text_horizontal; ?></option>
                                    <option value="1"><?php echo $text_vertical; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_radial; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <div id="elements">
                        <?php $element = 0;
                            if (!empty($tm_progress_bars)) {
                                for ($i = 0; $i <= sizeof($tm_progress_bars['1']['title']); $i++) {
                                    if (!empty($tm_progress_bars['1']['title'][$i])) {?>

                                    <div class="bar<?php echo $i ?>">
                                    <div class="form-group">
                                        <h4 class="col-sm-2 text-right">Progress Bar: <?php echo $i + 1; ?></h4>

                                        <div class="col-sm-10 text-right">
                                            <button type="button" onclick="removeBar(<?php echo $i ?>);"
                                                    data-toggle="tooltip"
                                                    title="<?php echo $text_remove_marker; ?>" class="btn btn-danger"><i
                                                    class="fa fa-minus-circle"></i></button>
                                        </div>

                                        <div class="clearfix "></div>
                                    </div>
                                    <div class="tab-pane">
                                        <div class="row">
                                            <div class="col-sm-10 col-sm-offset-2">
                                                <ul class="nav nav-tabs" id="language<?php echo $i ?>">
                                                    <?php foreach ($languages as $language) { ?>
                                                        <li>
                                                            <a href="#language<?php echo $language['language_id'] . $i; ?>"
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
                                                <div class="tab-pane"
                                                     id="language<?php echo $language['language_id'] . $i; ?>">
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label"
                                                               for="input-title<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>

                                                        <div class="col-sm-10">
                                                            <input
                                                                name="tm_progress_bars[<?php echo $language['language_id']; ?>][title][]"
                                                                placeholder="<?php echo $entry_title; ?>"
                                                                id="input-message<?php echo $language['language_id']; ?>"
                                                                class="form-control"
                                                                value="<?php echo isset($tm_progress_bars[$language['language_id']]['title'][$i]) ? $tm_progress_bars[$language['language_id']]['title'][$i] : ''; ?>">
                                                        </div>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                        </div>
                                    </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"
                                                   for="input-percentage"><?php echo $entry_percentage; ?></label>

                                            <div class="col-sm-10">
                                                <input type="text" name="percentage[]"
                                                       value="<?php echo $percentage[$i]; ?>"
                                                       placeholder="<?php echo $entry_percentage; ?>" id="input-percentage"
                                                       class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <?php $element++;
                                 }
                                }
                            } ?>



                    </div>
                    <div class="text-right">
                        <button type="button" onclick="addBar();" data-toggle="tooltip"
                                title="<?php echo $text_add_bar; ?>" class="btn btn-primary"><i
                                class="fa fa-plus-circle"></i></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>


<script type="text/javascript">
    var element =<?php echo $element; ?>;
    for (var i = 0; i < element; i++){
        $('#language'+i+' a:first').tab('show');
    }

    var languages = $.map(<?php echo json_encode($languages); ?>, function(value, index) {
        return [value];
    });


    function addBar() {
        element++;
        html = '<div class="bar' + element + '">';


        html += '<div class="form-group">';
        html += '	<h4 class="col-sm-2 text-right">Progress Bar: ' + (element) + '</h4>';
        html += '	<div class="col-sm-10 text-right">';
        html += '		  <button type="button" onclick="removeBar(' + element + ');" data-toggle="tooltip" title="<?php echo $text_remove_marker; ?>" class="btn btn-danger">' +
        '<i class="fa fa-minus-circle"></i></button>  ';
        html += '	</div>';
        html += '</div>';


        html += '<div class="tab-pane">';
        html += '	<div class="row">';
        html += '	<div class="col-sm-10 col-sm-offset-2">';
        html += '<ul class="nav nav-tabs" id="language' + element + '">';
        languages.forEach(function(language){
            html += '<li>';
            html += '<a href="#language' + language['language_id'] + element + '" data-toggle="tab">';
            html += '<img src="view/image/flags/' + language['image'] + '" title="' + language['name'] + '"/> ' + language['name'];
            html += '</a>';
            html += '</li>';
        })
        html += '</ul>';
        html += '</div>';
        html += '</div>';
        html += ' <div class="tab-content">';
        languages.forEach(function(language){
            html += '<div class="tab-pane" id="language' + language['language_id'] + element + '">';
            html += '<div class="form-group">';
            html += '<label class="col-sm-2 control-label" for="input-title' + language['language_id'] + element + '"><?php echo $entry_title; ?></label>';
            html += '<div class="col-sm-10">';
            html += '<input name="tm_progress_bars[' + language['language_id'] + '][title][]" placeholder="<?php echo $entry_title; ?>" id="input-title' + language['language_id'] + element + '" class="form-control" value="">';
            html += ' </div>';
            html += ' </div>';
            html += ' </div>';
        })
        html += ' </div>';
        html += ' </div>';
        html += ' </div>';
        html += '<div class="form-group">';
        html += '<label class="col-sm-2 control-label" for="input-percentage"><?php echo $entry_percentage; ?></label>';
        html += '<div class="col-sm-10">';
        html += '<input type="text" name="percentage[]" value="0" placeholder="<?php echo $entry_percentage; ?>" id="input-percentage" class="form-control"/>';
        html += '</div>';
        html += '</div>';

        $('#elements').append(html);
        $('#language' + element + ' a:first').tab('show');
    }

    function removeBar(index) {
        var el = '.bar' + index;
        $(el).remove();
        $('.tooltip').remove();
    }

</script>