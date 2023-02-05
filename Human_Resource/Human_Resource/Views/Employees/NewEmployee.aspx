﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewEmployee.aspx.cs" Inherits="Human_Resource.Views.Employees.NewEmployee" enableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdn.syncfusion.com/14.1.0.41/js/common/ej.webform.min.js"></script>
    <!-- for autocomplete -->
    <script src="../../Scripts/chosen.js"></script>  

     <script>
         $(document).ready(function () {

             //for autocomplete
             InitDropDown(); 
            
             $('[id*=uploadImageBtn]').click(function (e) {
                 e.preventDefault();
                 $('[id*=file_image]').trigger('click');
             });

             $('#uploadTrigger_1').click(function (e) {
                 e.preventDefault();
                 $('#MainContent_file_certificate1').trigger('click');
             });

             $('#uploadTrigger_2').click(function (e) {
                 e.preventDefault();
                 $('#MainContent_file_certificate2').trigger('click');
             });

             $('#uploadTrigger_3').click(function (e) {
                 e.preventDefault();
                 $('#MainContent_file_certificate3').trigger('click');
             });

             $('#permitTrigger').click(function (e) {
                 e.preventDefault();
                 $('[id*=permitFile]').trigger('click');
             });

             $('#contractTrigger').click(function (e) {
                 e.preventDefault();
                 $('[id*=contractFile]').trigger('click');
             });


             //allow only alphabatic char for name
             $("[id*=nameAR]").keypress(function (e) {
                 var arregex = /[\u0600-\u06FF, ]/;
                 if (!arregex.test(e.key)) {
                     return false;
                 }
             });
             $("[id*=nameEN]").keypress(function (e) {
                 if (!/^[a-zA-Z, ]/.test(e.key)) {
                     return false;
                 }
             });
             
         });

         //for autocomplete
         function InitDropDown() {

             var config = {
                 '.ChosenSelector': { allow_single_deselect: true, search_contains: true,size:10 },
             }
             for (var selector in config) {
                 $(selector).chosen(config[selector]);

             }
         }  
   

         $(function () {
             $('[id*=file_image]').change(function () {
                 if (this.files && this.files[0]) {
                     var reader = new FileReader();

                     reader.onload = function (e) {
                         $('[id*=img_Emp]').attr('src', e.target.result);
                     }

                     reader.readAsDataURL(this.files[0]);
                 }
           
             })
         });

         $(function () {
             $('#MainContent_file_certificate1').change(function () {
                 var path = $(this).val();
                 if (path != '' && path != null) {
                     var q = path.substring(path.lastIndexOf('\\') + 1);
                    // $('#MainContent_lbl_certificate1').style.display= "inline";
                     $('#MainContent_hr_cer1').hide();
                     $('#MainContent_lbl_certificate1').html(q);
                     $('[id*=cerValidMsg]').hide();
                 }
             })
         });
         $(function () {
             $('#MainContent_file_certificate2').change(function () {
                 var path = $(this).val();
                 if (path != '' && path != null) {
                     var q = path.substring(path.lastIndexOf('\\') + 1);
                     $('#MainContent_hr_cer2').hide();
                     $('#MainContent_lbl_certificate2').html(q);
                 }
             })
         });
         $(function () {
             $('#MainContent_file_certificate3').change(function () {
                 var path = $(this).val();
                 if (path != '' && path != null) {
                     var q = path.substring(path.lastIndexOf('\\') + 1);
                     $('#MainContent_hr_cer3').hide();
                     $('#MainContent_lbl_certificate3').html(q);
                 }
             })
         });

         $(function () {
             $('[id*=permitFile]').change(function () {
                 var path = $(this).val();
                 if (path != '' && path != null) {
                     var q = path.substring(path.lastIndexOf('\\') + 1);
                     $('[id*=lbl_permit]').html(q);
                 }
             })
         });

         $(function () {
             $('[id*=contractFile]').change(function () {
                 var path = $(this).val();
                 if (path != '' && path != null) {
                     var q = path.substring(path.lastIndexOf('\\') + 1);
                     $('[id*=lbl_contract]').html(q);
                 }
             })
         });
         function addCertificateRow() {
             if ($('[id*=frm_certificate2]').is(':visible')) {
                 $("[id*=frm_certificate3]").show();
                 $("[id*=frm_certificate3]").css("visibility", "visible");
                 $('[id*=frm-addCertificate]').hide();
                 $('[id*=btn-deleteCertificate2]').hide();
             }
             else {
 
                 $('[id*=frm_certificate2]').show();
                 $("[id*=frm_certificate2]").css("visibility", "visible");
             }
         }

         function deleteCertificateRow() {
             var uploadFileText = "<%= Resources.Labels.UploadFile %>";

             if ($('[id*=frm_certificate3]').is(':visible')) {
                 $('[id*=MainContent_txt_certificate3]').val("");
                 $('[id*=MainContent_file_certificate3]').val("");
                 $('[id*=MainContent_lbl_certificate3]').html(uploadFileText);
                 $('[id*=frm_certificate3]').hide();
                 $('[id*=frm-addCertificate]').show();
                 $('[id*=btn-deleteCertificate2]').show();


             }
             else {
                 $('[id*=txt_certificate2]').val("");
                 $('[id*=file_certificate2]').val("");
                 $('[id*=lbl_certificate2]').html(uploadFileText);
                 $('[id*=frm_certificate2]').hide();
             }
         }
         function addExperienceRow() {
             if ($('[id*=frm_experience2]').is(':visible')) {
                 $('[id*=frm_experience3]').show();
                 $('[id*=frm-addExperience]').hide();
                 $('[id*=btn-deleteExperience2]').hide();
             }
             else {
                 $('[id*=frm_experience2]').show();

             }
         }

         function deleteExperienceRow() {

             if ($('[id*=frm_experience3]').is(':visible')) {
                 $('[id*=txt_experience3]').val("");
                 $('[id*=frm_experience3]').hide();
                 $('[id*=frm-addExperience]').show();
                 $('[id*=btn-deleteExperience2]').show();


              }
              else {
                  $('[id*=txt_experience2]').val("");
                 $('[id*=frm_experience2]').hide();
              }
         }

         function fillDepartment(managementId) {
             if (managementId == 0) {
                 $('#MainContent_sel_department option').each(function () {
                     $(this).remove();
                 });
             }
             else {
                 var parameter = {
                     ID: managementId,
                 };
                 $.ajax({
                     type: "POST",
                     url: "NewEmployee.aspx/GetDepartments",
                     data: JSON.stringify(parameter),
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (data) {

                         var colours = jQuery.parseJSON(data.d);

                         for (var i = 0; i < colours.length; i++) {
                             var val = colours[i].DepartmentID;
                             var text = colours[i].Name;
                             $("#MainContent_sel_department").append($('<option></option>').attr('value', val).text(text));
                         }

                     },
                     failure: function (response) {
                         alert(response.d);
                     }
                 });
             }
         }

         function checkValidation() {
             var valid = true;
             if ($('[id*=txt_nameAR]').val() == "" || $('[id*=txt_nameAR]').val() == null) {
                 $('[id*=txt_nameAR]').attr("class", "form-control is-invalid");
                 valid = false;
             }
             if ($('[id*=txt_nameEN]').val() == "" || $('[id*=txt_nameEN]').val() == null) {
                 $('[id*=txt_nameEN]').attr("class", "form-control is-invalid");
                 valid = false;
             }
             if ($('[id*=dp_bod]').val() == "" || $('[id*=dp_bod]').val() == null) {
                 $('[id*=dp_bod]').attr("class", "form-control is-invalid");
                 valid = false;
             }
             if ($('[id*=txt_mobile]').val() == "" || $('[id*=txt_mobile]').val() == null) {
                 $('[id*=txt_mobile]').attr("class", "form-control is-invalid");
                 valid = false;
             }
             if ($('[id*=txt_identityNumber]').val() == "" || $('[id*=txt_identityNumber]').val() == null) {
                 $('[id*=identityValidMsg]').text("<%= Resources.Labels.ValueIsRequired %>");
                 $('[id*=identityValidMsg]').show();
                 valid = false;
             }

             if ($("[id*=txt_identityNumber]").val() != '' && $("[id*=txt_identityNumber]").val() != null) {
                 if ($("[id*=txt_identityNumber]").val().length < 12 || $("[id*=txt_identityNumber]").val().length > 12) {
                     $('[id*=identityValidMsg]').text("<%= Resources.Labels._12Digit %>");

                     $('[id*=identityValidMsg]').show();
                     valid = false;
                 }
             }
             //check vacation balance (should be less than 200)
             if ($('[id*=txt_vacationBalance]').val() != "" && $('[id*=txt_vacationBalance]').val() != null) {

                 if (parseInt($("[id*=txt_vacationBalance]").val()) > 200) {
                     $('[id*=txt_vacationBalance]').attr("class", "form-control is-invalid");

                     valid = false;
                 }
             }

             if ($('[id*=txt_salary]').val() == "" || $('[id*=txt_salary]').val() == null) {
                 $('[id*=txt_salary]').attr("class", "form-control is-invalid");
                 valid = false;
             }
             if ($('[id*=txt_email]').val() == "" || $('[id*=txt_email]').val() == null) {
                 $('[id*=txt_email]').attr("class", "form-control is-invalid");
                 $('[id*=msg_emailInvalid]').text("<%= Resources.Labels.ValueIsRequired %>");

                 valid = false;
             }
             else {

                 if (validateEmail($('[id*=txt_email]').val()) == "" || validateEmail($('[id*=txt_email]').val()) == null) {
                     $('[id*=txt_email]').attr("class", "form-control is-invalid");
                     $('[id*=msg_emailInvalid]').text("<%= Resources.Labels.ErrorEmailFormat %>");

                     valid = false;
                 }
             }
             if ($('[id*=txt_certificate1]').val() == "" || $('[id*=txt_certificate1]').val() == null) {
                 $('[id*=txt_certificate1]').attr("class", "form-control is-invalid");
                 valid = false;
             }
             if ($('[id*=dp_fromCer1]').val() == "" || $('[id*=dp_fromCer1]').val() == null) {
                 $('[id*=dp_fromCer1]').attr("class", "form-control is-invalid");
                 valid = false;
             }
             if ($('[id*=dp_toCer1]').val() == "" || $('[id*=dp_toCer1]').val() == null) {
                 $('[id*=dp_toCer1]').attr("class", "form-control is-invalid");
                 valid = false;
             }
             if (($('[id*=file_certificate1]').val() == "" || $('[id*=file_certificate1]').val() == null) && $('[id*=hid_emp_id]').val() == "") {
                 $('[id*=cerValidMsg]').show();
                 valid = false;
             }
             //check work hours should be less than or equal 24 hours
             if ($('[id*=txt_workHours]').val() != "" && $('[id*=txt_workHours]').val() != null) {

                 if (parseInt($("[id*=txt_workHours]").val()) > 24) {
                     $('[id*=txt_workHours]').attr("class", "form-control is-invalid");

                     valid = false;
                 }
             } 
             if (valid) {
                 var uniqID = $('#MainContent_hdnButtonID').val();

                 __doPostBack(uniqID, "OnClick");
             }
             return valid;
         }
        
     </script>
    <!-- text boxes -->
    <section class="statis">
        <div class="container" >
        <div class="row">
        <div class="col-md-12">    
                <input type="hidden" runat="server" id="hid_emp_id" value="" />
                 <div class="col-md-6 float1" style="display:inline">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                        <span> <asp:literal runat="server" text="<%$ Resources:Labels,PersonalInfo%>"/></span>
                        </div>
                        <div class="c-form-box">


                              <div class="c-profile">
                                <div class="row">
                                    
                                <div class="col-7 details">
                                    <div class="form-group" style="display:block">
                                    
                                    <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,NameAR%>" /></span>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                        <input type="text" class="form-control input-lg" id="txt_nameAR"  runat="server" value="" 
                                            onchange="removeValidation($(this));" />
                                        <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>
                                        </div>
                                    </div>
                                    <div class="form-group" style="display:block">
                                        <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                        <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,NameEN%>" /></span>
                                        </div>
                                        <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                            <input type="text" class="form-control input-lg" id="txt_nameEN"  runat="server" onchange="removeValidation($(this));" />
                                            <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>
                                        </div>
                                    </div>
                                    <div class="form-group" style="display:block">
                                    <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,bod%>" /></span>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8 div2">
                     
                                        <asp:TextBox ID="dp_bod" runat="server" class="form-control input-lg hasdatepicker" onchange="removeValidation($(this));" ></asp:TextBox>
                                        <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>
                                     </div>
                                 </div>

                                <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Mobile%>" /></span>
                                </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                        <input type="number" class="form-control input-lg" id="txt_mobile"  runat="server" onchange="removeValidation($(this));" />
                                        <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>
                                    </div> 
                                </div>
                             </div>
                                    <div class="col-4 details">
                                        <div>
                                        <img src="../../images/no-image-icon-125x125.png" id="img_Emp" name="img_Emp" class="rounded mx-auto text-center" runat="server">
                                        </div>
                                        <div >
                                          <asp:FileUpload ID="file_image" runat="server" class="hidden" accept=".png, .jpeg, .jpg, .jfif"/>
                                            <button type="button" runat="server"  ID="uploadImageBtn" class="btn-upload" >
                                           <asp:Literal  runat="server" Text="<%$ Resources:Labels,Upload%>" />

                                            </button>
                                        </div>
                                    </div>

                    </div>
                </div>

                            <div class="c-profile">
                         
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,MaritalStatus%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
  
                                <select runat="server" id="sel_maritalStatus" name="sel_maritalStatus" class="form-control"></select>
                                    </div>
                            </div> 
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Nationality%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                <select runat="server" id="sel_nationality" class="form-control ChosenSelector" style="width:100%"></select>
                                    </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Blood%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                     <select runat="server" id="sel_blood" name="sel_blood" class="form-control"></select>
                                    </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Type%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <asp:RadioButtonList id="rd_gender" RepeatDirection="Horizontal" runat="server" CssClass="rd-stemType">
                                        <asp:ListItem value="male" Text="<%$ Resources:Labels,Male%>" Selected="True"></asp:ListItem>
                                        <asp:ListItem value="female" Text="<%$ Resources:Labels,Female%>"></asp:ListItem>
                                    </asp:RadioButtonList>
                                  
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,CivilNo%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                   <input type="number" class="form-control input-lg" id="txt_identityNumber"  runat="server" onchange="removeValidation($(this));" />
                                    <div class="invalid-feedback" id="identityValidMsg"><asp:Literal  runat="server" Text="<%$ Resources:Labels,12Digit%>" /></div>
                                </div>
                            </div>  

                                 </div>
                              <div class="row row-padding" >
                            <div class="panel panel-green">
                        <div class="panel-heading">
                        <span> <asp:literal runat="server" text="<%$ Resources:Labels,AcademicCertificates%>"/></span>
                        </div>
                        <div class="c-form-dynamic" style="height:270px">
                            <div class="row">
                             <div class="invalid-feedback" id="cerValidMsg"><asp:Literal  runat="server" Text="<%$ Resources:Labels,UploadFile%>" /></div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Certificate1%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
 
                                <input type="text" class="form-control input-lg" id="txt_certificate1"  runat="server" value="" onchange="removeValidation($(this));" />
                                    <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>
                                    
                                </div>
                           </div>
                           <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,DateFrom%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                      <asp:TextBox ID="dp_fromCer1" runat="server" class="form-control input-lg hasdatepicker"  value="01/11/2000" onchange="removeValidation($(this));"></asp:TextBox>
                                     <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>                                   
                                </div>
                           </div>
                           <div class="form-group" style="display:block;height:auto">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,DateTo%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                      <asp:TextBox ID="dp_toCer1" runat="server" class="form-control input-lg hasdatepicker"  value="01/11/2000" onchange="removeValidation($(this));" ></asp:TextBox>
                                     <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>
                                   
                                </div>
                          
                                <div class="form-group">
                                    <div class="col-md-10 col-sm-4 col-xs-4 div1">
                                         <asp:Label ID="lbl_certificate1" runat="server" Text="<%$ Resources:Labels,UploadFile%>" CssClass="span-uploadFile"></asp:Label>
                                        <a href="" id="hr_cer1" runat="server" target="_blank" class="href-file"></a>
                                     </div>
                                     <div class="col-md-2 col-sm-8 col-xs-8 div2" >
                                         <asp:FileUpload ID="file_certificate1" runat="server" class="hidden" />
                                   <a href=""  id="uploadTrigger_1"> <i class="fa fa-upload"></i></a>
                                     </div>
                                </div>
                            </div>
                            
                            <div class="row"  id="frm_certificate2" style="display:none" runat="server">
                             <div class="form-group"  >
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Certificate2%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                        <input type="text" class="form-control input-lg" id="txt_certificate2"  runat="server" value=""  />
                                   
                                    <a href="javascript:deleteCertificateRow();"  id="btn-deleteCertificate2"> <i class="fa fa-minus"></i></a>
                                </div>
                                
                            </div>
                                 <div class="form-group" >
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,DateFrom%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                  <asp:TextBox ID="dp_fromCer2" runat="server" class="form-control input-lg hasdatepicker"  value="01/11/2000" ></asp:TextBox>

                                   
                                </div>
                           </div>
                           <div class="form-group" >
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,DateTo%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                   <asp:TextBox ID="dp_toCer2" runat="server" class="form-control input-lg hasdatepicker"  value="01/11/2000" ></asp:TextBox>
                                   
                                </div>
                           </div>
                             <div class="form-group">
                                    <div class="col-md-10 col-sm-4 col-xs-4 div1">
                                         <asp:Label ID="lbl_certificate2" runat="server" Text="<%$ Resources:Labels,UploadFile%>" CssClass="span-uploadFile"></asp:Label>
                                          <a href="" id="hr_cer2" runat="server" target="_blank" class="href-file"></a>
                                     </div>
                                     <div class="col-md-2 col-sm-8 col-xs-8 div2" >
                                        <asp:FileUpload ID="file_certificate2" runat="server" CssClass="hidden fileUpload" />
                                   <a href=""  id="uploadTrigger_2"> <i class="fa fa-upload"></i></a>
                                         
                                     </div>
                              
                                </div>
                            </div>

                            <div class="row" id="frm_certificate3" style="display:none" runat="server">
                            <div class="form-group"  >
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Certificate3%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                     <input type="text" class="form-control input-lg" id="txt_certificate3"  runat="server" value=""  />
                                  
                                    <a href="javascript:deleteCertificateRow();"  id="btn-deleteCertificate3"> <i class="fa fa-minus"></i></a>
                                </div>
                                
                            </div>
                            <div class="form-group" >
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,DateFrom%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                 <asp:TextBox ID="dp_fromCer3" runat="server" class="form-control input-lg hasdatepicker"  value="01/11/2000" ></asp:TextBox>
                                   
                                </div>
                           </div>
                           <div class="form-group" >
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,DateTo%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                    <asp:TextBox ID="dp_toCer3" runat="server" class="form-control input-lg hasdatepicker"  value="01/11/2000" ></asp:TextBox>
                                   
                                </div>
                           </div>
                                 <div class="form-group">
                                    <div class="col-md-10 col-sm-4 col-xs-4 div1">
                                        <asp:Label ID="lbl_certificate3" runat="server" Text="<%$ Resources:Labels,UploadFile%>" CssClass="span-uploadFile"></asp:Label>
                                          <a href="" id="hr_cer3" runat="server" target="_blank" class="href-file"></a>
                                     </div>
                                     <div class="col-md-2 col-sm-8 col-xs-8 div2" >
                                           <asp:FileUpload ID="file_certificate3" runat="server"  CssClass="hidden fileUpload" />
                                     <a href=""  id="uploadTrigger_3"> <i class="fa fa-upload"></i></a>
                                     </div>
                                </div>
                                </div>

                             <div class="form-group" style="display:block" id="frm-addCertificate">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                      <a href="javascript:addCertificateRow();" > <i class="fa fa-plus"></i></a>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >

                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                    <div class="row row-padding">
                      <div class="panel panel-green">
                        <div class="panel-heading">
                        <span> <asp:literal runat="server" text="<%$ Resources:Labels,PreviousExperience%>"/></span>
                        </div>
                        <div class="c-form-dynamic" style="height:195px;">
                            <div class="form-textarea" style="display:block">
                                <div class="col-md-3 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Experience1%>" /></span>
                                </div>
                                <div class="col-md-9 col-sm-8 col-xs-8 div2" >
                                    <asp:TextBox type="text" class="form-control input-lg textarea" ID="txt_experience1" name="txt_experience1"  TextMode="MultiLine" Rows="3" runat="server" value=""  />

                                </div>
                            </div>
                            <div class="form-textarea" style="display:none"  id="frm_experience2">
                                <div class="col-md-3 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Experience2%>" /></span>
                                </div>
                                <div class="col-md-9 col-sm-8 col-xs-8 div2">
                                    <asp:TextBox type="text" class="form-control input-lg textarea" ID="txt_experience2" name="txt_experience2" TextMode="MultiLine" Rows="4" runat="server" value="" />
                                    <a href="javascript:deleteExperienceRow();"  id="btn-deleteExperience2"> <i class="fa fa-minus"></i></a>
                            </div>
                                </div>
                            <div class="form-textarea" style="display:none" id="frm_experience3">
                                <div class="col-md-3 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Experience3%>" /></span>
                                </div>
                                    <div class="col-md-9 col-sm-8 col-xs-8 div2">
                                        <asp:TextBox type="text" class="form-control input-lg textarea" ID="txt_experience3" name="txt_experience3" TextMode="MultiLine" Rows="4"  runat="server" value=""  />
                                        <a href="javascript:deleteExperienceRow();"  id="btn-deleteExperience3"> <i class="fa fa-minus"></i></a>

                                    </div> 
                                </div>
                              <div class="form-group" style="display:block" id="frm-addexperience">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                      <a href="javascript:addExperienceRow();" > <i class="fa fa-plus"></i></a>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >

                                </div>
                            </div>
                        </div>
                    </div>
                                  </div>
                   
                        </div>
                    </div>
                </div>
            <div class="col-md-6 float2" style="display:inline">
                <div class="row-section">
                  <div class="panel panel-yellow">
                        <div class="panel-heading">
                        <span> <asp:literal runat="server" text="<%$ Resources:Labels,JobDetails%>"/></span>
                        </div>
                        <div class="c-form-box">
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Position%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="sel_position" class="form-control"></select>
                            </div>

                            </div>
                             <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Management%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="sel_management" name="sel_management" class="form-control" onchange="fillDepartment(this.value);removeValidation($(this));"></select>
                                     <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>
                            </div>
                                 </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Department%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="sel_department" name="sel_department" class="form-control"></select>
                            </div>

                            </div>
                              <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,IDNumber%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <input type="text" class="form-control" id="txt_IDNumber"  runat="server" value=""  />
                            </div>
                                  </div>
                                  <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,WorkHours%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <input type="number" class="form-control" id="txt_workHours"  
                                        runat="server"  
                                        min="1"
                                        step="1"
                                        onkeypress="return event.charCode >= 48 && event.charCode <= 57" 
                                        onchange="removeValidation($(this));" />
                                     <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,WorkHoursLimit%>" /></div>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,CurrentSalary%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <input type="number" class="form-control" 
                                        id="txt_salary"  runat="server" 
                                        min="1"
                                        step="1"
                                        onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                                        onchange="removeValidation($(this));" />
                                     <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>
                            </div>
                             </div>
                             <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,HiringDate%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <asp:TextBox ID="txt_hiringDate" runat="server" class="form-control input-lg hasdatepicker" ></asp:TextBox>
