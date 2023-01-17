<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Permissions.aspx.cs" Inherits="Human_Resource.Views.Settings.Permissions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>

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
                        alert(item.NameAr);
                        $('[id*=txt_empName]').text(item.NameAr);
                        $('[id*=txt_position]').val(item.Position);


                        var arrayBufferView = new Uint8Array(item.Image);
                        var blob = new Blob([arrayBufferView], { type: "image/jpeg" });
                        var urlCreator = window.URL || window.webkitURL;
                        var imageUrl = urlCreator.createObjectURL(blob);
                        var img = document.querySelector("[id*=img_emp]");
                        img.src = imageUrl;
 
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
                        <div class="col-4">

                           <img src="../../images/no-image-icon-125x125.png" id="img_emp" alt="" class="rounded mx-auto text-center">
           
                        </div>

                        <div class="col-7 details">
                            <div>
                                <p id="pName"><span style="width:20%"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Name%>" /> :</span>
                                    <span id="txt_empName" style="width:80%"></span></p>
                            </div>
                            <div>
                                <p id="pCompany"><span style="width:20%"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Position%>" />: </span>
                                    <span id="txt_position" style="width:80%"></span>
                                </p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

                   <div class="col-12">
                        <div class="c-form" >
                            <div class="col-4">
                            <ul id="lst_links"  runat="server"></ul>
                            </div>

                            <div class="col-8">
                            <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Employee%>" /></span>
                                <select runat="server" id="Select2" name="emp" style="width:80%" class="form-control input-lg" onchange="getEmpInfo($(this));" ></select>
                               
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </section>
</asp:Content>
