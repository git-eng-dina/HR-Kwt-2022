﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WorkShifts.aspx.cs" Inherits="Human_Resource.Views.Attendance.WorkShifts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
 
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>

    <script>

        $(document).ready(function () {

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

        });

        //function to close dialog, probably called by a button in the dialog
        function closeDialog() {
            $('#MainContent_hid_periodId').val("");
            $('#MainContent_txt_name').val("");
            $('#MainContent_startTime').val("");
            $('#MainContent_endTime').val("");
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
                url: "WorkShifts.aspx/GetPeriod",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    ShowDialog();
                    for (var prop in data) {
                        var item = data[prop];
                        $('#MainContent_hid_periodId').val(item.PeriodID);
                        $('#MainContent_txt_name').val(item.Name);
                        $('#MainContent_startTime').val(item.StartTime);
                        $('#MainContent_endTime').val(item.EndTime);
                      }


                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function savePeriod() {
            var id = $('#MainContent_hid_periodId').val();
            var name = $("#MainContent_txt_name").val();
            var startTime = $("#MainContent_startTime").val();
            var endTime = $("#MainContent_endTime").val();
             
             var parameter = {
                periodId: id,
                 name: name,
                 startTime: startTime,
                 endTime: endTime,
             };
            $.ajax({
                type: "POST",
                url: "WorkShifts.aspx/SavePeriod",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    window.top.location = "WorkShifts.aspx";

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
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Periods%>" /></a></li>
                                </ol>
                            </nav>
                        </div>
                       
                        <div class="SearchAddbar">

                        <div class="input-group">
                            <div class="col-4">
                                <input type="hidden" id="myPeriods" runat="server" />
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

                      
                     <!---- table-->
                              <asp:GridView ID="gv_data" runat="server" style="width:100%; margin-top:0px;" CssClass="gridView col-md-12"  
                             OnRowDataBound="gv_data_RowDataBound"    AutoGenerateColumns="False"  Width="90%" 
                                class="table table-bordered table-condensed table-responsive table-hover ">
                                <Columns>

                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Sequence%>" ItemStyle-Width="5%">
                                         <ItemTemplate>
                                                 <%#Container.DataItemIndex+1 %>                            
                                         </ItemTemplate> 
                                       </asp:TemplateField>

                                    
                                          
                              
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Name%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblName" runat="server" 
                                                 Text='<%# Eval("Name") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                   
                                     <asp:TemplateField HeaderText="<%$ Resources:Labels,Start%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblStartTime" runat="server" 
                                                 text= '<%# Eval("StartTime", "{0:HH:mm}") %>'  />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                   
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,End%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblEndTime" runat="server" 
                                                text= '<%# Eval("EndTime", "{0:HH:mm}") %>'   />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                   
                                   


                                 

                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Edit%>" ItemStyle-Width="5%" ControlStyle-CssClass="td-edit">
                                          <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkProducts" runat="server" myCustomID='<%# Eval("PeriodID")%>'  CssClass="td-edit">
                                                         <asp:Image ImageUrl="~/Images/edit.ico" runat="server" Width="20px" Height="20px" />
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                     <asp:TemplateField HeaderText="<%$ Resources:Labels,Delete%>" ItemStyle-Width="5%"  ControlStyle-CssClass="td-delete">
                                             <ItemTemplate>                     
                                                     <asp:ImageButton  CommandArgument='<%# Eval("PeriodID")%>' OnCommand="deletedatafromgrid"
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
                <asp:Literal runat="server" Text="<%$ Resources:Labels,AddPeriod%>"></asp:Literal>
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
                                <span><asp:Literal  runat="server" id="txt_nameTitle"  Text="<%$ Resources:Labels,Period%>" /></span>
                                <input type="hidden"  id="hid_periodId" name="hid_periodId" runat="server" value=""  />
                                <input type="text" class="form-control input-lg" id="txt_name"  runat="server" value=""  />
                            </div>
                        </div> 


                    <div class="row">
                     <div class="form-group" style="display:block">
                              <span ><asp:Literal  runat="server" Text="<%$ Resources:Labels,Start%>" /></span>
                            <input type="datetime-local" class="form-control calendar"  id="startTime" value="2000-11-01"  runat="server">
                              </div>
                 </div>

                    <div class="row">
                     <div class="form-group" style="display:block">
                            <span ><asp:Literal  runat="server" Text="<%$ Resources:Labels,End%>" /></span>
                            <input type="datetime-local" class="form-control  calendar" id="endTime" value="2000-11-01"  runat="server"   />                            
                    </div>
                 </div>
                 
                    
                <div class="modal-footer">
                    <button class="btn btn-new"  runat="server" onclick="savePeriod()" id="btn_ads" >
                        <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Save%>" />
                    </button>
 

                    </div>
                </div>
                 </div>
            </div>
        </div>
        </div>
</asp:Content>



