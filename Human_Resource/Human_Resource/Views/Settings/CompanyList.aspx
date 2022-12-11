<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompanyList.aspx.cs" Inherits="Human_Resource.Views.Settings.CompanyList" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" 
src="../../tiny_mce/tiny_mce.js"></script>
     <script type="text/javascript" >
         tinyMCE.init({
             // General options
             mode: "textareas",
             width:"100%",
             theme: "advanced",
             theme_advanced_path: false,
             theme_advanced_buttons1: "bold,italic,underline,|,justifyleft,justifycenter,justifyright,justifyfull",
             theme_advanced_buttons2: "forecolor,backcolor,|,formatselect,fontselect,fontsizeselect",

            // plugins: "pagebreak,style,layer,table,save,advhr, advimage, advlink, emotions, iespell, inlinepopups",
            
        });
    </script>
    <script>

        function removeValidation(input) {
            if ($(input).attr("class") == "form-control is-invalid") {

                $(input).attr("class", "form-control");

            }
        }
        function checkValidation() {

            var valid = true;
            if (tinymce.get("MainContent_companyListAr").getContent() == "" || tinymce.get("MainContent_companyListAr").getContent() == null) {
                $('#MainContent_companyListAr').attr("class", "form-control is-invalid");
                valid = false;
            }
           
            return valid;
        }

        function save() {
            var valid = checkValidation();
            if (valid) {
                var parameter = {
                    companyListAr: tinymce.get("MainContent_companyListAr").getContent(),
                    companyListEn: tinymce.get("MainContent_companyListEn").getContent(),
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
                            <div class="form-group textarea" style="display:block">
                                <input type="hidden" runat="server" id="hid_companyID" />
                                <asp:Literal runat="server" Text="<%$ Resources:Labels,CompanyListAr%>" />
                                <asp:TextBox class="form-control single-input" id="companyListAr" runat="server" TextMode="MultiLine" Rows="16"  onchange="removeValidation($(this));" />
                               <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>

                            </div>
                            </div>
                            <div class="row">
                            <div class="form-group textarea" style="display:block">
                                <asp:Literal runat="server" Text="<%$ Resources:Labels,CompanyListEn%>" />
                                <asp:TextBox class="form-control single-input" id="companyListEn" runat="server" TextMode="MultiLine" Rows="16"  onchange="removeValidation($(this));" />
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
