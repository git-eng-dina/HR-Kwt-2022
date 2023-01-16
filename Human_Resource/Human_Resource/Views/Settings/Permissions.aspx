<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Permissions.aspx.cs" Inherits="Human_Resource.Views.Settings.Permissions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>

        function getEmpInfo(sel) {
            var parameter = {
                ID: sel.val(),
            };
            $.ajax({
                type: "POST",
                url: "Permissions.aspx/GetEmpInfo",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    ShowDialog();
                    for (var prop in data) {
                        var item = data[prop];
                        $('#MainContent_hid_managementId').val(item.ManagementID);
                        $('#MainContent_dept_name').val(item.Name);
                        $('#MainContent_txt_mobile').val(item.Mobile);
                        $('#MainContent_emp').val(item.ManagerID);
                        $('#MainContent_branch').val(item.BranchID);
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
                        <div class="c-form">
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

                           <img src="../../images/no-image-icon-125x125.png" id="img_Customer" alt="" class="rounded mx-auto text-center">
           
                        </div>

                        <div class="col-7 details">
                            <div>
                                <p id="pName"><span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Name%>" /> :</span></p>
                            </div>
                            <div>
                                <p id="pCompany"><span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Position%>" />: </span></p>
                            </div>
                            <div>
                                <p id="pMobile"><span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Permissions%>" /> </span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                </div>
            </div>
            </section>
</asp:Content>
