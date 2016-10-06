function getURLVar(key) {
    var value = [];

    var query = String(document.location).split('?');

    if (query[1]) {
        var part = query[1].split('&');

        for (i = 0; i < part.length; i++) {
            var data = part[i].split('=');

            if (data[0] && data[1]) {
                value[data[0]] = data[1];
            }
        }

        if (value[key]) {
            return value[key];
        } else {
            return '';
        }
    }
}

$(document).ready(function () {
    // Adding the clear Fix
    cols1 = $('#column-right, #column-left').length;

    if (cols1 == 2) {
        $('#content .product-layout:nth-child(2n+2)').after('<div class="clearfix visible-md visible-sm"></div>');
    } else if (cols1 == 1) {
        $('#content .product-layout:nth-child(3n+3)').after('<div class="clearfix hidden-xs"></div>');
    } else {
        $('#content .product-layout:nth-child(4n+5)').addClass('last');
    }

    // Highlight any found errors
    $('.text-danger').each(function() {
        var element = $(this).parent().parent();

        if (element.hasClass('form-group')) {
            element.addClass('has-error');
        }
    });

    // Currency
    $('#currency .currency-select').on('click', function (e) {
        e.preventDefault();

        $('#currency input[name=\'code\']').attr('value', $(this).attr('name'));

        $('#currency').submit();
    });

    // Language
    $('#language a').on('click', function (e) {
        e.preventDefault();

        $('#language input[name=\'code\']').attr('value', $(this).attr('href'));

        $('#language').submit();
    });

    /* Search */
    $('#search input[name=\'search\']').parent().find('button').on('click', function () {
        url = $('base').attr('href') + 'index.php?route=product/search';

        var value = $('header input[name=\'search\']').val();

        if (value) {
            url += '&search=' + encodeURIComponent(value);
        }

        location = url;
    });

    $('#search input[name=\'search\']').on('keydown', function (e) {
        if (e.keyCode == 13) {
            $('header input[name=\'search\']').parent().find('button').trigger('click');
        }
    });

    // Menu
    $('#menu .dropdown-menu').each(function () {
        var menu = $('#menu').offset();
        var dropdown = $(this).parent().offset();

        var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

        if (i > 0) {
            $(this).css('margin-left', '-' + (i + 5) + 'px');
        }
    });

    // Product List
    $('#list-view').click(function () {
        $('#content .product-layout > .clearfix').remove();
        $(this).addClass('active');
        $('#grid-view').removeClass('active');
        $('#content .product-layout').attr('class', 'product-layout product-list col-xs-12');

        localStorage.setItem('display', 'list');
    });

    // Product Grid
    $('#grid-view').click(function () {
        $(this).addClass('active');
        $('#list-view').removeClass('active');
        $('#content .product-layout > .clearfix').remove();

        // What a shame bootstrap does not take into account dynamically loaded columns
        cols = $('#column-right, #column-left').length;

        if (cols == 2) {
            $('#content .product-layout').attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
        } else if (cols == 1) {
            $('#content .product-layout').attr('class', 'product-layout product-grid col-lg-4 col-md-4 col-sm-4 col-xs-12');
        } else {
            $('#content .product-layout').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12');
        }

        localStorage.setItem('display', 'grid');
    });

    if (localStorage.getItem('display') == 'list') {
        $('#list-view').trigger('click');
    } else {
        $('#grid-view').trigger('click');
    }

    // Checkout
    $(document).on('keydown', '#collapse-checkout-option input[name=\'email\'], #collapse-checkout-option input[name=\'password\']', function(e) {
        if (e.keyCode == 13) {
            $('#collapse-checkout-option #button-login').trigger('click');
        }
    });

    // tooltips on hover
    var iOS = /iPad|iPhone|iPod/.test(navigator.platform);
    if (!iOS) {
        $('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
    }

    // Makes tooltips work on ajax generated content
    $(document).ajaxStop(function () {
        if (!iOS) {
            $('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
        }
    });

    $('.ajax-overlay_close').on('click touchstart', function (e) {
        e.preventDefault();
        $('.ajax-overlay').removeClass('visible');
        returnOptions();
    })

    $(document).on('click touchstart', function (e) {
        var container = $(".product-option-wrap");
        var overlay = $('.ajax-overlay');
        if (container.is(e.target)
            && overlay.hasClass('visible')) {
            overlay.removeClass('visible');
            returnOptions();
        }
    })

    $('body').delegate('.alert .close', 'click', function () {
        $(this).parent().addClass('fadeOut');
    })


});

function ajaxAdd(el, product_id) {
    var width = $(window).width();
    var selector = el.parents('.product-thumb').find('.product-option-wrap');
    if (width > 767 && selector.length) {
        var overlay = $('.ajax-overlay');
        overlay.append(selector);
        overlay.addClass('visible');
        $('body').addClass('ajax-overlay-open');
    } else {
        cart.add(product_id);
    }
}

function returnOptions() {
    var options = $('.ajax-overlay').find('.product-option-wrap');
    $('body').removeClass('ajax-overlay-open');
    $('.product-thumb.options').each(function () {
        if ($(this).find('.product-option-wrap').length == 0) {
            $(this).append(options);
            return;
        }
    })
}
var timer;

// Cart add remove functions
var cart = {
    'addPopup': function (el) {
        var selector = el.parents('.product-option-wrap');

        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: selector.find('input[type=\'text\'], input[type=\'radio\']:checked, input[type=\'hidden\'], input[type=\'checkbox\']:checked, select, textarea'),
            dataType: 'json',
            beforeSend: function () {
                $('#cart > button').button('');
            },
            complete: function () {
                $('#button-cart').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                clearTimeout(timer);

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('[id*="input-option' + i.replace('_', '-') +'"]');

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('.ajax-overlay').removeClass('visible');
                    returnOptions();

                    $('#content').parent().before('<div class="alert alert-success"><i class="material-design-verification24"></i> ' + json['success'] + '<button type="button" class="close material-design-close47"></button></div>');
                    $('#cart-total').html(json['total']);
                    $('#cart-total2').html(json['total2']);

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                    timer = setTimeout(function () {
                        $('.alert').addClass('fadeOut');
                    }, 4000)
                }
            }

        });
    },
    'add': function (product_id, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            beforeSend: function () {
                $('#cart > button').button('');
            },
            complete: function () {
                $('#cart > button').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                clearTimeout(timer);
                if (json['redirect']) {
                    location = json['redirect'];
                }

                if (json['success']) {
                    $('#content').parent().before('<div class="alert alert-success"><i class="material-design-verification24"></i> ' + json['success'] + '<button type="button" class="close material-design-close47"></button></div>');

                    $('#cart-total').html(json['total']);
                    $('#cart-total2').html(json['total2']);

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                    timer = setTimeout(function () {
                        $('.alert').addClass('fadeOut');
                    }, 4000)
                }
            }
        });
    },
    'update': function (key, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/edit',
            type: 'post',
            data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            beforeSend: function () {
                $('#cart > button').button('');
            },
            success: function (json) {
                clearTimeout(timer);
                $('#cart > button').button('reset');
                $('#cart-total').html(json['total']);

                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
                timer = setTimeout(function () {
                    $('.alert').addClass('fadeOut');
                }, 4000)
            }
        });
    },
    'remove': function (key) {
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            beforeSend: function () {
                $('#cart > button').button('');
            },
            success: function (json) {
                clearTimeout(timer);
                $('#cart > button').button('reset');

                $('#cart-total').html(json['total']);

                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart').load('index.php?route=common/cart/info #cart');
                    location.reload();
                }
                timer = setTimeout(function () {
                    $('.alert').addClass('fadeOut');
                }, 4000)
            }

        });
    }
}

