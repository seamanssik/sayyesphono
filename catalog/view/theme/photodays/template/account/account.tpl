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
  <div class="row row-account">
    <div class="col-ed-8 col-lg-9 col-md-9 col-sm-9">
      <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
      <?php } ?>
      <div class="h3"><span>Мой аккаунт</span></div>
      <ul class="list-unstyled account-list">
        <li class="account-list__item"><a href="<?php echo $edit; ?>" class="account-list__link"><?php echo $text_edit; ?></a></li>
        <li class="account-list__item"><a href="<?php echo $password; ?>" class="account-list__link"><?php echo $text_password; ?></a></li>
        <li class="account-list__item"><a href="<?php echo $address; ?>" class="account-list__link"><?php echo $text_address; ?></a></li>
      </ul>
      <div class="h3"><span>Мои заказы</span></div>
      <ul class="list-unstyled account-list">
        <li class="account-list__item"><a href="<?php echo $order; ?>" class="account-list__link"><?php echo $text_order; ?></a></li>
      </ul>
      <div class="h3"><span>Мои фото</span></div>
      <ul class="list-unstyled account-list">
        <li class="account-list__item"><a href="<?php echo $download; ?>" class="account-list__link"><?php echo $text_download; ?></a></li>
      </ul>
    </div>
    <div class="col-ed-2 visible-ed"></div>
    <?php echo $column_right; ?>
  </div>
</div>
<?php echo $footer; ?>