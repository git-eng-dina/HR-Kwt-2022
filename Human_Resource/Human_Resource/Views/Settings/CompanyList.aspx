<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompanyList.aspx.cs" Inherits="Human_Resource.Views.Settings.CompanyList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function removeValidation(input) {
            if ($(input).attr("class") == "form-control is-invalid") {

                $(input).attr("class", "form-control");

            }
        }
        function checkValidation() {
            var valid = true;
            if ($('#MainContent_companyList').val() == "" || $('#MainContent_companyList').val() == null) {
                $('#MainContent_companyList').attr("class", "form-control is-invalid");
                valid = false;
            }
           
            return valid;
        }

        function save() {
            var valid = checkValidation();
            if (valid) {
                var parameter = {
                    CompanyListAr: $('#MainContent_companyListAr').val(),
                    CompanyListEn: $('#MainContent_companyListEn').val(),
                    companyId: $('#MainContent_hid_companyID').val(),
                };
                $.ajax({
                    type: "POST",
                    url: "CompanyList.aspx/SaveList",
                    data: JSON.stringify(parameter),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        $('#MainContent_hid_companyID').val(data.d);
                        alert('<%= Resources.Labels.SaveSuccessfully %>');

                     },
                     failure: function (response) {
                         alert(response.d);
                     }
                 });
        }
    </script>
     <section class="statis">
         <div class="container" >
              <div class="row">
                   <div class="col-12">
                        <div class="bcrumb-block">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,CompanyList%>" /></a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                   <div class="col-12">
                        <div class="c-form">
                            <div class="row">
                            <div class="form-group" style="display:block">
                                <input type="hidden" runat="server" id="hid_companyID" />
                                <asp:TextBox class="form-control single-input" id="companyListAr" runat="server" TextMode="MultiLine" Rows="16" onchange="removeValidation($(this));" />
                               <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>

                            </div>
                            </div>

                            <Button type="button" runat="server" class="btn btn-secondary btn-block save" id="btn_save" OnClick="save();" CausesValidation="false" >
                                <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Save%>" />
                            </Button>
  
                        </div>
                   </div>
             </div>
        </div>
    </section>
</asp:Content>
