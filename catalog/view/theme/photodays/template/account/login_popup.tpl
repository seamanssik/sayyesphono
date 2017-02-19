<div class="modal fade" id="modalSignIn" tabindex="-1" role="dialog" aria-labelledby="modalSignIn">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                <div class="modal-title"><span>Вход</span></div>
            </div>
            <div class="modal-body">
                <form id="form-loginPopUp" method="post" enctype="multipart/form-data" class="form-horizontal popup-form" autocomplete="off">
                    <div class="form-group popup-group">
                        <label class="popup-label" for="input-email">Телефон:</label>
                        <div class="col-sm-12">
                            <input class="popup-control" type="text" name="email" value="<?php echo $email; ?>" id="input-email" onkeypress='validate(event)'/>
                        </div>
                        <script>
                            function validate(evt) {
                                var theEvent = evt || window.event;
                                var key = theEvent.keyCode || theEvent.which;
                                key = String.fromCharCode( key );
                                var regex = /[-+()0-9]|\./;
                                if( !regex.test(key) ) {
                                    theEvent.returnValue = false;
                                    if(theEvent.preventDefault) theEvent.preventDefault();
                                }
                            }
                        </script>
                    </div>
                    <div class="form-group popup-group">
                        <label class="popup-label" for="input-password"><?php echo $entry_password; ?>:</label>
                        <div class="col-sm-12">
                            <input class="popup-control" type="password" name="password" value="<?php // echo $password; ?>" id="input-password" />
                        </div>
                    </div>
                    <div class="buttons popup-buttons">
                        <button class="popup-button" type="submit"><span><?php echo $button_login; ?></span></button>
                    </div>
<!--                    <script src="//ulogin.ru/js/ulogin.js"></script><div id="uLogin_6ffbf874" data-uloginid="6ffbf874"></div>-->
                    <div class="links clearfix">
                        <div class="pull-left">
                            <a href="<?php echo $forgotten; ?>" class="popup-link">Забыли пароль?</a>
                        </div>
                        <div class="pull-right">
                            <a href="<?php echo $register; ?>" class="popup-link">Зарегистрироваться</a>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>