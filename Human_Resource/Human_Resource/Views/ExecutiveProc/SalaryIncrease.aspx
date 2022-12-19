<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SalaryIncrease.aspx.cs" Inherits="Human_Resource.Views.ExecutiveProc.SalaryIncrease" EnableEventValidation="true"  %>
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
            $('#MainContent_hid_salaryIncreaseId').val("");
            $('#MainContent_dept_increaseType').val("");
            $('#MainContent_txt_increaseValue').val("");
            $('#MainContent_txt_name').val("");
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
                url: "SalaryIncrease.aspx/GetSalaryIncrease",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    ShowDialog();
                    for (var prop in data) {
                        var item = data[prop];
                        $('#MainContent_hid_salaryIncreaseId').val(item.SalaryIncreaseID);
                        $('#MainContent_dept_increaseType').val(item.IncreaseType);
                        $('#MainContent_txt_increaseValue').val(item.IncreaseValue);
                        $('#MainContent_txt_name').val(item.Name);
                     } 


                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function saveSalaryIncrease() {
            var id = $('#MainContent_hid_salaryIncreaseId').val();
             var increaseType = $("#MainContent_dept_increaseType").find(":selected").val();
             var increaseValue = $("#MainContent_txt_increaseValue").val();
            var name = $("#MainContent_txt_name").val();
            

            var parameter = {
                salaryIncreaseId: id,
                 increaseType: increaseType,
                 increaseValue: increaseValue,
                name: name,
                
            };
            $.ajax({
                type: "POST",
                url: "SalaryIncrease.aspx/SaveSalaryIncrease",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    window.top.location = "SalaryIncrease.aspx";

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
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,SalaryIncrease%>" /></a></li>
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

                       <!---- table -->
                            <asp:GridView ID="gv_data" runat="server"  CssClass="gridView col-md-12"  
                                AutoGenerateColumns="False"  Width="90%" 
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
                                    
                                
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Type%>" ItemStyle-Width="15%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDincreaseType" runat="server" 
                                                 Text='<%# Eval("IncreaseType") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>             
                                          
                            
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Value%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblIncreaseValue" runat="server" 
                                                 Text='<%# Eval("IncreaseValue") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                    
                                 
                                    

                                 

                                    <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-edit">
                                          <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkProducts" runat="server" myCustomID='<%# Eval("SalaryIncreaseID")%>'  CssClass="td-edit">
                                                         <asp:Image ImageUrl="~/Images/edit.ico" runat="server" Width="20px" Height="20px" />
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                   <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-delete">
                                             <ItemTemplate>                     
                                                     <asp:ImageButton  CommandArgument='<%# Eval("SalaryIncreaseID")%>' OnCommand="deletedatafromgrid"
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
                <asp:Literal runat="server" Text="<%$ Resources:Labels,AddSalaryIncrease%>"></asp:Literal>
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
                                <span><asp:Literal  runat="server"  Text="<%$ Resources:Labels,Name%>" /></span>
                         <input type="text" class="form-control input-lg" id="txt_name"  runat="server" value=""  />
                            </div>
                        </div> 

                    <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Type%>" /></span>
                                 <input type="hidden"  id="hid_salaryIncreaseId" name="hid_salaryIncreaseId" runat="server" value=""  />
                         <select runat="server" id="dept_increaseType" name="dept_increaseType" style="width:80%" class="form-control input-lg"    />
                             </div>
                        </div>
                  

                     <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server"  Text="<%$ Resources:Labels,Value%>" /></span>
                                <input type="text" class="form-control input-lg" id="txt_increaseValue"  runat="server" value=""  />
                            </div>
                        </div> 
                  
                   

                   
                    

                

                    
                    


                  
                    
                <div class="modal-footer">
                    <button class="btn btn-new"  runat="server" onclick="saveSalaryIncrease()" id="btn_ads" >
                        <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Save%>" />
                    </button>
 

                    </div>
                </div>
                 </div>
            </div>
        </div>
        </div>
</asp:Content>







