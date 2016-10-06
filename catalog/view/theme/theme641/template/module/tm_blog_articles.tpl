<?php if ($articles) { ?>
    <div class="container">
    <div class="box blog_articles">
        <div class="box-heading">
            <h3><?php echo $heading_title; ?></h3>
        </div>
        <div class="box-content">
            <div class="row">
                <?php foreach ($articles as $article) { ?>
                    <div class="col-sm-4">
                        <div class="article-title">
                            <a href="<?php echo $article['href']; ?>"><?php echo $article['article_title'] ?></a>
                        </div>

                        <?php if ($show_date == 1 || $show_author == 1 || $show_comments == 1) {?>
                            <div class="article-sub-title">
                                <?php if ($show_date == 1) {?>
                                    <span class="article-date material-design-clock100"><?php echo $article['date_added']; ?></span>
                                <?php }?>
                                <?php if ($article['allow_comment'] && $show_comments == 1) { ?>
                                    <span class="article-comments material-design-add183"><a
                                            href="<?php echo $article['comment_href']; ?>"><?php echo $article['total_comment']; ?></a></span>
                                <?php } ?>
                                <?php  if ($show_author == 1) {?>
                                <span class="article-author material-design-user157"><a
                                        href="<?php echo $article['author_href']; ?>"><?php echo $article['author_name']; ?></a></span>
                                <?php }?>


                            </div>
                        <?php }?>

                        <?php if ($show_image == 1) { ?>
                            <figure class="article-image">
                                <img src="<?php echo $article['image']; ?>"
                                     alt="<?php echo $article['article_title'] ?>"/>
                            </figure>
                        <?php } ?>



                        <?php if ($article['description']) { ?>
                            <div class="article-description"><?php echo $article['description']; ?></div>
                        <?php } ?>

                        <?php if ($show_readmore == 1) { ?>
                            <a href='<?php echo $article['href']; ?>' class="btn"><?php echo $text_button_continue?> </a>
                        <?php } ?>

                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
    </div>
<?php } else { ?>
    <div class="buttons">
        <div class="center"><?php echo $text_no_found; ?></div>
    </div>
    </div>
<?php } ?>