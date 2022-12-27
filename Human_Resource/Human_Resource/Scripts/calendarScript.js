var currentUpdateEvent;
var addStartDate;
var addEndDate;
var globalAllDay;
var CustomButtonText;


function updateEvent(event, element) {

    if ($(this).data("qtip")) $(this).qtip("destroy");

    currentUpdateEvent = event;
    ShowDialogWithData(event.id);

    return false;
}

function updateSuccess(updateResult) {


    alert(updateResult);

}

function deleteSuccess(deleteResult) {
    alert(deleteResult);
}


function UpdateTimeSuccess(updateResult) {
    alert(updateResult);
}

function selectDate(start, end, allDay) {
    alert('select date');
    $('#addDialog').dialog('open');
    $("#addEventStartDate").text("" + start.toLocaleString());
    $("#addEventEndDate").text("" + end.toLocaleString());

    addStartDate = start;
    addEndDate = end;
    globalAllDay = allDay;
    //alert(allDay);
}

function updateEventOnDropResize(event, allDay) {

    //alert("allday: " + allDay);
    var eventToUpdate = {
        id: event.id,
        start: event.start
    };

    if (event.end === null) {
        eventToUpdate.end = eventToUpdate.start;
    }
    else {
        eventToUpdate.end = event.end;
    }

    var endDate;
    if (!event.allDay) {
        endDate = new Date(eventToUpdate.end + 60 * 60000);
        endDate = endDate.toJSON();
    }
    else {
        endDate = eventToUpdate.end.toJSON();
    }

    eventToUpdate.start = eventToUpdate.start.toJSON();
    eventToUpdate.end = eventToUpdate.end.toJSON(); //endDate;
    eventToUpdate.allDay = event.allDay;

    PageMethods.UpdateEventTime(eventToUpdate, UpdateTimeSuccess);
}

function eventDropped(event, dayDelta, minuteDelta, allDay, revertFunc) {
    if ($(this).data("qtip")) $(this).qtip("destroy");

    updateEventOnDropResize(event);
}

function eventResized(event, dayDelta, minuteDelta, revertFunc) {
    if ($(this).data("qtip")) $(this).qtip("destroy");

    updateEventOnDropResize(event);
}

function checkForSpecialChars(stringToCheck) {
    //var pattern = /[^A-Za-z0-9 ]/;
    //return pattern.test(stringToCheck); 
    return true;
}

function isAllDay(startDate, endDate) {
    var allDay;

    if (startDate.format("HH:mm:ss") == "00:00:00" && endDate.format("HH:mm:ss") == "00:00:00") {
        allDay = true;
        globalAllDay = true;
    }
    else {
        allDay = false;
        globalAllDay = false;
    }

    return allDay;
}

function qTipText(start, end, description) {
    var text;

    if (end !== null)
        text = "<strong>Start:</strong> " + start.format("MM/DD/YYYY hh:mm T") + "<br/><strong>End:</strong> " + end.format("MM/DD/YYYY hh:mm T") + "<br/><br/>" + description;
    else
        text = "<strong>Start:</strong> " + start.format("MM/DD/YYYY hh:mm T") + "<br/><strong>End:</strong><br/><br/>" + description;

    return text;
}

function ShowDialog() {

    $("#dialog").dialog("open");
    $(".ui-dialog-titlebar").hide();
    var retval = "";
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
    var localDateTime = [dt.getFullYear() ,zeroPadded(dt.getMonth() + 1),
        zeroPadded(dt.getDate())].join('-') + 'T' +
        [zeroPadded(dt.getHours()),
        zeroPadded(dt.getMinutes())].join(':');
    return localDateTime;
 
}

