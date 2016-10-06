<div id="banner<?php echo $module; ?>" class="banners">
	<?php foreach ($banners as $banner) { ?>
	<?php if ($banner['link']) { ?>
	<div class="<?php echo $banner['title']; ?>">
		<div class="banner-box">
			<a class="clearfix" href="<?php echo $banner['link']; ?>">
				<div class="image">
				<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
			</div>
				<?php if ($banner['description']) { ?>
				<div class="s-desc"><?php echo $banner['description']; ?></div>
				<?php } ?>
			</a>
		</div>
	</div>
	<?php } else { ?>
	<div class="<?php echo $banner['title']; ?>">
		<div class="banner-box">
			<div class="image">
			<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
			</div>
			<?php if ($banner['description']) { ?>
			<div class="s-desc"><?php echo $banner['description']; ?></div>
			<?php } ?>
		</div>
	</div>
	<?php } ?>
	<?php } ?>
</div>
