<?php if ($reviews) { ?>
	<?php foreach ($reviews as $review) { ?>
		<div class="review-item">
			<div class="row">
                <div class="col-sm-4 col-md-3">
					<div class="review-score">
						<?php for ($i = 1; $i <= 5; $i++) { ?>
							<?php if ($review['rating'] < $i) { ?>
                                <span class="fa-stack"><i class="fl-bigmug-line-favourites5 fa-stack-1x"></i></span>
							<?php } else { ?>
                                <span class="fa-stack"><i class="fl-bigmug-line-favourites5   fa-stack-1x"></i>
                                                <i class="fl-bigmug-line-favourites5 star  fa-stack-1x"></i></span>
							<?php } ?>
						<?php } ?>
					</div>
					<div class="review-author"><strong><?php echo $review['author']; ?></strong></div>
					<div class="review-date"><?php echo $review['date_added']; ?></div>
				</div>
                <div class="col-sm-8 col-md-9">
					<?php echo $review['text']; ?>
				</div>
			</div>
		</div>
	<?php } ?>
	<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
	<p><?php echo $text_no_reviews; ?></p>
<?php } ?>