var voucher = {
    'add': function () {

    },
    'remove': function (key) {
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            beforeSend: function () {
                $('#cart > button').button('loading');
            },
            complete: function () {
                $('#cart > button').button('reset');
            },
            success: function (json) {
                clearTimeout(timer);
                $('#cart-total').html(json['total']);

                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart').load('index.php?route=common/cart/info #cart');
                }
                timer = setTimeout(function () {
                    $('.alert').addClass('fadeOut');
                }, 4000)
            }
        });
    }
}

var wishlist = {
    'add': function (product_id) {
        $.ajax({
            url: 'index.php?route=account/wishlist/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function (json) {
                clearTimeout(timer);
                $('.alert').remove();

                if (json['success']) {
                    $('#content').parent().before('<div class="alert alert-success"><i class="material-design-verification24"></i> ' + json['success'] + '<button type="button" class="close material-design-close47"></button></div>');
                }

                if (json['info']) {
                    $('#content').parent().before('<div class="alert alert-info"><i class="material-design-round52"></i> ' + json['info'] + '<button type="button" class="close material-design-close47"></button></div>');
                }

                $('#wishlist-total').html(json['total']);

                /*$('html, body').animate({ scrollTop: 0 }, 'slow');*/
                timer = setTimeout(function () {
                    $('.alert').addClass('fadeOut');
                }, 4000)
            }
        });
    },
    'remove': function () {

    }
}

