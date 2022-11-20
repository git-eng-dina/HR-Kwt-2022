<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Human_Resource.Views.Employees.Employees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script>


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
                       <div class="row ">
                            <asp:GridView ID="gv_employees" runat="server" style="width:90%;" CssClass="gridView"  
                                AutoGenerateColumns="False"  Width="90%">
                                <Columns>
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,TheName%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDno" runat="server" 
                                                 Text='<%# Eval("UserName") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,TheName%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDno" runat="server" 
                                                 Text='<%# Eval("UserName") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>             
                                   <asp:TemplateField HeaderText="Dept Name">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDname" runat="server" 
                                                 Text='<%# Eval("UserName") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Location">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblLoc" runat="server" 
                                                 Text='<%# Eval("UserName") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>                          
                                   <asp:TemplateField ShowHeader="false">
                                             <ItemTemplate>                     
                                                     <asp:ImageButton CommandArgument='<%# Eval("UserID")%>' OnCommand="deletedatafromgrid"
                                                            OnClientClick="return confirm('<%$ Resources:Labels,ConfirmDelete%>');return false;"
                                                            ID="Image1" runat="server" ImageUrl="~/Images/delete.ico" />
                                                             
                                             </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField ShowHeader="false">
                                          <ItemTemplate>                     
                                                     <asp:ImageButton CommandArgument='<%# Eval("UserID")%>' OnCommand="deletedatafromgrid"
                                                        ID="Image2" runat="server" ImageUrl="~/Images/edit.ico" />
                                      
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
