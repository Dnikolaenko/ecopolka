<?php echo $header; ?>
<?php if ($top) { ?>
    <section class="top"><?php echo $top; ?></section>
<?php } ?>
    <section id="container">
        <div class="container">
            <div class="row"><?php echo $column_left; ?>
                <?php if ($column_left && $column_right) { ?>
                    <?php $class = 'col-sm-6'; ?>
                <?php } elseif ($column_left || $column_right) { ?>
                    <?php $class = 'col-sm-9'; ?>
                <?php } else { ?>
                    <?php $class = 'col-sm-12'; ?>
                <?php } ?>
                <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?></div>
                <?php echo $column_right; ?></div>
        </div>
    </section>
    <section class="content_bottom">
        <?php echo $content_bottom; ?>
    </section>
<?php if ($bottom) { ?>
    <section class="bottom"><?php echo $bottom; ?></section>
<?php }
echo $footer; ?>


<script type="text/javascript">
    $('#banner0, #banner1, #banner2').wrapAll('<div class="banner-wrapper">');
</script>