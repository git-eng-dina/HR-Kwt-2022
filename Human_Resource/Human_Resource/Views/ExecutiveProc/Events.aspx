<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="Human_Resource.Views.ExecutiveProc.Events"  enableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <%-- <link href="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/cupertino/jquery-ui.min.css" rel="stylesheet" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.css" rel="stylesheet" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/qtip2/3.0.3/jquery.qtip.min.css" rel="stylesheet" />
    <link href="../../Content/css/calendar-blue.css" rel="stylesheet" />
    <link href="../../Content/css/custom-calendar.css" rel="stylesheet" />


     <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/qtip2/3.0.3/jquery.qtip.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.js"></script>--%>

     <link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.css" rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.print.css" rel="stylesheet" media="print" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/qtip2/3.0.3/jquery.qtip.min.js"></script>
    <script src="../../scripts/calendarScript.js" type="text/javascript"></script>

  <script>
      $(document).ready(function () {
          setResourceParams("<%= Resources.Labels.NewEvent%>", "<%= Resources.Labels.Today%>",
              "<%= Resources.Labels.Month%>", "<%= Resources.Labels.Week%>", "<%= Resources.Labels.Day%>",
              "<%= Resources.Labels.Save%>", "<%= Resources.Labels.Edit%>", "<%= Resources.Labels.ConfirmDelete%>",
              "<%= Session["user_id"]%>");

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
            <button type="button" class="close col-12" onClick="javascript:closeDialog();" CausesValidation="False">
                <i class="fa fa-close"></i>

            </button>
            </div>
         </div>
            <div class="modal-body panel-body model-b">
                 <div class="row div-attachment">
                 <a href=""  id="uploadTrigger_1"> <i class="fa fa-paperclip" style="color:#a19c9c"></i></a>
                      <a href="" id="lbl_attach" runat="server" target="_blank" class="href-file"></a>
                   
                   <a href="" id="delete_upload" style="display:none;"><i class='fas fa-trash' style="color:#a19c9c"></i></a>
                    </div>
                <div class="c-form"  style="margin-top:5px;">
                    <div class ="row">
                     <div class="form-group" style="display:block">
                          <asp:FileUpload ID="file" runat="server" style="display:none;" />
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Title%>" /></span>
                                <input type="hidden"  id="eventId" name="eventId" runat="server" value=""  />
                                <input type="text" class="form-control input-lg" id="txt_title" name="txt_title" runat="server" value=""  onchange="removeValidation($(this));"/>
                                 <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>

                            </div>
                        </div>
                     <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Description%>" /></span>
                                 <asp:TextBox type="text" class="form-control input-lg textarea" ID="description" name="description"  TextMode="MultiLine" Rows="3" runat="server" value="" Width="80%"  onchange="removeValidation($(this));" />
                                 <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>

                            </div>
                        </div>  

                    <div class="row">
                     <div class="form-group" style="display:block">
                              <span class="time-span"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Start%>" /></span>
                            <input type="datetime-local" class="form-control calendar" style="width:200px" id="start" runat="server" onchange="removeValidation($(this));">
                            <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>

 
                            <span class="time-span"><asp:Literal  runat="server" Text="<%$ Resources:Labels,End%>" /></span>
                            <input type="datetime-local" class="form-control input-lg calendar" id="end" style="width:200px"  runat="server"   onchange="removeValidation($(this));" /> 
                            <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>

                    </div>
                    </div>
                     <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Contributors%>" /></span>
                                   <input type="hidden" runat="server" id="hdn_empIds" name="hdn_empIds"/>
                                 <select runat="server" id="sel_employee" name="sel_employee" style="width:70%" class="form-control input-lg" ></select>
                                  <button class="add-arrow-btn"  runat="server"  id="btn_addEmp" >
                                   <i class="fas fa-arrow-alt-circle-down"></i>
                                </button>
                            </div>
                        </div> 
                 <div class ="row employee-list">
                        <ul id="lst_employee" class="employee-list" runat="server"></ul>
                    </div>
              
                  </div>
                    
                <div class="modal-footer">
                    <asp:HiddenField  runat="server" ID="hdnButtonID"/>


                    <asp:button class="btn btn-new"  id="btn_ads"  runat="server" Text=" <%$ Resources:Labels,Save%>"
                     UseSubmitBehavior="False"  
                        OnClick="btn_save_Click" 
                        OnClientClick="javascript:checkValidation(); return false;" >
                    </asp:button>

              <asp:button class="btn btn-delete"  id="btn_delete"  runat="server" Text=" <%$ Resources:Labels,Delete%>"
                     UseSubmitBehavior="False"  
                        OnClientClick="javascript:return deleteEvent();" >
                    </asp:button>

                  <%--  <button class="btn btn-new"  runat="server" id="btn_ads"
                         onclick="checkValidation()"  
                        >
                        <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Save%>" />
                    </button>--%>
 
                    <%-- <button class="btn btn-new"  runat="server" id="btn_ads"
                      onclick="saveEvent()">
                        <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Save%>" />
                    </button>--%>
 

                    </div>
                </div>
                 </div>
                
            </div>
     
</asp:Content>
