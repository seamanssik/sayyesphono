<?php echo $header; ?>
  <div class="container">
    <div class="account-heading">
      <div class="h1"><?php echo $heading_title; ?></div>
      <ul class="breadcrumb account-breadcrumb h1-after">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
          <?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><l/i> <?php } else { ?><li class="active"><span><?php echo $breadcrumb['text']; ?></span></li><?php } ?>
        <?php } ?>
      </ul>
    </div>
    <div class="row">
      <?php echo $column_right; ?>
    </div>
    <div class="row row-account">
      <div class="col-ed-8 col-lg-9 col-md-9 col-sm-9">
<!--        <div class="h3"><span>Мои заказы</span></div>-->
        <br>
        <?php if ($orders) { ?>
          <div class="order-group" id="accordion" role="tablist" aria-multiselectable="true">
            <?php $i = 0; foreach ($orders as $order) { ?>
              <div class="panel order-group__item">
                <div class="order-group__heading" role="tab" id="heading<?php echo $i; ?>">
                  <a class="order-group__button<?php echo ($i != 0) ? ' collapsed' : ''; ?>" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<?php echo $i; ?>" aria-expanded="true" aria-controls="collapse<?php echo $i; ?>">
                    <span><?php echo $order['order']; ?></span>
                  </a>
                  <div class="icon"><span></span></div>
                </div>
                <div id="collapse<?php echo $i; ?>" class="collapse<?php echo ($i == 0) ? ' in' : ''; ?>" role="tabpanel" aria-labelledby="heading<?php echo $i; ?>">
                  <div class="order-group__body">
                    <div class="order-group__title">
                      <span><?php echo $order['date_added']; ?> - <?php echo $order['counts']; ?>, Статус: <?php echo $order['status']; ?></span>
                    </div>
                    <?php foreach ($order['products']['products'] as $product) { ?>
                      <div class="order-product">
                        <div class="row">
                          <div class="col-md-4 col-sm-4">
                            <img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" />
                          </div>
                          <div class="col-md-8 col-sm-8">
                            <div class="order-product__title">
                              <?php echo $product['name']; ?>
                            </div>
                            <div class="order-product__options">
                              <?php foreach ($product['option'] as $option) { ?>
                                <?php if ($option['option_id'] == 15) { ?>
                                  <div class="clearfix"></div>
                                <?php } ?>

                                <?php if ($option['option_id'] == 17) { ?>
                                  <div class="order-product__option" style="margin-bottom: 0">
                                    <div class="text"><?php echo $option['name']; ?></div>
                                    <div class="row">
                                      <?php foreach ($option['option_array'] as $option_array) { ?>
                                        <div class="col-lg-6 col-md-6 col-sm-12 order-product__option-info">
                                          <img src="<?php echo $option_array['image']; ?>" alt="<?php echo $option_array['value']; ?>" class="img-responsive">
                                          <div class="order-product__option-image">
                                            <span class="text"><?php echo $option_array['value']; ?></span>
                                            <span class="price"><b><?php echo $option_array['price']; ?></b> <?php echo $option_array['symbol']; ?></span>
                                          </div>
                                        </div>
                                      <?php } ?>
                                    </div>
                                  </div>
                                <?php } ?>

                                <?php if ($option['option_id'] == 13 || $option['option_id'] == 19) { ?>
                                  <div class="order-product__option">
                                    <div class="text"><?php echo $option['name']; ?></div>
                                    <div class="value"><?php echo $option['value']; ?></div>
                                  </div>
                                <?php } ?>

                                <?php if ($option['option_id'] == 15 || $option['option_id'] == 23 || $option['option_id'] == 24) { ?>
                                  <div class="order-product__option">
                                    <div class="text"><?php echo $option['name']; ?></div>
                                    <div class="value"><?php echo $option['value']; ?></div>
                                  </div>
                                <?php } ?>

                                <?php if ($option['option_id'] == 15 || $option['option_id'] == 17 || $option['option_id'] == 19 || $option['option_id'] == 24) { ?>
                                  <div class="clearfix"></div>
                                <?php } ?>
                              <?php } ?>
                            </div>
                            <div class="order-product__total">
                              <div class="text">Итого:</div>
                              <div>
                                <span class="price"><?php echo $product['total']; ?></span>
                                <span class="symbol"><?php echo $product['symbol']; ?></span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    <?php } ?>
                    <div class="order-group__total">
                      <span class="text">Общая стоимость:</span>
                      <span class="price"><?php echo $order['total']; ?></span>
                      <span class="symbol"><?php echo $order['symbol']; ?></span>
                    </div>
                  </div>
                </div>
              </div>
              <?php // echo '<pre>'; ?>
              <?php // print_r($order) ?>
              <?php // echo '</pre>'; ?>
            <?php $i++; } ?>
          </div>
        <?php } else { ?>
          <p class="text-message heading-left"><?php echo $text_empty; ?></p>
        <?php } ?>
      </div>
      <div class="col-ed-2 visible-ed"></div>
    </div>
  </div>
<?php echo $footer; ?>
<?php /* ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($orders) { ?>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-right"><?php echo $column_order_id; ?></td>
              <td class="text-left"><?php echo $column_customer; ?></td>
              <td class="text-right"><?php echo $column_product; ?></td>
              <td class="text-left"><?php echo $column_status; ?></td>
              <td class="text-right"><?php echo $column_total; ?></td>
              <td class="text-left"><?php echo $column_date_added; ?></td>
              <td></td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($orders as $order) { ?>
            <tr>
              <td class="text-right">#<?php echo $order['order_id']; ?></td>
              <td class="text-left"><?php echo $order['name']; ?></td>
              <td class="text-right"><?php echo $order['products']; ?></td>
              <td class="text-left"><?php echo $order['status']; ?></td>
              <td class="text-right"><?php echo $order['total']; ?></td>
              <td class="text-left"><?php echo $order['date_added']; ?></td>
              <td class="text-right"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php */ ?>
