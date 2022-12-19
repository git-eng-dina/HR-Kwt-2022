<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Managements.aspx.cs" Inherits="Human_Resource.Views.Settings.Managements" EnableEventValidation="true" %>
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
            $('#MainContent_hid_managementId').val("");
            $('#MainContent_dept_name').val("");
            $('#MainContent_txt_mobile').val("");
            $('#MainContent_emp').val("");
            $('#MainContent_branch').val("");
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
                url: "Managements.aspx/GetManagement",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    ShowDialog();
                    for (var prop in data) {
                        var item = data[prop];
                        $('#MainContent_hid_managementId').val(item.ManagementID);
                        $('#MainContent_dept_name').val(item.Name);
                        $('#MainContent_txt_mobile').val(item.Mobile);
                         $('#MainContent_emp').val(item.ManagerID);
                        $('#MainContent_branch').val(item.BranchID);
                    }


                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function removeValidation(input) {
            if ($(input).attr("class") == "form-control is-invalid") {

                $(input).attr("class", "form-control");

            }
        }
        function checkValidation() {
            var valid = true;
            if ($('#MainContent_dept_name').val() == "" || $('#MainContent_dept_name').val() == null) {
                $('#MainContent_dept_name').attr("class", "form-control is-invalid");
                valid = false;
            }
            if ($('#MainContent_txt_mobile').val() == "" || $('#MainContent_txt_mobile').val() == null) {
                $('#MainContent_txt_mobile').attr("class", "form-control is-invalid");
                valid = false;
            }
            if ($("#MainContent_branch").find(":selected").val() == "" || $("#MainContent_branch").find(":selected").val() == null) {
                $('#MainContent_branch').attr("class", "form-control is-invalid");
                valid = false;
            }

            return valid;
        }

        function saveManagement() {
            var valid = checkValidation();

            if (valid) {
                var id = $('#MainContent_hid_managementId').val();
                var name = $("#MainContent_dept_name").val();
                var mobile = $("#MainContent_txt_mobile").val();
                var emp = $("#MainContent_emp").find(":selected").val();
                var branch = $("#MainContent_branch").find(":selected").val();
                var parameter = {
                    managementId: id,
                    name: name,
                    mobile: mobile,
                    managerId: emp,
                    branchId: branch
                };
                $.ajax({
                    type: "POST",
                    url: "Managements.aspx/SaveManagement",
                    data: JSON.stringify(parameter),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        window.top.location = "Managements.aspx";

                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
        }


            



</script>
     <section class="statis">
         <div class="container" >
              <div class="row">
                   <div class="col-12">
                        <div class="bcrumb-block">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Managements%>" /></a></li>
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
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Management%>" ItemStyle-Width="15%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDname" runat="server" 
                                                 Text='<%# Eval("Name") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>             
                                          
                                <asp:TemplateField HeaderText="<%$ Resources:Labels,Mobile%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblMobile" runat="server" 
                                                 Text='<%# Eval("Mobile") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="<%$ Resources:Labels,ManagementManager%>" ItemStyle-Width="20%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDmanager" runat="server" 
                                                 Text='<%# Eval("ManagerName") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>

                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Branch%>" ItemStyle-Width="20%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDbranch" runat="server" 
                                                 Text='<%# Eval("BranchName") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>

                                    <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-edit">
                                          <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkProducts" runat="server" myCustomID='<%# Eval("ManagementID")%>'  CssClass="td-edit">
                                                         <asp:Image ImageUrl="~/Images/edit.ico" runat="server" Width="20px" Height="20px" />
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                   <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-delete">
                                             <ItemTemplate>                     
                                                     <asp:ImageButton  CommandArgument='<%# Eval("ManagementID")%>' OnCommand="deletedatafromgrid"
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
                <asp:Literal runat="server" Text="<%$ Resources:Labels,AddManagement%>"></asp:Literal>
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
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,TheName%>" /></span>
                                <input type="hidden"  id="hid_managementId" name="hid_managementId" runat="server" value=""  />
                                <input type="text" class="form-control input-lg" id="dept_name" name="dept_name" runat="server" value=""  onchange="removeValidation($(this));" />
                                <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>
                    </div>
                        </div>
                     <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Mobile%>" /></span>
                                <input type="text" class="form-control input-lg" id="txt_mobile"  runat="server" value="" onchange="removeValidation($(this));"  />
                                <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>

                            </div>
                        </div> 
                    

                    <div class="row">
                     <div class="form-group" style="display:block">
                              <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,ManagementManager%>" /></span>
        
                                <select runat="server" id="emp" name="emp" style="width:80%" class="form-control input-lg" ></select>
                            </div>
                        </div>
                       <div class="row">
                     <div class="form-group" style="display:block">
                              <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Branch%>" /></span>
        
                                <select runat="server" id="branch" name="branch" style="width:80%" class="form-control input-lg" onchange="removeValidation($(this));" ></select>
                                 <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>

                            </div>
                        </div>
                  </div>
                    
                <div class="modal-footer">
                    <button class="btn btn-new"  runat="server" onclick="saveManagement()" id="btn_ads" >
                        <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Save%>" />
                    </button>
 

                    </div>
                </div>
                 </div>
                
            </div>
        </div>
     

</asp:Content>

