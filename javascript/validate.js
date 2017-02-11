$(document).ready(function () {
    var _body = $('body');

    /**
     * Validate form on contact page
     * @type {*|jQuery|HTMLElement}
     */
    var form = _body.find("#form-contact");
    form.validate({
        rules: {
            name: {
                required: true,
                minlength: 3,
                maxlength: 32
            },
            email: {
                required: true,
                email: true
            },
            enquiry: {
                required: true,
                minlength: 10,
                maxlength: 3000
            }
        },
        messages: {
            name: LANGS['contact_page']['error_name'],
            email: LANGS['contact_page']['error_email'],
            enquiry: LANGS['contact_page']['error_enquiry']
        },
        submitHandler: function submitHandler(form) {
            $.ajax({
                type: "POST",
                url: "/index.php?route=information/contact/submit",
                data: $(form).serialize(),
                timeout: 3000,
                dataType: 'json',
                success: function success(response) {
                    var _form = _body.find("#form-contact");

                    if (response['success']) {
                        _form.find('input, textarea').val('');

                        _body.find('#modalSuccess .modalSuccess-text').text('Ваше соощение успешно отправленно!');
                        _body.find('#modalSuccess').modal('show');
                    }

                    if (response['error']) {
                        console.log(response['error']);
                    }
                }
            });
            return false;
        }
    });

    /**
     * Validate login form
     * @type {*|jQuery|HTMLElement}
     */
    var form_login = _body.find("#form-loginPopUp");
    form_login.validate({
        rules: {
            email: {
                required: true,
                email: true
            },
            password: {
                required: true
            }
        },
        messages: {
            email: LANGS['login_form']['error_email'],
            password: LANGS['login_form']['error_password']
        },
        submitHandler: function submitHandler(form) {
            $.ajax({
                type: "POST",
                url: "/index.php?route=account/login_popup/login",
                data: $(form).serialize(),
                timeout: 3000,
                dataType: 'json',
                success: function success(response) {
                    var _form = _body.find("#form-loginPopUp");

                    _form.find('.alert').remove();

                    if (response['success']) {
                        location.reload();
                    }

                    if (response['error']) {
                        var html = '<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>' + response['error']['warning'] + '</div>';

                        _form.prepend(html);
                    }
                }
            });

            return false;
        }
    });


    /**
     * Validate form on faq page
     * @type {*|jQuery|HTMLElement}
     */
    var faq_form = _body.find("#form-faq");
    faq_form.validate({
        rules: {
            author_name: {
                required: true,
                minlength: 3,
                maxlength: 32
            },
            author_mail: {
                required: true,
                email: true
            },
            title: {
                required: true,
                minlength: 10,
                maxlength: 3000
            }
        },
        messages: {
            author_name: LANGS['faq_page']['error_name'],
            author_mail: LANGS['faq_page']['error_email'],
            title: LANGS['faq_page']['error_title']
        },
        submitHandler: function submitHandler(form) {
            $.ajax({
                type: "POST",
                url: "/index.php?route=information/information/addFaq",
                data: $(form).serialize(),
                timeout: 3000,
                dataType: 'json',
                success: function success(response) {
                    var _form = _body.find("#form-faq");

                    if (response['success']) {
                        _form.find('input, textarea').val('');

                        _body.find('#modalSuccess .modalSuccess-text').text('Ваш вопрос успешно отправленн!');
                        _body.find('#modalSuccess').modal('show');
                    }

                    if (response['error']) {
                        console.log(response['error']);
                    }
                }
            });
            return false;
        }
    });


    /**
     * Validate form on review page
     * @type {*|jQuery|HTMLElement}
     */
    var review_form = _body.find("#form-review");
    review_form.validate({
        rules: {
            author_name: {
                required: true,
                minlength: 3,
                maxlength: 32
            },
            author_mail: {
                required: true,
                email: true
            },
            author_review: {
                required: true,
                minlength: 10,
                maxlength: 3000
            }
        },
        messages: {
            author_name: LANGS['review_page']['error_name'],
            author_mail: LANGS['review_page']['error_email'],
            author_review: LANGS['review_page']['error_title']
        },
        submitHandler: function submitHandler(form) {
            $.ajax({
                type: "POST",
                url: "/index.php?route=information/information/addReviews",
                data: $(form).serialize(),
                timeout: 3000,
                dataType: 'json',
                success: function success(response) {
                    var _form = _body.find("#form-review");

                    if (response['success']) {
                        _form.find('input, textarea').val('');

                        _body.find('#modalSuccess .modalSuccess-text').text('Ваш отзыв успешно отправленн!');
                        _body.find('#modalSuccess').modal('show');
                    }

                    if (response['error']) {
                        console.log(response['error']);
                    }
                }
            });
            return false;
        }
    });


    /**
     * Validate form request
     * @type {*|jQuery|HTMLElement}
     */
    var request_form = _body.find("#form-request");
    request_form.validate({
        rules: {
            name: {
                required: true,
                minlength: 3,
                maxlength: 32
            },
            tel: {
                required: true
            }
        },
        messages: {
            name: LANGS['request_form']['error_name'],
            tel: LANGS['request_form']['error_tel']
        },
        submitHandler: function submitHandler(form) {
            $.ajax({
                type: "POST",
                url: "/index.php?route=information/contact/sendRequest",
                data: $(form).serialize(),
                timeout: 3000,
                dataType: 'json',
                success: function success(response) {
                    var _form = _body.find("#form-request");

                    if (response['success']) {
                        _body.find('#modalRequest').modal('hide');
                        _form.find('input, textarea').val('');

                        setTimeout(function () {
                            _body.find('#modalSuccess').modal('show');
                        }, 300);
                    }

                    if (response['error']) {
                        console.log(response['error']);
                    }
                }
            });
            return false;
        }
    });


    /**
     * Validate form question
     * @type {*|jQuery|HTMLElement}
     */
    var question_form = _body.find("#form-question");
    question_form.validate({
        rules: {
            name: {
                required: true,
                minlength: 3,
                maxlength: 32
            },
            telephone: {
                required: true
            }
        },
        messages: {
            name: LANGS['question_form']['error_name'],
            telephone: LANGS['question_form']['error_tel']
        },
        submitHandler: function submitHandler(form) {
            $.ajax({
                type: "POST",
                url: "/index.php?route=information/contact/sendQuestion",
                data: $(form).serialize(),
                timeout: 3000,
                dataType: 'json',
                success: function success(response) {
                    var _form = _body.find("#form-question");

                    if (response['success']) {
                        _form.find('input').val('');

                        setTimeout(function () {
                            _body.find('#modalSuccess').modal('show');
                        }, 300);
                    }

                    if (response['error']) {
                        console.log(response['error']);
                    }
                }
            });
            return false;
        }
    });
});