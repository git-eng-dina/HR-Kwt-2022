<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Permissions.aspx.cs" Inherits="Human_Resource.Views.Settings.Permissions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>

        $(document).ready(function () {

            $('.object').click(function (e) {
                e.preventDefault();
   
                if ($('[id*=sel_emp]').val() == 0) {
                    alert('<%= Resources.Labels.SelectUser %>');
                }
                else {
                    var element = $(this);
                    $('[id*=hid_appObjectID]').val(element.attr('id'));

                    $('[id*=lbl_objectName]').text(element.find(">:first-child").text());

                    var empId = $('[id*=sel_emp]').val();
                    var appObjectId = $('[id*=hid_appObjectID]').val();
                    var parameter = {
                        empId: empId,
                        appObjectId: appObjectId,
                    };
                    $.ajax({
                        type: "POST",
                        url: "Permissions.aspx/GetObjectPermission",
                        data: JSON.stringify(parameter),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            for (var prop in data) {
                                var item = data[prop];
 
                                if (item != "" && item != null) {

                                    $('[id*=chk_view]').prop('checked', item.ViewObject);
                                    $('[id*=chk_edit]').prop('checked', item.EditObject);

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

            });
        });

        function resetPermission() {
            $('[id*=chk_view]').prop('checked', false);
            $('[id*=chk_edit]').prop('checked', false);
          
        }

        function getEmpInfo(sel) {
            $('[id*=lbl_objectName]').text('');
            $('.permission-icon').each(function () {
                $(this).addClass('hidden');
            });
            resetPermission();

            var id = sel.val();
            var parameter = {
                ID: id,
            };
            $.ajax({
                type: "POST",
                url: "Permissions.aspx/GetEmpInfo",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    for (var prop in data) {
                        var item = data[prop];

                        $('[id*=txt_empName]').text(item.NameAr);
                        $('[id*=txt_position]').val(item.Position);

                        var img = document.querySelector("[id*=img_emp]");
                        if (item.Image != null) {
                            var arrayBufferView = new Uint8Array(item.Image);
                            var blob = new Blob([arrayBufferView], { type: "image/jpeg" });
                            var urlCreator = window.URL || window.webkitURL;
                            var imageUrl = urlCreator.createObjectURL(blob);
                           
                            img.src = imageUrl;
                        }
                        else {
                            img.src = "../../images/no-image-icon-125x125.png";
                        }
                        $.ajax({
                            type: "POST",
                            url: "Permissions.aspx/GetEmpPermissions",
                            data: JSON.stringify(parameter),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                for (var prop in data) {
                                    var item = data[prop];
                                    if (item != "" && item != null) {
                                        for (var perm in item) {
                                            per = item[perm];
 
                                            var element = $('[id*=' + per.AppObjectID + ']').find('div').first();
                                            var ifaView = element.find('.fa-eye').first();
                                            var ifaEdit = element.find('.fa-edit').first();
               
                                            if (per.ViewObject)
                                                ifaView.removeClass("hidden");
                                            else
                                                ifaView.addClass("hidden");

                                             if (per.EditObject)
                                                 ifaEdit.removeClass("hidden");
                                            else
                                                 ifaEdit.addClass("hidden");
                                        
                                        }
                                    }

                                }
                            },
                            failure: function (response) {
                                alert(response.d);
                            }
                        });
 
                    }


                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function savePermission() {
            var empId = $('[id*=sel_emp]').val();
            var appObjectId = $('[id*=hid_appObjectID]').val();
            var view = false;
            if ($("[id*=chk_view]").is(':checked'))
                view = true;

            var edit = false;
            if ($("[id*=chk_edit]").is(':checked'))
                edit = true;
            var parameter = {
                empId: empId,
                appObjectId: appObjectId,
                view: view,
                edit: edit,
            };
           
            $.ajax({
                type: "POST",
                url: "Permissions.aspx/savePermission",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    var element = $('[id*=' + appObjectId + ']').find('div').first();
                    var ifaView = element.find('.fa-eye').first();
                    var ifaEdit = element.find('.fa-edit').first();

                    if (view)
                        ifaView.removeClass("hidden");
                    else
                        ifaView.addClass("hidden");

                    if (edit)
                        ifaEdit.removeClass("hidden");
                    else
                        ifaEdit.addClass("hidden");
                    alert('<%= Resources.Labels.SaveSuccessfully%>');
                },
                failure: function (response) {
                    alert(response.d);
                }
            });

        }
    </script>
         <section class="statis">
         <div class="container" >
              <div class="row">
                   <div class="col-12">
                        <div class="bcrumb-block">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Permissions%>" /></a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="c-form" style="padding-bottom:0px;">
                            <div class="row">
                            <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Employee%>" /></span>
                                <select runat="server" id="sel_emp" name="sel_emp" style="width:80%" class="form-control input-lg" onchange="getEmpInfo($(this));" ></select>
                               
                            </div>
                            </div>
                        </div>
                    </div>

                   <div class="col-12">
                    <div class="c-user-profile">
                    <div class="row">
                        <div class="col-3">

                           <img src="../../images/no-image-icon-125x125.png" id="img_emp" alt="" class="rounded mx-auto text-center">
           
                        </div>

                        <div class="col-9 details">
                            <div>
                                <p id="pName" style="margin-top:20px;"><span style="width:20%"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Name%>" /> :</span>
                                    <span id="txt_empName" style="width:80%"></span></p>
                            </div>
                            <div>
                                <p id="pCompany" style="margin-top:20px;"><span style="width:20%"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Position%>" />: </span>
                                    <span id="txt_position" style="width:80%"></span>
                                </p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

                   <div class="col-12">
                        <div class="permission-form" style="margin-top:5px;" >
                            <div class="col-4 lst-links " id="lst_links" runat="server">
                                <div class="row col-11 form-group title ">
                                        <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Access%>" /></span>
                                </div>
                                <input type="hidden"  id="hid_appObjectID" name="hid_appObjectID" runat="server" value=""  />

                            </div>

                            <div class="col-8 box-shadows" >
                                <div class="row">
                                    <div class="row col-11 form-group title">
                                        <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Permissions%>" />:&nbsp;</span>
                                         <span  ID="lbl_objectName" ></span>
                                    </div>

                                </div>
                            <div class="row">
                                <div class="col-8">
                                 <i class="fa fa-eye view-li" aria-hidden="true"></i>
                                <asp:Literal runat="server" Text="<%$ Resources:Labels,View%>" />
                                </div>
                                <div class="col-4 per-chk">
                                    <asp:CheckBox runat="server" id="chk_view" name="chk_view"  class=" per-chk"></asp:CheckBox>

                                </div>
                                
                            </div>
                            <div class="row" style="height:300px;">
                                 <div class="col-8">
                                 <i class="fa fa-edit view-li" aria-hidden="true"></i>
                                 <asp:Literal runat="server" Text="<%$ Resources:Labels,AddEditDelete%>" />
                                 </div>
                                 <div class="col-4 per-chk">
                                <asp:CheckBox type="checkbox" runat="server" id="chk_edit" name="chk_edit"  class="per-chk"></asp:CheckBox>
                                 </div>
                            </div>

                            <div class="row">
                                  <button class="btn btn-secondary btn-block save"  runat="server" onclick="javascript:savePermission();return false;" id="btn_save" >
                                    <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Save%>" />
                                </button>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </section>
</asp:Content>
