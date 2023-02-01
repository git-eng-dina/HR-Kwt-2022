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
                if (confirm("<%= Resources.Labels.AreYouSure%>")) {

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

            $('.td-attendance').click(function () {
                var customID = $(this).attr('myCustomID');
                window.location = "../Attendance/WorkShifts.aspx?empID=" + customID;
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
                        <div class="row gridView-title" id="gv_unhiredEmp_title" runat="server">                       
                           <span><asp:Literal Text=" <%$ Resources:Labels,WaitingEmployees%>" runat="server"></asp:Literal> </span>
                        </div>
                      
      
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
                                                 <asp:Label ID="NameAr1" runat="server" 
                                                 Text='<%# Eval("NameAr") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,NameEN%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="NameEn1" runat="server" 
                                                 Text='<%# Eval("NameEn") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField> 
                                      <asp:TemplateField HeaderText="<%$ Resources:Labels,Age%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="Age1" runat="server" 
                                                 Text='<%# Eval("Age") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Position%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="Position1" runat="server" 
                                                 Text='<%# Eval("Position") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>             
                                  <asp:TemplateField HeaderText="<%$ Resources:Labels,Management%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="ManagementName1" runat="server" 
                                                 Text='<%# Eval("ManagementName") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Department%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="DepartmentName1" runat="server" 
                                                 Text='<%# Eval("DepartmentName") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,CurrentSalary%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="BasicSalary1" runat="server" 
                                                 Text='<%# Eval("BasicSalary") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>
                                           <asp:TemplateField HeaderText="<%$ Resources:Labels,AddedBy%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="AddedBy1" runat="server" 
                                                 Text='<%# Eval("AddedBy") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>                          
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Approve%>" ItemStyle-Width="15%" ControlStyle-CssClass="td-approve">
                                           <ItemTemplate>                     
                                                <asp:LinkButton ID="LinkApprove" runat="server" myCustomID='<%# Eval("EmployeeID")%>'  CssClass="td-approve">
                                                    <asp:Image ImageUrl="~/images/check.ico" runat="server" ToolTip="<%$ Resources:Labels,Approve%>" Width="20px" Height="20px" />
                                                </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Edit%>" ItemStyle-Width="15%" ControlStyle-CssClass="td-edit">
                                           <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkEdit" runat="server" myCustomID='<%# Eval("EmployeeID")%>'  CssClass="td-edit">
                                                         <asp:Image ImageUrl="~/Images/edit.ico" runat="server" Width="20px" Height="20px" />
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Delete%>" ItemStyle-Width="15%"  ControlStyle-CssClass="td-delete">
                                             <ItemTemplate>                     
                                                     <asp:ImageButton  CommandArgument='<%# Eval("EmployeeID")%>' OnCommand="deletedatafromgrid"
                                                            OnClientClick="return confirm(<%= Resources.Labels.ConfirmDelete %>);return false;"
                                                            ID="delete1" runat="server" ImageUrl="~/Images/delete.ico" />
                                                             
                                             </ItemTemplate>
                                    </asp:TemplateField> 
                                </Columns>
                                <EditRowStyle BackColor="#009999" VerticalAlign="Middle" />
                            </asp:GridView>
                    
                      <%-- </div>--%>
                       <!---- table hired employees-->
                        <div class="row">&nbsp;</div>
                         <div class="row gridView-title" id="gv_employees_title" runat="server">                       
                           <span><asp:Literal Text=" <%$ Resources:Labels,Employees%>" runat="server"></asp:Literal> </span>
                        </div>
                      
                <%--    <div class="row">--%>
                       
                            <asp:GridView ID="gv_employees" runat="server" style="width:100%; margin-top:0px;" CssClass="gridView col-md-12"  
                                OnRowDataBound="gv_employees_RowDataBound"  AutoGenerateColumns="False"  Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Sequence%>">
                                         <ItemTemplate>
                                                 <%#Container.DataItemIndex+1 %>                            
                                         </ItemTemplate> 
                                       </asp:TemplateField>
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,NameAR%>" >
                                         <ItemTemplate>
                                                 <asp:Label ID="NameAr2" runat="server" 
                                                 Text='<%# Eval("NameAr") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,NameEN%>" >
                                         <ItemTemplate>
                                                 <asp:Label ID="NameEn2" runat="server" 
                                                 Text='<%# Eval("NameEn") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField> 
                                     <asp:TemplateField HeaderText="<%$ Resources:Labels,Age%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="Age2" runat="server" 
                                                 Text='<%# Eval("Age") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Position%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="Position2" runat="server" 
                                                 Text='<%# Eval("Position") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>  
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Management%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="ManagementName2" runat="server" 
                                                 Text='<%# Eval("ManagementName") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>             
                                     <asp:TemplateField HeaderText="<%$ Resources:Labels,Department%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="DepartmentName2" runat="server" 
                                                 Text='<%# Eval("DepartmentName") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>             
                                   
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,CurrentSalary%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="BasicSalary2" runat="server" 
                                                 Text='<%# Eval("BasicSalary") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>
                                           <asp:TemplateField HeaderText="<%$ Resources:Labels,AddedBy%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="AddedBy2" runat="server" 
                                                 Text='<%# Eval("AddedBy") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>                          
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,WorkShifts%>" ItemStyle-Width="15%" ControlStyle-CssClass="td-attendance">
                                           <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkAttendance" runat="server" myCustomID='<%# Eval("EmployeeID")%>'  CssClass="td-attendance">
                                                         <asp:Image ImageUrl="~/images/attendance-icon.png" runat="server" Width="20px" Height="20px" ToolTip="<%$ Resources:Labels,WorkShifts%>"/>
                                                     </asp:LinkButton>   
                                             </ItemTemplate>
                                        </asp:TemplateField>   
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Edit%>" ItemStyle-Width="15%" ControlStyle-CssClass="td-edit">
                                           <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkEdit2" runat="server" myCustomID='<%# Eval("EmployeeID")%>'  CssClass="td-edit">
                                                         <asp:Image ImageUrl="~/Images/edit.ico" runat="server" Width="20px" Height="20px" />
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Delete%>" ItemStyle-Width="15%"  ControlStyle-CssClass="td-delete">
                                             <ItemTemplate>                     
                                                     <asp:ImageButton  CommandArgument='<%# Eval("EmployeeID")%>' OnCommand="deletedatafromgrid"
                                                            OnClientClick="return confirm(<%= Resources.Labels.ConfirmDelete %>);return false;"
                                                            ID="Image1" runat="server" ImageUrl="~/Images/delete.ico" />
                                                             
                                             </ItemTemplate>
                                    </asp:TemplateField> 
                                </Columns>
                                <EditRowStyle BackColor="#009999" VerticalAlign="Middle" />
                            </asp:GridView>
                      <%--  </div>--%>
   
                    </div>


            </div>
        </div>

    </section>

</asp:Content>
