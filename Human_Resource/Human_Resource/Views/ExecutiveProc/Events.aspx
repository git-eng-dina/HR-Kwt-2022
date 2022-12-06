<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="Human_Resource.Views.ExecutiveProc.Events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   <link href="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/cupertino/jquery-ui.min.css" rel="stylesheet" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.css" rel="stylesheet" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/qtip2/3.0.3/jquery.qtip.min.css" rel="stylesheet" />
    <link href="../../Content/css/calendar-blue.css" rel="stylesheet" />


     <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/qtip2/3.0.3/jquery.qtip.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.js"></script>
    <script src="../../scripts/calendarScript.js" type="text/javascript"></script>

  <script>
      $(document).ready(function () {
          CustomButtonText = "<%= Resources.Labels.NewEvent%>";
         // get_eventsdata('2017-10-10', '2017-11-10');
      });
  </script>

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
                        <div runat="server" id="calendar" />
                         <input type="hidden" id="hdClient" runat="server" />
                    </div>
            </div>
         </div>
    </section>

      <div id="dialog"  class="Modal-BackGround " style="overflow:hidden;padding:0px">

        <div class="modal-dialog body">
        <div class ="modal-content panel panel-default">
        <div class="modal-header frame-panel-heading">
           
            <div ><span >
                <asp:Literal runat="server" Text="<%$ Resources:Labels,NewEvent%>"></asp:Literal>
            </span>
                </div>
            <div class="float2" style="width:10px">
            <button class="close col-12" onClick="closeDialog()" ><i class="fa fa-close"></i></button>
            </div>
         </div>
            <div class="modal-body panel-body model-b">
                <div class="c-form">
                    <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Title%>" /></span>
                                <input type="hidden"  id="hid_branchId" name="hid_branchId" runat="server" value=""  />
                                <input type="text" class="form-control input-lg" id="title" name="title" runat="server" value=""  />
                            </div>
                        </div>
                     <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Description%>" /></span>
                                 <asp:TextBox type="text" class="form-control input-lg textarea" ID="description" name="description"  TextMode="MultiLine" Rows="3" runat="server" value="" Width="80%"  />
                            </div>
                        </div>  

                    <div class="row">
                     <div class="form-group" style="display:block">
                              <span class="time-span"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Start%>" /></span>
                            <input type="datetime-local" class="form-control calendar" style="width:200px" id="start" runat="server">
 
                            <span class="time-span"><asp:Literal  runat="server" Text="<%$ Resources:Labels,End%>" /></span>
                            <input type="datetime-local" class="form-control input-lg calendar" id="end" style="width:200px"  runat="server" value="2000-11-01"   />                            
                    </div>
                    </div>
                     <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Employees%>" /></span>
                                 <select runat="server" id="sel_employee" name="sel_employee" style="width:70%" class="form-control input-lg" ></select>
                                  <button class="add-arrow-btn"  runat="server" onclick="addEmp()" id="Button1" >
                                   <i class="fas fa-arrow-alt-circle-down"></i>
                                </button>
                            </div>
                        </div> 
                 <div class ="row employee-list">
                        <ul id="lst_employee" class="employee-list" runat="server"></ul>
                    </div>
                 </div>
                  </div>
                    
                <div class="modal-footer">
                    <button class="btn btn-new"  runat="server" onclick="saveEvent()" id="btn_ads" >
                        <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Save%>" />
                    </button>
 

                    </div>
                </div>
                 </div>
                
            </div>
     
</asp:Content>
