$(document).ready(function () {

    //message details
    //for datepicker value after changed
    $(".hasdatepicker").datepicker({
        changeMonth: true,
        changeYear: true,
        format: "MM/dd/yyyy",
    });
    $(".hasdatepicker").keydown(false);


    //for message modal
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

    $('[id*=MyModal]').delegate('.sendRep', 'click', function (e) {
        e.preventDefault();

        var valid = checkReplyValidation();
        if (valid)
            addMsgReply();


    });

    $('[id*=MyModal]').delegate('.sendMessage', 'click', function (e) {
        e.preventDefault();

        var valid = checkMsgValidation();
        if (valid)
            sendMessage();


    });

    $('[id*=MyModal]').delegate('.btnPrev', 'click', function (e) {
        e.preventDefault();

        var page = $('[id*=hdn_page]').val();
        page--;
        $('[id*=hdn_page]').val(page);
        loadMessages();


    });

    $('[id*=MyModal]').delegate('.btnNext', 'click', function (e) {
        e.preventDefault();

        var page = $('[id*=hdn_page]').val();
        page++;
        $('[id*=hdn_page]').val(page);
        loadMessages();


    });

    $('[id*=MyModal]').delegate('[id*=img_searchMsg]', 'click', function (e) {
        e.preventDefault();

        loadMessages();


    });
});

function loadMessages() {
    $('[id*=msg_cards]').empty();

    var parameter = {
        searchText: $('[id*=txt_search]').val(),
    };

    $.ajax({
        type: "POST",
        url: "../../login.aspx/GetMessagesCount",
        data: JSON.stringify(parameter),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            var total = data.d;
            var pageSize = 5;
            var page = $('[id*=hdn_page]').val();
            var skip = pageSize * (page - 1);
            var canPage = skip < total;

            if (page == 1) {//disable 
                $('[id*=btn_prev]').hide();
            }
            else //enable
                $('[id*=btn_prev]').show();

            if ((pageSize * page) < total)
                $('[id*=btn_next]').show();
            else
                $('[id*=btn_next').hide();

            var parameter = {
                skip: skip,
                searchText: $('[id*=txt_search]').val(),
            };
            $.ajax({
                type: "POST",
                url: "../../login.aspx/GetUserMessages",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    for (var prop in data) {
                        var item = data[prop];
                        for (var index in item) {
                            var msg = item[index];
                            addMsgToList(msg);

                        }
                        $('[id*=MyModal]').modal('show');
                    }
                },
                failure: function (response) {
                    alert(response.d);
                }
            });

        }
    });
}

function addMsgToList(msg) {
    var userMsgId = msg.UsersMessageID;
    var msgDivClass = "";
    if (msg.IsRead == true)
        msgDivClass = "readed-msg";


    var empName = "";
    if ('<%= Session["CultureName"].ToString().ToLower() %>' == "en-us")
        empName = msg.FromEmployeeEn;
    else
        empName = msg.FromEmployeeAr;

    var messageDate = convertToJavaScriptDateTime(msg.CreateDate);
    $('<div class="msg-card ' + msgDivClass + '" id="msgCard_' + msg.UsersMessageID + '"><div class="row col-12"><div class="col-6 float1"><span>' + empName + '</span></div><div class="col-6 float2" style="padding:0px;"><span>' + messageDate + '</span></div><div></div>').appendTo('[id*=msg_cards]');

    //title div
    $('<div class="row col-12 msg-title" id="div_title_' + msg.UsersMessageID + '"><span>' + msg.Title + '</span></div>').appendTo('[id*=msgCard_' + msg.UsersMessageID + ']');

    //content div
    $('<div class="row col-12 msg-content" id="div_content_' + msg.UsersMessageID + '"><span>' + msg.ContentMessage + '</span></div>').appendTo('[id*=msgCard_' + msg.UsersMessageID + ']');
}

function checkMsgValidation() {
    var valid = true;
    if ($('[id*=sel_emp]').val() == "" || $('[id*=sel_emp]').val() == null) {
        $('[id*=sel_emp]').attr("class", "form-control is-invalid");
        valid = false;
    }
    if ($('[id*=txt_title]').val() == "" || $('[id*=txt_title]').val() == null) {
        $('[id*=txt_title]').attr("class", "form-control is-invalid");
        valid = false;
    }
    if ($('[id*=txt_msgContent]').val() == "" || $('[id*=txt_msgContent]').val() == null) {
        $('[id*=txt_msgContent]').attr("class", "form-control is-invalid");
        valid = false;
    }
    return valid;
}

function sendMessage() {
    var toEmployeeID = $('[id*=sel_emp]').val();
    var title = $('[id*=txt_title]').val();
    var content = $('[id*=txt_msgContent]').val();

    var parameter = {
        toEmployeeID: toEmployeeID,
        title: title,
        content: content,
    };
    $.ajax({
        type: "POST",
        url: "../../login.aspx/SaveMessage",
        data: JSON.stringify(parameter),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            $('[id*=sel_emp]').val('');
            $('[id*=txt_title]').val('');
            $('[id*=txt_msgContent]').val('');
            alert(data.d);

        },
        failure: function (response) {
            alert(response.d);
        }
    });
}


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
