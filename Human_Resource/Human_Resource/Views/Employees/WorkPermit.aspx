<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WorkPermit.aspx.cs" Inherits="Human_Resource.Views.Employees.WorkPermit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <section class="statis">
         <div class="container report" >
              <div class="row">
                   <div class="col-12">
                        <div class="bcrumb-block">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><asp:Literal  runat="server" Text="<%$ Resources:Labels,WorkingPermission%>" /></li>
                                </ol>
                            </nav>
                        </div>
                          <div class="SearchAddbar">

                        <div class="input-group">
                            <div class="col-4">
                                <input type="text" runat="server" id="txt_search" placeholder="<%$ Resources:Labels,Search%>" />
                            </div>
                            <div style="width:90px">
                                <asp:Button ID="ButtonSearch" runat="server" CssClass="btn btn-search" Text=" <%$ Resources:Labels,Search%>"
                                    OnClick="btn_Search_Click" />
                            </div> 
                            <div style="width:80px">
                            <Button type="button" runat="server" class="btn btn-new btn-block" id="btn_new"  CausesValidation="false" >
                                <asp:Literal runat="server" Text=" <%$ Resources:Labels,Print%>" />
                            </Button>
                            </div>
                        </div>
   
                        </div>
                    </div>
                   <div class="col-12">
                        <div class="c-form">
                            <div class="row">
                           <div class="logo ">
                                  <asp:Image ImageUrl="~/images/new kuwait logo.jpg" Height="50px" Width="250px"  CssClass="mt-0"  runat="server" />
                            </div>
                            </div>

                             <div class="row">
                            <div class="report-title" >
                               <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,WorkPermitData%>" /></span>
          
                            </div>
                            </div>

                            <div class="row">
                                <!-- employer data -->
                             <fieldset  class="report-fieldset">

                              <legend class="legend"><asp:Literal  runat="server" Text="<%$ Resources:Labels,EmployerData%>" />
                              </legend>
                                 
                                 
                                 <div class="row">
                                    <div class="col-5">
                                          <span> <asp:Literal  runat="server" Text="رقم المدني للترخيص" /></span>
                                          <span> <asp:Literal  runat="server" id="licenseIDNum" /></span>
                                      </div>
                             

                                 <div class="col-7">
                                       <span> <asp:Literal  runat="server" Text="اسم الترخيص" /></span>
                                          <span> <asp:Literal  runat="server" id="ss" /></span>
                                 </div>
                                    </div>

                                 <div class="row">
                                    <div class="col-5">
                                          <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,UnifiedNumber %>" /></span>
                                          <span> <asp:Literal  runat="server" id="unifiedNum" /></span>
                                      </div>

                                </div>
                                 
                                 
                            </fieldset>
                              
                 
                            </div> 
                            

                            <div class="row">

                             <fieldset  class="report-fieldset">

                              <legend class="legend"><asp:Literal  runat="server" Text="<%$ Resources:Labels,WorkerData%>" />
                              </legend>
                                 
                                 
                                 <div class="row">
                                    <div class="col-5">
                                          <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,WorkerName %>" /></span>
                                          <span> <asp:Literal  runat="server" id="workerName" /></span>
                                      </div>
                             

                                <div class="col-7">
                                       <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,WorkerType %>" /></span>
                                          <span> <asp:Literal  runat="server" id="workerType" /></span>
                                 </div>
                                    </div>

                                <div class="row">
                                    <div class="col-5">
                                          <span > <asp:Literal  runat="server" Text="<%$ Resources:Labels,CivilNo %>" /></span>
                                         <span> <asp:Literal  runat="server" id="civilNo" /></span>
                                      </div>
                                    <div class="col-7">
                                       <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,bod %>" /></span>
                                          <span> <asp:Literal  runat="server" id="bod" /></span>
                                     </div>
                                </div>
                                 
                                 
                                 <div class="row">
                                    <div class="col-5">
                                          <span > <asp:Literal  runat="server" Text="<%$ Resources:Labels,passportNo %>" /></span>
                                         <span> <asp:Literal  runat="server" id="passportNo" /></span>
                                      </div>
                                    <div class="col-7">
                                       <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,WorkPermitDuration %>" /></span>
                                          <span> <asp:Literal  runat="server" id="workDuration" /></span>
                                     </div>
                                </div> 
                                 
                                 <div class="row">
                                    <div class="col-5">
                                          <span > <asp:Literal  runat="server" Text="<%$ Resources:Labels,PassportEnd %>" /></span>
                                         <span> <asp:Literal  runat="server" id="passportEnd" /></span>
                                      </div>
                                    <div class="col-7">
                                       <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,SalaryType %>" /></span>
                                          <span> <asp:Literal  runat="server" id="salaryType" /></span>
                                     </div>
                                </div>
                                 
                                 <div class="row">
                                    <div class="col-5">
                                          <span > <asp:Literal  runat="server" Text="<%$ Resources:Labels,WorkPermitStart %>" /></span>
                                         <span> <asp:Literal  runat="server" id="workPermitStart" /></span>
                                      </div>
                                    <div class="col-7">
                                       <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,SalaryDK %>" /></span>
                                          <span> <asp:Literal  runat="server" id="salary" /></span>
                                     </div>
                                </div>
                                 
                                 <div class="row">
                                    <div class="col-5">
                                          <span > <asp:Literal  runat="server" Text="<%$ Resources:Labels,WorkPermitEnd %>" /></span>
                                         <span> <asp:Literal  runat="server" id="workPermitEnd" /></span>
                                      </div>
                                    <div class="col-7">
                                       <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Nationality %>" /></span>
                                          <span> <asp:Literal  runat="server" id="nationality" /></span>
                                     </div>
                                </div> 
                                 
                                 <div class="row">
                                    <div class="col-5">
                                          <span > <asp:Literal  runat="server" Text="<%$ Resources:Labels,Job %>" /></span>
                                         <span> <asp:Literal  runat="server" id="job" /></span>
                                      </div>
                                    <div class="col-7">
                                       <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,EducationalLevel %>" /></span>
                                          <span> <asp:Literal  runat="server" id="educationalLevel" /></span>
                                     </div>
                                </div> 
                                 
                                 <div class="row">
                                    <div class="col-5">
                                          <span > <asp:Literal  runat="server" Text="<%$ Resources:Labels,OutgoingNumber %>" /></span>
                                         <span> <asp:Literal  runat="server" id="outgoingNumber" /></span>
                                      </div>
                                    <div class="col-7">
                                       <span> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Qualification %>" /></span>
                                          <span> <asp:Literal  runat="server" id="qualification" /></span>
                                     </div>
                                </div>
                            </fieldset>
                              
                 
                            </div> 
                        </div>
                   </div>
             </div>
        </div>
    </section>
</asp:Content>
