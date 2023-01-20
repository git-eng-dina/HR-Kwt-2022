<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventsApprove.aspx.cs" Inherits="Human_Resource.Views.ExecutiveProc.EventsApprove" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        $(document).ready(function () {

            $('.td-approve').click(function () {

                var customID = $(this).attr('myCustomID');
                if (confirm("<%= Resources.Labels.AreYouSure%>")) {

                     var parameter = {
                         eventID: customID,
                         userID:'<%= Session["user_id"].ToString() %>'
                     };
                     
                     $.ajax({
                         type: "POST",
                         url: "EventsApprove.aspx/Approve",
                         data: JSON.stringify(parameter),
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (data) {
                             window.location = "EventsApprove.aspx";

                         },
                         failure: function (response) {
                             alert(response.d);
                         }
                     });

                 }

                 return false;
            });

            $('.td-reject').click(function () {

                var customID = $(this).attr('myCustomID');
                if (confirm("<%= Resources.Labels.AreYouSure%>")) {

                     var parameter = {
                         eventID: customID,
                         userID: '<%= Session["user_id"].ToString() %>'
                     };

                     $.ajax({
                         type: "POST",
                         url: "EventsApprove.aspx/Reject",
                         data: JSON.stringify(parameter),
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (data) {
                             window.location = "EventsApprove.aspx";

                         },
                         failure: function (response) {
                             alert(response.d);
                         }
                     });

                 }

                 return false;
             });
        });

        function NewEvent() {
            window.location = "Events.aspx";
        }
    </script>
      <section class="statis">
         <div class="container" >
              <div class="row">
                   <div class="col-12">
                        <div class="bcrumb-block">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Events%>" /></a></li>
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


                            <asp:GridView ID="gv_events" runat="server" style="width:100%; margin-top:0px;" CssClass="specialist-gridview col-md-12"  
                                 OnRowDataBound="gv_events_RowDataBound" AutoGenerateColumns="False"  Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Sequence%>">
                                         <ItemTemplate>
                                                 <%#Container.DataItemIndex+1 %>                            
                                         </ItemTemplate> 
                                       </asp:TemplateField>
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Title%>" >
                                         <ItemTemplate>
                                                 <asp:Label ID="NameAr2" runat="server" 
                                                 Text='<%# Eval("title") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Start%>" >
                                         <ItemTemplate>
                                                 <asp:Label ID="start" runat="server" 
                                                  text= '<%# Eval("start", "{0:dd/MM/yyyy}") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField> 
                                     <asp:TemplateField HeaderText="<%$ Resources:Labels,End%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="end" runat="server" 
                                              text= '<%# Eval("end", "{0:dd/MM/yyyy}") %>'  DataFormatString="{0:MM/dd/yyyy}"/>                              
                                         </ItemTemplate>
                                   </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,AddedBy%>">
                                         <ItemTemplate>
                                                 <asp:Label ID="AddedBy2" runat="server" 
                                                 Text='<%# Eval("EmployeeName") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>                          
                                   <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-approve">
                                           <ItemTemplate>                     
                                                     <asp:LinkButton ID="approve" runat="server" myCustomID='<%# Eval("id")%>'  CssClass="td-approve">
                                                         <asp:Image ImageUrl="~/images/accept_document.png" runat="server" ToolTip="<%$ Resources:Labels,Approve%>" Width="20px" Height="20px"/>
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>   
                                    <asp:TemplateField ShowHeader="false" ItemStyle-Width ="5%" ControlStyle-CssClass="td-reject">
                                           <ItemTemplate>                     
                                                     <asp:LinkButton ID="reject" runat="server" myCustomID='<%# Eval("id")%>'  CssClass="td-reject">
                                                         <asp:Image ImageUrl="~/images/reject_document.png" runat="server" ToolTip="<%$ Resources:Labels,Reject%>" Width="20px" Height="20px" />
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
