<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StaffEvaluation.aspx.cs" Inherits="Human_Resource.Views.ExecutiveProc.StaffEvaluation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script>
        $(document).ready(function () {

            $('.td-edit').click(function () {
                var customID = $(this).attr('myCustomID');
                window.location = "AddEvaluation.aspx?uid=" + customID;
                return false;
            });


        });

        function NewEvaluation() {
            window.location = "AddEvaluation.aspx";

        }
</script>
     <section class="statis">
         <div class="container" >
              <div class="row">
                   <div class="col-12">
                        <div class="bcrumb-block">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,StaffEvaluation%>" /></a></li>
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
                     
                       <!---- table hired evaluations-->

                            <asp:GridView ID="gv_evaluations" runat="server" style="width:100%; margin-top:0px;" CssClass="gridView col-md-12"  
                              OnRowDataBound="gv_data_RowDataBound"  AutoGenerateColumns="False"  Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Sequence%>">
                                         <ItemTemplate>
                                                 <%#Container.DataItemIndex+1 %>                            
                                         </ItemTemplate> 
                                       </asp:TemplateField>

                                 
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Employee%>" >
                                         <ItemTemplate>
                                                 <asp:Label ID="LblEmployeeName" runat="server" 
                                                 Text='<%# Eval("EmployeeName") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField> 
                                     <asp:TemplateField HeaderText="<%$ Resources:Labels,Reviewer%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblReviewerName" runat="server" 
                                                 Text='<%# Eval("ReviewerName") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>
                                     
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,EvaluationDate%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblEvaluationDate" runat="server" 
                                                 Text='<%# Eval("EvaluationDate") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>             
                                   
                                       <asp:TemplateField HeaderText="<%$ Resources:Labels,OverAllProgress%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblOverAllProgress" runat="server" 
                                                 Text='<%# Eval("OverAllProgress") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>   

                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Comment%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblComment" runat="server" 
                                                 Text='<%# Eval("Comment") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>      
                                    

                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Edit%>" ItemStyle-Width="5%" ControlStyle-CssClass="td-edit">
                                           <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkProducts" runat="server" myCustomID='<%# Eval("EvaluationID")%>'  CssClass="td-edit">
                                                         <asp:Image ImageUrl="~/Images/edit.ico" runat="server" Width="20px" Height="20px" />
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Delete%>" ItemStyle-Width="5%"  ControlStyle-CssClass="td-delete">
                                             <ItemTemplate>                     
                                                     <asp:ImageButton  CommandArgument='<%# Eval("EvaluationID")%>' OnCommand="deletedatafromgrid"
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

    </section>

</asp:Content>