var compare = {
    'add': function (product_id) {
        $.ajax({
            url: 'index.php?route=product/compare/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function (json) {
                clearTimeout(timer);
                $('.alert').remove();

                if (json['info']){
                    $('#content').parent().before('<div class="alert alert-info"><i class="material-design-round52"></i> ' + json['info'] + '<button type="button" class="close material-design-close47"></button></div>');
                }

                if (json['success']) {
                    $('#content').parent().before('<div class="alert alert-success"><i class="material-design-verification24"></i> ' + json['success'] + '<button type="button" class="close material-design-close47"></button></div>');
                    if (json['warning']) {
                        $('.alert').append('<div class="alert alert-warning"><i class="material-design-warning37"></i> ' + json['warning'] + '<button type="button" class="close material-design-close47"></button></div>');
                    }

                    $('#compare-total').attr('data-original-title', json['total']);
                    var tmp = $('#compare-total2');
                    tmp.html(json['total']);
                    tmp.attr('title', json['total']);
                }
                timer = setTimeout(function () {
                    $('.alert').addClass('fadeOut');
                }, 4000)
            }
        });
    },
    'remove': function () {

    }
}

/* Agree to Terms */
$(document).delegate('.agree', 'click', function (e) {
    e.preventDefault();

    $('#modal-agree').remove();

    var element = this;

    $.ajax({
        url: $(element).attr('href'),
        type: 'get',
        dataType: 'html',
        success: function (data) {
            html = '<div id="modal-agree" class="modal">';
            html += '  <div class="modal-dialog">';
            html += '    <div class="modal-content">';
            html += '      <div class="modal-header">';
            html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
            html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
            html += '      </div>';
            html += '      <div class="modal-body">' + data + '</div>';
            html += '    </div';
            html += '  </div>';
            html += '</div>';

            $('body').append(html);

            $('#modal-agree').modal('show');
        }
    });
});

/* Autocomplete */
(function ($) {
    function Autocomplete(element, options) {
        this.element = element;
        this.options = options;
        this.timer = null;
        this.items = new Array();

        $(element).attr('autocomplete', 'off');
        $(element).on('focus', $.proxy(this.focus, this));
        $(element).on('blur', $.proxy(this.blur, this));
        $(element).on('keydown', $.proxy(this.keydown, this));

        $(element).after('<ul class="dropdown-menu"></ul>');
        $(element).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));
    }

    Autocomplete.prototype = {
        focus: function () {
            this.request();
        },
        blur: function () {
            setTimeout(function (object) {
                object.hide();
            }, 200, this);
        },
        click: function (event) {
            event.preventDefault();

            value = $(event.target).parent().attr('data-value');

            if (value && this.items[value]) {
                this.options.select(this.items[value]);
            }
        },
        keydown: function (event) {
            switch (event.keyCode) {
                case 27: // escape
                    this.hide();
                    break;
                default:
                    this.request();
                    break;
            }
        },
        show: function () {
            var pos = $(this.element).position();

            $(this.element).siblings('ul.dropdown-menu').css({
                top: pos.top + $(this.element).outerHeight(),
                left: pos.left
            });

            $(this.element).siblings('ul.dropdown-menu').show();
        },
        hide: function () {
            $(this.element).siblings('ul.dropdown-menu').hide();
        },
        request: function () {
            clearTimeout(this.timer);

            this.timer = setTimeout(function (object) {
                object.options.source($(object.element).val(), $.proxy(object.response, object));
            }, 200, this);
        },
        response: function (json) {
            html = '';

            if (json.length) {
                for (i = 0; i < json.length; i++) {
                    this.items[json[i]['value']] = json[i];
                }

                for (i = 0; i < json.length; i++) {
                    if (!json[i]['category']) {
                        html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
                    }
                }

                // Get all the ones with a categories
                var category = new Array();

                for (i = 0; i < json.length; i++) {
                    if (json[i]['category']) {
                        if (!category[json[i]['category']]) {
                            category[json[i]['category']] = new Array();
                            category[json[i]['category']]['name'] = json[i]['category'];
                            category[json[i]['category']]['item'] = new Array();
                        }

                        category[json[i]['category']]['item'].push(json[i]);
                    }
                }

                for (i in category) {
                    html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';

                    for (j = 0; j < category[i]['item'].length; j++) {
                        html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
                    }
                }
            }

            if (html) {
                this.show();
            } else {
                this.hide();
            }

            $(this.element).siblings('ul.dropdown-menu').html(html);
        }
    };

    $.fn.autocomplete = function (option) {
        return this.each(function () {
            var data = $(this).data('autocomplete');

            if (!data) {
                data = new Autocomplete(this, option);

                $(this).data('autocomplete', data);
            }
        });
    }
})(window.jQuery);
