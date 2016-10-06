<div class="container">
    <h3><?php echo $heading_title; ?></h3>

    <div id="progress-bars<?php echo $module; ?>" class="prog-wrapper row">
        <?php if ($type == '2') {
            foreach ($progress['title'] as $key => $value) { ?>
                <div class="col-sm-4">
                    <h4><?php echo $value ?></h4>

                    <div class="progress-horizontal" data-progress="<?php echo $percentage[$key]; ?>">
                        <div class="text">0</div>
                        <div class="bar" style="width: <?php echo $percentage[$key] . '%'; ?>">
                            <div class="text text-inner">0</div>
                        </div>
                    </div>
                </div>
            <?php }
        } elseif ($type == '1') {
            foreach ($progress['title'] as $key => $value) { ?>
                <div class="col-sm-4">
                    <h4><?php echo $value ?></h4>

                    <div class="progress-vertical" data-progress="<?php echo $percentage[$key]; ?>">
                        <div class="text">0</div>
                        <div class="bar" style="height: <?php echo $percentage[$key] . '%'; ?>">
                            <div class="text text-inner">0</div>
                        </div>
                    </div>
                </div>
            <?php }
        } else {
            foreach ($progress['title'] as $key => $value) { ?>
                <div class="col-sm-4">
                    <h4><?php echo $value ?></h4>
                    <div class="radial-progress draw" data-progress="<?php echo $percentage[$key]; ?>">
                    </div>
                </div>
            <?php }
        } ?>

    </div>
</div>

<script>
    ;
    (function ($) {
        <?php if ($type == 0){ ?>
        function animationClass() {
            $('.radial-progress.draw').each(function () {
                var a = ($(this).offset().top - $(window).scrollTop()) < $(window).height(),
                    scrollUp = ($(this).offset().top - $(window).scrollTop()) > -$(this).height();
                if (a && scrollUp) {
                    $(this).each(function () {
                        var progress = $(this).data('progress');
                        var circle = new ProgressBar.Circle('.radial-progress.draw', {
                            color: '#000',
                            trailColor: '#000',
                            fill: '#000',
                            strokeWidth: 10,
                            trailWidth: 0,
                            duration: 1500,
                            text: {
                                value: '0'
                            },
                            step: function (state, bar) {
                                bar.setText((bar.value() * 100).toFixed(0));
                            }
                        });
                        circle.animate(progress / 100, function () {
                        });
                        $(this).removeClass('draw');
                    })

                }
            })
        }

        $(window).on('load scroll', animationClass);

        <?php } else { ?>
        function animationClass() {
            $('[class*="progress"').not('.visible').each(function () {
                var a = ($(this).offset().top - $(window).scrollTop()) < $(window).height(),
                    scrollUp = ($(this).offset().top - $(window).scrollTop()) > -$(this).height();
                if (a && scrollUp) {
                    $(this).addClass('visible');
                    $(this).each(function () {
                        $(this).find('.text').counter({
                            start: 0,
                            end: $(this).data('progress'),
                            time: 1,
                            step: 50
                        });
                    })
                }
            })
        }


        $(window).on('load scroll', animationClass);

        function progressResize() {
            <?php if ($type == 2){ ?>
            $('.progress-horizontal .text-inner').css('width', $('.progress-horizontal').width());
            <?php }else{?>
            $('.progress-vertical .text-inner').css('height', $('.progress-vertical').height());
            <?php } ?>
        }

        $(window).on('load resize', progressResize);


        <?php }?>
    })(jQuery)
</script>