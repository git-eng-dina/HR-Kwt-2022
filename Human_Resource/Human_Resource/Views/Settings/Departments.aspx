<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Departments.aspx.cs" Inherits="Human_Resource.Views.Settings.Departments" EnableEventValidation="true" %>
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
            $("#dialog").dialog("close");
        }

        function ShowDialog(deptId) {
            alert(deptId);
            $("#dialog").dialog("open");
            $(".ui-dialog-titlebar").hide();
              var retval = "";
        }


        function saveDept() {
           
            var name = $("#MainContent_dept_name").val();
            var mobile = $("#MainContent_txt_mobile").val();
            var address = $("#MainContent_txt_address").val();
            var emp = $("#MainContent_emp").find(":selected").val();
            var parameter = {
                name: name,
                mobile: mobile,
                address: address,
                managerId: emp
            };
            $.ajax({
                type: "POST",
                url: "Departments.aspx/SaveDepartment",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    alert("==" + data.d);
                    __doPostBack('','');
                    closeDialog();
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
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Departments%>" /></a></li>
                                </ol>
                            </nav>
                        </div>
                       
                        <div class="SearchAddbar">

                        <div class="input-group">
                            <div class="col-3">
                                <input type="text" runat="server" id="txt_search" placeholder="<%$ Resources:Labels,Search%>" />
                            </div>
                            <div style="width:90px">
                            <Button runat="server" class="btn btn-search btn-block" id="btn_search"  CausesValidation="false" >
                                <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Search%>" />
                                <i class="fa fa-search" style="color:antiquewhite;padding:2px"></i>
                            </Button>
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
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Sequence%>" ItemStyle-Width="30px">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDno" runat="server" 
                                                 Text='<%# Eval("Name") %>' />                              
                                         </ItemTemplate> 
                                       </asp:TemplateField>
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Department%>" ItemStyle-Width="30px">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDname" runat="server" 
                                                 Text='<%# Eval("Name") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>             
                                          
                                <asp:TemplateField HeaderText="<%$ Resources:Labels,Mobile%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblMobile" runat="server" 
                                                 Text='<%# Eval("Mobile") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Address%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblAddress" runat="server" 
                                                 Text='<%# Eval("Address") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>  
                                        <asp:TemplateField HeaderText="<%$ Resources:Labels,DeptManager%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDmanager" runat="server" 
                                                 Text='<%# Eval("ManagerName") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                   <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%">
                                             <ItemTemplate>                     
                                                     <asp:ImageButton CommandArgument='<%# Eval("DepartmentID")%>' OnCommand="deletedatafromgrid"
                                                            OnClientClick="return confirm(<%= Resources.Labels.DeleteSuccessfully %>);return false;"
                                                            ID="Image1" runat="server" ImageUrl="~/Images/delete.ico" />
                                                             
                                             </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%">
                                          <ItemTemplate>                     
                                                     <asp:ImageButton CommandArgument='<%# Eval("DepartmentID")%>' OnCommand="deletedatafromgrid"
                                                        ID="Image2" runat="server" ImageUrl="~/Images/edit.ico" />
                                      
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
           
            <div class="col-md-7"><span >
                <asp:Literal runat="server" Text="<%$ Resources:Labels,AddDepartment%>"></asp:Literal>
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
                                <input type="text" class="form-control input-lg" id="dept_name" name="dept_name" runat="server" value=""  />
                            </div>
                        </div>
                     <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Mobile%>" /></span>
                                <input type="text" class="form-control input-lg" id="txt_mobile"  runat="server" value=""  />
                            </div>
                        </div> 
                     <div class ="row">
                    <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Address%>" /></span>
                                <input type="text" class="form-control input-lg" id="txt_address"  runat="server" value=""  />
                            </div>
                         </div>
                    <div class="row">
                     <div class="form-group" style="display:block">
                              <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,DeptManager%>" /></span>
        
                                <select runat="server" id="emp" name="emp" style="width:80%" class="form-control input-lg"></select>
                            </div>
                        </div>
                  </div>
                    
                <div class="modal-footer">
                    <button class="btn btn-new" Text = "<%$ Resources:Labels,Save%>" runat="server" onclick="saveDept()" id="btn_add" ></button>

                    </div>
                </div>
                 </div>
                
            </div>
        </div>
     

</asp:Content>

