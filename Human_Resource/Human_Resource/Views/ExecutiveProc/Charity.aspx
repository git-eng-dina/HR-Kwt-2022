<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Charity.aspx.cs" Inherits="Human_Resource.Views.ExecutiveProc.Charity" EnableEventValidation="true" %>
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
            $('#MainContent_hid_charityId').val("");
            $('#MainContent_emp').val("");
            $('#MainContent_txt_reason').val("");
            $('#MainContent_txt_details').val("");
            $('#MainContent_txt_amount').val("");
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
                url: "Charity.aspx/GetCharity",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    ShowDialog();
                    for (var prop in data) {
                        var item = data[prop];
                        $('#MainContent_hid_charityId').val(item.CharityID);
                        $('#MainContent_emp').val(item.EmployeeID);
                        $('#MainContent_txt_reason').val(item.Reason);
                        $('#MainContent_txt_details').val(item.Details);
                        $('#MainContent_txt_amount').val(item.Amount);
                     }


                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function saveCharity() {
            var id = $('#MainContent_hid_charityId').val();
            var emp = $("#MainContent_emp").find(":selected").val();
            var reason = $("#MainContent_txt_reason").val();
            var details = $("#MainContent_txt_details").val();
            var amount = $("#MainContent_txt_amount").val();
            

             var parameter = {
                charityId: id,
                 employeeId: emp,
                    reason: reason,
                    details: details,
                 amount: amount,
             };
            $.ajax({
                type: "POST",
                url: "Charity.aspx/SaveCharity",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    window.top.location = "Charity.aspx";

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
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Charity%>" /></a></li>
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
                            OnRowDataBound="gv_data_RowDataBound"     AutoGenerateColumns="False"  Width="90%" 
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
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Reason%>" ItemStyle-Width="15%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDreason" runat="server" 
                                                 Text='<%# Eval("Reason") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>             
                                          
                                      <asp:TemplateField HeaderText="<%$ Resources:Labels,Amount%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblAmount" runat="server" 
                                                 Text='<%# Eval("Amount") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>

                                <asp:TemplateField HeaderText="<%$ Resources:Labels,Details%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDetails" runat="server" 
                                                 Text='<%# Eval("Details") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>

                                   

                                    <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-edit">
                                          <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkProducts" runat="server" myCustomID='<%# Eval("CharityID")%>'  CssClass="td-edit">
                                                         <asp:Image ImageUrl="~/Images/edit.ico" runat="server" Width="20px" Height="20px" />
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>

                                   <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-delete">
                                             <ItemTemplate>                     
                                                     <asp:ImageButton  CommandArgument='<%# Eval("CharityID")%>' OnCommand="deletedatafromgrid"
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
                <asp:Literal runat="server" Text="<%$ Resources:Labels,AddCharity%>"></asp:Literal>
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

                    <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Reason%>" /></span>
                                <input type="hidden"  id="hid_charityId" name="hid_charityId" runat="server" value=""  />
                                <input type="text" class="form-control input-lg" id="txt_reason"  runat="server" value=""  />
                             </div>
                        </div>
                      <div class="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server"  Text="<%$ Resources:Labels,Amount%>" /></span>
                                 <input type="number" class="form-control" id="txt_amount"  runat="server"  />
                     </div>
                        </div>

                     <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" id="txt_detailsTitle"  Text="<%$ Resources:Labels,Details%>" /></span>
                                <input type="text" class="form-control input-lg" id="txt_details"  runat="server" value=""  />
                            </div>
                        </div> 

                  
                    

                

                    
                    


                  
                    
                <div class="modal-footer">
                    <button class="btn btn-new"  runat="server" onclick="saveCharity()" id="btn_ads" >
                        <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Save%>" />
                    </button>
 

                    </div>
                </div>
                 </div>
            </div>
        </div>
        </div>
</asp:Content>

