<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RewardsAndPenalties.aspx.cs" Inherits="Human_Resource.Views.ExecutiveProc.RewardsAndPenalties"  EnableEventValidation="true" %>
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
            $('#MainContent_hid_rewardId').val("");
            $('#MainContent_emp').val("");
            $('#MainContent_txt_title').val("");
            $('#MainContent_txt_description').val("");
            $('#MainContent_txt_value').val("");
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
                url: "RewardsAndPenalties.aspx/GetReward",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    ShowDialog();
                    for (var prop in data) {
                        var item = data[prop];
                        $('#MainContent_hid_rewardId').val(item.RewardID);
                        $('#MainContent_emp').val(item.EmployeeID);
                        //$('#MainContent_dept_type').val(item.Type);
                        $('#MainContent_txt_title').val(item.Title);
                        $('#MainContent_txt_description').val(item.Description);
                        $('#MainContent_txt_value').val(item.Value);
                      }


                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function saveReward() {
            var id = $('#MainContent_hid_rewardId').val();
            var emp = $("#MainContent_emp").find(":selected").val();
            //var type = $("#MainContent_dept_type").find(":selected").val();
            var title = $("#MainContent_txt_title").val();
            var description = $("#MainContent_txt_description").val();
            var value = $("#MainContent_txt_value").val();
             
             var parameter = {
                rewardId: id,
                 employeeId: emp,
                //type: type,
                 title: title,
                description: description,
                 value: value,
             };
            $.ajax({
                type: "POST",
                url: "RewardsAndPenalties.aspx/SaveReward",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    window.top.location = "RewardsAndPenalties.aspx";

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
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Penalties%>" /></a></li>
                                </ol>
                            </nav>
                        </div>
                       
                        <div class="SearchAddbar">

                        <div class="input-group">
                            <div class="col-4">
                                <input type="hidden" id="myPenalties" runat="server" />
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

                       <!---- table penalities -->
                          <div class="row gridView-title" id="gv_data_title" runat="server">                       
                           <span><asp:Literal Text=" <%$ Resources:Labels,EmployeesPenalties%>" runat="server"></asp:Literal> </span>
                        </div>
                            <asp:GridView ID="gv_data" runat="server" style="width:100%; margin-top:0px;" CssClass="gridView col-md-12"  
                          OnRowDataBound="gv_data_RowDataBound"       AutoGenerateColumns="False"  Width="90%" 
                                class="table table-bordered table-condensed table-responsive table-hover ">
                                <Columns>

                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Sequence%>" ItemStyle-Width="5%">
                                         <ItemTemplate>
                                                 <%#Container.DataItemIndex+1 %>                            
                                         </ItemTemplate> 
                                       </asp:TemplateField>

                                    
                                        <asp:TemplateField HeaderText="<%$ Resources:Labels,employee%>" ItemStyle-Width="20%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDemployee" runat="server" 
                                                 Text='<%# Eval("EmployeeName") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                  <%-- <asp:TemplateField HeaderText="<%$ Resources:Labels,Type%>" ItemStyle-Width="15%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDtype" runat="server" 
                                                 Text='<%# Eval("Type") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>   --%>          
                                          
                                <asp:TemplateField HeaderText="<%$ Resources:Labels,Title%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblTitle" runat="server" 
                                                 Text='<%# Eval("Title") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Description%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDescription" runat="server" 
                                                 Text='<%# Eval("Description") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                     <asp:TemplateField HeaderText="<%$ Resources:Labels,Value%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblValue" runat="server" 
                                                 Text='<%# Eval("Value") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>

                                   


                                 

                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Edit%>" ItemStyle-Width="15%" ControlStyle-CssClass="td-edit">
                                          <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkProducts" runat="server" myCustomID='<%# Eval("RewardID")%>'  CssClass="td-edit">
                                                         <asp:Image ImageUrl="~/Images/edit.ico" runat="server" Width="20px" Height="20px" />
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Delete%>" ItemStyle-Width="15%"  ControlStyle-CssClass="td-delete">
                                             <ItemTemplate>                     
                                                     <asp:ImageButton  CommandArgument='<%# Eval("RewardID")%>' OnCommand="deletedatafromgrid"
                                                            OnClientClick="return confirm(<%= Resources.Labels.ConfirmDelete %>);return false;"
                                                            ID="Image1" runat="server" ImageUrl="~/Images/delete.ico" />
                                                             
                                             </ItemTemplate>
                                    </asp:TemplateField> 
                                   
                                </Columns>
                                 <EditRowStyle BackColor="#009999" VerticalAlign="Middle" />
                            </asp:GridView>
                     <!---- table my penalities -->
                         <div class="row">&nbsp;</div>
                          <div class="row gridView-title" id="gv_myPenalties_title" runat="server">                       
                           <span><asp:Literal Text=" <%$ Resources:Labels,EmpPenalties%>" runat="server"></asp:Literal> </span>
                        </div>
                            <asp:GridView ID="gv_myPenalties" runat="server" style="width:100%; margin-top:0px;" CssClass="gridView col-md-12"  
                          OnRowDataBound="gv_data_RowDataBound"       AutoGenerateColumns="False"  Width="90%" 
                                class="table table-bordered table-condensed table-responsive table-hover ">
                                <Columns>

                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Sequence%>" ItemStyle-Width="5%">
                                         <ItemTemplate>
                                                 <%#Container.DataItemIndex+1 %>                            
                                         </ItemTemplate> 
                                       </asp:TemplateField>

                                    
                                        <asp:TemplateField HeaderText="<%$ Resources:Labels,employee%>" ItemStyle-Width="20%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDemployee" runat="server" 
                                                 Text='<%# Eval("EmployeeName") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                         
                                          
                                <asp:TemplateField HeaderText="<%$ Resources:Labels,Title%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblTitle" runat="server" 
                                                 Text='<%# Eval("Title") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Description%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDescription" runat="server" 
                                                 Text='<%# Eval("Description") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                     <asp:TemplateField HeaderText="<%$ Resources:Labels,Value%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblValue" runat="server" 
                                                 Text='<%# Eval("Value") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>

                                   


                                 

                                   <%-- <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-edit">
                                          <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkProducts" runat="server" myCustomID='<%# Eval("RewardID")%>'  CssClass="td-edit">
                                                         <asp:Image ImageUrl="~/Images/edit.ico" runat="server" Width="20px" Height="20px" />
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>--%>
                                  
                                   
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
                <asp:Literal runat="server" Text="<%$ Resources:Labels,AddPenalties%>"></asp:Literal>
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
        
                                <select runat="server" id="emp" name="emp" style="width:80%" class="form-control input-lg"></select>
                            </div>
                        </div>

                   <%-- <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Type%>" /></span>
                                <select runat="server" id="dept_type" name="dept_type" style="width:80%" class="form-control input-lg"    onchange="typeChanged()"/>
                             </div>
                        </div>--%>
                     <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server"   Text="<%$ Resources:Labels,Title%>" /></span>
                                <input type="hidden"  id="hid_rewardId" name="hid_rewardId" runat="server" value=""  />
                                <input type="text" class="form-control input-lg" id="txt_title"  runat="server" value=""  />
                            </div>
                        </div> 
                     <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" id="txt_descriptionTitle"  Text="<%$ Resources:Labels,Description%>" /></span>
                                <input type="text" class="form-control input-lg" id="txt_description"  runat="server" value=""  />
                            </div>
                        </div> 
                     <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server"    Text="<%$ Resources:Labels,Value%>" /></span>
                                <input type="text" class="form-control input-lg" id="txt_value"  runat="server" value=""  />
                            </div>
                        </div> 

                 
                    
                <div class="modal-footer">
                    <button class="btn btn-new"  runat="server" onclick="saveReward()" id="btn_ads" >
                        <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Save%>" />
                    </button>
 

                    </div>
                </div>
                 </div>
            </div>
        </div>
        </div>
</asp:Content>


