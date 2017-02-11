<div class="list-group account-nav">
  <?php if (!$logged) { ?>
  <a href="<?php echo $login; ?>" class="list-group-item account-nav__link"><?php echo $text_login; ?></a>
    <a href="<?php echo $register; ?>" class="list-group-item account-nav__link"><?php echo $text_register; ?></a>
    <a href="<?php echo $forgotten; ?>" class="list-group-item account-nav__link"><?php echo $text_forgotten; ?></a>
  <?php } ?>
  <?php if ($logged) { ?>
    <a href="<?php echo $account; ?>" class="list-group-item account-nav__link <?php echo $nav['account']; ?>"><?php echo $text_account; ?></a>
    <a href="<?php echo $edit; ?>" class="list-group-item account-nav__link <?php echo $nav['edit']; ?>"><?php echo $text_edit; ?></a>
    <a href="<?php echo $password; ?>" class="list-group-item account-nav__link <?php echo $nav['password']; ?>"><?php echo $text_password; ?></a>
    <a href="<?php echo $address; ?>" class="list-group-item account-nav__link <?php echo $nav['address']; ?>"><?php echo $text_address; ?></a>
    <a href="<?php echo $order; ?>" class="list-group-item account-nav__link <?php echo $nav['order']; ?>"><?php echo $text_order; ?></a>
    <a href="<?php echo $download; ?>" class="list-group-item account-nav__link <?php echo $nav['download']; ?>"><?php echo $text_download; ?></a>
    <a href="<?php echo $logout; ?>" class="list-group-item account-nav__link"><?php echo $text_logout; ?></a>
  <?php } ?>
</div>
