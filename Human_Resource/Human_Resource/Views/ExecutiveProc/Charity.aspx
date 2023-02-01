<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Charity.aspx.cs" Inherits="Human_Resource.Views.ExecutiveProc.Charity" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
 
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>


     <style>
       #ui-datepicker-div{
           z-index:10000 !important;
       }
   </style>
    <script>

        $(document).ready(function () {
            $(".hasdatepicker").datepicker({
                changeMonth: true,
                changeYear: true,
                format: "dd/MM/yyyy",
            });

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

        //function to close dialog, probably called by a button in the dialog
        function closeDialog() {
            $('#MainContent_hid_charityId').val("");
            $('#MainContent_emp').val("");
            $('#MainContent_txt_reason').val("");
            $('#MainContent_txt_details').val("");
            $('#MainContent_txt_amount').val("");
            $("#MainContent_file").val("");
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
                url: "Charity.aspx/GetCharity",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    ShowDialog();
                    for (var prop in data) {
                        var item = data[prop];
                        $('#MainContent_hid_charityId').val(item.CharityID);
                        $('#MainContent_emp').val(item.EmployeeID);
                        $('#MainContent_txt_reason').val(item.Reason);
                        $('#MainContent_txt_details').val(item.Details);
                        $('#MainContent_txt_amount').val(item.Amount);

                        var date = convertToJavaScriptDate(item.CharityDate);
                        $('[id*=dp_charityDate]').val(date);

                        if (item.Attachment != null) {
                            $('#MainContent_lbl_attach').attr("href", "../../Upload/Charities/" + item.Attachment.docnum);
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

        //function saveCharity() {
        //    var id = $('#MainContent_hid_charityId').val();
        //    var emp = $("#MainContent_emp").find(":selected").val();
        //    var reason = $("#MainContent_txt_reason").val();
        //    var details = $("#MainContent_txt_details").val();
        //    var amount = $("#MainContent_txt_amount").val();
            

        //     var parameter = {
        //        charityId: id,
        //         employeeId: emp,
        //            reason: reason,
        //            details: details,
        //         amount: amount,
        //     };
        //    $.ajax({
        //        type: "POST",
        //        url: "Charity.aspx/SaveCharity",
        //        data: JSON.stringify(parameter),
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: function (data) {
        //            window.top.location = "Charity.aspx";

        //        },
        //        failure: function (response) {
        //            alert(response.d);
        //        }
        //    });

        //}

        function checkValidation() {

            var valid = true;

            if ($('[id*=txt_amount]').val() == "" || $('[id*=txt_amount]').val() == null) {
                $('[id*=txt_amount]').attr("class", "form-control is-invalid");
                valid = false;
            }

            if ($('[id*=txt_reason]').val() == "" || $('[id*=txt_reason]').val() == null) {
                $('[id*=txt_reason]').attr("class", "form-control is-invalid");
                valid = false;
            }
            if ($('[id*=dp_charityDate]').val() == "" || $('[id*=dp_charityDate]').val() == null) {
                $('[id*=dp_charityDate]').attr("class", "form-control is-invalid");
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
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Charity%>" /></a></li>
                                </ol>
                            </nav>
                        </div>
                       
                        <div class="SearchAddbar">

                        <div class="input-group">
                            <div class="col-4">
                                <input type="text" runat="server" id="txt_search" placeholder="<%$ Resources:Labels,Search%>"  />
                            </div>
                            <div class="col-2">
                                 <asp:TextBox  ID="dp_fromSearch" runat="server" class="form-control input-lg hasdatepicker" placeholder="<%$ Resources:Labels,From%>" ></asp:TextBox>
                            </div>
                            <div class="col-2">
                                 <asp:TextBox  ID="dp_toSearch" runat="server" class="form-control input-lg hasdatepicker" placeholder="<%$ Resources:Labels,To%>" ></asp:TextBox>
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
                            OnRowDataBound="gv_data_RowDataBound"     AutoGenerateColumns="False"  Width="90%" 
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
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Reason%>" ItemStyle-Width="15%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDreason" runat="server" 
                                                 Text='<%# Eval("Reason") %>' />                              
                                         </ItemTemplate>
                                   </asp:TemplateField>             
                                          
                                      <asp:TemplateField HeaderText="<%$ Resources:Labels,Amount%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblAmount" runat="server" 
                                                 Text='<%# Eval("Amount") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>

                                     <asp:TemplateField HeaderText="<%$ Resources:Labels,Date%>" ItemStyle-Width="15%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblStart" runat="server" 
                                                Text='<%# Bind("CharityDate", "{0:MM-dd-yyyy}") %>'/>                              
                                         </ItemTemplate>
                                   </asp:TemplateField>     

                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Edit%>" ItemStyle-Width="15%" ControlStyle-CssClass="td-edit">
                                          <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkProducts" runat="server" myCustomID='<%# Eval("CharityID")%>'  CssClass="td-edit">
                                                         <asp:Image ImageUrl="~/Images/edit.ico" runat="server" Width="20px" Height="20px" />
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>

                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Delete%>" ItemStyle-Width="15%"  ControlStyle-CssClass="td-delete">
                                             <ItemTemplate>                     
                                                     <asp:ImageButton  CommandArgument='<%# Eval("CharityID")%>' OnCommand="deletedatafromgrid"
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
    <div id="dialog"  class="Modal-BackGround .Modal-Indx-form" style="overflow:hidden;padding:0px">

        <div class="modal-dialog body">
        <div class ="modal-content panel panel-default">
        <div class="modal-header frame-panel-heading">
           
            <div ><span >
                <asp:Literal runat="server" Text="<%$ Resources:Labels,AddCharity%>"></asp:Literal>
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
                   
                   <a href="" id="delete_upload" style="display:none;"><i class='fas fa-trash' style="color:#a19c9c"></i></a>
                    </div>

                <div class="c-form" style="margin-top:5px;">

                        <div class="row">
                     <div class="form-group" style="display:block">
                              <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Employee%>" /></span>
        
                                <select runat="server" id="sel_emp" name="sel_emp" style="width:80%" class="form-control input-lg"></select>
                          <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>
                            </div>
                        </div>

                    <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Reason%>" /></span>
                                <input type="hidden"  id="hid_charityId" name="hid_charityId" runat="server" value=""  />
                                <input type="text" class="form-control input-lg" id="txt_reason"  runat="server" value=""  onchange="removeValidation($(this));"/>
                                <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>

                             </div>
                        </div>
                      <div class ="row">
                   <div class="form-group" style="display:block">
                              <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Date%>" /></span>
                            <asp:TextBox  ID="dp_charityDate" runat="server" class="form-control input-lg hasdatepicker" onchange="removeValidation($(this));" ></asp:TextBox>
                        <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>
                             </div>
                        </div>
                      <div class="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server"  Text="<%$ Resources:Labels,Amount%>" /></span>
                                 <input type="number" class="form-control" id="txt_amount"  runat="server"  onchange="removeValidation($(this));" />
                               <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>

                     </div>
                        </div>

                     <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" id="txt_detailsTitle"  Text="<%$ Resources:Labels,Details%>" /></span>
                                <input type="text" class="form-control input-lg" id="txt_details"  runat="server" value=""  />
                            </div>
                        </div> 

                  
                   
                    
                <div class="modal-footer">
                     <asp:HiddenField  runat="server" ID="hdnButtonID"/>

                       <asp:button class="btn btn-new"  id="btn_ads"  runat="server" Text=" <%$ Resources:Labels,Save%>"
                     UseSubmitBehavior="False"  
                        OnClick="btn_save_Click" 
                        OnClientClick="javascript:checkValidation(); return false;" >
                    </asp:button>

                 <%--   <button class="btn btn-new"  runat="server"
                         OnClientClick="javascript:checkValidation(); return false;"
                        OnClick="btn_save_Click" id="btn_ads" >
                        <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Save%>" />
                    </button>
 --%>

                    </div>
                </div>
                 </div>
            </div>
        </div>
        </div>
</asp:Content>

