<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewEmployee.aspx.cs" Inherits="Human_Resource.Views.Employees.NewEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <script>
         $(document).ready(function () {
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

         });

         $(function () {
             $('#MainContent_file_certificate1').change(function () {
                 var path = $(this).val();
                 if (path != '' && path != null) {
                     var q = path.substring(path.lastIndexOf('\\') + 1);
                    // $('#MainContent_lbl_certificate1').style.display= "inline";
                     $('#MainContent_hr_cer1').hide();
                     $('#MainContent_lbl_certificate1').html(q);
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
         function addCertificateRow() {
             if ($('#frm_certificate2').is(':visible')) {
                 $('#frm_certificate3').show();
                 $('#frm-addCertificate').hide();
                 $('#btn-deleteCertificate2').hide();
             }
             else {
                 alert();
                 $('#frm_certificate2').show();

             }
         }

         function deleteCertificateRow() {
             var uploadFileText = "<%= Resources.Labels.UploadFile %>";

             if ($('#frm_certificate3').is(':visible')) {
                 $('#MainContent_txt_certificate3').val("");
                 $('#MainContent_file_certificate3').val("");
                 $('#MainContent_lbl_certificate3').html(uploadFileText);
                 $('#frm_certificate3').hide();
                 $('#frm-addCertificate').show();
                 $('#btn-deleteCertificate2').show();


             }
             else {
                 $('#MainContent_txt_certificate2').val("");
                 $('#MainContent_file_certificate2').val("");
                 $('#MainContent_lbl_certificate2').html(uploadFileText);
                 $('#frm_certificate2').hide();
             }
         }
         function addExperienceRow() {
             if ($('#frm_experience2').is(':visible')) {
                 $('#frm_experience3').show();
                 $('#frm-addExperience').hide();
                 $('#btn-deleteExperience2').hide();
             }
             else {
                 $('#frm_experience2').show();

             }
         }

         function deleteExperienceRow() {

              if ($('#frm_experience3').is(':visible')) {
                  $('#MainContent_txt_experience3').val("");
                  $('#frm_experience3').hide();
                  $('#frm-addExperience').show();
                  $('#btn-deleteExperience2').show();


              }
              else {
                  $('#MainContent_txt_experience2').val("");
                  $('#frm_experience2').hide();
              }
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
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,NameAR%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <input type="text" class="form-control input-lg" id="txt_nameAR"  runat="server" value=""  />
                            </div>

                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,NameEN%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <input type="text" class="form-control input-lg" id="txt_nameEN"  runat="server" value=""  />
                            </div>
                                </div>
                           <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,bod%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <asp:TextBox ID="dp_bod" runat="server" class="form-control input-lg hasdatepicker"  textMode="date" value="2000-11-01"></asp:TextBox>
<%--                                  
<%--                                    <input type="date" class="form-control input-lg hasdatepicker"  id="dp_bod" value="2017-06-01" pattern="\d{4}-\d{2}-\d{2}" runat="server" required="required"   />--%>
                            </div>
                                </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Mobile%>" /></span>
                                </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                        <input type="text" class="form-control input-lg" id="txt_mobile"  runat="server" value=""  />
                                    </div> 
                                </div>
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
                                <select runat="server" id="sel_nationality" class="form-control"></select>
                                    </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Blood%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                               <input type="text" class="form-control input-lg" id="txt_blood"  runat="server" value=""  />
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
                                   <input type="text" class="form-control input-lg" id="txt_identityNumber"  runat="server" value=""  />

                                </div>
                            </div>  


                              <div class="row row-padding">
                            <div class="panel panel-green">
                        <div class="panel-heading">
                        <span> <asp:literal runat="server" text="<%$ Resources:Labels,AcademicCertificates%>"/></span>
                        </div>
                        <div class="c-form-dynamic" style="height:175px">
                            <div class="row">
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Certificate1%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <input type="text" class="form-control input-lg" id="txt_certificate1"  runat="server" value=""  />
                                   
                                </div>
                           </div>
                           <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,DateFrom%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                  <input type="date" class="form-control input-lg hasdatepicker" id="dp_fromCer1"  runat="server" value="2000-11-01"   />
                                   
                                </div>
                           </div>
                           <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,DateTo%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                  <input type="date" class="form-control input-lg hasdatepicker" id="dp_toCer1"  runat="server" value="2000-11-01"   />
                                   
                                </div>
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
                            
                            <div class="row"  id="frm_certificate2" runat="server">
                             <div class="form-group"  >
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Certificate2%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                        <input type="text" class="form-control input-lg" id="txt_certificate2"  runat="server" value=""  />
                                   
                                    <a href="javascript:deleteCertificateRow();"  id="btn-deleteCertificate2"> <i class="fas fa-minus"></i></a>
                                </div>
                                
                            </div>
                                 <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,DateFrom%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                  <input type="date" class="form-control input-lg hasdatepicker" id="dp_fromCer2"  runat="server" value="2000-11-01"   />
                                   
                                </div>
                           </div>
                           <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,DateTo%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                  <input type="date" class="form-control input-lg hasdatepicker" id="dp_toCer2"  runat="server" value="2000-11-01"   />
                                   
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

                            <div class="row" id="frm_certificate3" runat="server">
                            <div class="form-group"  >
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Certificate3%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                     <input type="text" class="form-control input-lg" id="txt_certificate3"  runat="server" value=""  />
                                  
                                    <a href="javascript:deleteCertificateRow();"  id="btn-deleteCertificate3"> <i class="fas fa-minus"></i></a>
                                </div>
                                
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,DateFrom%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                  <input type="date" class="form-control input-lg hasdatepicker" id="dp_fromCer3"  runat="server" value="2000-11-01"   />
                                   
                                </div>
                           </div>
                           <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,DateTo%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                  <input type="date" class="form-control input-lg hasdatepicker" id="dp_toCer3"  runat="server" value="2000-11-01"   />
                                   
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
                                      <a href="javascript:addCertificateRow();" > <i class="fas fa-plus"></i></a>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >

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
                        <div class="c-form-dynamic" style="height:140px">
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
                                    <a href="javascript:deleteExperienceRow();"  id="btn-deleteExperience2"> <i class="fas fa-minus"></i></a>
                            </div>
                                </div>
                            <div class="form-textarea" style="display:none" id="frm_experience3">
                                <div class="col-md-3 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Experience3%>" /></span>
                                </div>
                                    <div class="col-md-9 col-sm-8 col-xs-8 div2">
                                        <asp:TextBox type="text" class="form-control input-lg textarea" ID="txt_experience3" name="txt_experience3" TextMode="MultiLine" Rows="4"  runat="server" value=""  />
                                        <a href="javascript:deleteExperienceRow();"  id="btn-deleteExperience3"> <i class="fas fa-minus"></i></a>

                                    </div> 
                                </div>
                              <div class="form-group" style="display:block" id="frm-addexperience">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                      <a href="javascript:addExperienceRow();" > <i class="fas fa-plus"></i></a>
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
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Department%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="sel_department" name="sel_department" class="form-control"></select>
                            </div>

                            </div>
                              <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,WorkHours%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <input type="number" class="form-control" id="txt_workHours"  runat="server" value=""  />
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,CurrentSalary%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <input type="number" class="form-control" id="txt_salary"  runat="server" value=""  />
                            </div>
                             </div>
                             <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,HiringDate%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <input type="text" class="form-control input-lg readOnly" id="txt_hiringDate" disabled  runat="server" value=""  />
                            </div>
                           </div>
                             <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Email%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <input type="text" class="form-control input-lg" id="txt_email" runat="server" value=""  />
                            </div>
                           </div>
                
                             <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,VacationsBalance%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <input type="number"  class="form-control input-lg" id="txt_vacationBalance" runat="server" value=""  />
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
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,JobDescription%>" /></span>
                                </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                        <asp:TextBox type="text" class="form-control input-lg" ID="txt_jobDesc" name="txt_jobDesc" TextMode="MultiLine" Rows="5" runat="server" value=""  />
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
                                    <input type="date" class="form-control input-lg hasdatepicker" id="dp_passportFromDate"  runat="server" value="2000-11-01"  />
                            </div>

                            </div>
                              <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,PassportEnddate%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <input type="date" class="form-control input-lg hasdatepicker" id="dp_passportEndDate"  runat="server" value="2000-11-01"  />
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
            <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-new" OnClick="btn_save_Click" Width="128px" Height="33px">
                <asp:Literal Text=" <%$Resources:Labels,Save%>" runat="server"></asp:Literal>
                <i class="fa fa-check"></i>
            </asp:LinkButton>


        </div>

    </div>
            </div>
        </section>

</asp:Content>
