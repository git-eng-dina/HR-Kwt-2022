<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewEmployee.aspx.cs" Inherits="Human_Resource.Views.Employees.NewEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <script>
         function addCertificateRow() {
             if ($('#frm_certificate2').is(':visible')) {
                 $('#frm_certificate3').show();
                 $('#frm-addCertificate').hide();
                 $('#btn-deleteCertificate2').hide();
             }
             else {
                 $('#frm_certificate2').show();

             }
             alert();
         }

         function deleteCertificateRow() {
             if ($('#frm_certificate3').is(':visible')) {
                 $('#txt_certificate3').val("");
                 $('#frm_certificate3').hide();
                 $('#frm-addCertificate').show();
                 $('#btn-deleteCertificate2').show();

             }
             else {
                 $('#txt_certificate2').val("");

                 $('#frm_certificate2').hide();
             }
         }
     </script>
    <!-- text boxes -->
    <section class="statis">
        <div class="container" >
        <div class="row">
        <div class="col-md-12">    
                
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
                                    <input type="date" class="form-control input-lg hasdatepicker" id="dp_bod"  runat="server" value="9/23/2009"   />
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
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Nationality%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                <select runat="server" id="nationality" class="form-control"></select>
                                    </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Type%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <table style="width:80%">
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="rd_male" Checked="true" runat="server" value="1" Text="<%$ Resources:Labels,Male%>" GroupName="stemmingType" CssClass="rd-stemType" />  
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="rd_female" runat="server" value="2"  Text="<%$ Resources:Labels,Female%>" GroupName="stemmingType" CssClass="rd-stemType"/>  

                                            </td>
                                        </tr>
                                    </table>
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
                        <div class="c-form-dynamic">
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Certificate1%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <input type="text" class="form-control input-lg" id="txt_certificate1"  runat="server" value=""  />
                                </div>
                            </div>
                             <div class="form-group" style="display:none" id="frm_certificate2">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Certificate2%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                        <input type="text" class="form-control input-lg" id="txt_certificate2"  runat="server" value=""  />
                                    <a href="javascript:deleteCertificateRow();"  id="btn-deleteCertificate2"> <i class="fas fa-minus"></i></a>
                                </div>
                            </div>
                            <div class="form-group" style="display:none" id="frm_certificate3">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Certificate3%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                     <input type="text" class="form-control input-lg" id="txt_certificate3"  runat="server" value=""  />
                                     <a href="javascript:deleteCertificateRow();"  id="btn-deleteCertificate3"> <i class="fas fa-minus"></i></a>
                                </div>
                            </div>
                             <div class="form-group" style="display:block" id="frm-addCertificate">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                      <a href="javascript:addCertificateRow();" > <i class="fas fa-plus"></i></a>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
<%--                                     <div class="c-form-box">
                                         <div class="form-group" style="display:block">
                                       
                                         </div>
                                     </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                                  </div>

                              <div class="row row-padding">
                            <div class="panel panel-green">
                        <div class="panel-heading">
                        <span> <asp:literal runat="server" text="<%$ Resources:Labels,AcademicEducation%>"/></span>
                        </div>
                        <div class="c-form-box">
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,AcademicCertificates%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                     <div class="c-form-box">
                                         <div class="form-group" style="display:block">
                                            <input type="text" class="form-control input-lg" id="Text2"  runat="server" value=""  />
                                         <a href="javascript:addRow();"  id="test"> <i class="fas fa-plus"></i></a>
                                             <%-- <input type="button" class="fa fa-plus btn-plus" id="btn_plus" />--%>
                                         </div>
                                     </div>
                                </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,PreviousEmployment%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <asp:TextBox type="text" class="form-control input-lg" name="txt_workExperience" TextMode="MultiLine" Rows="4" runat="server" value=""  />
                            </div>
                                </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Mobile%>" /></span>
                                </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                        <input type="text" class="form-control input-lg" id="Text4"  runat="server" value=""  />
                                    </div> 
                                </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Nationality%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                <select runat="server" id="Select4" class="form-control"></select>
                                    </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Type%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <table style="width:80%">
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="RadioButton7" Checked="true" runat="server" value="1" Text="<%$ Resources:Labels,Male%>" GroupName="stemmingType" CssClass="rd-stemType" />  
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="RadioButton8" runat="server" value="2"  Text="<%$ Resources:Labels,Female%>" GroupName="stemmingType" CssClass="rd-stemType"/>  

                                            </td>
                                        </tr>
                                    </table>
                            </div>
                            </div>
                        </div>
                    </div>
                                  </div>
                     <div class="row row-padding">
                            <div class="panel panel-yellow" style="display:block">
                        <div class="panel-heading">
                        <span> <asp:literal runat="server" text="<%$ Resources:Labels,JobDetails%>"/></span>
                        </div>
                        <div class="c-form-box">
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,NameAR%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <input type="text" class="form-control input-lg" id="Text7"  runat="server" value=""  />
                                </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,NameEN%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <input type="text" class="form-control input-lg" id="Text8"  runat="server" value=""  />
                            </div>
                                </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,HiringDate%>" /></span>
                                </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                        <input type="text" class="form-control reportdatetime" id="Text9"  runat="server" value=""  />
                                    </div> 
                                </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Nationality%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                <select runat="server" id="Select3" class="form-control"></select>
                                    </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Type%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <table style="width:80%">
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="RadioButton5" Checked="true" runat="server" value="1" Text="<%$ Resources:Labels,Male%>" GroupName="stemmingType" CssClass="rd-stemType" />  
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="RadioButton6" runat="server" value="2"  Text="<%$ Resources:Labels,Female%>" GroupName="stemmingType" CssClass="rd-stemType"/>  

                                            </td>
                                        </tr>
                                    </table>
                            </div>
                            </div>
               
                    </div>
                 </div>
                         </div>
                        </div>
                    </div>
                </div>
            <div class="col-md-6 float2" style="display:inline">
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
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,WorkHours%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <input type="text" class="form-control input-lg" id="txt_workHours"  runat="server" value=""  />
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,CurrentSalary%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <input type="text" class="form-control input-lg" id="txt_salary"  runat="server" value=""  />
                            </div>
                            </div> 
                          
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,JobDescription%>" /></span>
                                </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                        <asp:TextBox type="text" class="form-control input-lg" name="txt_jobDesc" TextMode="MultiLine" Rows="4" runat="server" value=""  />
                                    </div> 
                                </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Nationality%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                <select runat="server" id="Select2" class="form-control"></select>
                                    </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                    <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Type%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2">
                                    <table style="width:80%">
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="RadioButton3" Checked="true" runat="server" value="1" Text="<%$ Resources:Labels,Male%>" GroupName="stemmingType" CssClass="rd-stemType" />  
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="RadioButton4" runat="server" value="2"  Text="<%$ Resources:Labels,Female%>" GroupName="stemmingType" CssClass="rd-stemType"/>  

                                            </td>
                                        </tr>
                                    </table>
                            </div>
                            </div>
                           
                        </div>
                    </div>
            </div>

            
        </div>
    </div>

    <!-- buttons -->
    <div class="row">


    </div>
            </div>
        </section>

</asp:Content>
