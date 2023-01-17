<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Permissions.aspx.cs" Inherits="Human_Resource.Views.Settings.Permissions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>

        $(document).ready(function () {

            $('.object').click(function (e) {
                e.preventDefault();
                if ($('[id*=emp]').val() == 0)
                    alert("اختر موظف");
                   <%--// alert(<%= Resources.Labels.SelectHere %>);--%>
                else {

                }

                alert($(this).attr('id'));
            });
        });

        function getEmpInfo(sel) {
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


                        var arrayBufferView = new Uint8Array(item.Image);
                        var blob = new Blob([arrayBufferView], { type: "image/jpeg" });
                        var urlCreator = window.URL || window.webkitURL;
                        var imageUrl = urlCreator.createObjectURL(blob);
                        var img = document.querySelector("[id*=img_emp]");
                        img.src = imageUrl;

                        $.ajax({
                            type: "POST",
                            url: "Permissions.aspx/GetEmpPermissions",
                            data: JSON.stringify(parameter),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                for (var prop in data) {
                                    var item = data[prop];
                                    alert(item.ViewObject);
                                    $('[id*=txt_empName]').text(item.NameAr);
                                    $('[id*=txt_position]').val(item.Position);

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
                                <select runat="server" id="emp" name="emp" style="width:80%" class="form-control input-lg" onchange="getEmpInfo($(this));" ></select>
                               
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
                        <div class="c-form" style="margin-top:5px;" >
                            <div class="col-4 lst-links " id="lst_links" runat="server">
                                
                            </div>

                            <div class="col-8 float2" style="display:inline">
                            <div class="row">
                                 <i class="fa fa-eye view-li" aria-hidden="true"></i>
                                <asp:Literal runat="server" Text="<%$ Resources:Labels,Home%>" />

                                <div class="per-chk">
                                    <asp:CheckBox runat="server" id="chk_view" name="chk_view"  class=" input-lg"></asp:CheckBox>

                                </div>
                                
                            </div>
                            <div class="row">
                                 <i class="fa fa-edit view-li" aria-hidden="true"></i>
                                 <asp:Literal runat="server" Text="<%$ Resources:Labels,Home%>" />
                                 <asp:CheckBox runat="server" id="chk_edit" name="chk_edit"  class="form-control input-lg"></asp:CheckBox>

                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </section>
</asp:Content>
