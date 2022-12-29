<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VaccaitionApproval.aspx.cs" Inherits="Human_Resource.Views.Attendance.VaccaitionApproval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
 
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
     <style>
       #ui-datepicker-div{
           z-index:10000 !important;
       }
   </style>
    <script>

        $(document).ready(function () {

                $(".hasdatepicker").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    format: "dd/MM/yyyy",
                });

            $myWindow = $('#dialog');

            //instantiate the dialog
            $myWindow.dialog({
                height: 500,
                width: 400,
                modal: true,
                closeOnEscape: true,
                position: { my: 'top', at: 'top+75' },
                autoOpen: false,
                draggable: true,
                overlay: { opacity: 0.5, background: 'black' },

            });

            $('.td-edit').click(function () {
                var customID = $(this).attr('myCustomID');
                ShowDialogWithData(customID);
                return false;
            });

            $('.td-approve').click(function () {

                var customID = $(this).attr('myCustomID');
                if (confirm("<%= Resources.Labels.AreYouSure%>")) {

                     var parameter = {
                         employeeVacationID: customID,
                         userID: <%= Session["user_id"].ToString() %>,
                     };

                     $.ajax({
                         type: "POST",
                         url: "VaccaitionApproval.aspx/Approve",
                         data: JSON.stringify(parameter),
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (data) {
                             window.location = "VaccaitionApproval.aspx";

                         },
                         failure: function (response) {
                             alert(response.d);
                         }
                     });

                 }

                 return false;
             });
             $('.td-reject').click(function () {

                var customID = $(this).attr('myCustomID');
                if (confirm("<%= Resources.Labels.AreYouSure%>")) {

                     var parameter = {
                         employeeVacationID: customID,
                         userID: <%= Session["user_id"].ToString() %>,
                     };

                     $.ajax({
                         type: "POST",
                         url: "VaccaitionApproval.aspx/Approve",
                         data: JSON.stringify(parameter),
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (data) {
                             window.location = "VaccaitionApproval.aspx";

                         },
                         failure: function (response) {
                             alert(response.d);
                         }
                     });

                 }

                 return false;
             });

        });

        //function to close dialog, probably called by a button in the dialog
        function closeDialog() {
            $('#MainContent_hid_employeesVacationId').val("");
            $('#MainContent_emp').val("");
            $('#MainContent_vac').val("");
            $('#MainContent_txt_fromDate').val("");
            $('#MainContent_txt_toDate').val("");
            $("#dialog").dialog("close");
        }

        function ShowDialog() {

            $("#dialog").dialog("open");
            $(".ui-dialog-titlebar").hide();
            var retval = "";
        }
        function ShowDialogWithData(customID) {
            var parameter = {
                ID: customID
            };
            $.ajax({
                type: "POST",
                url: "VaccaitionApproval.aspx/GetEmployeesVacation",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    ShowDialog();
                    for (var prop in data) {
                        var item = data[prop];
                        $('#MainContent_hid_employeesVacationId').val(item.EmployeesVacationID);
                        $('#MainContent_emp').val(item.EmployeeID);
                        $('#MainContent_vac').val(item.VacationID);

                        var start = convertToJavaScriptDate(item.FromDate);
                        $('#MainContent_txt_fromDate').val(start);

                        var end = convertToJavaScriptDate(item.ToDate);
                        $('#MainContent_txt_toDate').val(end);
 
                     }


                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function saveEmployeesVacation() {
            var id = $('#MainContent_hid_employeesVacationId').val();
            var emp = $("#MainContent_emp").find(":selected").val();
            var vac = $("#MainContent_vac").find(":selected").val();
            var fromDate = $("#MainContent_txt_fromDate").val();
            var toDate = $("#MainContent_txt_toDate").val();
              var parameter = {
                employeesVacationId: id,
                 employeeId: emp,
                 vacationId: vac,
                  fromDate: fromDate,
                  toDate: toDate,
              };
            $.ajax({
                type: "POST",
                url: "VaccaitionApproval.aspx/SaveEmployeesVacation",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    window.top.location = "VaccaitionApproval.aspx";

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
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ScheduleVacation%>" /></a></li>
                                </ol>
                            </nav>
                        </div>
                       
                        <div class="SearchAddbar">

                        <div class="input-group">
                            <div class="col-4">
                                <input type="text" runat="server" id="txt_search" placeholder="<%$ Resources:Labels,Search%>"  />
                            </div>
                            <div style="width:90px">
                                <asp:Button ID="ButtonSearch" runat="server" CssClass="btn btn-search" Text=" <%$ Resources:Labels,Search%>"
                                    OnClick="btn_Search_Click" />
                            </div> 
                            <div style="width:80px">
                            <Button type="button" runat="server" class="btn btn-new btn-block" id="btn_new"  CausesValidation="false" >
                                <asp:Literal  runat="server" Text=" <%$ Resources:Labels,New%>" />
                            </Button>
                            </div>
                        </div>
   
                        </div>
                          <!------- approval vaccation -->
                        <div class="row gridView-title" id="gv_approve_title" runat="server">                       
                           <span><asp:Literal Text=" <%$ Resources:Labels,WaitingApprove%>" runat="server"></asp:Literal> </span>
                        </div>
                       <asp:GridView ID="gv_needApprove" runat="server"  CssClass="gridView col-md-12"  
                               style="margin-top:0px;"  AutoGenerateColumns="False"  Width="90%" 
                            OnRowDataBound="gv_approve_RowDataBound"      
                           class="table table-bordered table-condensed table-responsive table-hover ">
                                <Columns>

                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Sequence%>" ItemStyle-Width="5%">
                                         <ItemTemplate>
                                                 <%#Container.DataItemIndex+1 %>                            
                                         </ItemTemplate> 
                                       </asp:TemplateField>

                                    
                                        <asp:TemplateField HeaderText="<%$ Resources:Labels,employee%>" ItemStyle-Width="20%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDemployee1" runat="server" 
                                                 Text='<%# Eval("EmployeeName") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>

                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Vacation%>" ItemStyle-Width="20%">
                                             <ItemTemplate>
                                                     <asp:Label ID="LblDvacation1" runat="server" 
                                                     Text='<%# Eval("VacationName") %>' />                              
                                             </ItemTemplate>
                                            </asp:TemplateField>
                                
                                                  <asp:TemplateField HeaderText="<%$ Resources:Labels,FromDate%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblFromDate1" runat="server" 
                                             text= '<%# Eval("FromDate", "{0:dd/MM/yyyy}") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                          
                                 <asp:TemplateField HeaderText="<%$ Resources:Labels,ToDate%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblToDate1" runat="server" 
                                               text= '<%# Eval("ToDate", "{0:dd/MM/yyyy}") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                          
                                    <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-approve">
                                          <ItemTemplate>                     
                                                     <asp:LinkButton ID="approveTask" runat="server" myCustomID='<%# Eval("EmployeesVacationID")%>'  CssClass="td-approve">
                                                         <asp:Image ImageUrl="~/images/accept_document.png" runat="server" Width="20px" Height="20px" ToolTip="<%$ Resources:Labels,Approve%>" />
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                   <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-reject">
                                             <ItemTemplate>                     
                                                     <asp:LinkButton ID="approveTask" runat="server" myCustomID='<%# Eval("EmployeesVacationID")%>'  CssClass="td-reject">
                                                         <asp:Image ImageUrl="~/images/reject_document.png" runat="server" Width="20px" Height="20px" ToolTip="<%$ Resources:Labels,Reject%>"/>
                                                     </asp:LinkButton>  
                                                             
                                             </ItemTemplate>
                                    </asp:TemplateField> 
                                   
                                </Columns>
                                <EditRowStyle BackColor="#009999" VerticalAlign="Middle" />
                            </asp:GridView>
                       <!---- table -->
                        <div class="row" id="gv_Blank" runat="server">&nbsp;</div>
                        <div class="row gridView-title" id="gv_executed_title" runat="server">                       
                           <span><asp:Literal Text=" <%$ Resources:Labels,Vacations%>" runat="server"></asp:Literal> </span>
                        </div>

                            <asp:GridView ID="gv_data" runat="server"  CssClass="gridView col-md-12"  
                                AutoGenerateColumns="False"  Width="90%" 
                                style="margin-top:0px;" class="table table-bordered table-condensed table-responsive table-hover ">
                                <Columns>

                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Sequence%>" ItemStyle-Width="5%">
                                         <ItemTemplate>
                                                 <%#Container.DataItemIndex+1 %>                            
                                         </ItemTemplate> 
                                       </asp:TemplateField>

                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Vacation%>" ItemStyle-Width="20%">
                                             <ItemTemplate>
                                                     <asp:Label ID="LblDvacation" runat="server" 
                                                     Text='<%# Eval("VacationName") %>' />                              
                                             </ItemTemplate>
                                            </asp:TemplateField>
                                
                                                  <asp:TemplateField HeaderText="<%$ Resources:Labels,FromDate%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblFromDate" runat="server" 
                                             text= '<%# Eval("FromDate", "{0:dd/MM/yyyy}") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                          
                                 <asp:TemplateField HeaderText="<%$ Resources:Labels,ToDate%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblToDate" runat="server" 
                                               text= '<%# Eval("ToDate", "{0:dd/MM/yyyy}") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                          
                                    <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-edit">
                                          <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkProducts" runat="server" myCustomID='<%# Eval("EmployeesVacationID")%>'  CssClass="td-edit">
                                                         <asp:Image ImageUrl="~/Images/edit.ico" runat="server" Width="20px" Height="20px" />
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                   <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-delete">
                                             <ItemTemplate>                     
                                                     <asp:ImageButton  CommandArgument='<%# Eval("EmployeesVacationID")%>' OnCommand="deletedatafromgrid"
                                                            OnClientClick="return confirm(<%= Resources.Labels.ConfirmDelete %>);return false;"
                                                            ID="Image1" runat="server" ImageUrl="~/Images/delete.ico" />
                                                             
                                             </ItemTemplate>
                                    </asp:TemplateField> 
                                   
                                </Columns>
                                <EditRowStyle BackColor="#009999" VerticalAlign="Middle" />
                            </asp:GridView>
    
                      <%-- </div>--%>
   
                    </div>


            </div>
        </div>

    </section>
    <div id="dialog"  class="Modal-BackGround .Modal-Indx-form" style="overflow:hidden;padding:0px">

        <div class="modal-dialog body">
        <div class ="modal-content panel panel-default">
        <div class="modal-header frame-panel-heading">
           
            <div ><span >
                <asp:Literal runat="server" Text="<%$ Resources:Labels,AddVacations%>"></asp:Literal>
            </span>
                </div>
            <div class="float2" style="width:10px">
            <button class="close col-12" onClick="closeDialog()" ><i class="fa fa-close"></i></button>
            </div>
         </div>
            <div class="modal-body panel-body model-b">
                <div class="c-form">

                        <div class="row">
                     <div class="form-group" style="display:block">
                              <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Employee%>" /></span>
                                 <input type="hidden"  id="hid_employeesVacationId" name="hid_employeesVacationId" runat="server" value=""  />
                                <select runat="server" id="emp" name="emp" style="width:80%" class="form-control input-lg"></select>
                            </div>
                        </div>
                    <div class="row">
                     <div class="form-group" style="display:block">
                              <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Vacation%>" /></span>
                                 <select runat="server" id="vac" name="vac" style="width:80%" class="form-control input-lg"></select>
                            </div>
                        </div>
                    <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,FromDate%>" /></span>
                           <asp:TextBox ID="txt_fromDate" runat="server" class="form-control input-lg hasdatepicker"  ></asp:TextBox>
                         </div>
                        </div> 
                    <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,ToDate%>" /></span>
                           <asp:TextBox ID="txt_toDate" runat="server" class="form-control input-lg hasdatepicker"  ></asp:TextBox>
                         </div>
                        </div> 
                   
                     
                   
                  
                    
                <div class="modal-footer">
                    <button class="btn btn-new"  runat="server" onclick="saveEmployeesVacation()" id="btn_ads" >
                        <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Save%>" />
                    </button>
 

                    </div>
                </div>
                 </div>
            </div>
        </div>
</asp:Content>


