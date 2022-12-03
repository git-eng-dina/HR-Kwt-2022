<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="Human_Resource.Views.ExecutiveProc.Events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <link href="../../fullcalendar/jquery-ui-1.7.3.custom.css" rel="stylesheet" type="text/css" />
    <link href="../../fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" />

<%--    <script src="../../jquery/jquery-1.3.2.min.js" type="text/javascript"></script>--%>

    <script src="../../jquery/jquery-ui-1.7.3.custom.min.js" type="text/javascript"></script>

    <script src="../../jquery/jquery.qtip-1.0.0-rc3.min.js" type="text/javascript"></script>

    <script src="../../fullcalendar/fullcalendar.min.js" type="text/javascript"></script>

    <script src="../../scripts/calendarscript.js" type="text/javascript"></script>
    
    <script src="../../jquery/jquery-ui-timepicker-addon-0.6.2.min.js" type="text/javascript"></script>

     <section class="statis">
         <div class="container" >
               <div class="row">
                   <div class="col-12">
                        <div class="bcrumb-block">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Events%>" /></a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>

                    <div class="col-12">
                        <div runat="server" id="jsonDiv" />
                         <input type="hidden" id="hdClient" runat="server" />
                    </div>
            </div>
         </div>
    </section>
</asp:Content>
