<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
            </div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                    <table class="table table-striped table-bordered table-hover">
                        <tr>
                            <td><span class="required">*</span> <?php echo $entry_promo_text; ?></td>
                            <td>
                                <input type="hidden" value="0" name="promo_direction" />
                                <input class="form-control" name="promo_text" value="<?php echo $promo_text; ?>" size="30" />
                                <?php if ($error_promo_text) { ?>
                                    <span class="error"><?php echo $error_promo_text; ?></span>
                                <?php } ?>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_sort_order; ?></td>
                            <td><input class="form-control" name="sort_order" value="<?php echo $sort_order; ?>" size="1" /></td>
                        </tr>
                        <?php foreach($languages as $language){ ?>
                            <tr>
                                <td><?php echo $entry_image; ?> [<?php echo strtoupper($language['code']);?>]</td>
                                <td><div class="image">
                                        <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $images[$language['language_id']]; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                        <input type="hidden" name="images[<?php echo $language['language_id']?>]" value="<?php echo $images[$language['language_id']]; ?>" id="image_<?php echo $language['language_id']?>" />
                                    </div></td>
                            </tr>
                        <?php } ?>
                    </table>
                </form>
            </div>
        </div>
    </div>
<?php echo $footer; ?>