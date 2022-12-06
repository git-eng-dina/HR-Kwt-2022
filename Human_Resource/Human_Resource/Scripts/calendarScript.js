﻿var currentUpdateEvent;
var addStartDate;
var addEndDate;
var globalAllDay;
var CustomButtonText;

function updateEvent(event, element) {
    alert(event.description);

    if ($(this).data("qtip")) $(this).qtip("destroy");

    currentUpdateEvent = event;

    $('#updatedialog').dialog('open');
    $("#eventName").val(event.title);
    $("#eventDesc").val(event.description);
    $("#eventId").val(event.id);
    $("#eventStart").text("" + event.start.toLocaleString());

    if (event.end === null) {
        $("#eventEnd").text("");
    }
    else {
        $("#eventEnd").text("" + event.end.toLocaleString());
    }
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
    //    alert("added key: " + addResult);

    if (addResult != -1) {
        $('#MainContent_calendar').fullCalendar('renderEvent',
            {
                title: $("#addEventName").val(),
                start: addStartDate,
                end: addEndDate,
                id: addResult,
                description: $("#addEventDesc").val(),
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
function get_eventsdata(start, end) {
    $.ajax({
        type: "POST",
        url: 'Events.aspx/ProcessRequest',
        data: {
            start: start,
            end: end
        },
        success: function (resp) {
            // Now you have your event data, you can fire up Fullcalendar
            initFullcalendar(resp);
        }
    });
}

function ShowDialog() {

    $("#dialog").dialog("open");
    $(".ui-dialog-titlebar").hide();
    var retval = "";
}
function initFullcalendar(events, AddBtnText) {
    $('#MainContent_calendar').fullCalendar({
        theme: true,
        header: {
            left: 'prev,next today customBtn',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        customButtons: {
            customBtn: {
                text: CustomButtonText,
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
            //alert(event.title);
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

function closeDialog() {
    $("#dialog").dialog("close");
}

function saveEvent(eventId) {
    var title = $("#MainContent_title").val();
    var description = $("#MainContent_description").val();
    var start = $("#MainContent_start").val();
    var end = $("#MainContent_end").val();
    alert(start);
    var parameter = {
        title: title,
        description: description,
        start: start,
        end: end,
        eventId: '0'
    };
    $.ajax({
        type: "POST",
        url: "Events.aspx/SaveEvent",
        data: JSON.stringify(parameter),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            window.top.location = "branches.aspx";

        },
        failure: function (response) {
            alert(response.d);
        }
    });

}
$(document).ready(function () {
   // get_eventsdata('2017-10-10', '2017-11-10');
    // add dialog
    $myWindow = $('#dialog');

    //instantiate the dialog
    $myWindow.dialog({
        height: 500,
        width: 600,
        modal: true,
        closeOnEscape: true,
        position: { my: 'top', at: 'top+75' },
        autoOpen: false,
        draggable: true,
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
                    name: $("#eventName").val(),
                    description: $("#eventDesc").val()
                };

                PageMethods.UpdateEvent(eventToUpdate, updateSuccess);
                $(this).dialog("close");

                currentUpdateEvent.title = $("#eventName").val();
                currentUpdateEvent.description = $("#eventDesc").val();

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
