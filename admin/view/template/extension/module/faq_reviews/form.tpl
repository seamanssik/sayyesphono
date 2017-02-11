<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a onclick="$('#form').submit();" class="btn btn-primary"><i class="fa fa-check"></i> <?php echo $button_save; ?></a>
                <a onclick="location = '<?php echo $cancel; ?>';" class="btn btn-danger"><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a>
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
        <?php if ($error_warning) { ?>
            <div class="warning"><?php echo $error_warning; ?></div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="tab-pane">
                                <ul class="nav nav-tabs" id="language">
                                    <?php foreach ($languages as $language) { ?>
                                        <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                    <?php } ?>
                                </ul>
                                <div class="tab-content">
                                    <?php foreach ($languages as $language) { ?>
                                        <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                                            <div class="form-group required">
                                                <label class="col-sm-2 control-label" for="author-name-<?php echo $language['language_id']; ?>">Автор</label>
                                                <div class="col-sm-10">
                                                    <input id="author-name-<?php echo $language['language_id']; ?>" name="faq_description[<?php echo $language['language_id']; ?>][author_name]" size="100" value="<?php echo isset($faq_description[$language['language_id']]) ? $faq_description[$language['language_id']]['author_name'] : ''; ?>" class="form-control" />
                                                    <?php if (isset($error_author_name[$language['language_id']])) { ?>
                                                        <span class="text-danger"><?php echo $error_author_name[$language['language_id']]; ?></span>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                            <div class="form-group required">
                                                <label class="col-sm-2 control-label" for="description<?php echo $language['language_id']; ?>">Отзыв</label>
                                                <div class="col-sm-10">
                                                    <textarea class="summernote" name="faq_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($faq_description[$language['language_id']]) ? $faq_description[$language['language_id']]['description'] : ''; ?></textarea>
                                                    <?php if (isset($error_description[$language['language_id']])) { ?>
                                                        <span class="text-danger"><?php echo $error_description[$language['language_id']]; ?></span>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td class="text-left">Изображение</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="text-left">
                                            <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                            <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="well" style="padding:0 19px 4px">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <label class="control-label" style="padding: 0 0 9px;" for="select-topic"><?php echo $entry_topic; ?></label>
                                        <select name="topic_id" class="form-control" id="select-topic">
                                            <?php foreach ($topics as $topic) { ?>
                                                <?php if ($topic['topic_id'] == $topic_id) { ?>
                                                    <option value="<?php echo $topic['topic_id']; ?>" selected="selected"><?php echo $topic['name']; ?></option>
                                                <?php } else { ?>
                                                    <option value="<?php echo $topic['topic_id']; ?>"><?php echo $topic['name']; ?></option>
                                                <?php } ?>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <label class="control-label" style="padding: 0 0 9px;"><?php echo $entry_status; ?></label>
                                        <select name="status" class="form-control">
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
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <label class="control-label" style="padding: 0 0 9px;" for="input-sort_order">Порядок сортировки</label>
                                        <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="Порядок сортировки" id="input-sort_order" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <label class="control-label" style="padding: 0 0 9px;" for="input-date_added">Дата добавления</label>
                                        <input type="text" name="date_added" value="<?php echo $date_added; ?>" placeholder="Дата добавления" id="input-date_added" class="form-control date" data-date-format="YYYY-MM-DD" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
<script type="text/javascript">
    $('#language a:first').tab('show');
</script>
<script type="text/javascript">
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
</script>
<?php echo $footer; ?>
