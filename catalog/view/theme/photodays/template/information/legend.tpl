<?php echo $header; ?>
  <div class="container">
    <div class="row cd-legend-row">
      <div class="col-lg-2 col-md-2 col-sm-2">
        <div class="cd-legend-nav-bg"></div>
        <div class="cd-legend-nav" id="legend-control">
          <ul class="cd-legend-list active-2 hidden">
            <li class="cd-legend-list__item"><a href="#" class="cd-legend-list__link"><span>2009</span></a></li>
            <li class="cd-legend-list__item active"><a href="#" class="cd-legend-list__link"><span>2010</span></a></li>
            <li class="cd-legend-list__item"><a href="#" class="cd-legend-list__link"><span>2011</span></a></li>
            <li class="cd-legend-list__item"><a href="#" class="cd-legend-list__link"><span>2012</span></a></li>
            <li class="cd-legend-list__item"><a href="#" class="cd-legend-list__link"><span>2013</span></a></li>
            <li class="cd-legend-list__item"><a href="#" class="cd-legend-list__link"><span>2014</span></a></li>
          </ul>
        </div>
      </div>
      <div class="col-lg-10 col-md-10 col-sm-10">
        <div class="cd-legend-heading">
          <div class="h1 js-animate"><div class="c-text-masked"><span><?php echo $heading_title; ?></span></div></div>
          <ul class="breadcrumb h1-after">
            <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
              <?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><l/i> <?php } else { ?><li class="active"><span><?php echo $breadcrumb['text']; ?></span></li><?php } ?>
            <?php } ?>
          </ul>
        </div>
        <div class="cd-legend-container" id="legendCarousel">
          <?php foreach ($legends as $legend) { ?>
            <div class="row" data-toggle="legend-item" data-year="<?php echo $legend['year']; ?>">
              <div class="col-ed-<?php echo ($legend['image']) ? '5' : '12'; ?> col-lg-12">
                <div class="cd-legend-description">
                  <div class="cd-legend-description__year"><span><?php echo $legend['year']; ?></span></div>
                  <?php if($detect->isMobile() && !$detect->isTablet()) {?>
                    <div id="cd-legend-description__info-<?php echo $legend['legend_id']; ?>" class="cd-legend-description__info" style="height:300px;overflow:hidden;"><?php echo $legend['description']; ?></div>
                    <span data-toggle="openCloseText" data-element="cd-legend-description__info-<?php echo $legend['legend_id']; ?>" data-short="Скрыть" data-action="Читать дальше" data-height="300"><span>Читать дальше</span></>
                  <?php } else {?>
                    <div class="cd-legend-description__info"><?php echo $legend['description']; ?></div>
                  <?php };?>
                </div>
              </div>
              <?php if ($legend['image']) { ?>
                <div class="col-ed-7 col-lg-12">
                  <div class="cd-legend-images" id="legend-images-<?php echo $legend['legend_id']; ?>">
                    <?php foreach ($legend['image'] as $image) { ?>
                      <a href="<?php echo $image['popup']; ?>">
                        <div class="image-wrapper-legend">
                          <img src="<?php echo $image['thumb']; ?>">
                        </div>
                      </a>
                    <?php } ?>
                  </div>
                </div>
              <?php } ?>
            </div>
          <?php } ?>
        </div>
      </div>
    </div>
  </div>
<?php echo $footer; ?>