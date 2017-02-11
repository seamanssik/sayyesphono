<?php echo $header; ?>
<div id="content" class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <?php if ($error_warning) { ?>
        <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="pull-right">
                <a onclick="$('#form').submit();" class="btn btn-primary"><i class="fa fa-check"></i> <?php echo $button_save; ?></a>
                <a onclick="location = '<?php echo $cancel; ?>';" class="btn btn-danger"><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a>
            </div>
            <h1 class="panel-title"><i class="fa fa-edit"></i> <?php echo $heading_title; ?></h1>
        </div>
        <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form form-horizontal">
                <div class="tab-pane">
                    <ul class="nav nav-tabs" id="language">
                        <?php foreach ($languages as $language) { ?>
                            <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                        <?php } ?>
                    </ul>
                    <div class="tab-content">
                        <?php foreach ($languages as $language) { ?>
                            <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                                <div class="form-group hidden">
                                    <label class="col-sm-2 control-label" for="author-name-<?php echo $language['language_id']; ?>">Имя (<?php echo $language['name']; ?>)</label>
                                    <div class="col-sm-10">
                                        <input id="author-name-<?php echo $language['language_id']; ?>" name="faq_description[<?php echo $language['language_id']; ?>][author_name]" size="100" value="<?php echo isset($faq_description[$language['language_id']]) ? $faq_description[$language['language_id']]['author_name'] : ''; ?>" class="form-control" />
                                        <?php if (isset($error_author_name[$language['language_id']])) { ?>
                                            <span class="error">Ошибка...</span>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <label class="col-sm-2 control-label" for="faq_description<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?> (<?php echo $language['name']; ?>)</label>
                                    <div class="col-sm-10">
                                        <textarea class="summernote" name="faq_description[<?php echo $language['language_id']; ?>][title]" id="faq_description<?php echo $language['language_id']; ?>"><?php echo isset($faq_description[$language['language_id']]) ? $faq_description[$language['language_id']]['title'] : ''; ?></textarea>
                                        <?php if (isset($error_title[$language['language_id']])) { ?>
                                            <span class="error"><?php echo $error_title[$language['language_id']]; ?></span>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <label class="col-sm-2 control-label" for="description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?> (<?php echo $language['name']; ?>)</label>
                                    <div class="col-sm-10">
                                        <textarea class="summernote" name="faq_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($faq_description[$language['language_id']]) ? $faq_description[$language['language_id']]['description'] : ''; ?></textarea>
                                        <?php if (isset($error_description[$language['language_id']])) { ?>
                                            <span class="error"><?php echo $error_description[$language['language_id']]; ?></span>
                                        <?php } ?>
                                    </div>
                                </div>
                                <input type="hidden" name="faq_description[<?php echo $language['language_id']; ?>][meta_description]" value=""/>
                            </div>
                        <?php } ?>
                    </div>
                    <div class="form-group hidden">
                        <label class="col-sm-2 control-label" for="input-keyword"><?php echo $entry_keyword; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="select-topic"><?php echo $entry_topic; ?></label>
                        <div class="col-sm-10">
                            <select name="topic_id" class="form-control" id="select-topic">
                                <!--                        <option value="0">--><?php //echo $text_none; ?><!--</option>-->
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
                        <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
                        <div class="col-sm-10">
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
                        <label class="col-sm-2 control-label" for="input-sort_order"><?php echo $entry_sort_order; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort_order" class="form-control" />
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
<script type="text/javascript">
    $('#language a:first').tab('show');
</script>
<?php echo $footer; ?>
