<div class="welcome">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 js-animate">
                <img class="welcome-logo" src="/image/theme/logo-welcome.png" alt="Новый день, новый образ - новая ты!" title="Sey Yes! Photodays" width="491" height="188">
                <div class="clearfix"></div>
                <p class="welcome-alt c-text-masked"><span>Новый день, новый образ - новая ты!</span></p>
            </div>
            <div class="col-lg-6">
                <div class="welcome-text">
                    <?php if($heading_title) { ?>
                        <div class="welcome-text__title js-animate"><div class="c-text-masked"><span><?php echo $heading_title; ?></span></div></div>
                    <?php } ?>
                    <div class="welcome-text__description">
                        <?php echo $html; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>