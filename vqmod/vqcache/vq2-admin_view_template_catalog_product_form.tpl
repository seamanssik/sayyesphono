<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
            <li><a href="#tab-links" data-toggle="tab"><?php echo $tab_links; ?></a></li>
            <li><a href="#tab-attribute" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <li><a href="#tab-option" data-toggle="tab"><?php echo $tab_option; ?></a></li>
            <li class="hidden"><a href="#tab-recurring" data-toggle="tab"><?php echo $tab_recurring; ?></a></li>
            <li class="hidden"><a href="#tab-discount" data-toggle="tab"><?php echo $tab_discount; ?></a></li>
            <li class="hidden"><a href="#tab-special" data-toggle="tab"><?php echo $tab_special; ?></a></li>
            <li><a href="#tab-image" data-toggle="tab"><?php echo $tab_image; ?></a></li>
            <li><a href="#tab-review" data-toggle="tab">Отзывы</a></li>
            <li><a href="#tab-studio" data-toggle="tab">Студия</a></li>
            <li><a href="#tab-history" data-toggle="tab">История</a></li>
            <li class="hidden"><a href="#tab-reward" data-toggle="tab"><?php echo $tab_reward; ?></a></li>
            <li class="hidden"><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>

        <!-- Related Options / Связанные опции << -->
				<?php if ($related_options_installed) { ?>
				<li><a href="#tab-related_options" data-toggle="tab"><?php echo $related_options_title; ?></a></li>
				<?php } ?>
        <!-- >> Related Options / Связанные опции -->
      
      
          </ul>
          <div class="tab-content">
            <div class="tab-pane" id="tab-history">
              <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                  <thead>
                  <tr>
                    <td class="text-left"><?php echo $entry_image; ?></td>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td class="text-left">
                      <a href="" id="thumb-image_history" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb_history; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                      <input type="hidden" name="image_history" value="<?php echo $image_history; ?>" id="input-image_history" />
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <ul class="nav nav-tabs" id="language-history">
                <?php foreach ($languages as $language) { ?>
                  <li><a href="#language-history<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php } ?>
              </ul>
              <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                  <div class="tab-pane" id="language-history<?php echo $language['language_id']; ?>">
                    <div class="form-group required">
                      <label class="col-sm-2 control-label" for="input-history_title<?php echo $language['language_id']; ?>">Заголовок</label>
                      <div class="col-sm-10">
                        <input type="text" name="product_description[<?php echo $language['language_id']; ?>][history_title]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['history_title'] : ''; ?>" placeholder="Заголовок" id="input-history_title<?php echo $language['language_id']; ?>" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group required">
                      <label class="col-sm-2 control-label" for="input-history_signature<?php echo $language['language_id']; ?>">Подпись</label>
                      <div class="col-sm-10">
                        <input type="text" name="product_description[<?php echo $language['language_id']; ?>][history_signature]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['history_signature'] : ''; ?>" placeholder="Подпись" id="input-history_signature<?php echo $language['language_id']; ?>" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-history_link<?php echo $language['language_id']; ?>">Ссылка</label>
                      <div class="col-sm-10">
                        <input type="text" name="product_description[<?php echo $language['language_id']; ?>][history_link]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['history_link'] : ''; ?>" placeholder="Ссылка" id="input-history_link<?php echo $language['language_id']; ?>" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-history_text<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                      <div class="col-sm-10">
                        <textarea name="product_description[<?php echo $language['language_id']; ?>][history_text]" placeholder="<?php echo $entry_description; ?>" id="input-history_text<?php echo $language['language_id']; ?>" class="form-control summernote-fix"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['history_text'] : ''; ?></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-history_video<?php echo $language['language_id']; ?>">Видео</label>
                      <div class="col-sm-10">
                        <textarea name="product_description[<?php echo $language['language_id']; ?>][history_video]" placeholder="Видео" id="input-history_text<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['history_video'] : ''; ?></textarea>
                      </div>
                    </div>
                  </div>
                <?php } ?>
              </div>
            </div>
            <div class="tab-pane active" id="tab-general">
              <ul class="nav nav-tabs" id="language">
                <?php foreach ($languages as $language) { ?>
                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php } ?>
              </ul>
              <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-city<?php echo $language['language_id']; ?>">Город</label>
                    <div class="col-sm-10">
                      <input type="text" name="product_description[<?php echo $language['language_id']; ?>][city]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['city'] : ''; ?>" placeholder="Город" id="input-city<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_city[$language['language_id']])) { ?>
                        <div class="text-danger"><?php echo $error_city[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="product_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_name[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="product_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="product_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_meta_title[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_meta_title[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="product_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                    <div class="col-sm-10">
                      <textarea name="product_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group hidden">
                    <label class="col-sm-2 control-label" for="input-tag<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_tag; ?>"><?php echo $entry_tag; ?></span></label>
                    <div class="col-sm-10">
                      <input type="text" name="product_description[<?php echo $language['language_id']; ?>][tag]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['tag'] : ''; ?>" placeholder="<?php echo $entry_tag; ?>" id="input-tag<?php echo $language['language_id']; ?>" class="form-control" />
                    </div>
                  </div>
                </div>
                <?php } ?>
              </div>
            </div>
            <div class="tab-pane" id="tab-data">
              <!-- FIELD PROMO BANNER -->
              <div class="form-group">
                <label class="col-sm-2 control-label" for="select-promo"><?php echo $entry_promo_banner; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-md-4">
                      <select id="select-promo" name="promo" class="form-control">
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php foreach ($promotags as $promotag) { ?>
                          <?php if ($promotag['promo_direction'] == '0') { ?>
                            <?php if ($promotag['promo_tags_id'] == $promo) { ?>
                              <option value="<?php echo $promotag['promo_tags_id']; ?>" selected="selected"><?php echo $promotag['promo_text']; ?></option>
                            <?php } else { ?>
                              <option value="<?php echo $promotag['promo_tags_id']; ?>"><?php echo $promotag['promo_text']; ?></option>
                            <?php } ?>
                          <?php } ?>
                        <?php } ?>
                      </select>
                    </div>
                    <div class="col-md-4">
                      <div class="input-group date">
                        <input type="text" name="promo_date_start" value="<?php if ( $promo_date_start == '0000-00-00' ) { echo ''; } else { echo $promo_date_start; }  ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                        <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button></span>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="input-group date">
                        <input type="text" name="promo_date_end" value="<?php if ( $promo_date_end == '0000-00-00' ) { echo ''; } else { echo $promo_date_end; }  ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                        <span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- FIELD PROMO BANNER -->

              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-model"><?php echo $entry_model; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="model" value="<?php echo $model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
                  <?php if ($error_model) { ?>
                  <div class="text-danger"><?php echo $error_model; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-sku"><span data-toggle="tooltip" title="<?php echo $help_sku; ?>"><?php echo $entry_sku; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="sku" value="<?php echo $sku; ?>" placeholder="<?php echo $entry_sku; ?>" id="input-sku" class="form-control" />
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-upc"><span data-toggle="tooltip" title="<?php echo $help_upc; ?>"><?php echo $entry_upc; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="upc" value="<?php echo $upc; ?>" placeholder="<?php echo $entry_upc; ?>" id="input-upc" class="form-control" />
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-ean"><span data-toggle="tooltip" title="<?php echo $help_ean; ?>"><?php echo $entry_ean; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="ean" value="<?php echo $ean; ?>" placeholder="<?php echo $entry_ean; ?>" id="input-ean" class="form-control" />
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-jan"><span data-toggle="tooltip" title="<?php echo $help_jan; ?>"><?php echo $entry_jan; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="jan" value="<?php echo $jan; ?>" placeholder="<?php echo $entry_jan; ?>" id="input-jan" class="form-control" />
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-isbn"><span data-toggle="tooltip" title="<?php echo $help_isbn; ?>"><?php echo $entry_isbn; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="isbn" value="<?php echo $isbn; ?>" placeholder="<?php echo $entry_isbn; ?>" id="input-isbn" class="form-control" />
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-mpn"><span data-toggle="tooltip" title="<?php echo $help_mpn; ?>"><?php echo $entry_mpn; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="mpn" value="<?php echo $mpn; ?>" placeholder="<?php echo $entry_mpn; ?>" id="input-mpn" class="form-control" />
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-location"><?php echo $entry_location; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="location" value="<?php echo $location; ?>" placeholder="<?php echo $entry_location; ?>" id="input-location" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-price"><?php echo $entry_price; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="price" value="<?php echo $price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="form-control" />
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-tax-class"><?php echo $entry_tax_class; ?></label>
                <div class="col-sm-10">
                  <select name="tax_class_id" id="input-tax-class" class="form-control">
                    <option value="0"><?php echo $text_none; ?></option>
                    <?php foreach ($tax_classes as $tax_class) { ?>
                    <?php if ($tax_class['tax_class_id'] == $tax_class_id) { ?>
                    <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="quantity" value="<?php echo $quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="form-control" />
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-minimum"><span data-toggle="tooltip" title="<?php echo $help_minimum; ?>"><?php echo $entry_minimum; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="minimum" value="<?php echo $minimum; ?>" placeholder="<?php echo $entry_minimum; ?>" id="input-minimum" class="form-control" />
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-subtract"><?php echo $entry_subtract; ?></label>
                <div class="col-sm-10">
                  <select name="subtract" id="input-subtract" class="form-control">
                    <?php if ($subtract) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-stock-status"><span data-toggle="tooltip" title="<?php echo $help_stock_status; ?>"><?php echo $entry_stock_status; ?></span></label>
                <div class="col-sm-10">
                  <select name="stock_status_id" id="input-stock-status" class="form-control">
                    <?php foreach ($stock_statuses as $stock_status) { ?>
                    <?php if ($stock_status['stock_status_id'] == $stock_status_id) { ?>
                    <option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label"><?php echo $entry_shipping; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($shipping) { ?>
                    <input type="radio" name="shipping" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="shipping" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$shipping) { ?>
                    <input type="radio" name="shipping" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="shipping" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
                  <?php if ($error_keyword) { ?>
                  <div class="text-danger"><?php echo $error_keyword; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-date-available"><?php echo $entry_date_available; ?></label>
                <div class="col-sm-3">
                  <div class="input-group date">
                    <input type="text" name="date_available" value="<?php echo $date_available; ?>" placeholder="<?php echo $entry_date_available; ?>" data-date-format="YYYY-MM-DD" id="input-date-available" class="form-control" />
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                    </span></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-date-action">Дата фотосесси</label>
                <div class="col-sm-3">
                  <div class="input-group date">
                    <input type="text" name="date_action" value="<?php echo $date_action; ?>" placeholder="Дата фотосесси" data-date-format="YYYY-MM-DD" id="input-date-action" class="form-control" />
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                    </span></div>
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-length"><?php echo $entry_dimension; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-4">
                      <input type="text" name="length" value="<?php echo $length; ?>" placeholder="<?php echo $entry_length; ?>" id="input-length" class="form-control" />
                    </div>
                    <div class="col-sm-4">
                      <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
                    </div>
                    <div class="col-sm-4">
                      <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-length-class"><?php echo $entry_length_class; ?></label>
                <div class="col-sm-10">
                  <select name="length_class_id" id="input-length-class" class="form-control">
                    <?php foreach ($length_classes as $length_class) { ?>
                    <?php if ($length_class['length_class_id'] == $length_class_id) { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-weight"><?php echo $entry_weight; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="weight" value="<?php echo $weight; ?>" placeholder="<?php echo $entry_weight; ?>" id="input-weight" class="form-control" />
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-weight-class"><?php echo $entry_weight_class; ?></label>
                <div class="col-sm-10">
                  <select name="weight_class_id" id="input-weight-class" class="form-control">
                    <?php foreach ($weight_classes as $weight_class) { ?>
                    <?php if ($weight_class['weight_class_id'] == $weight_class_id) { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="status" id="input-status" class="form-control">
                    <?php if ($status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group ">
                <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-links">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-manufacturer"><span data-toggle="tooltip" title="<?php echo $help_manufacturer; ?>"><?php echo $entry_manufacturer; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="manufacturer" value="<?php echo $manufacturer; ?>" placeholder="<?php echo $entry_manufacturer; ?>" id="input-manufacturer" class="form-control" />
                  <input type="hidden" name="manufacturer_id" value="<?php echo $manufacturer_id; ?>" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
                  <div id="product-category" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($product_categories as $product_category) { ?>
                    <div id="product-category<?php echo $product_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_category['name']; ?>
                      <input type="hidden" name="product_category[]" value="<?php echo $product_category['category_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-filter"><span data-toggle="tooltip" title="<?php echo $help_filter; ?>"><?php echo $entry_filter; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="filter" value="" placeholder="<?php echo $entry_filter; ?>" id="input-filter" class="form-control" />
                  <div id="product-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($product_filters as $product_filter) { ?>
                    <div id="product-filter<?php echo $product_filter['filter_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_filter['name']; ?>
                      <input type="hidden" name="product_filter[]" value="<?php echo $product_filter['filter_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <div class="checkbox">
                      <label>
                        <?php if (in_array(0, $product_store)) { ?>
                        <input type="checkbox" name="product_store[]" value="0" checked="checked" />
                        <?php echo $text_default; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="product_store[]" value="0" />
                        <?php echo $text_default; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php foreach ($stores as $store) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($store['store_id'], $product_store)) { ?>
                        <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                        <?php echo $store['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" />
                        <?php echo $store['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-2 control-label" for="input-download"><span data-toggle="tooltip" title="<?php echo $help_download; ?>"><?php echo $entry_download; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="download" value="" placeholder="<?php echo $entry_download; ?>" id="input-download" class="form-control" />
                  <div id="product-download" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($product_downloads as $product_download) { ?>
                    <div id="product-download<?php echo $product_download['download_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_download['name']; ?>
                      <input type="hidden" name="product_download[]" value="<?php echo $product_download['download_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group ">
                <label class="col-sm-2 control-label" for="input-related"><span data-toggle="tooltip" title="<?php echo $help_related; ?>"><?php echo $entry_related; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="related" value="" placeholder="<?php echo $entry_related; ?>" id="input-related" class="form-control" />
                  <div id="product-related" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($product_relateds as $product_related) { ?>
                    <div id="product-related<?php echo $product_related['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_related['name']; ?>
                      <input type="hidden" name="product_related[]" value="<?php echo $product_related['product_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-attribute">
              <div class="table-responsive">
                <table id="attribute" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_attribute; ?></td>
                      <td class="text-left"><?php echo $entry_text; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $attribute_row = 0; ?>
                    <?php foreach ($product_attributes as $product_attribute) { ?>
                    <tr id="attribute-row<?php echo $attribute_row; ?>">
                      <td class="text-left" style="width: 40%;"><input type="text" name="product_attribute[<?php echo $attribute_row; ?>][name]" value="<?php echo $product_attribute['name']; ?>" placeholder="<?php echo $entry_attribute; ?>" class="form-control" />
                        <input type="hidden" name="product_attribute[<?php echo $attribute_row; ?>][attribute_id]" value="<?php echo $product_attribute['attribute_id']; ?>" /></td>
                      <td class="text-left"><?php foreach ($languages as $language) { ?>
                        <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                          <textarea name="product_attribute[<?php echo $attribute_row; ?>][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"><?php echo isset($product_attribute['product_attribute_description'][$language['language_id']]) ? $product_attribute['product_attribute_description'][$language['language_id']]['text'] : ''; ?></textarea>
                        </div>
                        <?php } ?></td>
                      <td class="text-left"><button type="button" onclick="$('#attribute-row<?php echo $attribute_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $attribute_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addAttribute();" data-toggle="tooltip" title="<?php echo $button_attribute_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-option">
              <div class="row">
                <div class="col-sm-2">
                  <ul class="nav nav-pills nav-stacked" id="option">
                    <?php $option_row = 0; ?>
                    <?php foreach ($product_options as $product_option) { ?>
                    <li><a href="#tab-option<?php echo $option_row; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-option<?php echo $option_row; ?>\']').parent().remove(); $('#tab-option<?php echo $option_row; ?>').remove(); $('#option a:first').tab('show');"></i> <?php echo $product_option['name']; ?></a></li>
                    <?php $option_row++; ?>
                    <?php } ?>
                    <li>
                      <input type="text" name="option" value="" placeholder="<?php echo $entry_option; ?>" id="input-option" class="form-control" />
                    </li>
                  </ul>
                </div>
                <div class="col-sm-10">
                  <div class="tab-content">
                    <?php $option_row = 0; ?>
                    <?php $option_value_row = 0; ?>
                    <?php foreach ($product_options as $product_option) { ?>
                    <div class="tab-pane" id="tab-option<?php echo $option_row; ?>">
                      <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_id]" value="<?php echo $product_option['product_option_id']; ?>" />
                      <input type="hidden" name="product_option[<?php echo $option_row; ?>][name]" value="<?php echo $product_option['name']; ?>" />
                      <input type="hidden" name="product_option[<?php echo $option_row; ?>][option_id]" value="<?php echo $product_option['option_id']; ?>" />
                      <input type="hidden" name="product_option[<?php echo $option_row; ?>][type]" value="<?php echo $product_option['type']; ?>" />
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-required<?php echo $option_row; ?>"><?php echo $entry_required; ?></label>
                        <div class="col-sm-10">
                          <select name="product_option[<?php echo $option_row; ?>][required]" id="input-required<?php echo $option_row; ?>" class="form-control">
                            <?php if ($product_option['required']) { ?>
                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                            <option value="0"><?php echo $text_no; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_yes; ?></option>
                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                            <?php } ?>
                          </select>
                        </div>
                      </div>
                      <?php if ($product_option['type'] == 'text') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control" />
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'textarea') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <textarea name="product_option[<?php echo $option_row; ?>][value]" rows="5" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control"><?php echo $product_option['value']; ?></textarea>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'file') { ?>
                      <div class="form-group" style="display: none;">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control" />
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'date') { ?>
                        <div class="form-group">
                          <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                          <div class="col-sm-3">
                            <div class="input-group date">
                              <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY.MM.DD" id="input-value<?php echo $option_row; ?>" class="form-control" />
                            <span class="input-group-btn">
                            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                            </span></div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-2 control-label" for="input-multiple-date<?php echo $option_row; ?>">Даты</label>
                          <div class="col-sm-10">
                            <input type="text" name="product_option[<?php echo $option_row; ?>][multiple_date]" value="<?php echo $product_option['multiple_date']; ?>" placeholder="Даты" data-date-format="yyyy-mm-dd" id="input-multiple-date<?php echo $option_row; ?>" class="form-control multidate" />
                          </div>
                        </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'time') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <div class="input-group time">
                            <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="HH:mm" id="input-value<?php echo $option_row; ?>" class="form-control" />
                            <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'datetime') { ?>
                        <div class="form-group">
                          <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                          <div class="col-sm-10">
                            <div class="input-group datetime">
                              <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY.MM.DD HH:mm" id="input-value<?php echo $option_row; ?>" class="form-control" />
                              <span class="input-group-btn">
                                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                              </span>
                            </div>
                          </div>
                        </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') { ?>
                      <div class="table-responsive">
                        <table id="option-value<?php echo $option_row; ?>" class="table table-striped table-bordered table-hover">
                          <thead>
                            <tr>
                              <td class="text-left"><?php echo $entry_option_value; ?></td>
                              <td class="text-right"><?php echo $entry_quantity; ?></td>
                              <td class="text-left"><?php echo $entry_subtract; ?></td>
                              <td class="text-right"><?php echo $entry_price; ?></td>
                              <td class="text-right"><?php echo $entry_option_points; ?></td>
                              <td class="text-right"><?php echo $entry_weight; ?></td>
                              <td></td>
                              <td></td>
                            </tr>
                          </thead>
                          <tbody>
                            <?php foreach ($product_option['product_option_value'] as $product_option_value) { ?>
                            <tr id="option-value-row<?php echo $option_value_row; ?>">
                              <td class="text-left"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][option_value_id]" class="form-control">
                                  <?php if (isset($option_values[$product_option['option_id']])) { ?>
                                  <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                                  <?php if ($option_value['option_value_id'] == $product_option_value['option_value_id']) { ?>
                                  <option value="<?php echo $option_value['option_value_id']; ?>" selected="selected"><?php echo $option_value['name']; ?></option>
                                  <?php } else { ?>
                                  <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                                  <?php } ?>
                                  <?php } ?>
                                  <?php } ?>
                                </select>
                                <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_value_id]" value="<?php echo $product_option_value['product_option_value_id']; ?>" /></td>
                              <td class="text-right"><input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]" value="<?php echo $product_option_value['quantity']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>
                              <td class="text-left"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]" class="form-control">
                                  <?php if ($product_option_value['subtract']) { ?>
                                  <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                  <option value="0"><?php echo $text_no; ?></option>
                                  <?php } else { ?>
                                  <option value="1"><?php echo $text_yes; ?></option>
                                  <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                  <?php } ?>
                                </select></td>
                              <td class="text-right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]" class="form-control">
                                  <?php if ($product_option_value['price_prefix'] == '+') { ?>
                                  <option value="+" selected="selected">+</option>
                                  <?php } else { ?>
                                  <option value="+">+</option>
                                  <?php } ?>
                                  <?php if ($product_option_value['price_prefix'] == '-') { ?>
                                  <option value="-" selected="selected">-</option>
                                  <?php } else { ?>
                                  <option value="-">-</option>
                                  <?php } ?>
                                </select>
                                <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price]" value="<?php echo $product_option_value['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                              <td class="text-right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points_prefix]" class="form-control">
                                  <?php if ($product_option_value['points_prefix'] == '+') { ?>
                                  <option value="+" selected="selected">+</option>
                                  <?php } else { ?>
                                  <option value="+">+</option>
                                  <?php } ?>
                                  <?php if ($product_option_value['points_prefix'] == '-') { ?>
                                  <option value="-" selected="selected">-</option>
                                  <?php } else { ?>
                                  <option value="-">-</option>
                                  <?php } ?>
                                </select>
                                <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points]" value="<?php echo $product_option_value['points']; ?>" placeholder="<?php echo $entry_points; ?>" class="form-control" /></td>
                              <td class="text-right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight_prefix]" class="form-control">
                                  <?php if ($product_option_value['weight_prefix'] == '+') { ?>
                                  <option value="+" selected="selected">+</option>
                                  <?php } else { ?>
                                  <option value="+">+</option>
                                  <?php } ?>
                                  <?php if ($product_option_value['weight_prefix'] == '-') { ?>
                                  <option value="-" selected="selected">-</option>
                                  <?php } else { ?>
                                  <option value="-">-</option>
                                  <?php } ?>
                                </select>
                                <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight]" value="<?php echo $product_option_value['weight']; ?>" placeholder="<?php echo $entry_weight; ?>" class="form-control" /></td>
                              <td class="text-left">
                                <a href="" id="thumb-image-option<?php echo $option_value_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $product_option_value['product_option_image_thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_image]" value="<?php echo $product_option_value['product_option_image']; ?>" id="input-image-option<?php echo $option_value_row; ?>" />
                              </td>
                              <td class="text-left"><button type="button" onclick="$(this).tooltip('destroy');$('#option-value-row<?php echo $option_value_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                            </tr>
                            <?php $option_value_row++; ?>
                            <?php } ?>
                          </tbody>
                          <tfoot>
                            <tr>
                              <td colspan="7"></td>
                              <td class="text-left"><button type="button" onclick="addOptionValue('<?php echo $option_row; ?>');" data-toggle="tooltip" title="<?php echo $button_option_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                            </tr>
                          </tfoot>
                        </table>
                      </div>
                      <select id="option-values<?php echo $option_row; ?>" style="display: none;">
                        <?php if (isset($option_values[$product_option['option_id']])) { ?>
                        <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                        <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select>
                      <?php } ?>
                    </div>
                    <?php $option_row++; ?>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-recurring">
              <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_recurring; ?></td>
                      <td class="text-left"><?php echo $entry_customer_group; ?></td>
                      <td class="text-left"></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $recurring_row = 0; ?>
                    <?php foreach ($product_recurrings as $product_recurring) { ?>

                    <tr id="recurring-row<?php echo $recurring_row; ?>">
                      <td class="text-left"><select name="product_recurring[<?php echo $recurring_row; ?>][recurring_id]" class="form-control">
                          <?php foreach ($recurrings as $recurring) { ?>
                          <?php if ($recurring['recurring_id'] == $product_recurring['recurring_id']) { ?>
                          <option value="<?php echo $recurring['recurring_id']; ?>" selected="selected"><?php echo $recurring['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                      <td class="text-left"><select name="product_recurring[<?php echo $recurring_row; ?>][customer_group_id]" class="form-control">
                          <?php foreach ($customer_groups as $customer_group) { ?>
                          <?php if ($customer_group['customer_group_id'] == $product_recurring['customer_group_id']) { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                      <td class="text-left"><button type="button" onclick="$('#recurring-row<?php echo $recurring_row; ?>').remove()" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $recurring_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addRecurring()" data-toggle="tooltip" title="<?php echo $button_recurring_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>

        <!-- Related Options / Связанные опции << -->
				<?php if ($related_options_installed) { ?>
					<div class="tab-pane" id="tab-related_options">
			
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_ro_use; ?></label>
							<div class="col-sm-10" >
						<?php
						
							$vopts = $variants_options;
							/*
							echo "<input type='checkbox' name='related_options_use' id='related_options_use' onchange='related_options_use_check()' value='1' ".(($related_options_use)?("checked"):(""))."><label for='related_options_use'>&nbsp;".$entry_ro_use."</label><br><br>";
							*/
						?>
						
								<label class="radio-inline">
									<input type="radio" name="related_options_use" id="related_options_use" value="1" <?php if ($related_options_use) echo "checked"; ?> onchange="related_options_use_check()" />
									<?php echo $text_yes; ?>
								</label>
								<label class="radio-inline">
									<input type="radio" name="related_options_use" value="" <?php if (!$related_options_use) echo "checked"; ?> onchange="related_options_use_check()" />
									<?php echo $text_no; ?>
								</label>
						
							</div>
						</div>
						
						<div id='related-options-use'>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="related_options_variant" ><?php echo $entry_ro_variant; ?></label>
								
									<div class="col-sm-4" >
										<?php
										//print_r($ro_settings);
											echo "<select name='related_options_variant' id='related_options_variant' class='form-control'>";
											echo "<option value='0'>".$text_ro_all_options."</option>";
											//$ro_settings = $this->config->get('related_options');
											
											if (isset($ro_settings['ro_use_variants'])	&& $ro_settings['ro_use_variants']) {
												foreach ($vopts as $vo_id => $vo_arr) {
													if ($vo_id != 0) {
														echo "<option value='".$vo_id."' ".(($vo_id==$related_options_variant)?("selected"):("")).">".$vo_arr['name']."</option>";
													}
												}
											}
										?>
										</select>
									</div>
									<div class="col-sm-6" >
									<button type="button" id="ro_add_all_variants" onclick='fill_all_variants();' data-toggle="tooltip" title="" class='btn btn-primary' data-original-title="<?php echo $entry_add_all_variants; ?>"><?php echo $entry_add_all_variants; ?></button>
									<button type="button" id="ro_add_product_variant" onclick='fill_all_variants(1);' data-toggle="tooltip" title="" class='btn btn-primary' data-original-title="<?php echo $entry_add_product_variants; ?>"><?php echo $entry_add_product_variants; ?></button>
									</div>
									<!--
									<div class="col-sm-2" >
										<button type="button" id="ro_add_all_variants" data-toggle="tooltip" title="" class='btn btn-primary' data-original-title="<?php echo $entry_add_all_variants; ?>"><?php echo $entry_add_all_variants; ?></button>
									</div>
									<div class="col-sm-2" >	
										<button type="button" id="ro_add_product_variant" data-toggle="tooltip" title="" class='btn btn-primary' data-original-title="<?php echo $entry_add_product_variants; ?>"><?php echo $entry_add_product_variants; ?></button>
									</div>
									-->
								
							
							
								<input type='hidden' name='related_options_discount' value='1'>
								<input type='hidden' name='related_options_special' value='1'>
							</div>	
			
							<div class="table-responsive" id="related_options_table_div" >
								<table id="related_options_table" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<td class="text-left"><?php echo $entry_options_values; ?></td>
											<td class="text-left" width="90"><?php echo $entry_related_options_quantity; ?>:</td>
									
											<?php if (isset($related_options_settings['spec_model']) && $related_options_settings['spec_model'] ) { ?>	
												<td class="text-left" width="90"><?php echo $entry_model; ?></td>
											<?php	}	?>
										
											<?php if (isset($related_options_settings['spec_sku']) && $related_options_settings['spec_sku'] ) { ?>	
												<td class="text-left" width="90"><?php echo $entry_sku; ?></td>
											<?php } ?>
										
											<?php if (isset($related_options_settings['spec_upc']) && $related_options_settings['spec_upc'] ) { ?>	
												<td class="text-left" width="90"><?php echo $entry_upc; ?></td>
											<?php } ?>
											
											<?php if (isset($related_options_settings['spec_ean']) && $related_options_settings['spec_ean'] ) { ?>	
												<td class="text-left" width="90"><?php echo $entry_ean; ?></td>
											<?php } ?>
											
											<?php if (isset($related_options_settings['spec_ofs']) && $related_options_settings['spec_ofs'] ) { ?>	
												<td class="text-left" width="150"><?php echo $entry_stock_status; ?></td> 
											<?php } ?>
											
											<?php if (isset($related_options_settings['spec_location']) && $related_options_settings['spec_location'] ) { ?>	
												<td class="text-left" width="90"><?php echo $entry_location; ?></td>
											<?php } ?>
											
											<?php if (isset($related_options_settings['spec_weight']) && $related_options_settings['spec_weight'] ) { ?>	
												<td class="text-left" width="90"><?php echo $entry_weight; ?></td>
											<?php } ?>
										
											<?php if (isset($related_options_settings['spec_price']) && $related_options_settings['spec_price'] ) { ?>	
												<td class="text-left" width="90" ><?php echo $entry_price; ?></td>
												<?php if (isset($related_options_settings['spec_price_discount']) && $related_options_settings['spec_price_discount'] ) { ?>
													<td class="text-left" style="90"><?php echo $tab_discount; ?>: <font style="font-weight:normal;font-size:80%;">(<?php echo str_replace(":","",$entry_customer_group." | ".$entry_quantity." | ".$entry_price);?>)</font></td>
												<?php } ?>
												<?php if (isset($related_options_settings['spec_price_special']) && $related_options_settings['spec_price_special'] ) { ?>
													<td class="text-left" style="90"><?php echo $tab_special; ?>: <font style="font-weight:normal;font-size:80%;">(<?php echo str_replace(":","",$entry_customer_group." | ".$entry_price);?>)</font></td>
												<?php } ?>
											<?php	} ?>
										
											<?php if (isset($related_options_settings['select_first']) && $related_options_settings['select_first'] == 1 ) { ?>	
												<td class="text-left" width="90" style="white-space:nowrap"><?php echo $entry_select_first_short; ?>:</td>
											<?php } ?>
											
											<td class="text-left" width="90"></td>
										
									<thead>
								
									<tbody id="tbody-related_options"></tbody>
			
								</table>
							
								
								<div class="col-sm-2" >
									<button type="button" id="add_related_option_button" onclick="add_related_option(false);" data-toggle="tooltip" title="" class='btn btn-primary' data-original-title="<?php echo $entry_add_related_options; ?>"><?php echo $entry_add_related_options; ?></button>
								</div>
							
							</div>
							
						</div>	
							
						<span class="help-block" style="margin-top: 30px;">
							<?php echo $entry_ro_version.": ".$ro_version; ?> | <?php echo $text_ro_support; ?> | <?php echo $text_extension_page; ?>
						</span>
				
					</div>
			
				<?php } ?>

        <!-- >> Related Options / Связанные опции -->
      
      
            <div class="tab-pane" id="tab-discount">
              <div class="table-responsive">
                <table id="discount" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_customer_group; ?></td>
                      <td class="text-right"><?php echo $entry_quantity; ?></td>
                      <td class="text-right"><?php echo $entry_priority; ?></td>
                      <td class="text-right"><?php echo $entry_price; ?></td>
                      <td class="text-left"><?php echo $entry_date_start; ?></td>
                      <td class="text-left"><?php echo $entry_date_end; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $discount_row = 0; ?>
                    <?php foreach ($product_discounts as $product_discount) { ?>
                    <tr id="discount-row<?php echo $discount_row; ?>">
                      <td class="text-left"><select name="product_discount[<?php echo $discount_row; ?>][customer_group_id]" class="form-control">
                          <?php foreach ($customer_groups as $customer_group) { ?>
                          <?php if ($customer_group['customer_group_id'] == $product_discount['customer_group_id']) { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                      <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][quantity]" value="<?php echo $product_discount['quantity']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>
                      <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][priority]" value="<?php echo $product_discount['priority']; ?>" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>
                      <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][price]" value="<?php echo $product_discount['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                      <td class="text-left" style="width: 20%;"><div class="input-group date">
                          <input type="text" name="product_discount[<?php echo $discount_row; ?>][date_start]" value="<?php echo $product_discount['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                      <td class="text-left" style="width: 20%;"><div class="input-group date">
                          <input type="text" name="product_discount[<?php echo $discount_row; ?>][date_end]" value="<?php echo $product_discount['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                      <td class="text-left"><button type="button" onclick="$('#discount-row<?php echo $discount_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $discount_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="6"></td>
                      <td class="text-left"><button type="button" onclick="addDiscount();" data-toggle="tooltip" title="<?php echo $button_discount_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-special">
              <div class="table-responsive">
                <table id="special" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_customer_group; ?></td>
                      <td class="text-right"><?php echo $entry_priority; ?></td>
                      <td class="text-right"><?php echo $entry_price; ?></td>
                      <td class="text-left"><?php echo $entry_date_start; ?></td>
                      <td class="text-left"><?php echo $entry_date_end; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $special_row = 0; ?>
                    <?php foreach ($product_specials as $product_special) { ?>
                    <tr id="special-row<?php echo $special_row; ?>">
                      <td class="text-left"><select name="product_special[<?php echo $special_row; ?>][customer_group_id]" class="form-control">
                          <?php foreach ($customer_groups as $customer_group) { ?>
                          <?php if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                      <td class="text-right"><input type="text" name="product_special[<?php echo $special_row; ?>][priority]" value="<?php echo $product_special['priority']; ?>" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>
                      <td class="text-right"><input type="text" name="product_special[<?php echo $special_row; ?>][price]" value="<?php echo $product_special['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                      <td class="text-left" style="width: 20%;"><div class="input-group date">
                          <input type="text" name="product_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $product_special['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                      <td class="text-left" style="width: 20%;"><div class="input-group date">
                          <input type="text" name="product_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $product_special['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                      <td class="text-left"><button type="button" onclick="$('#special-row<?php echo $special_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $special_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="5"></td>
                      <td class="text-left"><button type="button" onclick="addSpecial();" data-toggle="tooltip" title="<?php echo $button_special_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-image">
              <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                  <thead>
                  <tr>
                    <td class="text-left"><?php echo $entry_image; ?></td>
                    <td class="text-left">Логотип</td>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td class="text-left">
                      <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                      <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" /></td>
                    <td class="text-left">
                      <a href="" id="thumb-logo" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb_logo; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                      <input type="hidden" name="logo" value="<?php echo $logo; ?>" id="input-logo" />
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <div class="table-responsive">
                <table id="images" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_additional_image; ?></td>
                      <td class="text-right"><?php echo $entry_sort_order; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $image_row = 0; ?>
                    <?php foreach ($product_images as $product_image) { ?>
                    <tr id="image-row<?php echo $image_row; ?>">
                      <td class="text-left"><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $product_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="input-image<?php echo $image_row; ?>" /></td>
                      <td class="text-right"><input type="text" name="product_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>
                      <td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $image_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" title="<?php echo $button_image_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-review">
              <div class="table-responsive">
                <table id="reviews" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left">Фото</td>
                      <td class="text-left">Отзыв</td>
                      <td class="text-right">Порядок сортировки</td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $review_row = 0; ?>
                    <?php foreach ($product_reviews as $product_review) { ?>
                    <tr id="review-row<?php echo $review_row; ?>">
                      <td class="text-left">
                        <a href="" id="thumb-review<?php echo $review_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $product_review['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                        <input type="hidden" name="product_reviews[<?php echo $review_row; ?>][image]" value="<?php echo $product_review['image']; ?>" id="input-review<?php echo $review_row; ?>" />
                      </td>
                      <td class="text-left">
                        <div class="row">
                          <div class="col-sm-12"><textarea type="text" name="product_reviews[<?php echo $review_row; ?>][review]" placeholder="Отзыв" class="form-control summernote summernote-fix"><?php echo $product_review['review']; ?></textarea><br></div>
                        </div>
                        <div class="row">
                          <div class="col-sm-6"><input type="text" name="product_reviews[<?php echo $review_row; ?>][expert]" value="<?php echo $product_review['expert']; ?>" placeholder="Эксперт" class="form-control" /></div>
                          <div class="col-sm-6"><input type="text" name="product_reviews[<?php echo $review_row; ?>][position]" value="<?php echo $product_review['position']; ?>" placeholder="Должность" class="form-control" /></div>
                        </div>
                      </td>
                      <td class="text-right">
                        <input type="text" name="product_reviews[<?php echo $review_row; ?>][sort_order]" value="<?php echo $product_review['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" />
                      </td>
                      <td class="text-left">
                        <button type="button" onclick="$('#review-row<?php echo $review_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                      </td>
                    </tr>
                    <?php $review_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="3"></td>
                      <td class="text-left"><button type="button" onclick="addReview();" data-toggle="tooltip" title="<?php echo $button_image_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-studio">
              <div class="table-responsive">
                <table id="studios" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left">Фото</td>
                      <td class="text-left">Описание</td>
                      <td class="text-right">Порядок сортировки</td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $studio_row = 0; ?>
                    <?php foreach ($product_studios as $product_studio) { ?>
                    <tr id="studio-row<?php echo $studio_row; ?>">
                      <td class="text-left">
                        <a href="" id="thumb-studio<?php echo $studio_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $product_studio['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                        <input type="hidden" name="product_studios[<?php echo $studio_row; ?>][image]" value="<?php echo $product_studio['image']; ?>" id="input-studio<?php echo $studio_row; ?>" />
                      </td>
                      <td class="text-left">
                        <div class="row">
                          <div class="col-sm-12"><textarea type="text" name="product_studios[<?php echo $studio_row; ?>][text]" placeholder="Описание" class="form-control summernote summernote-fix"><?php echo $product_studio['text']; ?></textarea><br></div>
                        </div>
                        <div class="row">
                          <div class="col-sm-6"><input type="text" name="product_studios[<?php echo $studio_row; ?>][title]" value="<?php echo $product_studio['title']; ?>" placeholder="Заголовок" class="form-control" /></div>
                          <div class="col-sm-6"><input type="text" name="product_studios[<?php echo $studio_row; ?>][name]" value="<?php echo $product_studio['name']; ?>" placeholder="Название" class="form-control" /></div>
                        </div>
                      </td>
                      <td class="text-right">
                        <input type="text" name="product_studios[<?php echo $studio_row; ?>][sort_order]" value="<?php echo $product_studio['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" />
                      </td>
                      <td class="text-left">
                        <button type="button" onclick="$('#studio-row<?php echo $studio_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                      </td>
                    </tr>
                    <?php $studio_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="3"></td>
                      <td class="text-left"><button type="button" onclick="addStudio();" data-toggle="tooltip" title="<?php echo $button_image_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-reward">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-points"><span data-toggle="tooltip" title="<?php echo $help_points; ?>"><?php echo $entry_points; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="points" value="<?php echo $points; ?>" placeholder="<?php echo $entry_points; ?>" id="input-points" class="form-control" />
                </div>
              </div>
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_customer_group; ?></td>
                      <td class="text-right"><?php echo $entry_reward; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <tr>
                      <td class="text-left"><?php echo $customer_group['name']; ?></td>
                      <td class="text-right"><input type="text" name="product_reward[<?php echo $customer_group['customer_group_id']; ?>][points]" value="<?php echo isset($product_reward[$customer_group['customer_group_id']]) ? $product_reward[$customer_group['customer_group_id']]['points'] : ''; ?>" class="form-control" /></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-design">
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_store; ?></td>
                      <td class="text-left"><?php echo $entry_layout; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="text-left"><?php echo $text_default; ?></td>
                      <td class="text-left"><select name="product_layout[0]" class="form-control">
                          <option value=""></option>
                          <?php foreach ($layouts as $layout) { ?>
                          <?php if (isset($product_layout[0]) && $product_layout[0] == $layout['layout_id']) { ?>
                          <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                    </tr>
                    <?php foreach ($stores as $store) { ?>
                    <tr>
                      <td class="text-left"><?php echo $store['name']; ?></td>
                      <td class="text-left"><select name="product_layout[<?php echo $store['store_id']; ?>]" class="form-control">
                          <option value=""></option>
                          <?php foreach ($layouts as $layout) { ?>
                          <?php if (isset($product_layout[$store['store_id']]) && $product_layout[$store['store_id']] == $layout['layout_id']) { ?>
                          <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
  <script>
    $(".summernote-fix").summernote({
      height: 150
    });
  </script>
  <!-- OCFilter start -->
  <script type="text/javascript"><!--
  ocfilter.php = {
  	text_select: '<?php echo $text_select; ?>',
  	ocfilter_select_category: '<?php echo $ocfilter_select_category; ?>',
  	entry_values: '<?php echo $entry_values; ?>',
  	tab_ocfilter: '<?php echo $tab_ocfilter; ?>'
  };

  ocfilter.php.languages = [];

  <?php foreach ($languages as $language) { ?>
  ocfilter.php.languages.push({
  	'language_id': <?php echo $language['language_id']; ?>,
  	'name': '<?php echo $language['name']; ?>',
    'image': '<?php echo $language['image']; ?>'
  });
  <?php } ?>

  //--></script>
  <!-- OCFilter end -->
      
  <script type="text/javascript"><!--
// Manufacturer
$('input[name=\'manufacturer\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					manufacturer_id: 0,
					name: '<?php echo $text_none; ?>'
				});

				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['manufacturer_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'manufacturer\']').val(item['label']);
		$('input[name=\'manufacturer_id\']').val(item['value']);
	}
});

// Category
$('input[name=\'category\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'category\']').val('');

		$('#product-category' + item['value']).remove();

		$('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-category').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Filter
$('input[name=\'filter\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['filter_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter\']').val('');

		$('#product-filter' + item['value']).remove();

		$('#product-filter').append('<div id="product-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_filter[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-filter').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Downloads
$('input[name=\'download\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/download/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['download_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'download\']').val('');

		$('#product-download' + item['value']).remove();

		$('#product-download').append('<div id="product-download' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_download[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-download').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Related
$('input[name=\'related\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'related\']').val('');

		$('#product-related' + item['value']).remove();

		$('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_related[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-related').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>
  <script type="text/javascript"><!--
var attribute_row = <?php echo $attribute_row; ?>;

function addAttribute() {
    html  = '<tr id="attribute-row' + attribute_row + '">';
	html += '  <td class="text-left" style="width: 20%;"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" placeholder="<?php echo $entry_attribute; ?>" class="form-control" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
	html += '  <td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><textarea name="product_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"></textarea></div>';
    <?php } ?>
	html += '  </td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#attribute-row' + attribute_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
    html += '</tr>';

	$('#attribute tbody').append(html);

	attributeautocomplete(attribute_row);

	attribute_row++;
}

function attributeautocomplete(attribute_row) {
	$('input[name=\'product_attribute[' + attribute_row + '][name]\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/attribute/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							category: item.attribute_group,
							label: item.name,
							value: item.attribute_id
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'product_attribute[' + attribute_row + '][name]\']').val(item['label']);
			$('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').val(item['value']);
		}
	});
}

$('#attribute tbody tr').each(function(index, element) {
	attributeautocomplete(index);
});
//--></script>
  <script type="text/javascript"><!--
var option_row = <?php echo $option_row; ?>;

$('input[name=\'option\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/option/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						category: item['category'],
						label: item['name'],
						value: item['option_id'],
						type: item['type'],
						option_value: item['option_value']
					}
				}));
			}
		});
	},
	'select': function(item) {
		html  = '<div class="tab-pane" id="tab-option' + option_row + '">';
		html += '	<input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="" />';
		html += '	<input type="hidden" name="product_option[' + option_row + '][name]" value="' + item['label'] + '" />';
		html += '	<input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + item['value'] + '" />';
		html += '	<input type="hidden" name="product_option[' + option_row + '][type]" value="' + item['type'] + '" />';

		html += '	<div class="form-group">';
		html += '	  <label class="col-sm-2 control-label" for="input-required' + option_row + '"><?php echo $entry_required; ?></label>';
		html += '	  <div class="col-sm-10"><select name="product_option[' + option_row + '][required]" id="input-required' + option_row + '" class="form-control">';
		html += '	      <option value="1"><?php echo $text_yes; ?></option>';
		html += '	      <option value="0" selected><?php echo $text_no; ?></option>';
		html += '	  </select></div>';
		html += '	</div>';

		if (item['type'] == 'text') {
			html += '	<div class="form-group">';
			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
			html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
			html += '	</div>';
		}

		if (item['type'] == 'textarea') {
			html += '	<div class="form-group">';
			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
			html += '	  <div class="col-sm-10"><textarea name="product_option[' + option_row + '][value]" rows="5" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control"></textarea></div>';
			html += '	</div>';
		}

		if (item['type'] == 'file') {
			html += '	<div class="form-group" style="display: none;">';
			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
			html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
			html += '	</div>';
		}

		if (item['type'] == 'date') {
			html += '	<div class="form-group">';
			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
			html += '	  <div class="col-sm-3"><div class="input-group date"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY.MM.DD" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
			html += '	</div>';
			html += '	<div class="form-group">';
			html += '	  <label class="col-sm-2 control-label" for="input-multiple-value' + option_row + '">Даты:</label>';
			html += '	  <div class="col-sm-3"><input type="text" name="product_option[' + option_row + '][multiple_date]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="yyyy.mm.d" id="input-multiple-value' + option_row + '" class="form-control multidate" /></div>';
			html += '	</div>';
		}

		if (item['type'] == 'time') {
			html += '	<div class="form-group">';
			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
			html += '	  <div class="col-sm-10"><div class="input-group time"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
			html += '	</div>';
            html += '	<div class="form-group">';
            html += '	  <label class="col-sm-2 control-label" for="input-multiple-value' + option_row + '">Даты:</label>';
            html += '	  <div class="col-sm-3"><input type="text" name="product_option[' + option_row + '][multiple_date]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="yyyy.mm.dd" id="input-multiple-value' + option_row + '" class="form-control multidate" /></div>';
            html += '	</div>';
		}

		if (item['type'] == 'datetime') {
			html += '	<div class="form-group">';
			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
			html += '	  <div class="col-sm-10"><div class="input-group datetime"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY.MM.DD HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
			html += '	</div>';
            html += '	<div class="form-group">';
            html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '">Даты:</label>';
            html += '	  <div class="col-sm-3"><input type="text" name="product_option[' + option_row + '][multiple_date]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="yyyy-mm-dd" id="input-value' + option_row + '" class="form-control multidate" /></div>';
            html += '	</div>';
		}

		if (item['type'] == 'select' || item['type'] == 'radio' || item['type'] == 'checkbox' || item['type'] == 'image') {
			html += '<div class="table-responsive">';
			html += '  <table id="option-value' + option_row + '" class="table table-striped table-bordered table-hover">';
			html += '  	 <thead>';
			html += '      <tr>';
			html += '        <td class="text-left"><?php echo $entry_option_value; ?></td>';
			html += '        <td class="text-right"><?php echo $entry_quantity; ?></td>';
			html += '        <td class="text-left"><?php echo $entry_subtract; ?></td>';
			html += '        <td class="text-right"><?php echo $entry_price; ?></td>';
			html += '        <td class="text-right"><?php echo $entry_option_points; ?></td>';
			html += '        <td class="text-right"><?php echo $entry_weight; ?></td>';
			html += '        <td></td>';
			html += '      </tr>';
			html += '  	 </thead>';
			html += '  	 <tbody>';
			html += '    </tbody>';
			html += '    <tfoot>';
			html += '      <tr>';
			html += '        <td colspan="6"></td>';
			html += '        <td class="text-left"><button type="button" onclick="addOptionValue(' + option_row + ');" data-toggle="tooltip" title="<?php echo $button_option_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>';
			html += '      </tr>';
			html += '    </tfoot>';
			html += '  </table>';
			html += '</div>';

            html += '  <select id="option-values' + option_row + '" style="display: none;">';

            for (i = 0; i < item['option_value'].length; i++) {
				html += '  <option value="' + item['option_value'][i]['option_value_id'] + '">' + item['option_value'][i]['name'] + '</option>';
            }

            html += '  </select>';
			html += '</div>';
		}

		$('#tab-option .tab-content').append(html);

		$('#option > li:last-child').before('<li><a href="#tab-option' + option_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick=" $(\'#option a:first\').tab(\'show\');$(\'a[href=\\\'#tab-option' + option_row + '\\\']\').parent().remove(); $(\'#tab-option' + option_row + '\').remove();"></i>' + item['label'] + '</li>');

		$('#option a[href=\'#tab-option' + option_row + '\']').tab('show');
		
		$('[data-toggle=\'tooltip\']').tooltip({
			container: 'body',
			html: true
		});

		$('.date').datetimepicker({
			pickTime: false
		});

		$('.multidate').datepicker({
          multidate: true
		});

		$('.time').datetimepicker({
			pickDate: false
		});

		$('.datetime').datetimepicker({
			pickDate: true,
			pickTime: true
		});

		option_row++;
	}
});
//--></script>
  <script type="text/javascript"><!--
var option_value_row = <?php echo $option_value_row; ?>;

function addOptionValue(option_row) {
	html  = '<tr id="option-value-row' + option_value_row + '">';
	html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]" class="form-control">';
	html += $('#option-values' + option_row).html();
	html += '  </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]" class="form-control">';
	html += '    <option value="1"><?php echo $text_yes; ?></option>';
	html += '    <option value="0" selected><?php echo $text_no; ?></option>';
	html += '  </select></td>';
	html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price_prefix]" class="form-control">';
	html += '    <option value="+">+</option>';
	html += '    <option value="-">-</option>';
	html += '  </select>';
	html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
	html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]" class="form-control">';
	html += '    <option value="+">+</option>';
	html += '    <option value="-">-</option>';
	html += '  </select>';
	html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="" placeholder="<?php echo $entry_points; ?>" class="form-control" /></td>';
	html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]" class="form-control">';
	html += '    <option value="+">+</option>';
	html += '    <option value="-">-</option>';
	html += '  </select>';
	html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="" placeholder="<?php echo $entry_weight; ?>" class="form-control" /></td>';
    html += '<td class="text-left">';
    html += ' <a href="" id="thumb-image' + option_value_row +'" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />';
    html += ' <input type="hidden" name="product_option['+ option_row +'][product_option_value]['+ option_value_row +'][product_option_image]" value="" id="input-image' + option_value_row + '" />';
    html += ' </td>';
    html += '  <td class="text-left"><button type="button" onclick="$(this).tooltip(\'destroy\');$(\'#option-value-row' + option_value_row + '\').remove();" data-toggle="tooltip" rel="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#option-value' + option_row + ' tbody').append(html);
	$('[rel=tooltip]').tooltip();

	option_value_row++;
}
//--></script>
  <script type="text/javascript"><!--
var discount_row = <?php echo $discount_row; ?>;

function addDiscount() {
	html  = '<tr id="discount-row' + discount_row + '">';
    html += '  <td class="text-left"><select name="product_discount[' + discount_row + '][customer_group_id]" class="form-control">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
    <?php } ?>
    html += '  </select></td>';
    html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
    html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
    html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#discount-row' + discount_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#discount tbody').append(html);

	$('.date').datetimepicker({
		pickTime: false
	});

	discount_row++;
}
//--></script>
  <script type="text/javascript"><!--
var special_row = <?php echo $special_row; ?>;

function addSpecial() {
	html  = '<tr id="special-row' + special_row + '">';
    html += '  <td class="text-left"><select name="product_special[' + special_row + '][customer_group_id]" class="form-control">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
    <?php } ?>
    html += '  </select></td>';
    html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
    html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#special-row' + special_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#special tbody').append(html);

	$('.date').datetimepicker({
		pickTime: false
	});

	special_row++;
}
//--></script>
  <script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
	html  = '<tr id="image-row' + image_row + '">';
	html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#images tbody').append(html);

	image_row++;
}
//--></script>
  <script type="text/javascript"><!--
var review_row = <?php echo $review_row; ?>;

function addReview() {
	html  = '<tr id="review-row' + review_row + '">';
	html += '  <td class="text-left"><a href="" id="thumb-review' + review_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="product_reviews[' + review_row + '][image]" value="" id="input-review' + review_row + '" /></td>';
	html += '  <td class="text-left">';
	html += '    <div class="row">';
    html += '      <div class="col-sm-12"><textarea type="text" name="product_reviews[' + review_row + '][review]" placeholder="Отзыв" class="form-control summernote"></textarea><br></div>';
    html += '    </div>';
	html += '    <div class="row">';
	html += '      <div class="col-sm-6"><input type="text" name="product_reviews[' + review_row + '][expert]" value="" placeholder="Эксперт" class="form-control" /></div>';
	html += '      <div class="col-sm-6"><input type="text" name="product_reviews[' + review_row + '][position]" value="" placeholder="Должность" class="form-control" /></div>';
	html += '    </div>';
	html += '  </td>';
	html += '  <td class="text-left"><input type="text" name="product_reviews[' + review_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#review-row' + review_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#reviews tbody').append(html);

  $('.summernote').summernote({
    height: 150,
  });

  review_row++;
}
//--></script>
  <script type="text/javascript"><!--
var studio_row = <?php echo $studio_row; ?>;

function addStudio() {
	html  = '<tr id="studio-row' + studio_row + '">';
	html += '  <td class="text-left"><a href="" id="thumb-studio' + studio_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="product_studios[' + studio_row + '][image]" value="" id="input-studio' + studio_row + '" /></td>';
	html += '  <td class="text-left">';
	html += '    <div class="row">';
    html += '      <div class="col-sm-12"><textarea type="text" name="product_studios[' + studio_row + '][text]" placeholder="Описание" class="form-control summernote"></textarea><br></div>';
    html += '    </div>';
	html += '    <div class="row">';
	html += '      <div class="col-sm-6"><input type="text" name="product_studios[' + studio_row + '][title]" value="" placeholder="Заголовок" class="form-control" /></div>';
	html += '      <div class="col-sm-6"><input type="text" name="product_studios[' + studio_row + '][name]" value="" placeholder="Название" class="form-control" /></div>';
	html += '    </div>';
	html += '  </td>';
	html += '  <td class="text-left"><input type="text" name="product_studios[' + studio_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#studio-row' + studio_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#studios tbody').append(html);

  $('.summernote').summernote({
    height: 150,
  });

  studio_row++;
}
//--></script>
  <script type="text/javascript"><!--
var recurring_row = <?php echo $recurring_row; ?>;

function addRecurring() {
	html  = '<tr id="recurring-row' + recurring_row + '">';
	html += '  <td class="left">';
	html += '    <select name="product_recurring[' + recurring_row + '][recurring_id]" class="form-control">>';
	<?php foreach ($recurrings as $recurring) { ?>
	html += '      <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>';
	<?php } ?>
	html += '    </select>';
	html += '  </td>';
	html += '  <td class="left">';
	html += '    <select name="product_recurring[' + recurring_row + '][customer_group_id]" class="form-control">>';
	<?php foreach ($customer_groups as $customer_group) { ?>
	html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
	<?php } ?>
	html += '    <select>';
	html += '  </td>';
	html += '  <td class="left">';
	html += '    <a onclick="$(\'#recurring-row' + recurring_row + '\').remove()" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></a>';
	html += '  </td>';
	html += '</tr>';

	$('#tab-recurring table tbody').append(html);
	
	recurring_row++;
}
//--></script>
  <script type="text/javascript"><!--
    $.fn.datepicker.dates['en'] = {
      days: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
      daysShort: ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
      daysMin: ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
      months: "Январь_Феврать_Март_Апрель_Май_Июнь_Июль_Август_Сентябрь_Остябрь_Ноябрь_Декабрь".split("_"),
      monthsShort: "Янв_Фев_Мар_Апр_Май_Июн_Июл_Авг_Сен_Отк_Ноя_Дек".split("_"),
      today: "Today",
      clear: "Clear",
      format: "mm/dd/yyyy",
      titleFormat: "MM yyyy", /* Leverages same syntax as 'format' */
      weekStart: 0
    };

    moment.locale('en', {
      months: "Январь_Феврать_Март_Апрель_Май_Июнь_Июль_Август_Сентябрь_Остябрь_Ноябрь_Декабрь".split("_"),
      monthsShort: "Янв_Фев_Мар_Апр_Май_Июн_Июл_Авг_Сен_Отк_Ноя_Дек".split("_"),
      weekdays: "dimanche_lundi_mardi_mercredi_jeudi_vendredi_samedi".split("_"),
      weekdaysShort: "dim._lun._mar._mer._jeu._ven._sam.".split("_"),
      weekdaysMin: "Вс_Пн_Вт_Ср_Чт_Пт_Сб".split("_"),
      week: { dow: 1 } // Monday is the first day of the week
    });

    $('.date').datetimepicker({
      pickTime: false
    });

    $('.time').datetimepicker({
      pickDate: false
    });

    $('.datetime').datetimepicker({
      pickDate: true,
      pickTime: true
    });

    $('.multidate').datepicker({
      multidate: true,
      weekStart: 1
    });
    //--></script>
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
$('#language-history a:first').tab('show');
$('#option a:first').tab('show');
//--></script></div>

      
      <!-- Related Options / Связанные опции << -->
<script type="text/javascript"><!--

var ro_counter = 0;
var ro_discount_counter = 0;
var ro_special_counter = 0;
var ro_variants = [];
var ro_variants_options_order = [];
var ro_all_options = [];

ro_variants[0] = [];
ro_variants_options_order[0] = [];
<?php

  if ( isset($variants_options) ) {
		foreach ($variants_options as $vo_id => $ro_votps) {
			echo "ro_variants[".$vo_id."]=[];\n";
			echo "ro_variants_options_order[".$vo_id."]=[];\n";
			
			foreach ($ro_votps['options_order'] as $option_id) {
				echo "ro_variants_options_order[".$vo_id."].push(".$option_id.");\n";
			}
			
			foreach ($ro_votps['options'] as $option_id => $option_name) {
				echo "ro_variants[".$vo_id."][".$option_id."] = \"".$option_name."\";\n";
			}
			
			
		}
	}
	
	if (isset($ro_all_options)) {
		foreach ($ro_all_options as $option_id => $option_data) {
			echo "ro_all_options[".$option_id."] = [];\n";
			
			if (!isset($variants_options)) {
				echo "ro_variants[0][".$option_id."] = \"".$option_data['name']."\";\n";
				echo "ro_variants_options_order[0].push(".$option_id.");";
			}
			
			foreach ($option_data['values'] as $option_value_data) {
			//foreach ($option_data['values'] as $option_value_id => $option_value_name) {
				echo "ro_all_options[".$option_id."].push( {option_value_id: ".$option_value_data['option_value_id'].", name: \"".htmlspecialchars($option_value_data['name'])."\"} );\n";
				//echo "ro_all_options[".$option_id."][".$option_value_id."] = \"".htmlspecialchars($option_value_name)."\";\n";
				
			}
		}
	}
	
?>

function fill_all_variants(product_options_only) {

	var vopts = ro_variants[ $('[name=related_options_variant]')[0].value ];
	var all_vars = [];
	
	if (product_options_only) {
		var this_product_options = [];
		$('select[name^=product_option][name*=option_value_id]').each(function() {
			if ( $(this).val() ) {
				this_product_options.push($(this).val());
			}
		});
	}
		
	for (var i in vopts) {
		if((vopts[i] instanceof Function) ) { continue; }
		
		var temp_arr = [];
		
		for (var ij in ro_all_options[i]) {
			if((ro_all_options[i][ij] instanceof Function) ) { continue; }
			j = ro_all_options[i][ij]['option_value_id'].toString();
		//for (var j in ro_all_options[i]) {
		//	if((ro_all_options[i][j] instanceof Function) ) { continue; }
			if (product_options_only && $.inArray(j, this_product_options) == -1 ) { //
				continue;
			}
			if (all_vars.length) {
				for (var k in all_vars) {
					if((all_vars[k] instanceof Function) ) { continue; }
					var comb_arr = all_vars[k].slice(0);
					comb_arr[i] = j;
					temp_arr.push( comb_arr );
				}
			} else {
				var comb_arr = [];
				comb_arr[i] = j;
				temp_arr.push(comb_arr);
			}
			
		}
		if (temp_arr && temp_arr.length) {
			all_vars = temp_arr.slice(0);
		}
	}
	
	if (all_vars.length) {
		for (var i in all_vars) {
			if((all_vars[i] instanceof Function) ) { continue; }
			rop = {};
			for (var j in all_vars[i]) {
				if((all_vars[i][j] instanceof Function) ) { continue; }
				rop[j] = all_vars[i][j];
			}
			add_related_option(rop);

		}
		
		related_options_use_check();
		refresh_ro_status();
		check_defaultselectpriority();
		
	}
	
}


function refresh_ro_status(ro_num) {
  
	if (ro_num || ro_num==0) {
		update_combination(ro_num);
	}
	
	var vopts = ro_variants[ $('[name=related_options_variant]')[0].value ];
	
	$('div[id^=ro_status]').html('');
	
	var opts_combs = [];
	var checked_opts_combs = [];
	$('tr[id^=related-option]').each( function () {
		var opts_comb = $(this).attr('ro_opts_comb');
		
		if ( $.inArray(opts_comb, opts_combs) != -1 && $.inArray(opts_comb, checked_opts_combs)==-1 ) {
			$('tr[ro_opts_comb='+opts_comb+']').each( function () {
				$(this).find('div[id^=ro_status]').html('<?php echo $warning_equal_options; ?>');
			});
			checked_opts_combs.push(opts_comb);
		} else {
			opts_combs.push(opts_comb);
		}
	})
	
	return;
	
}

function add_related_option(params) {
  
  var str_add = "";
	var vopts = ro_variants[ $('[name=related_options_variant]')[0].value ];
	var vopts_order = ro_variants_options_order[ $('[name=related_options_variant]')[0].value ];
	var spec_model = <?php echo (isset($related_options_settings['spec_model']) && $related_options_settings['spec_model'] )?("true"):"false" ?>;
	var spec_sku = <?php echo (isset($related_options_settings['spec_sku']) && $related_options_settings['spec_sku'] )?("true"):"false" ?>;
	var spec_upc = <?php echo (isset($related_options_settings['spec_upc']) && $related_options_settings['spec_upc'] )?("true"):"false" ?>;
	var spec_ean = <?php echo (isset($related_options_settings['spec_ean']) && $related_options_settings['spec_ean'] )?("true"):"false" ?>;
	var spec_ofs = <?php echo (isset($related_options_settings['spec_ofs']) && $related_options_settings['spec_ofs'] )?("true"):"false" ?>;
	var spec_location = <?php echo (isset($related_options_settings['spec_location']) && $related_options_settings['spec_location'] )?("true"):"false" ?>;
	var spec_weight = <?php echo (isset($related_options_settings['spec_weight']) && $related_options_settings['spec_weight'] )?("true"):"false" ?>;
	
	var spec_price = <?php echo (isset($related_options_settings['spec_price']) && $related_options_settings['spec_price'] )?("true"):"false" ?>;
	var spec_price_prefix = <?php echo (isset($related_options_settings['spec_price_prefix']) && $related_options_settings['spec_price_prefix'] )?("true"):"false" ?>;
	var spec_price_discount = <?php echo (isset($related_options_settings['spec_price_discount']) && $related_options_settings['spec_price_discount'] )?("true"):"false" ?>;
	var entry_add_discount = "<?php echo $entry_add_discount; ?>";
	var entry_del_discount_title = "<?php echo $entry_del_discount_title; ?>";
	var spec_price_special = <?php echo (isset($related_options_settings['spec_price_special']) && $related_options_settings['spec_price_special'] )?("true"):"false" ?>;
	var entry_add_special = "<?php echo $entry_add_special; ?>";
	var entry_del_special_title = "<?php echo $entry_del_special_title; ?>";
	
	var select_first = <?php echo (isset($related_options_settings['select_first']) && $related_options_settings['select_first'] == 1 )?("true"):"false" ?>;
	var edit_columns = <?php echo (isset($related_options_settings['edit_columns']) )?($related_options_settings['edit_columns']):0; ?>
	
	str_add += "<tr id=\"related-option"+ro_counter+"\"><td>";
	
	var div_id = "ro_status"+ro_counter;
	str_add +="<div id='"+div_id+"' style='color: red'></div>";
	
	
	for (var i = 0; i < vopts_order.length; i++) {
		option_id = vopts_order[i];
		str_add += "<div style='float:left;'><label class='col-sm-1 control-label' for='ro_o_"+ro_counter+"_"+option_id+"'> ";
		//str_add += "<div class='col-sm-1' > ";
		str_add += "<nobr>"+vopts[option_id]+":</nobr>";
		str_add += "</label>";
		//str_add += "</div>";
		//str_add += "<div class='col-sm-1'>";
		str_add += "<select class='form-control' id='ro_o_"+ro_counter+"_"+option_id+"' name='relatedoptions["+ro_counter+"][options]["+option_id+"]' onChange=\"refresh_ro_status("+ro_counter+")\">";
		str_add += "<option value=0></option>";
					
			for (var j in ro_all_options[option_id]) {
				if((ro_all_options[option_id][j] instanceof Function) ) { continue; }
				option_value_id = ro_all_options[option_id][j]['option_value_id'];
			//for (var option_value_id in ro_all_options[option_id]) {
			//	if((ro_all_options[option_id][option_value_id] instanceof Function) ) { continue; }
				
				str_add += "<option value='"+option_value_id+"'";
				if (params[option_id] == option_value_id) {
					str_add +=" selected ";
				}
				str_add += ">"+ro_all_options[option_id][j]['name']+"</option>";
				//str_add += ">"+ro_all_options[option_id][option_value_id]+"</option>";
			}

		str_add += "</select>";
		str_add += "</div>";
	}
	
  
  str_add += "</td>";
  str_add += "<td>&nbsp;";
	str_add += "<input type='text' class='form-control' name='relatedoptions["+ro_counter+"][quantity]' size='2' value='"+(params['quantity']||0)+"'>";
  str_add += "<input type='hidden' name='relatedoptions["+ro_counter+"][relatedoptions_id]' value='"+(params['relatedoptions_id']||"")+"'>";
  str_add += "</td>";
	
	str_add += add_text_field(spec_model, params, 'model');
	str_add += add_text_field(spec_sku, params, 'sku');
	str_add += add_text_field(spec_upc, params, 'upc');
	str_add += add_text_field(spec_ean, params, 'ean');
	str_add += add_text_field(spec_location, params, 'location');
	
	if (spec_ofs) {
		
		str_add += '<td>';
		str_add += '&nbsp;<select name="relatedoptions['+ro_counter+'][stock_status_id]" class="form-control">';
		str_add += '<option value="0">-</option>';
		<?php foreach ($stock_statuses as $stock_status) { ?>
			str_add += '<option value="<?php echo $stock_status['stock_status_id']; ?>"';
			if ("<?php echo $stock_status['stock_status_id'] ?>" == params['stock_status_id']) {
				str_add += ' selected ';
			}
			str_add += '><?php echo $stock_status['name']; ?></option>';
		<?php } ?>
		str_add += '</select>';
		
		str_add += '</td>';
	
	}
	
	if (spec_weight)	{
		str_add += "<td>&nbsp;";
		str_add += "<p style='white-space: nowrap;'><select class='form-control' name='relatedoptions["+ro_counter+"][weight_prefix]'>";
		str_add += "<option value='=' "+( (params['weight_prefix'] && params['weight_prefix']=='=')? ("selected") : (""))+">=</option>";
		str_add += "<option value='+' "+( (params['weight_prefix'] && params['weight_prefix']=='+')? ("selected") : (""))+">+</option>";
		str_add += "<option value='-' "+( (params['weight_prefix'] && params['weight_prefix']=='-')? ("selected") : (""))+">-</option>";
		str_add += "</select>";
		str_add += "<input type='text' class='form-control' name='relatedoptions["+ro_counter+"][weight]' value=\""+(params['weight']||'0.000')+"\" size='5'>";
		str_add += "</p></td>";
	} else {
		str_add += "<input type='hidden' name='relatedoptions["+ro_counter+"][weight_prefix]' value=\""+(params['weight_prefix']||'')+"\">";
		str_add += "<input type='hidden' name='relatedoptions["+ro_counter+"][weight]' value=\""+(params['weight']||'0.000')+"\">";
	}
	
	if (spec_price)	{
		str_add += "<td>&nbsp;";
		if (spec_price_prefix) {
			str_add += "<select name='relatedoptions["+ro_counter+"][price_prefix]' class='form-control'>";
			var price_prefixes = ['=', '+', '-'];
			for (var i in price_prefixes) {
				if((price_prefixes[i] instanceof Function) ) { continue; }
				var price_prefix = price_prefixes[i];
				str_add += "<option value='"+price_prefix+"' "+(price_prefix==params['price_prefix']?"selected":"")+">"+price_prefix+"</option>";
			}
			str_add += "</select>";
		}
		str_add += "<input type='text' class='form-control' name='relatedoptions["+ro_counter+"][price]' value='"+(params['price']||'')+"' size='10'>";
		str_add += "</td>";
	} else {
		str_add += "<input type='hidden' name='relatedoptions["+ro_counter+"][price]' value='"+(params['price']||'')+"'>";
	}
	
	
	if (spec_price && spec_price_discount)	{
		str_add += "<td>";
	} else {
		str_add += "<div style='display:none;'>";
	}
	
	str_add += "<button type='button' onclick=\"add_related_option_discount("+ro_counter+", '');\" data-toggle='tooltip' title='"+entry_add_discount+"' class='btn btn-primary'><i class='fa fa-plus-circle'></i></button>";
	str_add += "<div id='ro_price_discount"+ro_counter+"' >";
	str_add += "</div>";
	if (spec_price && spec_price_discount)	{
		str_add += "</td>";	
	} else {
		str_add += "</div>";
	}
	
	if (spec_price && spec_price_special)	{
		str_add += "<td>";
	} else {
		str_add += "<div style='display:none;'>";
	}
	str_add += "<button type='button' onclick=\"add_related_option_special("+ro_counter+", '');\" data-toggle='tooltip' title='"+entry_add_special+"' class='btn btn-primary'><i class='fa fa-plus-circle'></i></button>";
	str_add += "<div id='ro_price_special"+ro_counter+"'>";
	str_add += "</div>";
	if (spec_price && spec_price_special)	{
		str_add += "</td>";	
	} else {
		str_add += "</div>";
	}
	
	if (select_first) {
		str_add += "<td>&nbsp;";
		str_add += "<input id='defaultselect_"+ro_counter+"' type='checkbox' onchange='check_defaultselectpriority();' name='relatedoptions["+ro_counter+"][defaultselect]' "+((params && params['defaultselect'])?("checked"):(""))+" value='1'>";
		str_add += "<input id='defaultselectpriority_"+ro_counter+"' type='text' class='form-control' title='<?php echo $entry_select_first_priority; ?>' name='relatedoptions["+ro_counter+"][defaultselectpriority]'  value=\""+((params && params['defaultselectpriority'])?(params['defaultselectpriority']):(""))+"\" >";
		str_add += "</td>";	
	}

	str_add += "<td><br>";
	str_add += "<button type=\"button\" class='btn btn-danger' onclick=\"$('#related-option" + ro_counter + "').remove();refresh_ro_status();\" data-toggle=\"tooltip\" title=\"<?php echo $button_remove; ?>\" class='btn btn-primary' data-original-title=\"<?php echo $button_remove; ?>\" ><i class=\"fa fa-minus-circle\"></i></button>";
	
  //str_add += "<a onclick='$(\"#related-option" + ro_counter + "\").remove();refresh_ro_status();' class='button'><?php echo $button_remove; ?></a>";
  str_add += "</td></tr>";
  
  $('#tbody-related_options').append(str_add);
	
	if (params && params['discounts'] && params['discounts'].length) {
		for (var i_dscnt=0; i_dscnt<params['discounts'].length; i_dscnt++) {
			
			add_related_option_discount(ro_counter, params['discounts'][i_dscnt]);
			
		}
	}
	
	if (params && params['specials'] && params['specials'].length) {
		for (var i_dscnt=0; i_dscnt<params['specials'].length; i_dscnt++) {
			
			add_related_option_special(ro_counter, params['specials'][i_dscnt]);
			
		}
	}
	
	update_combination(ro_counter);
	
	if (params==false) {
		refresh_ro_status();
	}
	
  ro_counter++;
  
}

function add_text_field(field_on, params, field_name) {
	str_add = "";
	if (field_on)	{
		str_add += "<td>&nbsp;";
		str_add += "<input type='text' class='form-control' name='relatedoptions["+ro_counter+"]["+field_name+"]' value=\""+(params[field_name]||'')+"\">";
		str_add += "</td>";
	//} else {
	//	str_add += "<input type='hidden' class='form-control' name='relatedoptions["+ro_counter+"]["+field_name+"]' value=\""+(params[field_name]||'')+"\">";
	}
	return str_add;
}

function update_combination(ro_num) {
	
	var vopts = ro_variants[ $('[name=related_options_variant]')[0].value ];
	var str_opts = "";
	
	for (var option_id in vopts) {
		if((vopts[option_id] instanceof Function) ) { continue; }
		str_opts += "_о"+option_id;
		str_opts += "_"+$('#ro_o_'+ro_num+'_'+option_id).val();
	}
	$('#related-option'+ro_num).attr('ro_opts_comb', str_opts);
	
}

//проверяет доступность полей приоритета для выбора сочетаний опций по-умолчанию
function check_defaultselectpriority() {
	var dsc = $('input[type=checkbox][id^=defaultselect_]');
	var dsp;
	for (var i=0;i<dsc.length;i++) {
		dsp = $('#defaultselectpriority_'+dsc[i].id.substr(14));
		if (dsp && dsp.length) {
			if (dsc[i].checked) {
				dsp[0].style.display = '';
				if (isNaN(dsp[0].value)) {
					dsp[0].value = 0;
				}
				if (parseInt(dsp[0].value)==0) {
					dsp[0].value = "1";
				}
			} else {
				dsp[0].style.display = 'none';
			}
		}
	}
}

function add_related_option_discount(ro_counter, discount) {
	
	var first_name = "relatedoptions["+ro_counter+"][discounts]["+ro_discount_counter+"]";
	var customer_group_id = (discount=="")?(0):(discount['customer_group_id']);
	
	str_add = "";
	str_add += "<table id='related-option-discount"+ro_discount_counter+"' style='width:242px;'><tr><td>";
	//str_add += "<div id='related-option-discount"+ro_discount_counter+"'>";
	//str_add += "<tr id='related-option-discount"+ro_discount_counter+"'><td style='border:0px;'>";
	
	
	
	str_add += "<select name='"+first_name+"[customer_group_id]' class='form-control' title=\"<?php echo htmlspecialchars($entry_customer_group); ?>\" style='float:left;width:80px;'>";
	<?php foreach ($customer_groups as $customer_group) { ?>
	str_add += "<option value='<?php echo $customer_group['customer_group_id']; ?>' "+((customer_group_id==<?php echo $customer_group['customer_group_id']; ?>)?("selected"):(""))+"><?php echo $customer_group['name']; ?></option>";
	<?php } ?>
	str_add += "</select>";
	//str_add += "</td><td style='border:0px;'>";
	
	str_add += "<input type='text' class='form-control' style='float:left;width:42px;' size='2' name='"+first_name+"[quantity]' value='"+((discount=="")?(""):(discount['quantity']))+"' title=\"<?php echo htmlspecialchars($entry_quantity); ?>\">";
	str_add += "";
	//str_add += "</td><td style='border:0px;'>";
	
	// hidden
	str_add += "<input type='hidden' name='"+first_name+"[priority]' value='"+((discount=="")?(""):(discount['priority']))+"' title=\"<?php echo htmlspecialchars($entry_priority); ?>\">";
	//str_add += "</td><td style='border:0px;'>";
	
	str_add += "<input type='text' class='form-control' style='float:left;width:80px;' size='10' name='"+first_name+"[price]' value='"+((discount=="")?(""):(discount['price']))+"' title=\"<?php echo htmlspecialchars($entry_price); ?>\">";
	//str_add += "</td><td style='border:0px;'>";
	
	str_add += "<button type=\"button\" onclick=\"$('#related-option-discount" + ro_discount_counter + "').remove();\" data-toggle=\"tooltip\" title=\"<?php echo $button_remove; ?>\" class=\"btn btn-danger\" style='float:left;' data-original-title=\"\"><i class=\"fa fa-minus-circle\"></i></button>";
	//str_add += "<a onclick='$(\"#related-option-discount" + ro_discount_counter + "\").hide().remove();' title=\"<?php echo $button_remove; ?>\">XX</a>";
	//str_add += "</td><td style='border:0px;'>";
	
	//str_add += "</div>";
	str_add += "</td></tr></table>";
	
	$('#ro_price_discount'+ro_counter).append(str_add);
	
	ro_discount_counter++;
	
}

function add_related_option_special(ro_counter, special) {
	
	var first_name = "relatedoptions["+ro_counter+"][specials]["+ro_special_counter+"]";
	var customer_group_id = (special=="")?(0):(special['customer_group_id']);
	
	str_add = "";
	str_add += "<table id='related-option-special"+ro_special_counter+"' style='width:200px;'><tr><td>";
	//str_add += "<div id='related-option-special"+ro_special_counter+"' style='float:both;'>";
	
	
	
	str_add += "<select name='"+first_name+"[customer_group_id]' class='form-control' style='float:left;width:80px;' title=\"<?php echo htmlspecialchars($entry_customer_group); ?>\">";
	<?php foreach ($customer_groups as $customer_group) { ?>
	str_add += "<option value='<?php echo $customer_group['customer_group_id']; ?>' "+((customer_group_id==<?php echo $customer_group['customer_group_id']; ?>)?("selected"):(""))+"><?php echo $customer_group['name']; ?></option>";
	<?php } ?>
	str_add += "</select>";
	//str_add += "</td><td style='border:0px;'>";
	
	// hedden
	str_add += "<input type='hidden' size='2' name='"+first_name+"[priority]' value='"+((special=="")?(""):(special['priority']))+"' title=\"<?php echo htmlspecialchars($entry_priority); ?>\">";
	//str_add += "</td><td style='border:0px;'>";
	
	str_add += "<input type='text'  class='form-control' style='float:left;width:80px;' size='10' name='"+first_name+"[price]' value='"+((special=="")?(""):(special['price']))+"' title=\"<?php echo htmlspecialchars($entry_price); ?>\">";
	//str_add += "</td><td style='border:0px;'>";
	
	str_add += "<button type=\"button\" onclick=\"$('#related-option-special" + ro_special_counter + "').remove();\" data-toggle=\"tooltip\" title=\"<?php echo $button_remove; ?>\" class=\"btn btn-danger\" style='float:left;' data-original-title=\"<?php echo $button_remove; ?>\"><i class=\"fa fa-minus-circle\"></i></button>";
	//str_add += "<a onclick='$(\"#related-option-special" + ro_special_counter + "\").remove();' title=\"<?php echo $button_remove; ?>\">XX</a>";
	//str_add += "</td><td style='border:0px;'>";
	
	//str_add += "</div>";
	str_add += "</td></tr></table>";
	
	$('#ro_price_special'+ro_counter).append(str_add);
	
	ro_special_counter++;
	
}


function related_options_use_check() {

	$("#related-options-use").toggle( $("#related_options_use").is(':checked') );
	
}

$(document).ready(function(){
<?php
  if ( isset($rop_array) ) {
    foreach ($rop_array as $rop) {
      
      echo "rop = {};\n";
      echo "rop['quantity']=".(isset($rop['quantity'])?(int)$rop['quantity']:0) .";\n";
			echo "rop['model']=\"".addslashes(isset($rop['model'])?(string)$rop['model']:'')."\";\n";
			echo "rop['sku']=\"".addslashes(isset($rop['sku'])?(string)$rop['sku']:'')."\";\n";
			echo "rop['upc']=\"".addslashes(isset($rop['upc'])?(string)$rop['upc']:'')."\";\n";
			echo "rop['ean']=\"".addslashes(isset($rop['ean'])?(string)$rop['ean']:'')."\";\n";
			echo "rop['location']=\"".addslashes(isset($rop['location'])?(string)$rop['location']:'')."\";\n";
			echo "rop['stock_status_id']=\"".(isset($rop['stock_status_id'])?(int)$rop['stock_status_id']:'0')."\";\n";
			echo "rop['weight_prefix']=\"".(isset($rop['weight_prefix'])?(string)$rop['weight_prefix']:'')."\";\n";
			echo "rop['weight']=\"".(isset($rop['weight'])?$rop['weight']:0)."\";\n";
			echo "rop['price']=".(isset($rop['price'])?(float)$rop['price']:0).";\n";
			echo "rop['price_prefix']='".(isset($rop['price_prefix'])?(string)$rop['price_prefix']:'=')."';\n";
			echo "rop['defaultselect']=". (isset($rop['defaultselect'])?(int)$rop['defaultselect']:"0").";\n";
			echo "rop['defaultselectpriority']=".(isset($rop['defaultselectpriority'])?(int)$rop['defaultselectpriority']:"0").";\n";
			
      echo "rop['relatedoptions_id']=".(int)$rop['relatedoptions_id'].";\n";
			
			if (isset($rop['options'])) {
				foreach ($rop['options'] as $option_id => $option_value_id) {
					echo "rop[".$option_id."]=".$option_value_id.";\n";
				}
			}
			echo "rop['discounts']=[];";
			if (isset($rop['discounts'])) {
				$discount_cnt = 0;
				foreach($rop['discounts'] as $rop_discount) {
					echo "rop['discounts'][".$discount_cnt."] = {};\n";
					echo "rop['discounts'][".$discount_cnt."]['customer_group_id'] 	= '".$rop_discount['customer_group_id']."';\n";
					echo "rop['discounts'][".$discount_cnt."]['quantity'] 					= '".$rop_discount['quantity']."';\n";
					echo "rop['discounts'][".$discount_cnt."]['priority'] 					= '".$rop_discount['priority']."';\n";
					echo "rop['discounts'][".$discount_cnt."]['price'] 							= '".(float)$rop_discount['price']."';\n";
					$discount_cnt++;
				}
			}
			echo "rop['specials']=[];";
			if (isset($rop['specials'])) {
				$special_cnt = 0;
				foreach($rop['specials'] as $rop_special) {
					echo "rop['specials'][".$special_cnt."] = {};\n";
					echo "rop['specials'][".$special_cnt."]['customer_group_id'] 	= '".$rop_special['customer_group_id']."';\n";
					echo "rop['specials'][".$special_cnt."]['priority'] 					= '".$rop_special['priority']."';\n";
					echo "rop['specials'][".$special_cnt."]['price'] 							= '".(float)$rop_special['price']."';\n";
					$special_cnt++;
				}
			}
      echo "add_related_option(rop);\n";
    }
  }
?>
related_options_use_check();
refresh_ro_status();
check_defaultselectpriority();
});

//--></script>
<!-- >> Related Options / Связанные опции -->
      
      
      
<?php echo $footer; ?>
