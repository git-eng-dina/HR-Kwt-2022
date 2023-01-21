$(document).ready(function(){
    'use strict';

    // sync Navbar Links With Sections

    $(window).scroll(function(){
        $(".block").each(function(){
            if($(window).scrollTop() > $(this).offset().top){
                var blockId = $(this).attr("id");
                $(".navbar li").removeClass("active"); 
                $(".navbar li a[data-scroll = "+ blockId +"]").parent().addClass("active");
            }
        });
        var scrollToTop = $(".scroll-to-top");
            if($(window).scrollTop() >= 1000){
                if(scrollToTop.is(":hidden")){
                    $(".scroll-to-top").fadeIn(500);
                }
            }else{
                $(".scroll-to-top").fadeOut(500);
            }


            });

        $(".scroll-to-top, .home-btn").click(function(e){
            e.preventDefault();

            $('html, body').animate({
                scrollTop: 0
            },1000);

        });

        $(".menu-bg").click(function(){
          $('nav .main-menu-button i.fa-close').hide(250);
          $('nav .main-menu-button i.fa-bars').show(250);

            $('.main-menu').addClass('open');
            $('.main-menu').animate({
             right:"-=250"
            },500);
            $(this).css({
              display:"none"
             });
        });

        $('.main-menu-button').click(function(){
          if ($('.main-menu').hasClass('open')) {
            $('nav .main-menu-button i').toggle(250);
            
            $('nav .main-menu-button .m').slideDown(250);
            $('.main-menu').removeClass('open');
            $('.main-menu').animate({
              right:0
            },500);
            $(".menu-bg").css({
              display:"block"
             });
          } else {
          $('nav .main-menu-button i').toggle(250);

          $('.main-menu').addClass('open');
          $('.main-menu').animate({
            right:"-=250"
          },500);
          $(".menu-bg").css({
            display:"none"
           });
          }
        });

        $('.main-menu ul li').hover(function(){
          var dmenu = $(this).data('menu');
          if(dmenu == "products") {
            $('.main-menu .products .dropdown-mobile').css('display','block');
          }else if (dmenu == "contacts") {
            $('.main-menu .contacts .dropdown-mobile').css('display','block');
          }
        },function(){
          $('.main-menu .dropdown-mobile').css('display','none');
        });

        function toggleDropdown (e) {
          const _d = $(e.target).closest('.dropdown'),
            _m = $('.dropdown-menu', _d);
          setTimeout(function(){
            const shouldOpen = e.type !== 'click' && _d.is(':hover');
            _m.toggleClass('show', shouldOpen);
            _d.toggleClass('show', shouldOpen);
            $('[data-toggle="dropdown"]', _d).attr('aria-expanded', shouldOpen);
          }, e.type === 'mouseleave' ? 300 : 0);
        }

        $('body')
        .on('mouseenter mouseleave','.dropdown',toggleDropdown)
        .on('click', '.dropdown-menu a', toggleDropdown);

    $('li.dropdown').click(function () {
        $('li.dropdown').not(this).find('ul').hide();
        $(this).find('ul').toggle();
    }); 


    //message details

    $('[id*=MyModal]').delegate('.msg-card', 'click', function (e) {
        e.preventDefault();

        $('[id*=box_messageDetails]').show();
        var element = $(this);
        var idStr = element.attr('id');
        const myArray = idStr.split("_");
        var id = myArray[1];
    
        $('[id*=hdn_usersMessageID]').val(id);

        $('[id*=lbl_objectName]').text(element.find(">:first-child").text());

        getMessageDetails(id);
       
    });

    $('[id*=MyModal]').delegate('.send', 'click', function (e) {
        e.preventDefault();

        var valid = checkReplyValidation();
        if (valid)
            addMsgReply();


    });
});


