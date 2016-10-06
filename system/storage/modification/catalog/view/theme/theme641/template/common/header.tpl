<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
        <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--    --><?php //if ($icon) { ?>
<!--        <link href="--><?php //echo $icon; ?><!--" rel="icon"/>-->
<!--    --><?php //} ?>

    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
    <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <link href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">

    <link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/magnificent.css" rel="stylesheet">
    <link href="catalog/view/theme/<?php echo $theme_path; ?>/js/jquery.bxslider/jquery.bxslider.css" rel="stylesheet">
    <link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/photoswipe.css" rel="stylesheet">
    <link href="catalog/view/theme/<?php echo $theme_path; ?>/js/fancybox/jquery.fancybox.css" rel="stylesheet">
    <link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/material-design.css" rel="stylesheet">
    <link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/fl-bigmug-line.css" rel="stylesheet">
    <?php foreach ($styles as $style) { ?>
        <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
              media="<?php echo $style['media']; ?>"/>
    <?php } ?>
    <script src="catalog/view/theme/<?php echo $theme_path; ?>/js/common.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
    <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>
    <!--custom script-->
    <?php foreach ($scripts as $script) { ?>
        <?php if (strcmp($script, 'catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js') != 0) { ?>
            <script src="<?php echo $script; ?>" type="text/javascript"></script>
        <?php } ?>
    <?php } ?>
    <script src="catalog/view/javascript/camera/camera_nav.js"></script>
    <script src="catalog/view/theme/<?php echo $theme_path; ?>/js/device.min.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
    <div style=' clear: both; text-align:center; position: relative;'>
        <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
            <img src="catalog/view/theme/<?php echo $theme_path; ?>/image/warning_bar_0000_us.jpg" border="0" height="42" width="820"
                 alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."/>
        </a>
    </div>
    <![endif]-->
    <?php foreach ($analytics as $analytic) { ?>
        <?php echo $analytic; ?>
    <?php } ?>
    <link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/stylesheet.css" rel="stylesheet">
</head>
<body class="<?php echo $class; ?>">
<p id="gl_path" class="hidden"><?php echo $theme_path; ?></p>
<div id="page">
    <header>
        <nav id="top-links" class="nav toggle-wrap">
            <a class="toggle material-design-settings49" href='#'></a>
            <ul class="toggle_cont">
                <li class="first">
                    <a href="<?php echo $home; ?>" title="<?php echo $text_home; ?>" >
<!--                            <i class="material-design-home149"></i>-->
                        <span><?php echo $text_home; ?></span>
                    </a>
                </li>
                <li class="toggle-wrap">
                    <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"
                       class="toggle">
<!--                            <i class="material-design-user157"></i>-->
                        <span><?php echo $text_account; ?></span>
                        <span class="caret"></span></a>
                    <ul class="toggle_cont toggle_cont__right">
                        <?php if ($logged) { ?>
                            <li>
                                <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
                            </li>
                            <li>
                                <a href="<?php echo $order; ?>"><?php echo $text_order; ?></a>
                            </li>
                            <li>
                                <a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a>
                            </li>
                            <li>
                                <a href="<?php echo $download; ?>"><?php echo $text_download; ?></a>
                            </li>
                            <li>
                                <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
                            </li>
                        <?php } else { ?>
                            <li>
                                <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
                            </li>
                            <li>
                                <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
                            </li>
                        <?php } ?>
                    </ul>
                </li>
                <li>
                    <a href="<?php echo $compare; ?>" id="compare-total2"
                       title="<?php echo $text_compare; ?>">
<!--                            <i class="material-design-shuffle24"></i> -->
                        <span><?php echo $text_compare; ?></span></a>
                </li>
                <li>
                    <a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>">
<!--                            <i class="material-design-forward18"></i> -->
                        <span><?php echo $text_checkout; ?></span></a>
                </li>
            </ul>
        </nav>
        <div class="top-row">
        <div class="fleft">
            <ul class="top-menu">
                <li>
                    <a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>">
                        <span><?php echo $text_checkout; ?></span></a>
                </li>
                <li>
                    <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>">
                        <span><?php echo $text_account; ?></span>
                    </a>
                </li>
                <li>
                    <a href="<?php echo $login; ?>">
                        <span><?php echo $text_login; ?></span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="fright">
            <a class="wish_button" href="<?php echo $wishlist; ?>" id="wishlist-total"
                title="<?php echo $text_wishlist; ?>">
                <i class="fl-bigmug-line-like51"></i>
                <span><?php echo $text_wishlist; ?></span>
            </a>
            <?php echo $cart; ?>
            <?php echo $language; ?>
            <?php echo $currency; ?>
        </div>
        </div>

        <div id="stuck" class="stuck-menu">
            <div class="fleft">
                <div id="logo" class="logo">
                    <?php if ($logo) { ?>
                        <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>"
                                                            alt="<?php echo $name; ?>" class="img-responsive"/></a>
                    <?php } else { ?>
                        <h1>
                            <a href="<?php echo $home; ?>"><?php echo $name; ?></a>
                        </h1>
                    <?php } ?>
                </div>
            </div>
            <?php if ($categories) { ?>
            <div id="tm_menu" class="nav__primary">
                <?php if ($categories_tm) {
                    echo $categories_tm;
                } ?>
                <div class="clear"></div>
            </div>
            <?php } ?>
            <div class="fright">
                <?php echo $search; ?>
            </div>
        </div>

        <?php if ($categories) { ?>
            <div class="container">
                <div id="menu-gadget" class="menu-gadget" >
                    <?php if ($categories_tm) {
                        echo $categories_tm;
                    } ?>
                </div>
            </div>
        <?php } ?>

        <?php if ($header_top){?>
            <div class="header_modules"><?php echo $header_top;?></div>
        <?php }?>
    </header>

				<style>
				/**nthLevelMenu starts*/
				.nthLevelMenu{	background-clip: padding-box; background-color: #fff;	border: 1px solid rgba(0, 0, 0, 0.15);	border-radius: 4px; -webkit-border-radius: 4px;	-webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, 0.176); box-shadow: 0 6px 12px rgba(0, 0, 0, 0.176);	display: none;	left: 100%;	min-width: 160px; min-height:160px;	padding: 5px 0 0;	position: absolute;	top: -6px;	z-index: 1001; }

				#menu .dropdown a:first-child.hidea{display:none;}
				#menu .dropdown a.see-all { border-top: none; }
				@media (min-width: 768px) {
					#menu .dropdown:hover > .dropdown-menu1 {
						display: block;
					}
				}
				/**nthLevelMenu ends*/
				
				</style>
				<?php function nthLevelMenu($category,$text_all){ ob_start(); ?>
				<?php if (!empty($category['children'])) { ?>
				<li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
					<div class="dropdown-menu1 nthLevelMenu">
						<div class="dropdown-inner">
							<?php 
							foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
							<ul class="list-unstyled">
								<?php foreach ($children as $child) { ?>
								<?php if(!empty($child['children'])) { ?>
								<?php echo nthLevelMenu($child,$text_all); ?>
								<?php } else { ?>
								
				<?php if(isset($child['children'])) { ?>
				<?php echo nthLevelMenu($child,$text_all); ?>
				<?php } else { ?>
				<li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
				<?php } ?>
			
								<?php } ?>
								<?php } ?>
							</ul>
							<?php } ?>
						</div>
						<!-- <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['seeallname']; ?></a>--> </div>
				</li>
				<?php } else { ?>
				<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
				<?php } ?>	
			<?php $menu = ob_get_contents(); ob_end_clean();	return $menu; } ?>
			