function ShowDialogWithData(customID) {

    var lang = "ar-AS";
    if ('<%= Session["CultureName"] %>' != null)
        lang = '<%= Session["CultureName"].ToString() %>';

    var parameter = {
        ID: customID
    };
    $.ajax({
        type: "POST",
        url: "Events.aspx/GetEvent",
        data: JSON.stringify(parameter),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            ShowDialog();
            for (var prop in data) {
                var item = data[prop];
                $('#MainContent_eventId').val(item.id);
                $('#MainContent_txt_title').val(item.title);
                $('#MainContent_description').val(item.description);


                var s = convertToJavaScriptDate(item.start);  
                $('#MainContent_start').val(s);

                s = convertToJavaScriptDate(item.end);
                $('#MainContent_end').val(s);

                if (item.Attachment != null) {
                    $('#MainContent_lbl_attach').attr("href", "../../Upload/Events/" + item.Attachment.docnum);
                    $('#MainContent_lbl_attach').html(item.Attachment.docName);
                    $('[id*=delete_upload]').show();
                }

                var lstView = $("[id*=lst_employee]");
                for (var emp in item.Employees) {
                    var employee = item.Employees[emp];

                    var row = '<li id="' + employee.EmployeeID + '"> <input type="hidden"  runat="server" />' + "</li>";

                    //Add the row to the employee list
                    lstView.append(row);

                    var li = $('#MainContent_lst_employee li:last-child');

                    var span = document.createElement('SPAN');
                    span.innerHTML = "<i class='fa fa-close delete-row-list'></i>";
                    span.className = "delete-row-span";
                    span.onclick = function () {
                        $(this).closest("li").remove();
                    };

                    li.append(span);

                    var spanName = document.createElement('SPAN');
                    if (lang == "ar-AS")
                        spanName.innerHTML = employee.NameAr;
                    else
                        spanName.innerHTML = employee.NameEn;
     
                    spanName.className = "value-list";
                    li.append(spanName);
                    var hid_input = li.find("input");
                    hid_input.attr("id", "hid_emp_" + employee.EmployeeID);
                    hid_input.val(employee.EmployeeID);
                }
            }


        },
        failure: function (response) {
            alert(response.d);
        }
    });
}

function closeDialog() {

    $("#MainContent_hdn_empIds").val("");
    $("#MainContent_eventId").val("");
    $("#MainContent_txt_title").val("");
    $("#MainContent_description").val("");
    $("#MainContent_start").val("");
    $("#MainContent_end").val("");
    $("#MainContent_file").val("");
    $('#MainContent_lst_employee').empty();

    $("#dialog").dialog("close");

    return false;
}

function addEmp() {

    var empId = $('#MainContent_sel_employee').val();
    var empName = $("#MainContent_sel_employee option:selected").text();

    var lstView = $("[id*=lst_employee]");

    if (!$("#MainContent_lst_employee #" + empId).length) {



        var row = '<li id="' + empId + '"> <input type="hidden"  runat="server" />' + "</li>";

        //Add the row to the employee list
        lstView.append(row);

        var li = $('#MainContent_lst_employee li:last-child');

        var span = document.createElement('SPAN');
        span.innerHTML = "<i class='fa fa-close delete-row-list'></i>";
        span.className = "delete-row-span";
        span.onclick = function () {
            $(this).closest("li").remove();
        };

        li.append(span);

        var spanName = document.createElement('SPAN');
        spanName.innerHTML = empName;
        spanName.className = "value-list";
        li.append(spanName);
        var hid_input = li.find("input");
        hid_input.attr("id", "hid_emp_" + empId);
        hid_input.val(empId);

        return false;
    }

}

