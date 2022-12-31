<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AttendanceReport.aspx.cs" Inherits="Human_Resource.Views.Attendance.AttendanceReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
         <script>
             $(document).ready(function () {
                 $(".hasdatepicker").datepicker({
                     changeMonth: true,
                     changeYear: true,
                     format: "MM/dd/yyyy",
                 });
             });

        </script>


     <section class="statis">
         <div class="container" >
              <div class="row">
                   <div class="col-12">
                        <div class="bcrumb-block">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Employees%>" /></a></li>
                                </ol>
                            </nav>
                        </div>
                       
                        <div class="SearchAddbar">

                        <div class="input-group">
                            <div class="col-2">
                                <input type="text" runat="server" id="txt_deviceNum" placeholder="<%$ Resources:Labels,DeviceID%>" />
                            </div>
                            <div class="col-2">
                                <input type="text" runat="server" id="txt_port" placeholder="<%$ Resources:Labels,Port%>" />
                            </div>
                            <div class="col-2">
                                <asp:TextBox ID="dp_from" runat="server" class="form-control input-lg hasdatepicker" placeholder="<%$ Resources:Labels,From%>" ></asp:TextBox>
                            </div>
                            <div class="col-2">
                                <asp:TextBox ID="dp_to" runat="server" class="form-control input-lg hasdatepicker" placeholder="<%$ Resources:Labels,To%>" ></asp:TextBox>
                            </div>
                            <div class="col-2">
                                <asp:Button ID="ButtonSearch" runat="server" CssClass="btn btn-search" Text=" <%$ Resources:Labels,Search%>"
                                    OnClick="btn_Search_Click" />
                            </div> 

                        </div>
   
                        </div>
                    </div>
                  </div>
         </div>
    </section>
</asp:Content>
