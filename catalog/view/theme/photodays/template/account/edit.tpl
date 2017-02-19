<?php echo $header; ?>
  <div class="container">
    <div class="row">
      <?php echo $column_right; ?>
    </div>
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
        <?php if($already_approve == false) {?>
        <div class="account-mobile-confirm">Внимание, <a href="<?php echo $action_phone;?>">подтвердите Ваш номер телефона.</a></div>
        <?php };?>
<!--        <div class="h3"><span>Изменить персональные данные</span></div>-->
        <br>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="account-form form-horizontal">
          <div class="form-group account-form__group required">
            <div class="col-sm-12">
              <label class="control-label account-form__label" for="input-firstname"><?php echo $entry_firstname; ?> </label>
              <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control account-form__control" />
              <?php if ($error_firstname) { ?>
                <div class="text-danger"><?php echo $error_firstname; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group account-form__group required">
            <div class="col-sm-12">
              <label class="control-label account-form__label" for="input-lastname"><?php echo $entry_lastname; ?></label>
              <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control account-form__control" />
              <?php if ($error_lastname) { ?>
                <div class="text-danger"><?php echo $error_lastname; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="form-group account-form__group required">
            <div class="col-sm-12">
              <label class="control-label account-form__label" for="input-lastname">Отчество</label>
              <input type="text" name="middlename" value="<?php echo $middlename; ?>" placeholder="Отчество" id="input-middlename" class="form-control account-form__control" />
              <?php if ($error_middlename) { ?>
                <div class="text-danger"><?php echo $error_middlename; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="form-group account-form__group required">
            <div class="col-sm-12">
              <label class="control-label account-form__label" for="input-email"><?php echo $entry_email; ?></label>
              <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control account-form__control" />
              <?php if ($error_email) { ?>
                <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group account-form__group required">
            <div class="col-sm-12">
              <label class="control-label account-form__label" for="input-telephone"><?php echo $entry_telephone; ?></label>
              <input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control account-form__control" />
              <?php if ($error_telephone) { ?>
                <div class="text-danger"><?php echo $error_telephone; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="form-group account-form__group required">
            <div class="col-sm-12">
              <label class="control-label account-form__label" for="input-vk">Ваш профайл VKontakte</label>
              <input type="text" name="vk" value="<?php echo $vk; ?>" placeholder="" id="input-vk" class="form-control account-form__control" />
            </div>
          </div>

          <div class="form-group account-form__group required">
            <div class="col-sm-12">
              <label class="control-label account-form__label" for="input-fb">Ваш профайл Facebook</label>
              <input type="text" name="fb" value="<?php echo $fb; ?>" placeholder="" id="input-fb" class="form-control account-form__control" />
            </div>
          </div>

          <div class="form-group account-form__group required">
            <div class="col-sm-12">
              <label class="control-label account-form__label" for="input-insta">Ваш профайл Instagram</label>
              <input type="text" name="insta" value="<?php echo $insta; ?>" placeholder="" id="input-insta" class="form-control account-form__control" />
            </div>
          </div>

          <?php foreach ($custom_fields as $custom_field) { ?>
              <?php if ($custom_field['location'] == 'account') { ?>
                <?php if ($custom_field['type'] == 'select') { ?>
                  <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label account-form__label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control account-form__control">
                        <option value=""><?php echo $text_select; ?></option>
                        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                          <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                            <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                          <?php } else { ?>
                            <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                          <?php } ?>
                        <?php } ?>
                      </select>
                      <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'radio') { ?>
                  <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label account-form__label"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <div>
                        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                          <div class="radio">
                            <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                              <label>
                                <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                <?php echo $custom_field_value['name']; ?></label>
                            <?php } else { ?>
                              <label>
                                <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                <?php echo $custom_field_value['name']; ?></label>
                            <?php } ?>
                          </div>
                        <?php } ?>
                      </div>
                      <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'checkbox') { ?>
                  <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label account-form__label"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <div>
                        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                          <div class="checkbox">
                            <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
                              <label>
                                <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                <?php echo $custom_field_value['name']; ?></label>
                            <?php } else { ?>
                              <label>
                                <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                <?php echo $custom_field_value['name']; ?></label>
                            <?php } ?>
                          </div>
                        <?php } ?>
                      </div>
                      <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'text') { ?>
                  <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label account-form__label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control account-form__control" />
                      <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'textarea') { ?>
                  <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label account-form__label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control account-form__control"><?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                      <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'file') { ?>
                  <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label account-form__label"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                      <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
                      <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'date') { ?>
                  <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label account-form__label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <div class="input-group date">
                        <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control account-form__control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                      <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'time') { ?>
                  <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label account-form__label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <div class="input-group time">
                        <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control account-form__control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                      <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'datetime') { ?>
                  <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label account-form__label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <div class="input-group datetime">
                        <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control account-form__control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                      <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                <?php } ?>
              <?php } ?>
            <?php } ?>
          <input type="hidden" name="fax" value="<?php echo $fax; ?>" />
          <div class="buttons clearfix">
            <div class="pull-left">
              <a href="<?php echo $back; ?>" class="btn__default"><?php echo $button_back; ?></a>
            </div>
            <div class="pull-right">
              <button type="submit" class="btn__primary"><span><?php echo $button_continue; ?></span></button>
            </div>
          </div>
        </form>
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
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
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
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend><?php echo $text_your_details; ?></legend>
          <div class="form-group account-form__group required">
            <label class="col-sm-2 control-label account-form__label" for="input-firstname"><?php echo $entry_firstname; ?> </label>
            <div class="col-sm-10">
              <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control account-form__control" />
              <?php if ($error_firstname) { ?>
              <div class="text-danger"><?php echo $error_firstname; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group account-form__group required">
            <label class="col-sm-2 control-label account-form__label" for="input-lastname"><?php echo $entry_lastname; ?></label>
            <div class="col-sm-10">
              <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control account-form__control" />
              <?php if ($error_lastname) { ?>
              <div class="text-danger"><?php echo $error_lastname; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group account-form__group required">
            <label class="col-sm-2 control-label account-form__label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control account-form__control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group account-form__group required">
            <label class="col-sm-2 control-label account-form__label" for="input-telephone"><?php echo $entry_telephone; ?></label>
            <div class="col-sm-10">
              <input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control account-form__control" />
              <?php if ($error_telephone) { ?>
              <div class="text-danger"><?php echo $error_telephone; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group account-form__group">
            <label class="col-sm-2 control-label account-form__label" for="input-fax"><?php echo $entry_fax; ?></label>
            <div class="col-sm-10">
              <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control account-form__control" />
            </div>
          </div>
          <?php foreach ($custom_fields as $custom_field) { ?>
          <?php if ($custom_field['location'] == 'account') { ?>
          <?php if ($custom_field['type'] == 'select') { ?>
          <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label account-form__label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control account-form__control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'radio') { ?>
          <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label account-form__label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="radio">
                  <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'checkbox') { ?>
          <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label account-form__label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="checkbox">
                  <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'text') { ?>
          <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label account-form__label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control account-form__control" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'textarea') { ?>
          <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label account-form__label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control account-form__control"><?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'file') { ?>
          <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label account-form__label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'date') { ?>
          <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label account-form__label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group date">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control account-form__control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'time') { ?>
          <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label account-form__label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group time">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control account-form__control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'datetime') { ?>
          <div class="form-group account-form__group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label account-form__label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group datetime">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control account-form__control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php } ?>
          <?php } ?>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
// Sort the custom fields
$('.form-group account-form__group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('.form-group account-form__group').length) {
		$('.form-group account-form__group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('.form-group account-form__group').length) {
		$('.form-group account-form__group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('.form-group account-form__group').length) {
		$('.form-group account-form__group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('.form-group account-form__group').length) {
		$('.form-group account-form__group:first').before(this);
	}
});
//--></script>
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});
//--></script>
<?php */ ?>
