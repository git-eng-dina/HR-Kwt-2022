function getSupervisorTasks(empId,role,lang) {


    var parameter = {
        empId: empId,
        role: role,
        lang: lang,
        textSearch: $('#MainContent_txt_search').val(),
        date: getDateTime(),
    };
    $.ajax({
        type: "POST",
        url: "Tasks.aspx/GetSuperVisorTasks",
        data: JSON.stringify(parameter),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: onSucssess,
        failure: function (response) {
            alert(response.d);
        }
    });
}

function onSucssess(data) {
    var tasks = jQuery.parseJSON(data.d);

    var row = $("[id*=gv_approve] tr:last-child").clone(true);
    $("[id*=gv_approve] tr").not($("[id*=gv_approve] tr:first-child")).remove();
    $.each(tasks, function () {
        var task = $(this);
        $("td", row).eq(0).html($(this).find("TaskID").text());
        $("td", row).eq(1).html($(this).find("Name").text());
        $("td", row).eq(2).html($(this).find("Description").text());
        $("td", row).eq(3).html($(this).find("AddedBy").text());
        $("[id*=gv_approve]").append(row);
        row = $("[id*=gv_approve] tr:last-child").clone(true);
    });
}
function zeroPadded(val) {
    if (val >= 10)
        return val;
    else
        return '0' + val;
}

function getDateTime() {
    var localTime = new Date();

    var year = localTime.getYear();
    var month = localTime.getMonth() + 1;
    var date = localTime.getDate();
    var localDateTime = [localTime.getFullYear(), zeroPadded(localTime.getMonth() + 1),
        zeroPadded(localTime.getDate())].join('/');

     localDateTime = [zeroPadded(localTime.getMonth() + 1),
         zeroPadded(localTime.getDate()), localTime.getFullYear()].join('/');
    return localDateTime;

    //var localTime = new Date();
    //var year = localTime.getYear();
    //var month = localTime.getMonth() + 1;
    //var date = localTime.getDate();
    //var hours = localTime.getHours();
    //var minutes = localTime.getMinutes();
    //var seconds = localTime.getSeconds();
    //at this point you can do with your results whatever you please
}