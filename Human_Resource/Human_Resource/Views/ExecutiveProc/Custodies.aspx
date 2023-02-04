<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Custodies.aspx.cs" Inherits="Human_Resource.Views.ExecutiveProc.Custodies" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
 
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
      <!-- for autocomplete -->
    <script src="../../Scripts/chosen.js"></script>  
    <script>

        $(document).ready(function () {

            //for autocomplete
            InitDropDown(); 

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
            $("#dialog").parent().appendTo($("form:first"));

            $('.td-edit').click(function () {
                var customID = $(this).attr('myCustomID');
                ShowDialogWithData(customID);
                return false;
            });


            $('[id*=uploadTrigger_1]').click(function (e) {
                e.preventDefault();
                $('[id*=file]').trigger('click');
            });

            $('[id*=delete_upload]').click(function (e) {
                e.preventDefault();
                $('[id*=file]').val("");
                $('[id*=hasFiles]').val("");
                $('[id*=lbl_attach]').html("");
                $('[id*=delete_upload]').hide();
            });
            $(function () {
                $('[id*=file]').change(function () {
                    var path = $(this).val();
                    if (path != '' && path != null) {
                        var q = path.substring(path.lastIndexOf('\\') + 1);
                        $('[id*=lbl_attach]').html(q);
                        $('[id*=delete_upload]').show();
                    }
                })
            });

        });

        //for autocomplete
        function InitDropDown() {

            var config = {
                '.ChosenSelector': { allow_single_deselect: true, search_contains: true, size: 10 },
            }
            for (var selector in config) {
                $(selector).chosen(config[selector]);
                //$('.chosen-drop').css({ "width": "80%" });
                $('.chosen-container-single').css({ "width": "80%" });

            }
        }  

        //function to close dialog, probably called by a button in the dialog
        function closeDialog() {
            $('#MainContent_hid_custodieId').val("");
            $('[id*=sel_emp]').val("");
            $('#MainContent_dept_type').val("");
            $('#MainContent_txt_details').val("");
            $("#MainContent_file").val("");
            $('[id*=hasFiles]').val("");
            $('#MainContent_chk_isRecovery').prop('checked', false);
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
                url: "Custodies.aspx/GetCustodie",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    ShowDialog();
                    for (var prop in data) {
                        var item = data[prop];
                        $('#MainContent_hid_custodieId').val(item.CustodieID);
                        $('[id*=sel_emp]').val(item.EmployeeID);
                        $('#MainContent_dept_type').val(item.Type);
                        $('#MainContent_txt_details').val(item.Details);
                        $('#MainContent_chk_isRecovery').prop('checked', item.IsRecovery);

                        if (item.Attachment != null) {
                            $('[id*=hasFiles]').val("1");
                            $('#MainContent_lbl_attach').attr("href", "../../Upload/Custodies/" + item.Attachment.docnum);
                            $('#MainContent_lbl_attach').html(item.Attachment.docName);
                            $('[id*=delete_upload]').show();
                        }
                     }


                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

       
        function typeChanged() {

            var type = $("#MainContent_dept_type").find(":selected").val();
            $("#MainContent_txt_detailsTitle").text("test");

        }

        function checkValidation() {

            var valid = true;

            if ($('[id*=sel_emp]').find(":selected").val() == "" || $('[id*=sel_emp]').find(":selected").val() == null) {
                $('[id*=sel_emp]').attr("class", "form-control is-invalid");
                valid = false;
            }

           
            if (valid) {

                var uniqID = $('#MainContent_hdnButtonID').val();

                __doPostBack(uniqID, "OnClick");
            }
            return valid;
        }




</script>
     <section class="statis">
         <div class="container" >
              <div class="row">
                   <div class="col-12">
                        <div class="bcrumb-block">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Custody%>" /></a></li>
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
                                 OnRowDataBound="gv_data_RowDataBound" 
                                class="table table-bordered table-condensed table-responsive table-hover ">
                                <Columns>

                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Sequence%>" ItemStyle-Width="5%">
                                         <ItemTemplate>
                                                 <%#Container.DataItemIndex+1 %>                            
                                         </ItemTemplate> 
                                       </asp:TemplateField>

                                    
                                        <asp:TemplateField HeaderText="<%$ Resources:Labels,employee%>" ItemStyle-Width="20%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDemployee" runat="server" 
                                                 Text='<%# Eval("EmployeeName") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Type%>" ItemStyle-Width="15%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDtype" runat="server" 
                                                 Text='<%# Eval("Type") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>             
                                          
                                <asp:TemplateField HeaderText="<%$ Resources:Labels,Details%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDetails" runat="server" 
                                                 Text='<%# Eval("Details") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>

                                     <asp:TemplateField HeaderText="<%$ Resources:Labels,Recovery%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:CheckBox ID="LblIsRecovery" runat="server" 
                                                 Checked='<%# Eval("IsRecovery") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>


                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Edit%>" ItemStyle-Width="5%" ControlStyle-CssClass="td-edit">
                                          <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkProducts" runat="server" myCustomID='<%# Eval("CustodieID")%>'  CssClass="td-edit">
                                                         <asp:Image ImageUrl="~/Images/edit.ico" runat="server" Width="20px" Height="20px" />
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Delete%>" ItemStyle-Width="5%"  ControlStyle-CssClass="td-delete">
                                             <ItemTemplate>                     
                                                     <asp:ImageButton  CommandArgument='<%# Eval("CustodieID")%>' OnCommand="deletedatafromgrid"
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
                <asp:Literal runat="server" Text="<%$ Resources:Labels,AddCustody%>"></asp:Literal>
            </span>
                </div>
            <div class="float2" style="width:10px">
            <button class="close col-12" onClick="closeDialog()" ><i class="fa fa-close"></i></button>
            </div>
         </div>
            <div class="modal-body panel-body model-b">
                 <div class="row div-attachment">
                       <asp:FileUpload ID="file" runat="server" style="display:none;" />
                 <a href=""  id="uploadTrigger_1"> <i class="fa fa-paperclip" style="color:#a19c9c"></i></a>
                      <a href="" id="lbl_attach" runat="server" target="_blank" class="href-file"></a>
                   
                   <a href="" id="delete_upload"  style="display:none;"><i class='fas fa-trash' style="color:#a19c9c"></i></a>
                    </div>

                <div class="c-form" style="margin-top:5px;">

                        <div class="row">
                     <div class="form-group" style="display:block">
                              <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Employee%>" /></span>
        
                                <select runat="server" id="sel_emp" name="sel_emp" style="width:80%" 
                                    class="form-control input-lg ChosenSelector" 
                                    onchange="removeValidation($(this));" >
                                </select>
                                <div class="invalid-feedback" >
                                    <asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" />
                                </div>
                            </div>
                        </div>

                    <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Type%>" /></span>
                                <input type="hidden"  id="hid_custodieId" name="hid_custodieId" runat="server" value=""  />
                                <select runat="server" id="dept_type" name="dept_type" 
                                    style="width:80%" class="form-control input-lg"    onchange="typeChanged()"/>
                             </div>
                        </div>
                     <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" id="txt_detailsTitle"  Text="<%$ Resources:Labels,Details%>" /></span>
                                <input type="text" class="form-control input-lg" 
                                    id="txt_details" name="txt_details"  
                                    runat="server" value="" />
                            </div>
                        </div> 

                    <div class="row">
                     <div class="form-group" style="display:block">
                                <asp:CheckBox runat="server" id="chk_isRecovery" name="chk_isRecovery" Text="<%$ Resources:Labels,Recovery%>" class="form-control input-lg"></asp:CheckBox>
                            </div>
                        </div>
                    

                    
                <div class="modal-footer">
                     <asp:HiddenField  runat="server" ID="hdnButtonID"/>
                     <asp:HiddenField  runat="server" ID="hasFiles"/>

                     <asp:button class="btn btn-new"  id="btn_ads"  runat="server" Text=" <%$ Resources:Labels,Save%>"
                     UseSubmitBehavior="False"  
                        OnClick="btn_save_Click" 
                        OnClientClick="javascript:checkValidation(); return false;" >
                    </asp:button>

                    </div>
                </div>
                 </div>
            </div>
        </div>
        </div>
</asp:Content>



