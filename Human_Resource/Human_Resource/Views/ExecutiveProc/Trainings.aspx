<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Trainings.aspx.cs" Inherits="Human_Resource.Views.ExecutiveProc.Trainings" EnableEventValidation="true" %>
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
                url: "Trainings.aspx/GetTraining",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    ShowDialog();
                    for (var prop in data) {
                        var item = data[prop];
                        $('#MainContent_hid_trainingId').val(item.TrainingID);
                        $('#MainContent_txt_name').val(item.Name);
                        $('#MainContent_txt_description').val(item.Description);
 
                     }


                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function saveTraining() {
            var id = $('#MainContent_hid_trainingId').val();
            var name = $("#MainContent_txt_name").val();
            var description = $("#MainContent_txt_description").val();
            var parameter = {
                trainingId: id,
                name: name,
                description: description,
            };
            $.ajax({
                type: "POST",
                url: "Trainings.aspx/SaveTraining",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    window.top.location = "Trainings.aspx";

                },
                failure: function (response) {
                    alert(response.d);
                }
            });

        }

        function addEmp() {
            var empId = $('#MainContent_sel_employee').val();

            var gridView = $("[id*=gv_employees]");
            var row = gridView.find("tr").eq(1);

            //Check if row is dummy, if yes then remove.
            if ($.trim(row.find("td").eq(0).html()) == "") {
                row.remove();
            }

            //Clone the reference first row.
            row = row.clone(true);

            //Add the Name value to first cell.
            var txtName = $("[id*=NameAr]");
            SetValue(row, 0, "name", txtName);

            //Add the Country value to second cell.
            var txtCountry = $("[id*=txtCountry]");
            SetValue(row, 1, "country", txtCountry);

            //Add the row to the GridView.
            gridView.append(row);

            return false;
            alert(empId);
          

        }






</script>
     <section class="statis">
         <div class="container" >
              <div class="row">
                   <div class="col-12">
                        <div class="bcrumb-block">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Training%>" /></a></li>
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

                                    
                                  

                                
                                              
                                          
                                <asp:TemplateField HeaderText="<%$ Resources:Labels,Training%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblName" runat="server" 
                                                 Text='<%# Eval("Name") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                
                                        <asp:TemplateField HeaderText="<%$ Resources:Labels,Description%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDescription" runat="server" 
                                                 Text='<%# Eval("Description") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>

                                 


                                    <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-edit">
                                          <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkProducts" runat="server" myCustomID='<%# Eval("TrainingID")%>'  CssClass="td-edit">
                                                         <asp:Image ImageUrl="~/Images/edit.ico" runat="server" Width="20px" Height="20px" />
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                   <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-delete">
                                             <ItemTemplate>                     
                                                     <asp:ImageButton  CommandArgument='<%# Eval("TrainingID")%>' OnCommand="deletedatafromgrid"
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
                <asp:Literal runat="server" Text="<%$ Resources:Labels,AddTraining%>"></asp:Literal>
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
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Training%>" /></span>
                                <input type="hidden"  id="hid_trainingId" name="hid_trainingId" runat="server" value=""  />
                                <input type="text" class="form-control input-lg" id="txt_name"  runat="server" value=""  />
                            </div>
                        </div> 
  
                   <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Description%>" /></span>
                                <input type="text" class="form-control input-lg" id="txt_description"  runat="server" value=""  />
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
                  
                     <asp:GridView ID="gv_employees" runat="server"  CssClass="gridView col-md-12"  
                                AutoGenerateColumns="False"  Width="90%" 
                                class="table table-bordered table-condensed table-responsive table-hover ">
                                <Columns>

                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Sequence%>" ItemStyle-Width="5%">
                                         <ItemTemplate>
                                                 <%#Container.DataItemIndex+1 %>                            
                                         </ItemTemplate> 
                                       </asp:TemplateField>

                                    
                                  

                                
                                              
                                          
                                <asp:TemplateField HeaderText="<%$ Resources:Labels,NameAr%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblName" runat="server" 
                                                 Text='<%# Eval("NameAr") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                
                                        <asp:TemplateField HeaderText="<%$ Resources:Labels,NameEn%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDescription" runat="server" 
                                                 Text='<%# Eval("NameEn") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>

                                 


                                    <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-edit">
                                          <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkProducts" runat="server" myCustomID='<%# Eval("EmployeeID")%>'  CssClass="td-edit">
                                                         <asp:Image ImageUrl="~/Images/edit.ico" runat="server" Width="20px" Height="20px" />
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                   <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-delete">
                                             <ItemTemplate>                     
                                                     <asp:ImageButton  CommandArgument='<%# Eval("EmployeeID")%>' OnCommand="deletedatafromgrid"
                                                            OnClientClick="return confirm(<%= Resources.Labels.ConfirmDelete %>);return false;"
                                                            ID="Image1" runat="server" ImageUrl="~/Images/delete.ico" />
                                                             
                                             </ItemTemplate>
                                    </asp:TemplateField> 
                                   
                                </Columns>
                                <EditRowStyle BackColor="#009999" VerticalAlign="Middle" />
                            </asp:GridView>
                  
                    
                <div class="modal-footer">
                    <button class="btn btn-new"  runat="server" onclick="saveTraining()" id="btn_ads" >
                        <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Save%>" />
                    </button>
 

                    </div>
                </div>
                 </div>
            </div>
        </div>
</asp:Content>
