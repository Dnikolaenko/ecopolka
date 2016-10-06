<div id="parallax_<?php echo $module_counter; ?>" class="parallax">
    <div <?php if ($image) { ?>data-source-url="<?php echo $image; ?>"<?php } ?> class="<?php if ($class) echo $class;?>">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <?php echo $description; ?>
                </div>
            </div>
            <?php foreach ($modules as $module) { ?>
                <div class="inner-module"><?php echo $module; ?></div>
            <?php } ?>
        </div>
    </div>
</div>

<script>
    jQuery(document).ready(function () {
        jQuery("#parallax_<?php echo $module_counter; ?>>div").cherryFixedParallax({
            invert: false
        });
    });
</script>