function getMessageDetails(id) {

    $('[id*=msg_replies]').empty();
    var parameter = {
        usersMessageID: id,
    };
    $.ajax({
        type: "POST",
        url: "../../login.aspx/GetMessageDetails",
        data: JSON.stringify(parameter),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            for (var prop in data) {
                var item = data[prop];

                if (item != "" && item != null) {
                    var empName = "";
                    if (item.CultureName == "en-us")
                        empName = item.FromEmployeeEn;
                    else
                        empName = item.FromEmployeeAr;

                    $('[id*=lbl_empName]').html(empName);

                    $('[id*=lbl_msgDate]').html(convertToJavaScriptDateTime(item.CreateDate));
                    $('[id*=lbl_msgTitle]').html(item.Title);
                    $('[id*=lbl_msgContent]').html(item.ContentMessage);

                    //emp image
                    var img = document.querySelector("[id*=img_emp]");
                    if (item.EmpImage != null) {
                        var arrayBufferView = new Uint8Array(item.EmpImage);
                        var blob = new Blob([arrayBufferView], { type: "image/jpeg" });
                        var urlCreator = window.URL || window.webkitURL;
                        var imageUrl = urlCreator.createObjectURL(blob);

                        img.src = imageUrl;
                    }
                    else {
                        img.src = "../../images/no-image-icon-125x125.png";
                    }

                    //replies
                    for (var pp in item.Replies) {
                        var reply = item.Replies[pp];
                        
                        //sending info div
                        var empName = "";
                        if (item.CultureName == "en-us")
                            empName = reply.FromEmployeeEn;
                        else
                            empName = reply.FromEmployeeAr;

                        var messageDate = convertToJavaScriptDateTime(reply.CreateDate);
                        $('<div class="msg-card col-12" ><div class="row col-12"><div class="col-6 float1"><span>' + empName + '</span></div><div class="col-6 float2"><span>' + messageDate + '</span></div><div></div>').appendTo('[id*=msg_replies]');

                        //content div
                        $('<div class="row col-12 msg-reply-content" ><span>' + reply.ContentMessage + '</span></div>').appendTo('[id*=msg_replies]');
                    }
                }
                else {
                    resetPermission();
                }

            }
        },
        failure: function (response) {
            alert(response.d);
        }
    });
}
function removeValidation(input) {
    if ($(input).attr("class") == "form-control is-invalid") {

        $(input).attr("class", "form-control");

    }
}

function checkReplyValidation() {
    var valid = true;
    if ($('[id*=txt_reply]').val() == "" || $('[id*=txt_reply]').val() == null) {
        $('[id*=txt_reply]').attr("class", "form-control is-invalid");
        valid = false;
    }
    return valid;
}


function addMsgReply() {

    var usersMessageID = $('[id*=hdn_usersMessageID]').val();

    var replyText = $('[id*=txt_reply]').val();

    var parameter = {
        usersMessageID: usersMessageID,
        replyText: replyText,
    };
    $.ajax({
        type: "POST",
        url: "../../login.aspx/AddMessageReply",
        data: JSON.stringify(parameter),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            var id = $('[id*=hdn_usersMessageID]').val();
            getMessageDetails(id);

        },
        failure: function (response) {
            alert(response.d);
        }
    });
}
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


//function zeroPadded(val) {
//    if (val >= 10)
//        return val;
//    else
//        return '0' + val;
//}

//function getDateTime() {
//    var localTime = new Date();
    
//    var year = localTime.getYear();
//    var month = localTime.getMonth() + 1;
//    var date = localTime.getDate();
//    var localDateTime = [localTime.getFullYear(), zeroPadded(localTime.getMonth() + 1),
//        zeroPadded(localTime.getDate())].join('-')

//  //  $('#hdnCurrentDate').val(localDateTime); 
//    //var localTime = new Date();
//    //var year = localTime.getYear();
//    //var month = localTime.getMonth() + 1;
//    //var date = localTime.getDate();
//    //var hours = localTime.getHours();
//    //var minutes = localTime.getMinutes();
//    //var seconds = localTime.getSeconds();
//    //at this point you can do with your results whatever you please
//}