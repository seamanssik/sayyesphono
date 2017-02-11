<div class="s-cd">
  <div class="s-nav">
    <div class="container">
      <div class="s-nav__container"></div>
    </div>
  </div>
  <div id="homeSlideShow">
    <?php foreach ($banners as $banner) { ?>
      <div class="s-item" style="background-image: url('<?php echo $banner['image']; ?>');">
        <img src="/" class="lazyOwl s-item__image" data-src="<?php echo $banner['image']; ?>" alt="<?php echo strip_tags($banner['title']); ?>">
        <div class="s-item__container">
          <div class="container">
            <div class="s-item__title"><?php echo $banner['title']; ?></div>
            <?php if ($banner['link']) { ?><a href="<?php echo $banner['link']; ?>" class="s-item__link"><span>Подробнее</span></a><?php } ?>
          </div>
        </div>
      </div>
    <?php } ?>
  </div>
</div>