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

function addSuccess(addResult) {
    // if addresult is -1, means event was not added

    if (addResult != -1) {
        $('#MainContent_calendar').fullCalendar('renderEvent',
            {
                title: $("#MainContent_title").val(),
                start: addStartDate,
                end: addEndDate,
                id: addResult,
                description: $("#MainContent_description").val(),
                allDay: globalAllDay
            },
            true // make the event "stick"
        );
        $('#MainContent_calendar').fullCalendar('unselect');
    }
}

function UpdateTimeSuccess(updateResult) {
    alert(updateResult);
}

function selectDate(start, end, allDay) {

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
//function get_eventsdata(start, end) {

//    var parameter = {
//        startDate: start,
//        endDate: end
//    };

//    $.ajax({
//        type: "POST",
//        dataType: "text json",
//        contentType: "application/json",
//        url: 'Events.aspx/ProcessRequest',
//        data: JSON.stringify(parameter),
//        success: function (resp) {
//            return resp;

//        },
//        error: function (response) {
//            alert(response);
//        }
//    });
//}

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
                $('#MainContent_title').val(item.title);
                $('#MainContent_description').val(item.description);


                var s = convertToJavaScriptDate(item.start);  
                $('#MainContent_start').val(s);

                s = convertToJavaScriptDate(item.end);
                $('#MainContent_end').val(s);

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
    $("#dialog").dialog("close");
}

function saveEvent(eventId) {
    var eventId = $("#MainContent_eventId").val();
    var title = $("#MainContent_title").val();
    var description = $("#MainContent_description").val();
    var start = $("#MainContent_start").val();
    var end = $("#MainContent_end").val();

    var empIdsStr = "";
    var inputs = $('ul li input');
    inputs.each(function (e) {
        empIdsStr = empIdsStr + $(this).val() + ',';
    });

    var parameter = {
        title: title,
        description: description,
        start: start,
        end: end,
        empIds: empIdsStr,
        eventId: eventId
    };
    $.ajax({
        type: "POST",
        url: "Events.aspx/SaveEvent",
        data: JSON.stringify(parameter),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            closeDialog();
            addSuccess(data.d);

        },
        failure: function (response) {
            alert(response.d);
        }
    });

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
        //eventSources: [
        //    // Load Standard Events For Employee
        //    function (start, end, callback) {
        //        $.ajax({
        //            type: "POST",
        //            url: "EventResponse.ashx",
        //            //data: '{startDate: "' + $.fullCalendar.formatDate(start, 'M/d/yyyy') + '",' + 'endDate: "' + $.fullCalendar.formatDate(end, 'M/d/yyyy') + '  "   , employeeID: "' + $('#lstEmployeesMaster').val() + '"       }',
        //            contentType: "application/json; charset=utf-8",
        //            dataType: "json",

        //            success: function (eventstring) {
        //                alert(eventstring);
        //                alert(success);
        //                //var buildingEvents = $.map(eventstring.d, function (item) {
        //                //    return {
        //                //        id: item.EventID,
        //                //        title: item.Title,
        //                //        start: '2022-11-18',
        //                //        end: '2022-11-18',
        //                //        allDay: false,
        //                //        //...(More Fields)
        //                //    };
        //                //});

        //                //callback(buildingEvents);
        //            },
        //            error: function (data) {
        //                alert(data.d);
        //            }
        //        });
        //    },
        //    //...(Additional Functions for other events)
        //],

        // events: 
        //     function(start, end, timezone, callback) {
        //         $.ajax({
        //             url: 'EventResponse.ashx',
        //             dataType: 'json',
        //             success: function (data) {
        //                 var events = [];
        //                 alert(data.d);
        //                 var res = data.d;
        //                 alert(res);
        //                 for (var i = 0; i < res.length; i++) {
        //                     alert(res[i].id);
        //                     events.push({
        //                         id: data[i]['id'],
        //                         title: data[i]['title'],
        //                         description: data[i]['description'],
        //                         start: convertToJavaScriptDate(data[i]['start']),
        //                         end: convertToJavaScriptDate(data[i]['end']),
        //                     });
        //                 }

        //                 //adding the callback
        //                // callback(events);
        //             }
        //             ,
        //             failure: function (response) {
        //                 alert(response.d);
        //             }
        //         });
        //     }
        //,
        eventDrop: eventDropped,
        eventResize: eventResized,
        eventRender: function (event, element) {
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
        }
    });

}

$(document).ready(function () {
    var events = [];
    $.ajax({
        type: "POST",
       // dataType: "json",
        contentType: "application/json; charset=utf-8",
        url: "EventResponse.ashx",
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
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Status: " + textStatus); alert("Error: " + XMLHttpRequest.responseText);
        }

    })

  

   // initFullcalendar();
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


    // update Dialog
    $('#updatedialog').dialog({
        autoOpen: false,
        width: 470,
        buttons: {
            "update": function () {
                alert(currentUpdateEvent.title);
                var eventToUpdate = {
                    id: currentUpdateEvent.id,
                    name: $("#MainContent_title").val(),
                    description: $("#MainContent_description").val()
                };

                PageMethods.UpdateEvent(eventToUpdate, updateSuccess);
                $(this).dialog("close");

                currentUpdateEvent.title = $("#MainContent_title").val();
                currentUpdateEvent.description = $("#MainContent_description").val();

                $('#MainContent_calendar').fullCalendar('updateEvent', currentUpdateEvent);

            },
            "delete": function () {

                if (confirm("do you really want to delete this event?")) {

                    PageMethods.deleteEvent($("#eventId").val(), deleteSuccess);
                    $(this).dialog("close");
                    $('#MainContent_calendar').fullCalendar('removeEvents', $("#eventId").val());
                }
            }
        }
    });

    //add dialog
    $('#addDialog').dialog({
        autoOpen: false,
        width: 470,
        buttons: {
            "Add": function () {
                //alert("sent:" + addStartDate.format("dd-MM-yyyy hh:mm:ss tt") + "==" + addStartDate.toLocaleString());
                var eventToAdd = {
                    title: $("#addEventName").val(),
                    description: $("#addEventDesc").val(),
                    start: addStartDate.toJSON(),
                    end: addEndDate.toJSON(),

                    allDay: isAllDay(addStartDate, addEndDate)
                };

                if (checkForSpecialChars(eventToAdd.title) || checkForSpecialChars(eventToAdd.description)) {
                    alert("please enter characters: A to Z, a to z, 0 to 9, spaces");
                }
                else {
                    //alert("sending " + eventToAdd.title);

                    PageMethods.addEvent(eventToAdd, addSuccess);
                    $(this).dialog("close");
                }
            }
        }
    });

    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    var options = {
        weekday: "long", year: "numeric", month: "short",
        day: "numeric", hour: "2-digit", minute: "2-digit"
    };


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
