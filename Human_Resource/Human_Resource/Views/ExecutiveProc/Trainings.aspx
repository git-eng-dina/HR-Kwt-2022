<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Trainings.aspx.cs" Inherits="Human_Resource.Views.ExecutiveProc.Trainings" EnableEventValidation="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
 
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
     <style>
       #ui-datepicker-div{
           z-index:10000 !important;
       }
   </style>
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

            $('.td-edit').click(function () {
                var customID = $(this).attr('myCustomID');
                ShowDialogWithData(customID);
                return false;
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
                $('.chosen-container-single').css({ "width": "65%" });

            }
        }  
        //function to close dialog, probably called by a button in the dialog
        function closeDialog() {
            $('#MainContent_hid_trainingId').val("");
            $('#MainContent_txt_name').val("");
            $('#MainContent_txt_description').val("");
            $("#MainContent_hdn_empIds").val("");
            $('#MainContent_lst_employee').empty();
            $('#MainContent_dp_start').val("");
            $('#MainContent_dp_end').val("");
            $("#dialog").dialog("close");
        }

        function ShowDialog() {

            $("#dialog").dialog("open");
            $(".ui-dialog-titlebar").hide();
            var retval = "";
        }
        function ShowDialogWithData(customID) {
            var lang = "ar-AS";
            if ('<%= Session["CultureName"] %>' != null)
                lang = '<%= Session["CultureName"].ToString() %>';


            var parameter = {
                ID: customID
            };
            $.ajax({
                type: "POST",
                url: "Trainings.aspx/GetTraining",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    ShowDialog();
                    for (var prop in data) {
                        var item = data[prop];
                        $('#MainContent_hid_trainingId').val(item.TrainingID);
                        $('#MainContent_txt_name').val(item.Name);
                        $('#MainContent_txt_description').val(item.Description);

                        if (item.StartDate != null) {
                        var start = convertToJavaScriptDate(item.StartDate);
                        $('[id*=dp_start]').val(start);
                        }

                        if (item.EndDate != null) {
                            var end = convertToJavaScriptDate(item.EndDate);
                            $('[id*=dp_end]').val(end);
                        }

                        var lstView = $("[id*=lst_employee]");
                        for (var emp in item.Employees) {
                            var employee = item.Employees[emp];

                            var row = '<li id="' + employee.EmployeeID + '"> <input type="hidden"  runat="server" />' + "</li>";

                            //Add the row to the employee list
                            lstView.append(row);

                            var li = $('#MainContent_lst_employee li:last-child');

                            var span = document.createElement('SPAN');
                            span.innerHTML = "<i class='fa fa-close delete-row-list'></i>";
                            span.className = "delete-row-span";
                            span.onclick = function () {
                                $(this).closest("li").remove();
                            };

                            li.append(span);

                            var spanName = document.createElement('SPAN');
                            if (lang == "ar-AS")
                                spanName.innerHTML = employee.NameAr;
                            else 
                                spanName.innerHTML = employee.NameEn;
                            spanName.className = "value-list";
                            li.append(spanName);
                            var hid_input = li.find("input");
                            hid_input.attr("id", "hid_emp_" + employee.EmployeeID );
                            hid_input.val(employee.EmployeeID );
                        }
                     }


                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function checkValidation() {

            var valid = true;

            if ($('#MainContent_txt_name').val() == "" || $('#MainContent_txt_name').val() == null) {
                $('#MainContent_txt_name').attr("class", "form-control is-invalid");
                valid = false;
            }
            if ($('#MainContent_txt_description').val() == "" || $('#MainContent_txt_description').val() == null) {
                $('#MainContent_txt_description').attr("class", "form-control is-invalid");
                valid = false;
            }
            if ($('#MainContent_dp_start').val() == "" || $('#MainContent_dp_start').val() == null) {
                $('#MainContent_dp_start').attr("class", "form-control is-invalid");
                valid = false;
            }
            if ($('#MainContent_dp_end').val() == "" || $('#MainContent_dp_end').val() == null) {
                $('#MainContent_dp_end').attr("class", "form-control is-invalid");
                $('[id*=endValidMsg]').text("<%= Resources.Labels.ValueIsRequired %>");
                valid = false;
            }

            if ($('#MainContent_dp_start').val() != "" && $('#MainContent_dp_start').val() != null
                && $('#MainContent_dp_end').val() != "" && $('#MainContent_dp_end').val() != null) {

                var start = $('#MainContent_dp_start').val();
                var end = $('#MainContent_dp_end').val();
                if (start > end) {
                    $('#MainContent_dp_end').attr("class", "form-control is-invalid");
                    $('[id*=endValidMsg]').text("<%= Resources.Labels.EndBiggerThanStart %>");
                    valid = false;
                }
            }
            var empIdsStr = "";
            var inputs = $('ul li input');
            inputs.each(function (e) {
                empIdsStr = empIdsStr + $(this).val() + ',';
            });
            $("#MainContent_hdn_empIds").val(empIdsStr);

            if (empIdsStr == "") {
                $('#MainContent_sel_employee').attr("class", "form-control is-invalid");
                valid = false;
            }

            return valid;
        }

        function saveTraining() {
            var valid = checkValidation();
            if (valid) {
                var id = $('#MainContent_hid_trainingId').val();
                var name = $("#MainContent_txt_name").val();
                var description = $("#MainContent_txt_description").val();
                var startDate = $("#MainContent_dp_start").val();
                var endDate = $("#MainContent_dp_end").val();



                var empIdsStr = "";
                var inputs = $('ul li input');
                inputs.each(function (e) {
                    empIdsStr = empIdsStr + $(this).val() + ',';
                });


                var parameter = {
                    trainingId: id,
                    name: name,
                    description: description,
                    startDate: startDate,
                    endDate: endDate,
                    empIds: empIdsStr,
                };
                $.ajax({
                    type: "POST",
                    url: "Trainings.aspx/SaveTraining",
                    data: JSON.stringify(parameter),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        window.top.location = "Trainings.aspx";

                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
        }

        function addEmp() {
            
            var empId = $('#MainContent_sel_employee').val();
            var empName = $("#MainContent_sel_employee option:selected").text();

            var lstView = $("[id*=lst_employee]");

            if (!$("#MainContent_lst_employee #" + empId).length) {



                var row = '<li id="' + empId + '"> <input type="hidden"  runat="server" />' + "</li>";

                //Add the row to the employee list
                lstView.append(row);

                var li = $('#MainContent_lst_employee li:last-child');

                var span = document.createElement('SPAN');
                span.innerHTML = "<i class='fa fa-close delete-row-list'></i>";
                span.className = "delete-row-span";
                span.onclick = function () {
                    $(this).closest("li").remove();
                };

                li.append(span);

                var spanName = document.createElement('SPAN');
                spanName.innerHTML = empName;
                spanName.className = "value-list";
                li.append(spanName);
                var hid_input = li.find("input");
                hid_input.attr("id", "hid_emp_" + empId);
                hid_input.val(empId);

                return false;
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
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Training%>" /></a></li>
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
                               OnRowDataBound="gv_data_RowDataBound"  AutoGenerateColumns="False"  Width="90%" 
                                class="table table-bordered table-condensed table-responsive table-hover ">
                                <Columns>

                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Sequence%>" ItemStyle-Width="5%">
                                         <ItemTemplate>
                                                 <%#Container.DataItemIndex+1 %>                            
                                         </ItemTemplate> 
                                       </asp:TemplateField>

                                    
                                  

                                
                                              
                                          
                                <asp:TemplateField HeaderText="<%$ Resources:Labels,Training%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblName" runat="server" 
                                                 Text='<%# Eval("Name") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                
                                        <asp:TemplateField HeaderText="<%$ Resources:Labels,Description%>" ItemStyle-Width="25%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblDescription" runat="server" 
                                                 Text='<%# Eval("Description") %>' />                              
                                         </ItemTemplate>
                                        </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Start%>" ItemStyle-Width="15%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblStart" runat="server" 
                                                Text='<%# Bind("StartDate", "{0:MM-dd-yyyy}") %>'/>                              
                                         </ItemTemplate>
                                   </asp:TemplateField>    
                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,End%>" ItemStyle-Width="15%">
                                         <ItemTemplate>
                                                 <asp:Label ID="LblEnd" runat="server" Text='<%# Bind("EndDate", "{0:MM-dd-yyyy}") %>'/>                              
                                         </ItemTemplate>
                                   </asp:TemplateField>   
                                 


                                    <asp:TemplateField HeaderText="<%$ Resources:Labels,Edit%>" ItemStyle-Width="5%" ControlStyle-CssClass="td-edit">
                                          <ItemTemplate>                     
                                                     <asp:LinkButton ID="LinkProducts" runat="server" myCustomID='<%# Eval("TrainingID")%>'  CssClass="td-edit">
                                                         <asp:Image ImageUrl="~/Images/edit.ico" runat="server" Width="20px" Height="20px" />
                                                     </asp:LinkButton>  
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                   <asp:TemplateField HeaderText="<%$ Resources:Labels,Delete%>" ItemStyle-Width="5%"  ControlStyle-CssClass="td-delete">
                                             <ItemTemplate>                     
                                                     <asp:ImageButton  CommandArgument='<%# Eval("TrainingID")%>' OnCommand="deletedatafromgrid"
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
                <asp:Literal runat="server" Text="<%$ Resources:Labels,AddTraining%>"></asp:Literal>
            </span>
                </div>
            <div class="float2" style="width:10px">
            <button class="close col-12" onClick="closeDialog()" ><i class="fa fa-close"></i></button>
            </div>
         </div>
            <div class="modal-body panel-body model-b">
                <div class="c-form">

                     

                     <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Training%>" /></span>
                                <input type="hidden"  id="hid_trainingId" name="hid_trainingId" runat="server" value=""  />
                                <input type="text" class="form-control input-lg" id="txt_name"  runat="server"  onchange="removeValidation($(this));"  />
                                <div class="invalid-feedback" >
                                    <asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" />
                                </div>
                            </div>
                        </div> 
  
                   <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Description%>" /></span>
                                <input type="text" class="form-control input-lg" id="txt_description"  runat="server"  onchange="removeValidation($(this));" />
                                <div class="invalid-feedback" >
                                    <asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" />
                                </div>
                            </div>
                        </div> 
                     <div class ="row">
                   <div class="form-group" style="display:block">
                              <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Start%>" /></span>
                            <asp:TextBox  ID="dp_start" runat="server" class="form-control input-lg hasdatepicker" onchange="removeValidation($(this));" ></asp:TextBox>
                        <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>
                             </div>
                        </div>
                  
                    <div class ="row">
                   <div class="form-group" style="display:block">
                              <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,End%>" /></span>
                            <asp:TextBox  ID="dp_end" runat="server" class="form-control input-lg hasdatepicker"  onchange="removeValidation($(this));"></asp:TextBox>
                              <div class="invalid-feedback" id="endValidMsg"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>

                   </div>
                 </div>
                    <div class ="row">
                     <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Employees%>" /></span>
                                 <select runat="server" id="sel_employee" name="sel_employee" 
                                     style="width:70%" class="form-control input-lg ChosenSelector" ></select>
                          <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>
                                  <button class="add-arrow-btn"  runat="server" onclick="addEmp()" id="Button1" >
                                   <i class="fas fa-arrow-alt-circle-down"></i>
                                </button>
                            </div>
                        </div> 
                    <div class ="row employee-list">
                        <ul id="lst_employee" class="employee-list" runat="server"></ul>
                    </div>

                <div class="modal-footer">
                    <button class="btn btn-new"  runat="server" onclick="saveTraining()" id="btn_ads" >
                        <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Save%>" />
                    </button>
 

                    </div>
                </div>
                 </div>
            </div>
        </div>
    </div>
</asp:Content>
