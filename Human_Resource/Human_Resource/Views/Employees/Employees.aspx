<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Human_Resource.Views.Employees.Employees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script>
        $(document).ready(function () {

            $('.td-edit').click(function () {
                var customID = $(this).attr('myCustomID');
                window.location = "NewEmployee.aspx?uid=" + customID;
                return false;
            });

            $('.td-approve').click(function () {
                var customID = $(this).attr('myCustomID');
                if (confirm("are you sure?")) {

                    var parameter = {
                        employeeID: customID,

                    };

                    $.ajax({
                        type: "POST",
                        url: "Employees.aspx/ApproveEmployee",
                        data: JSON.stringify(parameter),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            window.location = "Employees.aspx";
                           
                        },
                        failure: function (response) {
                            alert(response.d);
                        }
                    });
                   
                }
               
                return false;
            });

        });

        function NewEmployee() {
            window.location = "NewEmployee.aspx";

        }
</script>
     <section class="statis">
         <div class="container" >
              <div class="row">
                   <div class="col-12">
                        <div class="bcrumb-block">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Employees%>" /></a></li>
                                </ol>
                            </nav>
                        </div>
                       
                        <div class="SearchAddbar">

                        <div class="input-group">
                            <div class="col-4">
                                <input type="text" runat="server" id="txt_search" placeholder="<%$ Resources:Labels,Search%>" />
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
                       <!------- unhired employees -->
                        <div class="row gridView-title">                       
                           <span><asp:Literal Text=" <%$ Resources:Labels,WaitingEmployees%>" runat="server"></asp:Literal> </span>
                        </div>
                       <div class="row">
                      
      
                        <asp:GridView ID="gv_unhiredEmp" runat="server" style="margin-top:0px;" CssClass="gridView col-md-12"  
                                AutoGenerateColumns="False"  Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Sequence%>" ItemStyle-Width="5%">
                                         <ItemTemplate>
                                                 <%#Container.DataItemIndex+1 %>                            
                                         </ItemTemplate> 
                                       </asp:TemplateField>
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,NameAR%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDno" runat="server" 
                                                 Text='<%# Eval("NameAr") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,NameEN%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDno" runat="server" 
                                                 Text='<%# Eval("NameEn") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField> 
                                      <asp:TemplateField HeaderText="<%$ Resources:Labels,Age%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDname" runat="server" 
                                                 Text='<%# Eval("Age") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Position%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDno" runat="server" 
                                                 Text='<%# Eval("Position") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>             
                                  <asp:TemplateField HeaderText="<%$ Resources:Labels,Department%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDno" runat="server" 
                                                 Text='<%# Eval("DepartmentName") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,CurrentSalary%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDname" runat="server" 
                                                 Text='<%# Eval("BasicSalary") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>
                                           <asp:TemplateField HeaderText="<%$ Resources:Labels,AddedBy%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblLoc" runat="server" 
                                                 Text='<%# Eval("AddedBy") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>                          
                                   <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-approve">
                                           <ItemTemplate>                     
                                                <asp:LinkButton ID="LinkProducts" runat="server" myCustomID='<%# Eval("EmployeeID")%>'  CssClass="td-approve">
                                                    <asp:Image ImageUrl="~/Images/edit.ico" runat="server" ToolTip="<%$ Resources:Labels,Department%>" Width="20px" Height="20px" />
                                                </asp:LinkButton>  
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
                    
                       </div>
                       <!---- table hired employees-->
                         <div class="row gridView-title">                       
                           <span><asp:Literal Text=" <%$ Resources:Labels,Employees%>" runat="server"></asp:Literal> </span>
                        </div>
                    <div class="row">
                       
                            <asp:GridView ID="gv_employees" runat="server" style="width:100%; margin-top:0px;" CssClass="gridView col-md-12"  
                                AutoGenerateColumns="False"  Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Sequence%>">
                                         <ItemTemplate>
                                                 <%#Container.DataItemIndex+1 %>                            
                                         </ItemTemplate> 
                                       </asp:TemplateField>
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,NameAR%>" >
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDno" runat="server" 
                                                 Text='<%# Eval("NameAr") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,NameEN%>" >
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDno" runat="server" 
                                                 Text='<%# Eval("NameEn") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField> 
                                     <asp:TemplateField HeaderText="<%$ Resources:Labels,Age%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDname" runat="server" 
                                                 Text='<%# Eval("Age") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Position%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDno" runat="server" 
                                                 Text='<%# Eval("Position") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>  
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Department%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDno" runat="server" 
                                                 Text='<%# Eval("DepartmentName") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>             
                                   
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,CurrentSalary%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDname" runat="server" 
                                                 Text='<%# Eval("BasicSalary") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>
                                           <asp:TemplateField HeaderText="<%$ Resources:Labels,AddedBy%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblLoc" runat="server" 
                                                 Text='<%# Eval("AddedBy") %>' />                              
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
                        </div>
   
                    </div>


            </div>
        </div>

    </section>

</asp:Content>
