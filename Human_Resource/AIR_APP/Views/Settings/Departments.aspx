<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Departments.aspx.cs" Inherits="Human_Resource.Views.Settings.Departments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
 
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
    <script>

        $(document).ready(function () {

            $myWindow = $('#dialog');

            //instantiate the dialog
            $myWindow.dialog({
                height: 500,
                width: 550,
                modal: true,
                position: { my: 'top', at: 'top+75' },
                autoOpen: false,
                
                overlay: { opacity: 0.5, background: 'black' }
            });
        });

        ////function to show dialog   
        //var showDialog = function () {
        //    //if the contents have been hidden with css, you need this
        //    $myWindow.show();
        //    //open the dialog
        //    $myWindow.dialog("open");
        //}

        //function to close dialog, probably called by a button in the dialog
        function closeDialog() {
            $("#dialog").dialog("close");
        }

        function ShowDialog() {
            $("#dialog").dialog("open");
            $(".ui-dialog-titlebar").hide();
    var retval = "";

    //show modal dialog box and collect its return value
       // retval = window.showModalDialog('AddDepartmentFrame.html', window, "dialogWidth:390px;dialogHeight:180px;scroll:no;");

    if (retval != "" && retval != null) {
      //  document.getElementById("TextBox1").value = retval;
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
                       <div class="row ">
                            <asp:GridView ID="gv_departments" runat="server" style="width:90%;" CssClass="gridView"  
                                AutoGenerateColumns="False"  Width="90%">
                                <Columns>
                                   <asp:TemplateField HeaderText="Deptno">
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
    <div id="dialog"  class="Modal-BackGround .Modal-Indx-form" style="overflow:hidden;padding:0px">
        <div class="modal-dialog">
        <div class ="modal-content panel panel-default">
        <div class="modal-header panel-heading">
            <span class="col-6">
                <asp:Literal runat="server" Text="<%$ Resources:Labels,AddDepartment%>"></asp:Literal>
            </span>
            <button class="close col-6" onClick="closeDialog()" ><i class="fa fa-close"></i></button>
            </div>

            <div class="modal-body panel-body model-b">
                <div class="c-form">
                    <div class="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,TheName%>" /></span>
                                <input type="text" class="form-control input-lg" id="txt_name"  runat="server" value=""  />
                            </div>
                    </div>
                 </div>
                </div>
            </div>
        </div>
        </div>


</asp:Content>


