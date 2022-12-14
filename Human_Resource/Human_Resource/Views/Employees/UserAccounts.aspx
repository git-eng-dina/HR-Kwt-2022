<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserAccounts.aspx.cs" Inherits="Human_Resource.Views.Employees.UserAccounts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function clearValues() {
 
            $("#MainContent_lbl_msg").html('');
            $("#MainContent_txt_userName").val("");
            $("#MainContent_txt_password").val("");
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
                                <select runat="server" id="sel_employee" name="sel_employee" class="form-control" style="width:80%" onchange="clearValues()"></select>
              
                            </div>
                            </div>

                             <div class="row">
                            <div class="form-group" style="display:block">
                               <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,UserName%>" /></span>
                                <asp:TextBox class="form-control input-lg" id="txt_userName" runat="server" />
                            </div>
                            </div>

                            <div class="row">
                            <div class="form-group" style="display:block">
                               <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Password%>" /></span>
                                <input type="password" class="form-control input-lg" id="txt_password" runat="server" />
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
