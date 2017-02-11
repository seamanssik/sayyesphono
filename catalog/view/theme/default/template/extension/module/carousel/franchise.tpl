<div class="franchise-carousel">
  <div id="franchiseCarousel" class="owl-carousel">
    <?php foreach ($banners as $banner) { ?>
    <div class="item text-center">
      <a href="<?php echo $banner['popup']; ?>" title="<?php echo strip_tags($banner['title']); ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo strip_tags($banner['title']); ?>" class="img-responsive" /></a>
    </div>
    <?php } ?>
  </div>
</div>