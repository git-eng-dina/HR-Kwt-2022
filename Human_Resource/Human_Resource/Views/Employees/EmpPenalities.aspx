<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmpPenalities.aspx.cs" Inherits="Human_Resource.Views.Employees.EmpPenalities" %>
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
                url: "EmpPenalities.aspx/GetReward",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    ShowDialog();
                    for (var prop in data) {
                        var item = data[prop];
                        $('#MainContent_hid_rewardId').val(item.RewardID);
                        $('#MainContent_emp').val(item.EmployeeID);
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
                                <input type="text" runat="server" id="txt_search" placeholder="<%$ Resources:Labels,Search%>"  />
                            </div>
                            <div style="width:90px">
                                <asp:Button ID="ButtonSearch" runat="server" CssClass="btn btn-search" Text=" <%$ Resources:Labels,Search%>"
                                    OnClick="btn_Search_Click" />
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

                                   
                                </Columns>
                                <EditRowStyle BackColor="#009999" VerticalAlign="Middle" />
                            </asp:GridView>
    
                      <%-- </div>--%>
   
                    </div>


            </div>
        </div>

    </section>
    
</asp:Content>



