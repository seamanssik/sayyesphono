<div class="action question">
    <div class="container">
        <div class="row">
            <div class="col-ed-3 visible-ed hidden-lg hidden-md hidden-sm hidden-xs">
                <div class="action-promo__img">
                    <img src="/image/catalog/blank.gif" data-echo="<?php echo $banners[0]['thumb']; ?>" alt="<?php echo $banners[0]['title']; ?>" width="262" height="276" />
                </div>
            </div>
            <div class="col-ed-9 col-lg-12 col-md-12">
                <div class="action-text js-animate">
                    <div class="c-text-masked"><span><?php echo $banners[0]['title']; ?></span></div>
                    <p><?php echo $banners[0]['field_1']; ?></p>
                </div>
                <form action="" method="post" id="form-question" enctype="multipart/form-data" class="action-form pull-left" autocomplete="off">
                    <div class="row">
                        <div class="col-ed-5 col-lg-5 col-md-5 col-sm-5">
                            <div class="form-group">
                                <label class="control-label" for="input-name">Имя:</label>
                                <input type="text" name="name" id="input-name" class="form-control" />
                            </div>
                        </div>
                        <div class="col-ed-7 col-lg-7 col-md-7 col-sm-7">
                            <div class="form-group">
                                <label class="control-label" for="input-telephone">Телефон:</label>
                                <input type="tel" name="telephone" id="input-telephone" class="form-control" />
                        </div>
                        </div>
                    </div>
                </form>
                <a href="javascript: void(0);" onclick="$('#form-question').submit();" class="action-link"><span><?php echo $banners[0]['field_2']; ?></span></a>
            </div>
        </div>
    </div>
</div>