<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompanyInfo.aspx.cs" Inherits="Human_Resource.Views.Settings.CompanyInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>

        function addEmp() {

            var empId = $('#MainContent_sel_advisor').val();
            var empName = $("#MainContent_sel_advisor option:selected").text();
            var lstView = $("[id*=lst_employee]");

            if (!$("#MainContent_sel_advisor #" + empId).length) {



                var row = '<li id="' + empId + '"> <input type="hidden"  runat="server" />' + "</li>";

                //Add the row to the employee list
                lstView.append(row);

                var li = $('#MainContent_sel_advisor li:last-child');

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
                alert(hid_input.val());
                return false;
            }

        }

        function setAdvisorsIds() {
            var listItems = $("#lst_employee li");
            var ids = "";
            listItems.each(function (idx, li) {
                var product = $(li);
                ids += product.val() + ",";

                // and the rest of your code
            });
            alert(ids);
        }
    </script>
    
    <section class="statis">
         <div class="container" >
              <div class="row">
                   <div class="col-12">
                        <div class="bcrumb-block">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,CompanyInfo%>" /></a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                   <div class="col-12">
                        <div class="c-form">
                            <div class="row">
                            <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,TheName%>" /></span>
                                <asp:TextBox id="txt_name"  runat="server" class="form-control input-lg" ></asp:TextBox>
                                <input type="hidden" runat="server" id="hid_companyID" />
                            </div>
                            </div>

                             <div class="row">
                            <div class="form-group" style="display:block">
                               <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Address%>" /></span>
                                <asp:TextBox class="form-control input-lg" id="txt_address" runat="server" />
                            </div>
                            </div>

                            <div class="row">
                            <div class="form-group" style="display:block">
                               <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Email%>" /></span>
                                <input type="email" class="form-control input-lg" id="txt_email" runat="server" />
                            </div>
                            </div> 
                            
                            <div class="row">
                            <div class="form-group" style="display:block">
                               <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Mobile%>" /></span>
                                <asp:TextBox class="form-control input-lg" id="txt_mobile" runat="server" />
                            </div>
                            </div>

                            <div class="row">
                            <div class="form-group" style="display:block">
                               <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Phone%>" /></span>
                                <asp:TextBox class="form-control input-lg" id="txt_phone" runat="server" />
                            </div>
                            </div>

                             <div class="row">
                            <div class="form-group" style="display:block">
                               <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Fax%>" /></span>
                                <asp:TextBox class="form-control input-lg" id="txt_fax" runat="server" />
                            </div>
                            </div>
                            <div class="row">
                            <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,GeneralDirector%>" /></span>
                                <select runat="server" id="sel_generalDirector" name="sel_generalDirector" class="form-control select"></select>
      
                            </div>
                            </div>
                             <div class="row">
                            <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,CEO%>" /></span>
                                <select runat="server" id="sel_CEO" name="sel_CEO" class="form-control select"></select>
      
                            </div>
                            </div>
                             <div class="row">
                            <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,FinancialManager%>" /></span>
                                <select runat="server" id="sel_financialManager" name="sel_financialManager" class="form-control select"></select>
      
                            </div>
                            </div>
                             <div class="row">
                            <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,HRManager%>" /></span>
                                <select runat="server" id="sel_HRManager" name="sel_HRManager" class="form-control select"></select>
      
                            </div>
                            </div>
                            <div class="row">
                            <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Legal%>" /></span>
                                <select runat="server" id="sel_legal" name="sel_legal" class="form-control select"></select>
      
                            </div>
                            </div>
                            <div class="row">
                            <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Advisors%>" /></span>
                                <select runat="server" id="sel_advisor" name="sel_advisor" class="form-control select" style="width:70%"></select>
                                <button type="button" class="add-arrow-btn"  runat="server" onclick="addEmp()" id="Button1" >
                                   <i class="fas fa-arrow-alt-circle-down"></i>
                                </button>
                            </div>
                            </div>
                             <div class ="row employee-list">
                                 <input type="hidden" runat="server" id="advisorsIds" name="advisorsIds" />
                                 <ul id="lst_employee" class="employee-list" runat="server"></ul>
                            </div>
                            <div class="row">
                            <div class="form-group" style="display:block">
                               <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Notes%>" /></span>
                                <asp:TextBox class="form-control input-lg" id="txt_notes" runat="server"  />
                            </div>
                            </div>

                            <Button type="button" runat="server" class="btn btn-secondary btn-block save" id="btn_save" OnClick="setAdvisorsIds();" CausesValidation="false" >
                                <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Edit%>" />
                            </Button>
                          <%-- <asp:Button runat="server" Text = "<%$ Resources:Labels,Edit%>" class="btn btn-secondary btn-block" id="btn_edit"  CausesValidation="false" >
                            </asp:Button>--%>
  
                        </div>
                   </div>
             </div>
        </div>
    </section>
</asp:Content>
