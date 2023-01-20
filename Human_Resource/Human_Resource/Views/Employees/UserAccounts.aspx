<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserAccounts.aspx.cs" Inherits="Human_Resource.Views.Employees.UserAccounts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        //function clearValues() {
 
        //    $("#MainContent_lbl_msg").html('');
        //    $("#MainContent_txt_userName").val("");
        //    $("#MainContent_txt_password").val("");
        //}
         
        function getAccountInfo() {
            var parameter = {
                userID: $("[id*=sel_employee").val(),
            };
            $.ajax({
                type: "POST",
                url: "UserAccounts.aspx/GetAccount",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    for (var prop in data) {
                        var item = data[prop];
   
                        $('[id*=txt_userName]').val(item.Username);
                        $('[id*=isBarcodeUser]').prop('checked', item.IsBarcodeUser);                       
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
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,UsersInfo%>" /></a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                   <div class="col-12">
                        <div class="c-form mini-form">
                            <div class="row">
                            <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Employee%>" /></span>
                                <select runat="server" id="sel_employee" name="sel_employee" class="form-control" style="width:80%" onchange="getAccountInfo()"></select>
              
                            </div>
                            </div>

                             <div class="row">
                            <div class="form-group" style="display:block">
                               <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,UserName%>" /></span>
                                <asp:TextBox class="form-control input-lg" id="txt_userName" runat="server" Text="" />
                            </div>
                            </div>

                            <div class="row">
                            <div class="form-group" style="display:block">
                               <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Password%>" /></span>
                                <input type="password" class="form-control input-lg" id="txt_password" runat="server" value="" />
                            </div>
                            </div> 

                            <div class="row">
                            <div class="form-group" style="display:block">
                                <asp:CheckBox ID="isBarcodeUser" runat="server"  />
                               <span style="width:70%"> <asp:Literal  runat="server" Text="<%$ Resources:Labels,BarcodeUser%>" /></span>
                                    
                            </div>
                            </div> 

                            
                             <label class="form-control label-error" id="lbl_msg" name="lbl_msg" runat="server" />
                            <asp:Button runat="server" Text = "<%$ Resources:Labels,Save%>" class="btn btn-secondary btn-block" id="btn_save" OnClick="btn_save_Click" CausesValidation="false" >
                            </asp:Button>
  
                        </div>
                   </div>
             </div>
        </div>
    </section>
</asp:Content>
