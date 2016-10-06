<div class="box twitter soc_info">
    <div class="box-heading">
        <h3><?php echo $heading_title; ?></h3>
    </div>
    <div id="twitterRefresher" class="box-content">
        <a class="twitter-timeline" width="<?php echo $width; ?>" height="<?php echo $height; ?>"
           data-theme="<?php echo $color_scheme; ?>" href="<?php echo $page_url; ?>"
           data-tweet-limit="<?php echo $tweet_limit; ?>" data-widget-id="<?php echo $widget_id; ?>"></a>
    </div>
</div>


<script>
    window.twttr = (function (d, s, id) {
        var t, js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = "https://platform.twitter.com/widgets.js";
        fjs.parentNode.insertBefore(js, fjs);
        return window.twttr || (t = {
                _e: [], ready: function (f) {
                    t._e.push(f)
                }
            });
    }(document, "script", "twitter-wjs"));

    // Twitter refresher "class"
    var TwitterRefresh = function (options) {
        this.id = options.id;
        this.code = options.code;
    }

    TwitterRefresh.prototype.doRefresh = function () {
        document.getElementById(this.id).innerHTML = this.code;
        if (document.getElementById('twitter-wjs') != null) {
            document.getElementById('twitter-wjs').remove();
        }
        window.twttr = (function (d, s, id) {
            var t, js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s);
            js.id = id;
            js.src = "https://platform.twitter.com/widgets.js";
            fjs.parentNode.insertBefore(js, fjs);
            return window.twttr || (t = {
                    _e: [], ready: function (f) {
                        t._e.push(f)
                    }
                });
        }(document, "script", "twitter-wjs"));

    }

    // Create new instance
    var twtrefresher = new TwitterRefresh({
        id: 'twitterRefresher',
        code: '<a class="twitter-timeline" width="<?php echo $width; ?>" height="<?php echo $height; ?>" data-theme="<?php echo $color_scheme; ?>" href="<?php echo $page_url; ?>" data-tweet-limit="<?php echo $tweet_limit; ?>" data-widget-id="<?php echo $widget_id; ?>"></a>'
    });

    ;
    (function ($) {
        $(window).on('resize', function () {

        })
    })(jQuery)


</script>
