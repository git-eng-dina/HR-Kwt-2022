<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExpiredPassports.aspx.cs" Inherits="Human_Resource.Views.Employees.ExpiredPassports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script>
        $(document).ready(function () {

            $('.td-attendance').click(function () {
                var customID = $(this).attr('myCustomID');
                window.location = "../Attendance/WorkShifts.aspx?empID=" + customID;
                return false;
            });
        });

        
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
                        </div>
   
                        </div>
                      
                       <!---- table hired employees-->
                            <asp:GridView ID="gv_employees" runat="server" style="width:100%; margin-top:0px;" CssClass="gridView col-md-12"  
                                OnRowDataBound="gv_data_RowDataBound" AutoGenerateColumns="False"  Width="100%">
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
                                   <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-attendance">
                                           <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkAttendance" runat="server" myCustomID='<%# Eval("EmployeeID")%>'  CssClass="td-attendance">
                                                         <asp:Image ImageUrl="~/images/attendance-icon.png" runat="server" Width="20px" Height="20px" ToolTip="<%$ Resources:Labels,WorkShifts%>"/>
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>   
                                  
                                </Columns>
                                <EditRowStyle BackColor="#009999" VerticalAlign="Middle" />
                            </asp:GridView>
   
                    </div>


            </div>
        </div>

    </section>

</asp:Content>

