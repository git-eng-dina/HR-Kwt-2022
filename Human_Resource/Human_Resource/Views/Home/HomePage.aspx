<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Human_Resource.Views.Home.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  
<section class="statis">
    <div class="container" >
          <div class="row">
                 <div class="col-md-6">
                <div class="flag info-block">
                    <span class="flag dark-blue"></span>
                    <div class="row">
                        <div class="col-4 text-center mt-2 br-3 s-employees">
                            <i class="fa fa-users" style="font-size:40px;color:#2a3a92"></i>
                           <%-- <svg class="s-invoice" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                 viewBox="0 0 128 128" style="enable-background:new 0 0 128 128;" xml:space="preserve">
                            </svg>--%>
                        </div>
                        <div class="col-8 text-center">
                            <label> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Employees%>" /></label>
                          <p id="lbl_employees"  runat="server" >
                                <%--<a class="a-enter" href="@Url.Action("SalesInvoices", "Agent", new { agentId= "xxx"})" title="">@AppResource.Enter</a>--%>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="info-block">
                    <span class="flag normal-blue"></span>
                    <div class="row">
                        <div class="col-4 text-center mt-2 br-3 orders">
                              <i class="fa fa-id-card-o" style="font-size:40px;color:#1d75b8"></i>
                        </div>
                        <div class="col-8 text-center">
                            <label> <asp:Literal  runat="server" Text="<%$ Resources:Labels,ExpiredPassports%>" /></label>
                          <p id="lbl_expiredPassports"  runat="server" >
                                <%--<a class="a-enter" href="@Url.Action("SalesInvoices", "Agent", new { agentId= "xxx"})" title="">@AppResource.Enter</a>--%>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
              
            <div class="col-md-6">
                <div class="info-block">
                    <span class="flag rose"></span>
                    <div class="row">
                        <div class="col-4 text-center mt-2 br-3 quotations">
                              <i class="fa fa-calendar-check" style="font-size:40px;color:#ff5d6f"></i>
                        </div>
                        <div class="col-8 text-center">
                            <label> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Events%>" /></label>
                          <p id="lbl_events"  runat="server" >
                                <%--<a class="a-enter" href="@Url.Action("SalesInvoices", "Agent", new { agentId= "xxx"})" title="">@AppResource.Enter</a>--%>
                            </p>
                        </div>
                       
                    </div>
                </div>
            </div>
              <div class="col-md-6">
                <div class="info-block">
                    <span class="flag green"></span>
                    <div class="row">
                        <div class="col-4 text-center mt-2 br-3 users">
                              <i class="fa fa-edit" style="font-size:40px;color:#00cc9e"></i>
                        </div>
                        <div class="col-8 text-center">
                            <label> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Tasks%>" /></label>
                          <p id="lbl_tasks"  runat="server" >
                                <%--<a class="a-enter" href="@Url.Action("SalesInvoices", "Agent", new { agentId= "xxx"})" title="">@AppResource.Enter</a>--%>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
               <div class="col-md-6">
                <div class="info-block">
                    <span class="flag orange"></span>
                    <div class="row">
                        <div class="col-4 text-center mt-2 br-3 trainings">
                              <i class="fa fa-calendar-check" style="font-size:40px;color:#ffb36b"></i>
                        </div>
                        <div class="col-8 text-center">
                            <label> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Trainings%>" /></label>
                          <p id="lbl_trainings"  runat="server" >
                                <%--<a class="a-enter" href="@Url.Action("SalesInvoices", "Agent", new { agentId= "xxx"})" title="">@AppResource.Enter</a>--%>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
                <div class="col-md-6">
                <div class="info-block">
                    <span class="flag purble"></span>
                    <div class="row">
                        <div class="col-4 text-center mt-2 br-3 vacations">
                              <i class="fa fa-calendar-check" style="font-size:40px;color:#bc80ef"></i>
                        </div>
                        <div class="col-8 text-center">
                            <label> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Vacations%>" /></label>
                          <p id="lbl_vacations"  runat="server" >
                                <%--<a class="a-enter" href="@Url.Action("SalesInvoices", "Agent", new { agentId= "xxx"})" title="">@AppResource.Enter</a>--%>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>         
</asp:Content>
