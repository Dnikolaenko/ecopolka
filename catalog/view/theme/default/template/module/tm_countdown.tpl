<div class="container">
    <div class="box countdown">
        <div class="box-heading">
            <h3><?php echo $heading_title; ?></h3>
        </div>
        <div class="box-content">
            <?php if ($description) { ?>
                <div class="countdown_description"><?php echo $description; ?></div>
            <?php } ?>
            <?php if ($type == 1) { ?>
                <div id="radial-countdown<?php echo $module; ?>" class="radial-countdown"
                     data-date="<?php echo $date ?>"></div>
            <?php } else { ?>
                <div id="countdown<?php echo $module; ?>" class="countdown-simple"
                     data-date="<?php echo $date ?>">
                    <div class="cell"><span class="number days"></span> <?php echo $days_title; ?></div>
                    <div class="cell"><span class="number hours"></span> <?php echo $hours_title; ?></div>
                    <div class="cell"><span class="number minutes"></span> <?php echo $minutes_title; ?></div>
                    <div class="cell"><span class="number seconds"></span> <?php echo $seconds_title; ?></div>
                </div>
            <?php } ?>
        </div>
    </div>
</div>

<?php if ($type == 1) { ?>
    <script>
        var obj = jQuery("#radial-countdown<?php echo $module;?>"),
            timesettings = {
                Days: {
                    color: '<?php echo $days_color ?>',
                    show: <?php echo $show_days; ?>,
                    text: '<?php echo $days_title; ?>'
                },
                Hours: {
                    color: '<?php echo $hours_color ?>',
                    show: <?php echo $show_hours; ?>,
                    text: '<?php echo $hours_title; ?>'
                },
                Minutes: {
                    color: '<?php echo $minutes_color ?>',
                    show: <?php echo $show_minutes; ?>,
                    text: '<?php echo $minutes_title; ?>'
                },
                Seconds: {
                    color: '<?php echo $seconds_color ?>',
                    show: <?php echo $show_seconds; ?>,
                    text: '<?php echo $seconds_title; ?>'

                }
            },
            settings = {
                animation: '<?php echo $animation; ?>',
                direction: '<?php echo $direction; ?>',
                circle_bg_color: '<?php echo $bg_color ?>',
                fg_width: <?php echo $fg_width; ?>,
                bg_width: <?php echo $bg_width; ?>,
                count_past_zero: false,
                time: timesettings
            };
        jQuery(document).ready(function () {

            obj.TimeCircles(settings);
        });

        <?php if ($count > 2) { ?>
        jQuery(window).on('resize', function (event) {
            <?php if ($count > 3) { ?>
            if (jQuery(window).width() > 767) {
                obj.TimeCircles({
                    time: {
                        Minutes: {show: true},
                        Seconds: {show: true}
                    }
                }).rebuild();
            } else if (jQuery(window).width() > 479) {
                obj.TimeCircles({
                    time: {
                        Minutes: {show: true},
                        Seconds: {show: false}
                    }
                }).rebuild();
            } else {
                obj.TimeCircles({
                    time: {
                        Minutes: {show: false},
                        Seconds: {show: false}
                    }
                }).rebuild();
            }
            <?php }else{ ?>

            if (jQuery(window).width() > 479) {
                obj.TimeCircles({
                    time: {
                        <?php if ($show_seconds == 'true'){ ?>
                        Seconds: {show: true}
                        <?php }else{ ?>
                        Minutes: {show: true}
                        <?php } ?>
                    }
                }).rebuild();
            } else {
                obj.TimeCircles({
                    time: {
                        <?php if ($show_seconds == 'true'){ ?>
                        Seconds: {show: false}
                        <?php }else{ ?>
                        Minutes: {show: false}
                        <?php } ?>
                    }
                }).rebuild();
            }
            <?php } ?>
        });
        <?php }else{ ?>
        jQuery(window).on('resize', function (event) {
            obj.TimeCircles().rebuild();
        });
        <?php } ?>
    </script>
<?php } else { ?>
    <script>
        ;(function($){
            var obj = $('#countdown<?php echo $module; ?>');

            obj.countdown(obj.data('date'), function(event){
                $(this).find('.days').html(event.strftime('%D'));
                $(this).find('.hours').html(event.strftime('%H'));
                $(this).find('.minutes').html(event.strftime('%M'));
                $(this).find('.seconds').html(event.strftime('%S'));
            });
        })(jQuery)
    </script>
<?php } ?>



