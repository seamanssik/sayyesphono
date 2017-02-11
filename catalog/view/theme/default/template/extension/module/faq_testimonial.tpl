<?php if ($topics) { ?>
    <div class="container">
    <?php $i = 0; $c = count($topics); foreach ($topics as $topic) { ?>
        <div class="faq">
            <?php if ($topic['faqs']) { ?>
            <div class="faq-items">
                <?php foreach ($topic['faqs'] as $faq) { ?>
                    <div class="faq-item__request" aria-expanded="true" aria-selected="true"><span class="icon"><?php echo $faq['title']; ?></span></div>
                    <div class="faq-item__response" style="display: none;">
                        <?php echo $faq['description']; ?>
                    </div>
                <?php } ?>
            </div>
            <?php } else { ?>
                <p class="text-empty"><?php echo $text_empty; ?></p>
            <?php } ?>
        </div>
    <?php $i++; } ?>
    </div>
<?php } ?>
<div class="faq-form">
    <div class="container faq-form__container">
        <form action="<?php echo $action; ?>" id="form-faq" method="post" enctype="multipart/form-data" class="form-horizontal" autocomplete="off">
            <fieldset>
                <legend class="js-animate"><div class="c-text-masked"><span><?php echo $heading_title; ?></span></div></legend>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group js-animate">
                            <label class="col-sm-12 control-label" for="input-name"><?php echo $entry_author_name; ?>:</label>
                            <div class="col-sm-12">
                                <input type="text" name="author_name" id="input-name" value="<?php echo $author_name; ?>" class="form-control" />
                                <?php if ($error_author_name) { ?>
                                    <div class="text-danger"><?php echo $error_author_name;?></div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group js-animate">
                            <label class="col-sm-12 control-label" for="input-email"><?php echo $entry_author_mail; ?>:</label>
                            <div class="col-sm-12">
                                <input type="text" name="author_mail" id="input-email" value="<?php echo $author_mail; ?>" class="form-control" />
                                <?php if ($error_author_email) { ?>
                                    <div class="text-danger"><?php echo $error_email;?></div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group js-animate">
                    <label class="col-sm-12 control-label" for="input-title"><?php echo $entry_faq; ?>:</label>
                    <div class="col-sm-12">
                        <textarea rows="2" name="title" id="input-title" class="form-control"><?php echo $title;?></textarea>
                        <?php if ($error_title) { ?>
                            <div class="text-danger"><?php echo $error_title;?></div>
                        <?php } ?>
                    </div>
                </div>
                <?php echo $captcha; ?>
            </fieldset>
            <div class="buttons text-center">
                <input type="hidden" name="key" value="testimonial">
                <button type="submit" class="js-animate"><span><?php echo $button_submit; ?></span></button>
            </div>
        </form>
    </div>
</div>