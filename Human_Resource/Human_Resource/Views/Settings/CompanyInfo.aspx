<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompanyInfo.aspx.cs" Inherits="Human_Resource.Views.Settings.CompanyInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="statis">
         <div class="container" >
              <div class="row">
                   <div class="col-12">
                        <div class="bcrumb-block">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,CompanyInfo%>" /></a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                   <div class="col-12">
                        <div class="c-form">
                            <div class="row">
                            <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,TheName%>" /></span>
                                <asp:TextBox id="txt_name"  runat="server" class="form-control input-lg" ></asp:TextBox>
                                <input type="hidden" runat="server" id="hid_companyID" />
                            </div>
                            </div>

                             <div class="row">
                            <div class="form-group" style="display:block">
                               <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Address%>" /></span>
                                <asp:TextBox class="form-control input-lg" id="txt_address" runat="server" />
                            </div>
                            </div>

                            <div class="row">
                            <div class="form-group" style="display:block">
                               <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Email%>" /></span>
                                <input type="email" class="form-control input-lg" id="txt_email" runat="server" />
                            </div>
                            </div> 
                            
                            <div class="row">
                            <div class="form-group" style="display:block">
                               <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Mobile%>" /></span>
                                <asp:TextBox class="form-control input-lg" id="txt_mobile" runat="server" />
                            </div>
                            </div>

                            <div class="row">
                            <div class="form-group" style="display:block">
                               <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Phone%>" /></span>
                                <asp:TextBox class="form-control input-lg" id="txt_phone" runat="server" />
                            </div>
                            </div>

                             <div class="row">
                            <div class="form-group" style="display:block">
                               <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Fax%>" /></span>
                                <asp:TextBox class="form-control input-lg" id="txt_fax" runat="server" />
                            </div>
                            </div>
                            <div class="row">
                            <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,GeneralDirector%>" /></span>
                                <select runat="server" id="sel_generalDirector" name="sel_generalDirector" class="form-control input-lg"></select>
      
                            </div>
                            </div>
                             <div class="row">
                            <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,CEO%>" /></span>
                                <select runat="server" id="sel_CEO" name="sel_CEO" class="form-control"></select>
      
                            </div>
                            </div>
                             <div class="row">
                            <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,FinancialManager%>" /></span>
                                <select runat="server" id="sel_financialManager" name="sel_financialManager" class="form-control"></select>
      
                            </div>
                            </div>
                             <div class="row">
                            <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,HRManager%>" /></span>
                                <select runat="server" id="sel_HRManager" name="sel_HRManager" class="form-control"></select>
      
                            </div>
                            </div>
                            <div class="row">
                            <div class="form-group" style="display:block">
                               <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Notes%>" /></span>
                                <asp:TextBox class="form-control input-lg" id="txt_notes" runat="server"  />
                            </div>
                            </div>


                            <asp:Button runat="server" Text = "<%$ Resources:Labels,Edit%>" class="btn btn-secondary btn-block" id="btn_edit" OnClick="btn_edit_Click" CausesValidation="false" >
                            </asp:Button>
  
                        </div>
                   </div>
             </div>
        </div>
    </section>
</asp:Content>
