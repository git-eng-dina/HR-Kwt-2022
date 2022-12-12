<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompanyListView.aspx.cs" Inherits="Human_Resource.Views.Settings.CompanyListView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <section class="statis">
         <div class="container" >
              <div class="row">
                   <div class="col-12">
                        <div class="bcrumb-block">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,CompanyList%>" /></a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                   <div class="col-12">
                        <div class="view-form">
                            <div class="row">
                            <div class="form-group textarea" style="display:block">
                                <asp:Literal runat="server" ID="companyList1"></asp:Literal>
<%--                                <asp:TextBox class="form-control single-input" id="companyList" runat="server" TextMode="MultiLine" Rows="16"  onchange="removeValidation($(this));" />--%>

                            </div>
                            </div>
  
                        </div>
                   </div>
             </div>
        </div>
    </section>
</asp:Content>
