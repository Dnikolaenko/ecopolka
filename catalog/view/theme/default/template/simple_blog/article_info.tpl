<?php echo $header; ?>
    <div class="container">
        <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li>
                    <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                </li>
            <?php } ?>
        </ul>

        <div class="form-group">
            <?php echo $column_left; ?>
            <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-9'; ?>
            <?php } else { ?>
                <?php $class = 'col-sm-12'; ?>
            <?php } ?>

            <div id="content" class="<?php echo $class; ?>">
                <?php echo $content_top; ?>

                <div class="row form-group">
                    <?php if (isset($article_info_found)) { ?>
                        <article class="article-info">
                            <div class="article-title">
                                <h1><?php echo $article_info['article_title'] ?></h1>
                            </div>

                            <div class="article-sub-title">
                                <span
                                    class="article-date material-design-clock100"><?php echo $article_date_modified; ?></span>

                                <?php if ($article_info['allow_comment']) { ?>
                                    <span
                                        class="article-comments material-design-add183"><?php echo $total_comment; ?></span>
                                <?php } ?>
                                <span class="article-author material-design-user157"><?php echo $text_posted_by; ?>
                                    <a
                                        href="<?php echo $author_url; ?>"><?php echo $article_info['author_name']; ?></a></span>
                            </div>

                            <?php if ($image) { ?>
                                <?php if (isset($featured_found)) { ?>
                                    <div class="article-image">
                                        <img src="<?php echo $image; ?>"
                                             alt="<?php echo $article_info['article_title']; ?>"/>
                                    </div>
                                <?php } else { ?>
                                    <div class="article-thumbnail-image">
                                        <img src="<?php echo $image; ?>"
                                             alt="<?php echo $article_info['article_title']; ?>" height="100"
                                             width="100"/>
    									<span class="article-description">
    										<?php echo html_entity_decode($article_info['description'], ENT_QUOTES, 'UTF-8'); ?>
    									</span>
                                    </div>
                                <?php } ?>
                            <?php } ?>

                            <?php if (isset($featured_found)) { ?>
                                <div class="article-description">
                                    <?php echo html_entity_decode($article_info['description'], ENT_QUOTES, 'UTF-8'); ?>
                                </div>
                            <?php } else { ?>
                                <div class="article-description">
                                    <?php echo html_entity_decode($article_info['description'], ENT_QUOTES, 'UTF-8'); ?>
                                </div>
                            <?php } ?>

                            <?php if ($article_additional_description) { ?>
                                <?php foreach ($article_additional_description as $description) { ?>
                                    <div class="article-description">
                                        <?php echo html_entity_decode($description['additional_description'], ENT_QUOTES, 'UTF-8'); ?>
                                    </div>
                                <?php } ?>
                            <?php } ?>

                            <?php if ((isset($simple_blog_share_social_site)) && ($simple_blog_share_social_site)) { ?>
                                <span class="article-share">
<div class="addthis_sharing_toolbox"></div>


                            <!-- Go to www.addthis.com/dashboard to customize your tools -->
                            <script type="text/javascript"
                                    src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-55e053ac02ebd38e"
                                    async="async"></script>
    								</span>
                            <?php } ?>

                            <div class="product_tabs">
                                <ul class="nav nav-tabs">
                                    <?php if ($products) { ?>
                                        <li>
                                            <a href="#tab-products"
                                               data-toggle="tab"><?php echo $text_related_product; ?></a>
                                        </li>
                                    <?php } ?>
                                    <?php if (($simple_blog_related_articles) && ($related_articles)) { ?>
                                        <li>
                                            <a href="#tab-articles"
                                               data-toggle="tab"><?php echo $text_related_article; ?></a>
                                        </li>
                                    <?php } ?>
                                    <?php if ($simple_blog_author_information) { ?>
                                        <li>
                                            <a href="#tab-author"
                                               data-toggle="tab"><?php echo $text_author_information;; ?></a>
                                        </li>
                                    <?php } ?>
                                    <?php if ($article_info['allow_comment']) { ?>
                                        <li>
                                            <a href="#tab-comments"
                                               data-toggle="tab"><?php echo $text_related_comment; ?></a>
                                        </li>
                                    <?php } ?>

                                </ul>

                                <div class="tab-content">
                                    <?php if ($products) { ?>
                                        <div id="tab-products" class="tab-pane">
                                            <div class="row product-layout">
                                                <?php foreach ($products as $product) { ?>
                                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                                        <div class="product-thumb simple-blog-product">
                                                            <?php if ($product['thumb']) { ?>
                                                                <div class="image">
                                                                    <a href="<?php echo $product['href']; ?>"><img
                                                                            src="<?php echo $product['thumb']; ?>"
                                                                            alt="<?php echo $product['name']; ?>"
                                                                            title="<?php echo $product['name']; ?>"
                                                                            class="img-responsive"/></a>
                                                                </div>
                                                            <?php } ?>

                                                            <div class="caption text-center">
                                                                <div class="name">
                                                                    <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    <?php } ?>

                                    <?php if (($simple_blog_related_articles) && ($related_articles)) { ?>
                                        <div id="tab-articles" class="tab-pane related-article">
                                            <?php foreach ($related_articles as $related_article) { ?>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="image text-center">
                                                            <a href="<?php echo $related_article['article_href']; ?>">
                                                                <img src="<?php echo $related_article['image']; ?>"
                                                                     alt="<?php echo $related_article['article_title']; ?>"
                                                                     title="<?php echo $related_article['article_title']; ?>"
                                                                     class="img-responsive img-thumbnail"/>
                                                            </a>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6">
                                                        <h4>
                                                            <a href="<?php echo $related_article['article_href']; ?>"><?php echo $related_article['article_title']; ?></a>
                                                        </h4>

                                                        <div class="article-sub-title">
                                                            <span
                                                                class="article-date material-design-clock100"><?php echo $related_article['date_added']; ?></span>

                                                                    <span
                                                                        class="article-comments material-design-add183">
                                                                        <a href='<?php echo $related_article['article_href']; ?>#comment-section'><?php echo $related_article['total_comment'] . $text_comment_on_article; ?></a></span>

                                                                <span
                                                                    class="article-author material-design-user157">
                                                                    <a href="<?php echo $related_article['author_href']; ?>"><?php echo $related_article['author_name']; ?></a>
                                                                    </span>

                                                            <?php //echo $text_updated; ?><?php //echo $related_article['date_modified']; ?>


                                                        </div>

                                                        <div>
                                                            <?php if ($column_left || $column_right) { ?>
                                                                <?php echo utf8_substr(strip_tags(html_entity_decode($related_article['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '...'; ?>
                                                            <?php } else { ?>
                                                                <?php echo utf8_substr(strip_tags(html_entity_decode($related_article['description'], ENT_QUOTES, 'UTF-8')), 0, 250) . '...'; ?>
                                                            <?php } ?>
                                                        </div>

                                                        <div class="related-article-button">
                                                            <a href="<?php echo $url; ?>"
                                                               class="btn"><?php echo $button_continue_reading; ?></a>
                                                        </div>
                                                    </div>

                                                </div>
                                            <?php } ?>
                                        </div>
                                    <?php } ?>

                                    <?php if ($simple_blog_author_information) { ?>
                                        <div id="tab-author" class="tab-pane author-info">
                                            <?php if (isset($author_image)) { ?>
                                                <div class="image">
                                                    <img src="<?php echo $author_image; ?>"
                                                         alt="<?php echo $article_info['article_title']; ?>"/>
                                                </div>
                                            <?php } ?>
                                            <h3><?php echo $author_name ?></h3>
                                            <?php echo $author_description; ?>
                                        </div>
                                    <?php } ?>

                                    <?php if ($article_info['allow_comment']) { ?>
                                        <div id="tab-comments" class="tab-pane">
                                            <h2><?php echo $text_related_comment; ?></h2>

                                            <div class="form-group">
                                                <div id="comments" class="blog-comment-info">
                                                    <div id="comment-list"></div>
                                                    <div id="comment-section"></div>
                                                    <h2 id="review-title">
                                                        <?php echo $text_write_comment; ?>
                                                        <div class="reply-cancel">
                                                        <span id="reply-remove"
                                                              style="display:none; cursor: pointer;"
                                                              onclick="removeCommentId();">
                                                            <?php echo $text_cancel_reply ?>
                                                        </span>
                                                        </div>
                                                    </h2>
                                                    <input type="hidden" name="blog_article_reply_id" value="0"
                                                           id="blog-reply-id"/>

                                                    <div class="comment-left">
                                                        <div class="form-group">
                                                            <label for="comment-name">
                                                                <strong><?php echo $entry_name; ?></strong>
                                                            </label>
                                                            <input type="text" name="name" value="" id="comment-name"
                                                                   class="form-control"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="comment-text">
                                                                <strong><?php echo $entry_review; ?></strong>
                                                            </label>
                                                            <textarea name="text" class="form-control"
                                                                      id="comment-text"></textarea>
                                                            <span
                                                                style="font-size: 11px;"><?php echo $text_note; ?></span>
                                                        </div>
                                                        <?php if ($site_key) { ?>
                                                            <div class="form-group">
                                                                <div class="col-sm-12">
                                                                    <div class="g-recaptcha"
                                                                         data-sitekey="<?php echo $site_key; ?>"></div>
                                                                </div>
                                                            </div>
                                                        <?php } ?>
                                                    </div>
                                                    <br/>

                                                    <div class="text-right">
                                                        <a id="button-comment" class="btn btn-info">
                                                            <span><?php echo $button_submit; ?></span></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php } ?>
                                </div>

                        </article>
                    <?php } else { ?>
                        <h3 class="text-center"><?php echo $text_no_found; ?></h3>
                    <?php } ?>
                </div>

                <?php echo $content_bottom; ?>
            </div>

            <?php echo $column_right; ?>
        </div>
    </div>

    <script type="text/javascript">
        function removeCommentId() {
            $("#blog-reply-id").val(0);
            $("#reply-remove").css('display', 'none');
        }
    </script>

    <script type="text/javascript">
        $('#comment-list .pagination a').delegate('click', function () {
            $('#comment-list').fadeOut('slow');

            $('#comment-list').load(this.href);

            $('#comment-list').fadeIn('slow');

            return false;
        });

        $('#comment-list').load('index.php?route=simple_blog/article/comment&simple_blog_article_id=<?php echo $simple_blog_article_id; ?>');

        $('.product_tabs li:first-child a').tab('show');

    </script>

    <script type="text/javascript">
        $('#button-comment').bind('click', function () {
            $.ajax({
                type: 'POST',
                url: 'index.php?route=simple_blog/article/writeComment&simple_blog_article_id=<?php echo $simple_blog_article_id; ?>',
                dataType: 'json',
                data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()) + '&reply_id=' + encodeURIComponent($('input[name=\'blog_article_reply_id\']').val()),
                beforeSend: function () {
                    $('.success, .warning').remove();
                    $('#button-comment').attr('disabled', true);
                    $('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
                },
                complete: function () {
                    $('#button-comment').attr('disabled', false);
                    $('.attention').remove();
                },
                success: function (data) {

                    $('.alert').remove();

                    if (data['error']) {
                        $('#review-title').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + data['error'] + '</div>');
                    }

                    if (data['success']) {
                        $('#review-title').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + data['success'] + '</div>');

                        $('input[name=\'name\']').val('');
                        $('textarea[name=\'text\']').val('');
                        $('input[name=\'captcha\']').val('');
                        $("#blog-reply-id").val(0);
                        $("#reply-remove").css('display', 'none');

                        $('#comment-list').load('index.php?route=simple_blog/article/comment&simple_blog_article_id=<?php echo $simple_blog_article_id; ?>');
                    }
                }
            });
        });
    </script>


<?php echo $footer; ?>