<%--                                    <input type="text" class="form-control input-lg readOnly" id="txt_hiringDate" disabled  runat="server" value=""  />--%>
                            </div>
                           </div>
                             <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Email%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <input type="text" class="form-control input-lg" id="txt_email" runat="server" value="" onchange="removeValidation($(this));" />
                                    <div class="invalid-feedback" id="msg_emailInvalid"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>
                            </div>
                           </div>
                
                             <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,VacationsBalance%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <input type="number"  class="form-control input-lg" 
                                        id="txt_vacationBalance" runat="server"
                                        min="1"
                                        step="1"
                                        onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                                        onchange="removeValidation($(this));" />
                                   <div class="invalid-feedback" ><asp:Literal  runat="server" Text="<%$ Resources:Labels,VacBalanceError%>" /></div>

                            </div>
                           </div>
                            
                           <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Guarantor%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <input type="text" class="form-control input-lg" id="txt_guarantor"  runat="server" value=""  />
                            </div>
                            </div> 

                           <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,WorkingPermission%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                     <asp:FileUpload ID="permitFile" runat="server"  CssClass="hidden fileUpload" />
                                     <a href=""  id="permitTrigger"> <i class="fa fa-upload"></i></a>
                                     <a href="" id="hrf_permit" runat="server" target="_blank" class="href-file"></a>
                                     <asp:Label ID="lbl_permit" runat="server"  CssClass="span-uploadFile"></asp:Label>
                                </div>
                            </div> 
                            
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,WorkContract%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                     <asp:FileUpload ID="contractFile" runat="server"  CssClass="hidden fileUpload" />
                                     <a href=""  id="contractTrigger"> <i class="fa fa-upload"></i></a>
                                     <a href="" id="hrf_contract" runat="server" target="_blank" class="href-file"></a>

                                     <asp:Label ID="lbl_contract" runat="server"  CssClass="span-uploadFile"></asp:Label>
                                </div>
                            </div> 
                          
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,JobDescription%>" /></span>
                                </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                        <asp:TextBox type="text" class="form-control input-lg textarea" ID="txt_jobDesc" name="txt_jobDesc" TextMode="MultiLine" Rows="5" runat="server"  />
                                    </div> 
                                </div>
                            
                          
                           
                        </div>
                    </div>
                </div>

                <div class="row-section">
                 <div class="panel panel-brown">
                        <div class="panel-heading">
                        <span> <asp:literal runat="server" text="<%$ Resources:Labels,PassportInfo%>"/></span>
                        </div>
                        <div class="c-form-box">
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,passportNo%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                    <input type="text" class="form-control" id="txt_passportNo" runat="server" value=""  />

                            </div>

                            </div>
                             <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,PassportStartdate%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                    <asp:TextBox ID="dp_passportFromDate" runat="server" class="form-control input-lg hasdatepicker"  value="01/11/2000" ></asp:TextBox>

                            </div>

                            </div>
                              <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,PassportEnddate%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                   <asp:TextBox ID="dp_passportEndDate" runat="server" class="form-control input-lg hasdatepicker"  value="01/11/2000" ></asp:TextBox>

<%--                                    <input type="text" class="form-control input-lg hasdatepicker" id="dp_passportEndDate"  runat="server" value="2000-11-01"  />--%>
                            </div>
                            </div>
                             <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,SequenceNum%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                   <input type="text" class="form-control input-lg" id="txt_sequenceNum"  runat="server" value=""  />

                                </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,UnifiedNumber%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                   <input type="text" class="form-control input-lg" id="txt_unifiedNum"  runat="server" value=""  />

                                </div>
                            </div>

                            
                          
                           
                        </div>
                    </div>

                </div>
            </div>

            
        </div>
    </div>

    <!-- buttons -->
    <div class="row">
        <div class="col-md-11 modal-footer">
              <asp:HiddenField  runat="server" ID="hdnButtonID"/>
            <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-new"
                 UseSubmitBehavior="False"  
                OnClientClick="javascript:return checkValidation();"
                OnClick="btn_save_Click" Width="128px" Height="33px">
                <asp:Literal Text=" <%$Resources:Labels,Save%>" runat="server"></asp:Literal>
                <i class="fa fa-check"></i>
            </asp:LinkButton>


        </div>

    </div>
            </div>
      
        </section>

</asp:Content>
