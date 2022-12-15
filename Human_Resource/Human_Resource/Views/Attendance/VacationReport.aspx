<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VacationReport.aspx.cs" Inherits="Human_Resource.Views.Attendance.VacationReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
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
                      
                    
                      <%-- </div>--%>
                       <!---- table hired employees-->
                      
                      
                <%--    <div class="row">--%>
                       
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
                                    
                                 
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,VacationsBalance%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDno" runat="server" 
                                                 Text='<%# Eval("VacationsBalance") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>             
                                                       
                                  <%-- <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-edit">
                                           <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkProducts" runat="server" myCustomID='<%# Eval("EmployeeID")%>'  CssClass="td-edit">
                                                         <asp:Image ImageUrl="~/Images/edit.ico" runat="server" Width="20px" Height="20px" />
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>--%>
                                 
                                </Columns>
                                <EditRowStyle BackColor="#009999" VerticalAlign="Middle" />
                            </asp:GridView>
                      <%--  </div>--%>
   
                    </div>


            </div>
        </div>

    </section>

</asp:Content>
