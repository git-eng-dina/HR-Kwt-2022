<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Human_Resource.Views.Home.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  
<section class="statis">
    <div class="container" >
          <div class="row">
                 <div class="col-md-6" id="div_employees" runat="server">
                <div class="flag info-block">
                    <span class="flag dark-blue"></span>
                    <div class="row">
                        <div class="col-4 text-center mt-2 br-3 s-employees">
                            <i class="fa fa-users" style="font-size:40px;color:#2a3a92"></i>

                        </div>
                          <div class="col-8 text-center block-cursor">
                             <a href="/Views/Employees/Employees.aspx">
                            <label> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Employees%>" /></label>
                          <p id="lbl_employees"  runat="server" >
                            </p>
                              </a>
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
                         <div class="col-8 text-center block-cursor">
                             <a href="/Views/ExecutiveProc/Events.aspx">
                            <label> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Events%>" /></label>
                          <p id="lbl_events"  runat="server" >
                            </p>
                             </a>
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
                        <div class="col-8 text-center block-cursor">
                             <a href="/Views/ExecutiveProc/Trainings.aspx">
                            <label> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Trainings%>" /></label>
                          <p id="lbl_trainings"  runat="server" >
                            </p>
                            </a>
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
                          <div class="col-8 text-center block-cursor">
                             <a href="/Views/Attendance/VaccaitionApproval.aspx">
                            <label> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Vacations%>" /></label>
                          <p id="lbl_vacations"  runat="server" >
                            </p>
                              </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6" >
                <div class="info-block" id="div_passports" runat="server">
                    <span class="flag normal-blue"></span>
                    <div class="row">
                        <div class="col-4 text-center mt-2 br-3 orders">
                              <i class="fa fa-id-card-o" style="font-size:40px;color:#1d75b8"></i>
                        </div>
                      <div class="col-8 text-center block-cursor">
                             <a href="/Views/Employees/ExpiredPassports.aspx">
                            <label> <asp:Literal  runat="server" Text="<%$ Resources:Labels,ExpiredPassports%>" /></label>
                          <p id="lbl_expiredPassports"  runat="server" >
                            </p>
                          </a>
                        </div>
                         <div class="col-12 text-center">
                            <asp:Chart ID="passportsChart" runat="server" Height="200px" Width="300px" >
                                <Titles>
                                    <asp:Title  Name="Items" />
                                </Titles>
                                <Legends>
                                    <asp:Legend Alignment="Center" Docking="Right" IsTextAutoFit="False" Name="Default" LegendStyle="Column" />
                                </Legends>
                                <Series>
                                    <asp:Series Name="Default" />
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="PassportChartArea" BorderWidth="0" />
                                </ChartAreas>
                            </asp:Chart>
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
                        <div class="col-8 text-center block-cursor">
                             <a href="/Views/ExecutiveProc/Tasks.aspx"> 
                            <label> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Tasks%>" /></label>
                                 <p id="lbl_tasks"  runat="server" > <asp:Literal ID="events_notFount"  runat="server" Text="<%$ Resources:Labels,NotFound%>" /> </p>
                              </a>                                                  
                        </div>
                    
                             <div class="col-12 text-center">
                            <asp:Chart ID="tasksChart" runat="server" Height="200px" Width="300px" >
                                <Titles>
                                    <asp:Title  Name="Items" />
                                </Titles>
                                <Legends>
                                    <asp:Legend Alignment="Center" Docking="Right" IsTextAutoFit="False" Name="Default" LegendStyle="Column" />
                                </Legends>
                                <Series>
                                    <asp:Series Name="Default" />
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BorderWidth="0" />
                                </ChartAreas>
                            </asp:Chart>
                            </div>
                     
                    </div>
                </div>
            </div>


        </div>
    </div>
</section>         
</asp:Content>