function initFullcalendar(events) {
 
    $('#MainContent_calendar').fullCalendar({
        theme: true,
        header: {
            left: 'prev,next today customBtn',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        customButtons: {
            customBtn: {
                text: 'add event',
                click: function () {
                    ShowDialog();
                }
            }
        },
        defaultView: 'agendaWeek',
        eventClick: updateEvent,
        selectable: true,
        selectHelper: true,
        select: selectDate,
        editable: true,
        events: events,      
        eventDrop: eventDropped,
        eventResize: eventResized,
        eventRender: function (event, element) {
 
            if (event.Approved == null) {
                element.css('background-color', '#e3c56c');
            }
            else if (event.Approved == true) {
                element.css('background-color', '#b0dfb0');
            }
            else
                element.css('background-color', '#cfb1b5');

            element.qtip({
                content: {
                    text: qTipText(event.start, event.end, event.description),
                    title: '<strong>' + event.title + '</strong>' 
                },
                position: {
                    my: 'bottom left',
                    at: 'top right'
                },
                style: { classes: 'qtip-shadow qtip-rounded' }
            });
        },


    });

}


function removeValidation(input) {
    if ($(input).attr("class") == "form-control is-invalid") {

        $(input).attr("class", "form-control");

    }
}
function checkValidation() {

    var valid = true;
    if ($('#MainContent_txt_title').val() == "" || $('#MainContent_txt_title').val() == null) {
        $('#MainContent_txt_title').attr("class", "form-control is-invalid");
        valid = false;
    }

    if ($('[id*=description]').val() == "" || $('[id*=description]').val() == null) {
        $('[id*=description]').attr("class", "form-control is-invalid");
        valid = false;
    }

    if ($('#MainContent_start').val() == "" || $('#MainContent_start').val() == null) {
        $('#MainContent_start').attr("class", "form-control is-invalid");
        valid = false;
    }

    if ($('#MainContent_end').val() == "" || $('#MainContent_end').val() == null) {
        $('#MainContent_end').attr("class", "form-control is-invalid");
        valid = false;
    }
   
    if (valid) {

        var empIdsStr = "";
        var inputs = $('ul li input');
        inputs.each(function (e) {
            empIdsStr = empIdsStr + $(this).val() + ',';
        });
        $("#MainContent_hdn_empIds").val(empIdsStr);

        var uniqID = $('#MainContent_hdnButtonID').val();

        __doPostBack(uniqID, "OnClick");
    }
    return valid;
}


const today = new Date();
var start = new Date(today.setDate(today.getDate() - today.getDay())).format('yyyy-MM-dd');
var end = new Date(today.setDate(today.getDate() - today.getDay() + 7)).format('yyyy-MM-dd');



//function date_format(unix_timestamp, format) {
//    const date = new Date(unix_timestamp);
//    const dateObject = {
//        'Y': date.getFullYear(),
//        'm': String(date.getMonth()).padStart(2, '0'),
//        'd': String(date.getDate()).padStart(2, '0'),
//        'H': String(date.getHours()).padStart(2, '0'),
//        'i': String(date.getMinutes()).padStart(2, '0'),
//        's': String(date.getSeconds()).padStart(2, '0'),
//    };
//    var dateString = '';
//    for (let char of format) {
//        if (char in dateObject) {
//            dateString += dateObject[char];
//        } else {
//            dateString += char;
//        }
//    }
//    return dateString;
//}
function GetCalendarDateRange() {

    start = $('#MainContent_calendar').fullCalendar('getView').start.format('YYYY-MM-DD');
    end = $('#MainContent_calendar').fullCalendar('getView').end.format('YYYY-MM-DD');

}

$(document).ready(function () {
    $(".hasdatepicker").datepicker({
        changeMonth: true,
        changeYear: true,
        format: "dd/MM/yyyy",
    });

    //initFullcalendar();

    var events = [];
    $.ajax({
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        url: "EventResponse.ashx?start=" + start + "&end=" + end,
        success: function (data) {

            $.each(data, function (i, v) {
                events.push({
                    id: v.id,
                    title: v.title,
                    description: v.description,
                    start: v.start,
                    end: v.end != null ? v.end : null,
                    //  color: v.ThemeColor,
                    allDay: v.allDay
                });
            })

            initFullcalendar(events);

            $('.fc-prev-button').click(function () {

                events = [];
                GetCalendarDateRange();
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: "EventResponse.ashx?start=" + start + "&end=" + end,
                    success: function (data) {

                        $.each(data, function (i, v) {
                            events.push({
                                id: v.id,
                                title: v.title,
                                description: v.description,
                                start: v.start,
                                end: v.end != null ? v.end : null,
                                allDay: v.allDay
                            });
                        })

                        $('[id*=calendar]').fullCalendar('removeEvents');
                        $('[id*=calendar]').fullCalendar('addEventSource', events);
                        $('[id*=calendar]').fullCalendar('rerenderEvents');
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Status: " + textStatus); alert("Error: " + XMLHttpRequest.responseText);
                    }

                });

            });

            $('.fc-next-button').click(function () {
                events = [];
                GetCalendarDateRange();
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: "EventResponse.ashx?start=" + start + "&end=" + end,
                    success: function (data) {

                        $.each(data, function (i, v) {
                            events.push({
                                id: v.id,
                                title: v.title,
                                description: v.description,
                                start: v.start,
                                end: v.end != null ? v.end : null,
                                allDay: v.allDay
                            });
                        })

                        $('[id*=calendar]').fullCalendar('removeEvents');
                        $('[id*=calendar]').fullCalendar('addEventSource', events);
                        $('[id*=calendar]').fullCalendar('rerenderEvents');
                        
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Status: " + textStatus); alert("Error: " + XMLHttpRequest.responseText);
                    }

                });
            });

            $('.fc-month-button').click(function () {
                events = [];
                GetCalendarDateRange();
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: "EventResponse.ashx?start=" + start + "&end=" + end,
                    success: function (data) {

                        $.each(data, function (i, v) {
                            events.push({
                                id: v.id,
                                title: v.title,
                                description: v.description,
                                start: v.start,
                                end: v.end != null ? v.end : null,
                                allDay: v.allDay
                            });
                        })

                        $('[id*=calendar]').fullCalendar('removeEvents');
                        $('[id*=calendar]').fullCalendar('addEventSource', events);
                        $('[id*=calendar]').fullCalendar('rerenderEvents');
                        
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Status: " + textStatus); alert("Error: " + XMLHttpRequest.responseText);
                    }

                });
            });

            $('.fc-agendaWeek-button').click(function () {
                events = [];
                GetCalendarDateRange();
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: "EventResponse.ashx?start=" + start + "&end=" + end,
                    success: function (data) {

                        $.each(data, function (i, v) {
                            events.push({
                                id: v.id,
                                title: v.title,
                                description: v.description,
                                start: v.start,
                                end: v.end != null ? v.end : null,
                                allDay: v.allDay
                            });
                        })

                        $('[id*=calendar]').fullCalendar('removeEvents');
                        $('[id*=calendar]').fullCalendar('addEventSource', events);
                        $('[id*=calendar]').fullCalendar('rerenderEvents');
                        
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Status: " + textStatus); alert("Error: " + XMLHttpRequest.responseText);
                    }

                });
            });

            $('.fc-agendaDay-button').click(function () {
                events = [];
                GetCalendarDateRange();
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: "EventResponse.ashx?start=" + start + "&end=" + end,
                    success: function (data) {

                        $.each(data, function (i, v) {
                            events.push({
                                id: v.id,
                                title: v.title,
                                description: v.description,
                                start: v.start,
                                end: v.end != null ? v.end : null,
                                allDay: v.allDay
                            });
                        })

                        $('[id*=calendar]').fullCalendar('removeEvents');
                        $('[id*=calendar]').fullCalendar('addEventSource', events);
                        $('[id*=calendar]').fullCalendar('rerenderEvents');
                        
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Status: " + textStatus); alert("Error: " + XMLHttpRequest.responseText);
                    }

                });
            });

            $('.fc-today-button').click(function () {
                events = [];
                GetCalendarDateRange();
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: "EventResponse.ashx?start=" + start + "&end=" + end,
                    success: function (data) {

                        $.each(data, function (i, v) {
                            events.push({
                                id: v.id,
                                title: v.title,
                                description: v.description,
                                start: v.start,
                                end: v.end != null ? v.end : null,
                                allDay: v.allDay
                            });
                        })

                        $('[id*=calendar]').fullCalendar('removeEvents');
                        $('[id*=calendar]').fullCalendar('addEventSource', events);
                        $('[id*=calendar]').fullCalendar('rerenderEvents');
                        
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Status: " + textStatus); alert("Error: " + XMLHttpRequest.responseText);
                    }

                });
            });
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Status: " + textStatus); alert("Error: " + XMLHttpRequest.responseText);
        }

    });


  


    $("[id*=btn_addEmp]").click(function (e) {
        addEmp();
        e.preventDefault();
    });
    // add dialog
    $myWindow = $('#dialog');

    //instantiate the dialog
    $myWindow.dialog({
        height: 550,
        width: 600,
        modal: true,
        closeOnEscape: true,
        position: { my: 'top', at: 'top+75' },
        autoOpen: false,
        draggable: false,
        overlay: { opacity: 0.5, background: 'black' },

    });
    $("#dialog").parent().appendTo($("form:first"));

    // update Dialog
    //$('#updatedialog').dialog({
    //    autoOpen: false,
    //    width: 470,
    //    buttons: {
    //        "update": function () {
    //            alert(currentUpdateEvent.title);
    //            var eventToUpdate = {
    //                id: currentUpdateEvent.id,
    //                name: $("#MainContent_txt_title").val(),
    //                description: $("#MainContent_description").val()
    //            };

    //            PageMethods.UpdateEvent(eventToUpdate, updateSuccess);
    //            $(this).dialog("close");

    //            currentUpdateEvent.title = $("#MainContent_txt_title").val();
    //            currentUpdateEvent.description = $("#MainContent_description").val();

    //            $('#MainContent_calendar').fullCalendar('updateEvent', currentUpdateEvent);

    //        },
    //        "delete": function () {

    //            if (confirm("do you really want to delete this event?")) {

    //                PageMethods.deleteEvent($("#eventId").val(), deleteSuccess);
    //                $(this).dialog("close");
    //                $('#MainContent_calendar').fullCalendar('removeEvents', $("#eventId").val());
    //            }
    //        }
    //    }
    //});

 

    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    var options = {
        weekday: "long", year: "numeric", month: "short",
        day: "numeric", hour: "2-digit", minute: "2-digit"
    };

    $('[id*=uploadTrigger_1]').click(function (e) {
        e.preventDefault();
        $('[id*=file]').trigger('click');
    });

    $('[id*=delete_upload]').click(function (e) {
        e.preventDefault();
        $('[id*=file]').val("");
        $('[id*=lbl_attach]').html("");
        $('[id*=delete_upload]').hide();
    });

    $(function () {
        $('[id*=file]').change(function () {
            var path = $(this).val();
            if (path != '' && path != null) {
                var q = path.substring(path.lastIndexOf('\\') + 1);
                $('[id*=lbl_attach]').html(q);
                $('[id*=delete_upload]').show();
            }
        })
    });
    //$('#MainContent_calendar').fullCalendar({
    //    theme: true,
    //    header: {
    //        left: 'prev,next today customBtn',
    //        center: 'title',
    //        right: 'month,agendaWeek,agendaDay'
    //    },
    //    customButtons: {
    //        customBtn: {
    //            text: 'Custom Button',
    //            click: function () {
    //                alert('This custom button is hot! 🔥\nNow go have fun!');
    //            }
    //        }
    //    },
    //    defaultView: 'agendaWeek',
    //    eventClick: updateEvent,
    //    selectable: true,
    //    selectHelper: true,
    //    select: selectDate,
    //    editable: true,
    //    events: function (start, end, timezone, callback) {
    //        $.ajax({
    //            url: "Events.aspx/ProcessRequest",
    //            type: "POST",
    //            dataType: "JSON",
    //            data: {
    //                start: start.unix(),
    //                end: end.unix()
    //            },
    //            success: function (result) {
    //                var eventsList = [];
    //                 alert(result);                 // --1--
    //                // alert(JSON.stringify(result)); // --2--
    //                $(result).each(function () {
    //                    var eventTitle = $(this).attr('EventTitle');
    //                    var eventStart = $(this).attr('ShiftDate');
    //                    var eventId = $(this).attr('id');
    //                    eventsList.push(
    //                        {
    //                            id: eventId,
    //                            title: eventTitle,
    //                            start: eventStart
    //                        });
    //                });
    //                if (callback)
    //                    callback(eventsList);
    //            }
    //        });
    //    },
    //    eventDrop: eventDropped,
    //    eventResize: eventResized,
    //    eventRender: function (event, element) {
    //        //alert(event.title);
    //        element.qtip({
    //            content: {
    //                text: qTipText(event.start, event.end, event.description),
    //                title: '<strong>' + event.title + '</strong>'
    //            },
    //            position: {
    //                my: 'bottom left',
    //                at: 'top right'
    //            },
    //            style: { classes: 'qtip-shadow qtip-rounded' }
    //        });
    //    }
    //});
});
