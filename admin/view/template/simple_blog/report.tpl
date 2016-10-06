<?php echo $header; ?>
    <?php echo $column_left; ?>
    
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">             
                <h1><?php echo $heading_title; ?></h1>
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
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
            
            <?php if ($success) { ?>
                <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <?php } ?>
            
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?></h3>
                </div>
                
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                
                                <tr>
                                    <td class="text-left">
                                        <?php if ($sort == 'sbad.article_title') { ?>
        		                			<a href="<?php echo $sort_article_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_article_name; ?></a>
        		                		<?php } else { ?>
        		                			<a href="<?php echo $sort_article_title; ?>"><?php echo $column_article_name; ?></a>
        		                		<?php } ?>
                                    </td>
			                
                                    <td class="text-left">
                                        <?php if ($sort == 'sbau.author_name') { ?>
        		                			<a href="<?php echo $sort_author_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_author_name; ?></a>
        		                		<?php } else { ?>
        		                			<a href="<?php echo $sort_author_name; ?>"><?php echo $column_author_name; ?></a>
        		                		<?php } ?>
                                    </td>	
			                        
                                    <td class="text-right">
                                        <?php if ($sort == 'sbv.view') { ?>
        		                			<a href="<?php echo $sort_view; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_viewed; ?></a>
        		                		<?php } else { ?>
        		                			<a href="<?php echo $sort_view; ?>"><?php echo $column_viewed; ?></a>
        		                		<?php } ?>
                                    </td>
                                    
    				                <td class="text-right"><?php echo $column_percent; ?></td>
                                </tr>
                                
                            </thead>
                            
                            <tbody>
                                <?php if ($blog_views) { ?>
		          			        <?php foreach($blog_views as $blog_view) { ?>
                                        <tr>
                                            <td class="text-left"><?php echo $blog_view['article_title']; ?></td>
    	            						<td class="text-left"><?php echo $blog_view['author_name']; ?></td>
    	            						<td class="text-right"><?php echo $blog_view['viewed']; ?></td>
                    						<td class="text-right"><?php echo $blog_view['percent']; ?></td>
                                        </tr>
                                    <?php } ?>
                                <?php } else { ?>
                                    <tr>
    			          				<td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
    			          			</tr>
                                <?php } ?>
                            </tbody>
                            
                        </table>
                    </div>
                    
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-left"><?php echo $pagination; ?></div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right"><?php echo $results; ?></div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    
<?php echo $footer; ?>

<p>An increasing number of people now want to do their part to save the planet due to the worsening problems caused by
   global warming. Unfortunately, numerous people assume that going green is costly and time consuming. Read on to
   discover several immediate things you can do to get on the path to living green.</p>
<p>Recycling is the top way to start. A lot of people continue to place glass and aluminum items in their normal garbage
   even though recycling is not that hard to do today. In the US, it's not hard to locate a trash service that offers
   glass and aluminum recycling choices. Many people still continue to discard these items even though recycling bins
   are not hard to find. It merely takes a few minutes to wash off the cans and bottles before placing them into the
   recycle bin.</p>
<p>Newspapers are other items that overburden our landfills. Virtually all people will merely take their daily paper and
   toss it in the garbage when they are done with it. But, there are many other uses that you can get out of your
   newsprint other than poring over it. Did you know that you can keep your windows clean using newspapers? If you're
   tired of seeing small white fragments and streaks on your windowpanes after you clean them with paper towels and
   cleaner, try to use old newspapers instead. Several community groups run regular paper drives. Merely compile all of
   your old newspapers, put them in a stack, and see if the paper drive organizers will come to your location and pick
   them up.</p>
<p>One more thing that could help you to start to live green is to begin walking a bit more. Lots of people routinely
   drive short distances merely to buy one thing at their local corner market. If you just walk to the store, it can
   take less time, because you won't have to locate a parking spot, but you will be saving money on gas and helping to
   save planet Earth by not burning those fuels.</p>
<p>If you wish to save even more on gas, take the chance to carpool when you can and only mow your lawn two times a
   month instead of weekly. A gorgeous lawn is good to have but skipping an additional week before you mow again
   shouldn't significantly affect it. Using a manual push mower like those more normally used many, many years ago will
   help to save the environment even more. Numerous hardware shops still carry this type of mower.
</p>
<p>When people make up their mind to try green living, it's easy to make a few lifestyle modifications that will benefit
   our environment. Likewise, you can find lots of info all over the Internet on other ways to start living green, you
   only have to look for it.</p>