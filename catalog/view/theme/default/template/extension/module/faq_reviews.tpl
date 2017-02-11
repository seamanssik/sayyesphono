<div class="review">
<?php if ($topics) { ?>
    <div class="container">
        <?php foreach ($topics as $topic) { ?>
            <div class="reviews">
                <?php if ($topic['faqs']) { ?>
                    <?php foreach ($topic['faqs'] as $faq) { ?>
                        <div class="review-item js-animate">
                            <div class="review-item__figure">
                                <div class="lines js-animate o-lines-animate">
                                    <i></i>
                                    <i></i>
                                    <i></i>
                                    <i></i>
                                </div>
                                <img src="<?php echo $faq['image']; ?>" alt="<?php echo $faq['author_name']; ?>" width="160" height="240" data-100-bottom="transform: translate3d(0,-10%,0)" data--100-top="transform: translate3d(0,15%,0)">
                            </div>
                            <div class="review-item__description">
                                <div class="review-item__date">
                                    <span class="date"><?php echo $faq['date']; ?></span>
                                    <span class="year"><?php echo $faq['year']; ?></span>
                                </div>
                                <div class="review-item__author js-animate">
                                    <div class="c-text-masked">
                                        <span><?php echo $faq['author_name']; ?></span>
                                    </div>
                                </div>
                                <div class="review-item__review">
                                    <?php echo $faq['author_review']; ?>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                <?php } ?>
            </div>
        <?php } ?>
        <div class="row">
            <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
        </div>
    </div>
<?php } ?>
</div>
<div class="review-form">
    <div class="container review-form__container">
        <form action="<?php echo $action; ?>" id="form-review" method="post" enctype="multipart/form-data" class="form-horizontal" autocomplete="off">
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
                    <label class="col-sm-12 control-label" for="input-review"><?php echo $entry_faq; ?>:</label>
                    <div class="col-sm-12">
                        <textarea rows="2" name="author_review" id="input-review" class="form-control"><?php echo $title;?></textarea>
                        <?php if ($error_title) { ?>
                            <div class="text-danger"><?php echo $error_title;?></div>
                        <?php } ?>
                    </div>
                </div>
                <?php echo $captcha; ?>
            </fieldset>
            <div class="buttons text-center">
                <input type="hidden" name="key" value="review">
                <button type="submit" class="js-animate"><span><?php echo $button_submit; ?></span></button>
            </div>
        </form>
    </div>
</div>