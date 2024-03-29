$(document).ready(function () {
    'use strict';

    // sync Navbar Links With Sections

    $(window).scroll(function () {
        $(".block").each(function () {
            if ($(window).scrollTop() > $(this).offset().top) {
                var blockId = $(this).attr("id");
                $(".navbar li").removeClass("active");
                $(".navbar li a[data-scroll = " + blockId + "]").parent().addClass("active");
            }
        });
        var scrollToTop = $(".scroll-to-top");
        if ($(window).scrollTop() >= 1000) {
            if (scrollToTop.is(":hidden")) {
                $(".scroll-to-top").fadeIn(500);
            }
        } else {
            $(".scroll-to-top").fadeOut(500);
        }


    });

    $(".scroll-to-top, .home-btn").click(function (e) {
        e.preventDefault();

        $('html, body').animate({
            scrollTop: 0
        }, 1000);

    });

    $(".menu-bg").click(function () {
        $('nav .main-menu-button i.fa-close').hide(250);
        $('nav .main-menu-button i.fa-bars').show(250);

        $('.main-menu').addClass('open');
        $('.main-menu').animate({
            left: "-=250"
        }, 500);
        $(this).css({
            display: "none"
        });
    });

    // $(".main-menu-button").click(function(){
    //   $(".main-menu").slideToggleRight(300,function() {
    //     $(this).hasClass('close'); }
    //   );
    // });

    // $('.main-menu-button').click(function () {
    //     $('.main-menu').animate({
    //       right: 0
    //     });
    // });

    $('.main-menu-button').click(function () {
        if ($('.main-menu').hasClass('open')) {
            $('nav .main-menu-button i').toggle(250);

            $('nav .main-menu-button .m').slideDown(250);
            $('.main-menu').removeClass('open');
            $('.main-menu').animate({
                left: 0
            }, 500);
            $(".menu-bg").css({
                display: "block"
            });
        } else {
            $('nav .main-menu-button i').toggle(250);

            $('.main-menu').addClass('open');
            $('.main-menu').animate({
                left: "-=250"
            }, 500);
            $(".menu-bg").css({
                display: "none"
            });
        }
    });

    $('.main-menu ul li').hover(function () {
        var dmenu = $(this).data('menu');
        if (dmenu == "products") {
            $('.main-menu .products .dropdown-mobile').css('display', 'block');
        } else if (dmenu == "contacts") {
            $('.main-menu .contacts .dropdown-mobile').css('display', 'block');
        }
    }, function () {
        $('.main-menu .dropdown-mobile').css('display', 'none');
    });

    function toggleDropdown(e) {
        const _d = $(e.target).closest('.dropdown'),
            _m = $('.dropdown-menu', _d);
        setTimeout(function () {
            const shouldOpen = e.type !== 'click' && _d.is(':hover');
            _m.toggleClass('show', shouldOpen);
            _d.toggleClass('show', shouldOpen);
            $('[data-toggle="dropdown"]', _d).attr('aria-expanded', shouldOpen);
        }, e.type === 'mouseleave' ? 300 : 0);
    }

    $('body')
        .on('mouseenter mouseleave', '.dropdown', toggleDropdown)
        .on('click', '.dropdown-menu a', toggleDropdown);

    $('li.dropdown').click(function () {
        $('li.dropdown').not(this).find('ul').hide();
        $(this).find('ul').toggle();
    });

   
});




function zeroPadded(val) {
    if (val >= 10)
        return val;
    else
        return '0' + val;
}
function convertToJavaScriptDate(value) {
    var pattern = /Date\(([^)]+)\)/;
    var results = pattern.exec(value);
    var dt = new Date(parseFloat(results[1]));
    var localDateTime = [zeroPadded(dt.getMonth() + 1),
    zeroPadded(dt.getDate()), dt.getFullYear()].join('/');
    return localDateTime;

}
function convertToJavaScriptDateTime(value) {
    var pattern = /Date\(([^)]+)\)/;
    var results = pattern.exec(value);
    var dt = new Date(parseFloat(results[1]));
    var localDateTime = [dt.getFullYear(), zeroPadded(dt.getMonth() + 1),
    zeroPadded(dt.getDate())].join('-') + ' ' +
        [zeroPadded(dt.getHours()),
        zeroPadded(dt.getMinutes())].join(':');
    return localDateTime;

}
function logout() {
    $.ajax({
        type: "POST",
        url: "../../login.aspx/logout",

        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            window.location = "../../login.aspx";

        },
        failure: function (response) {
            alert(response.d);
        }
    });
}

function openMessageTab(evt, tabName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
}

const validateEmail = (email) => {
    return String(email)
        .toLowerCase()
        .match(
            /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        );
};