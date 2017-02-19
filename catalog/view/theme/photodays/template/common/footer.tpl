
</div>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-ed-2 col-lg-3 col-md-3 col-sm-6">
                <a href="/" class="f-logo">Photodays</a>
                <ul class="f-social">
                    <?php if ($link_in) { ?><li><a href="<?php echo $link_in; ?>" target="_blank" class="f-social__item f-social__int">Photodays в Instagram</a></li><?php } ?>
                    <?php if ($link_vk) { ?><li><a href="<?php echo $link_vk; ?>" target="_blank" class="f-social__item f-social__vk">Photodays Вконтакте</a></li><?php } ?>
                    <?php if ($link_fb) { ?><li><a href="<?php echo $link_fb; ?>" target="_blank" class="f-social__item f-social__fb">Photodays в Facebook</a></li><?php } ?>
                    <?php if ($link_you) { ?><li><a href="<?php echo $link_you; ?>" target="_blank" class="f-social__item f-social__you">Смотрите Photodays на youtube</a></li><?php } ?>
                </ul>
            </div>
            <div class="col-ed-5 col-lg-5 col-md-5 hidden-sm hidden-xs">
                <ul class="f-menu">
                    <?php foreach ($menus as $key => $menu) { ?>
                        <?php if ($key == 5) { ?>
                            <li class="f-menu__item"><a href="<?php echo $blog_url; ?>" class="f-menu__link">Блог</a></li>
                        <?php } ?>
                        <li class="f-menu__item">
                            <a href="<?php echo $menu['href']; ?>" class="f-menu__link"><?php echo $menu['name']; ?></a>
                        </li>
                    <?php } ?>
                    <li class="f-menu__item"><a href="<?php echo $contact; ?>" class="f-menu__link">Контакты</a></li>
                    <?php /* ?>
                    <li class="f-menu__item"><a href="<?php echo $photodays; ?>" class="f-menu__link">Photodays</a></li>
                    <li class="f-menu__item"><a href="<?php echo $reviews; ?>" class="f-menu__link">Отзывы</a></li>
                    <li class="f-menu__item"><a href="<?php echo $showroom; ?>" class="f-menu__link">Showroom</a></li>
                    <li class="f-menu__item"><a href="<?php echo $faq; ?>" class="f-menu__link">FAQ</a></li>
                    <li class="f-menu__item"><a href="<?php echo $archive_photodays; ?>" class="f-menu__link">Архив фотосессий</a></li>
                    <li class="f-menu__item"><a href="<?php echo $blog_url; ?>" class="f-menu__link">Блог</a></li>
                    <li class="f-menu__item"><a href="<?php echo $legend; ?>" class="f-menu__link">Легенда</a></li>
                    <li class="f-menu__item hidden"><a href="<?php echo $franchise; ?>" class="f-menu__link">Франшиза</a></li>
                    <li class="f-menu__item"><a href="<?php echo $about_us; ?>" class="f-menu__link">О нас</a></li><?php */ ?>
                </ul>
            </div>
            <div class="col-ed-5 col-lg-4 col-md-4 col-sm-6">
                <div class="pull-right f-col__right">
                    <ul class="f-contact">
                        <li class="f-contact__item"><a href="tel:<?php echo trim(str_replace(' ', '', $telephone)); ?>"><?php echo $telephone; ?></a></li>
                        <li class="f-contact__item"><a href="tel:<?php echo trim(str_replace(' ', '', $telephone_2)); ?>"><?php echo $telephone_2; ?></a></li>
                        <li class="f-contact__item"><a href="mailto:<?php echo trim(str_replace(' ', '', $email)); ?>"><?php echo $email; ?></a></li>
                    </ul>
                    <span class="f-copy">&copy; SAY YES! PHOTODAYS <?php echo date('Y'); ?></span>
                    <span class="f-art">dev.saz-ART</span>
                </div>
            </div>
        </div>
    </div>
</footer>
<a href="#" class="scrollToTop">Вверх</a>
<div class="modal fade" id="modalRequest" tabindex="-1" role="dialog" aria-labelledby="modalRequest">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                <div class="modal-title"><span>Заявка на сотрудничество</span></div>
            </div>
            <div class="modal-body">
                <form id="form-request" method="post" enctype="multipart/form-data" class="form-horizontal popup-form" autocomplete="off">
                    <div class="form-group popup-group">
                        <label class="popup-label" for="input-name">Имя:</label>
                        <div class="col-sm-12">
                            <input class="popup-control" type="text" name="name" id="input-name" />
                        </div>
                    </div>
                    <div class="form-group popup-group">
                        <label class="popup-label" for="input-tel">Телефон:</label>
                        <div class="col-sm-12">
                            <input class="popup-control" type="tel" name="tel" id="input-tel" />
                        </div>
                    </div>
                    <div class="buttons popup-buttons">
                        <button class="popup-button" type="submit"><span>Отправить</span></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modalSuccess" tabindex="-1" role="dialog" aria-labelledby="modalSuccess">
    <div class="modal-dialog modalSuccess-dialog" role="document">
        <div class="modal-content">
            <div class="modalSuccess-title">
                <span>Спасибо!</span>
                <button type="button" class="modalSuccess-close close" data-dismiss="modal" aria-label="Close"></button></div>
            <div class="modalSuccess-text">Ваша заявка успешно отправленна!</div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalSuccessAccount" tabindex="-1" role="dialog" aria-labelledby="modalSuccessAccount">
    <div class="modal-dialog modalSuccess-dialog" role="document">
        <div class="modal-content">
            <div class="modalSuccess-title">
                <span>Поздравляем!</span>
                <button type="button" class="modalSuccess-close close" data-dismiss="modal" aria-label="Close"></button></div>
            <div class="modalSuccess-text">Ваш аккаунт создан</div>
        </div>
    </div>
</div>

<script src="/javascript/jquery/jquery-ui-accordion.min.js?v=0.0.9" type="text/javascript"></script>
<script src="/javascript/skrollr.min.js?v=0.0.9" type="text/javascript"></script>
<script src="/app/js/dropdown.js?v=0.0.9" type="text/javascript"></script>
<script src="/library/app.min.js?v=0.0.9" type="text/javascript"></script>
<script src="/library/startup.min.js?v=0.0.9" type="text/javascript"></script>
<script>
    echo.init({
        offset: 100,
        throttle: 250,
        unload: false,
        callback: function (element, op) {
            // console.log(element, 'has been', op + 'ed')
        }
    });
</script>

<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-84736170-1', 'auto');
    ga('send', 'pageview');

</script>

<script type="text/javascript">
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter42676884 = new Ya.Metrika({
                    id:42676884,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true,
                    webvisor:true
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/42676884" style="position:absolute; left:-9999px;" alt="" /></div></noscript>

</body>
</html>