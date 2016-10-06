<?php if ($categories) { ?>
    <div class="box blog-categories">
        <div class="box-heading"><h3><?php echo $heading_title; ?></h3></div>
        <div class="box-content">

            <ul class="list-unstyled menu">
                <?php foreach ($categories as $category) { ?>
                    <li>
                        <?php if ($category['simple_blog_category_id'] == $category_id) { ?>
                            <a href="<?php echo $category['href']; ?>"
                               class="active"><?php echo $category['name']; ?></a>
                        <?php } else { ?>
                            <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                        <?php } ?>

                        <?php if ($category['children']) { ?>
                            <ul>
                                <?php foreach ($category['children'] as $child) { ?>
                                    <li>
                                        <?php if ($child['category_id'] == $child_id) { ?>
                                            <a href="<?php echo $child['href']; ?>" class="active"><?php echo $child['name']; ?></a>
                                        <?php } else { ?>
                                            <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                        <?php } ?>
                                    </li>
                                <?php } ?>
                            </ul>
                        <?php } ?>
                    </li>

                <?php } ?>
            </ul>
        </div>
    </div>
<?php } ?>

<?php if ((isset($category_search_article)) && ($category_search_article)) { ?>
    <div class="box blog-search">
        <div class="box-heading"><h3><?php echo $text_search_article ?></h3></div>
        <div class="box-content">
            <div id="blog-search">
                <div>
                    <input type="text" name="article_search" value="<?php echo $blog_search; ?>"
                           placeholder="<?php echo $text_search_article; ?>" class="form-control"
                           style="margin-bottom: 5px;"/>

                    <a id="button-search" href="#"></a>
                </div>
            </div>
        </div>
    </div>

<?php } ?>



<script type="text/javascript">
    jQuery('#blog-search input[name=\'article_search\']').keydown(function (e) {
        if (e.keyCode == 13) {
            jQuery('#button-search').trigger('click');
        }
    });

    jQuery('#button-search').bind('click', function (e) {
        e.preventDefault();
        url = 'index.php?route=simple_blog/search';

        var article_search = jQuery('#blog-search input[name=\'article_search\']').val();

        if (article_search) {
            url += '&blog_search=' + encodeURIComponent(article_search);
        }

        location = url;
    });
    jQuery(document).ready(function(){
    jQuery('.blog-categories .menu').find('li>ul').before('<i class="material-design-drop25"></i>');
    jQuery('.blog-categories .menu li i').on("click", function () {
        if (jQuery(this).hasClass('material-design-drop27')) {
            jQuery(this).removeClass('material-design-drop27').parent('li').find('> ul').slideToggle();
        }
        else {
            jQuery(this).addClass('material-design-drop27').parent('li').find('> ul').slideToggle();
        }
    });
    })
    ;
</script> 
