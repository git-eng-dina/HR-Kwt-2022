<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="empEvalution.aspx.cs" Inherits="Human_Resource.Views.Employees.empEvalution" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <section class="statis">
         <div class="row" >
            <div class="c-form report">
                    <!-- evaluation data -->      
                <div class="row">
                <div class="col-6">
                     <fieldset  class="report-fieldset">

                    <legend class="legend"><asp:Literal  runat="server" Text="<%$ Resources:Labels,PersonalInfo%>" />
                    </legend>
                     <div class="row">
                        <span class="title"> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Employee%>" /></span>:
                        <span class="span-value"> <asp:Literal  runat="server" id="txt_employee" /></span>
                    </div>
                    
                    <div class="row">
                        <span class="title"> <asp:Literal  runat="server" Text="<%$ Resources:Labels,ReviewerHint%>" /></span>:
                        <span class="span-value"> <asp:Literal  runat="server" id="txt_reviewer" /></span>
                    </div>
                             
                <div class="row">
                
                    <span class="title"> <asp:Literal  runat="server" Text="<%$ Resources:Labels,EvaluationDate%>" /></span>:
                        <span class="span-value"> <asp:Literal  runat="server" id="txt_evaluationDate" /></span>
                </div>
                    </fieldset>
                </div>
                    <div class="col-6">
                         <fieldset  class="report-fieldset">

                            <legend class="legend"><asp:Literal  runat="server" Text="<%$ Resources:Labels,JobKnowledge%>" />
                            </legend>
                                 
                                 
                                <div class="row">
                                        <span class="title"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Performance %>" /></span>:
                                        <span> <asp:Literal  runat="server" id="txt_performance" /></span>
                                    </div>
                             
                               <div class="row">
                                    <span class="title"><asp:Literal  runat="server" Text="<%$ Resources:Labels,JobKnowledge%>" /></span>:
                                        <span> <asp:Literal  runat="server" id="txt_jobKnowledge" /></span>
                                </div>

                                <div class="row">
                                        <span class="title"> <asp:Literal  runat="server" Text="<%$ Resources:Labels,OrganizeIdea%>" /></span>:
                                        <span> <asp:Literal  runat="server" id="txt_organizeIdea" /></span>
                               </div>
                                 
                                 
                        </fieldset>
                    </div>
            </div>

            <div class="row">
                       
                        <div class="col-6">
                              <fieldset  class="report-fieldset">

                                        <legend class="legend"><asp:Literal  runat="server" Text="<%$ Resources:Labels,EmployeeMannerism%>" />
                                        </legend>

                                            <div class="row">
                                                    <span class="title"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Behavior %>" /></span>:
                                                    <span> <asp:Literal  runat="server" id="txt_Behavior" /></span>
                                            </div>
                             

                                            <div class="row">
                                                <span class="title"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Attendance%>" /></span>:
                                                    <span> <asp:Literal  runat="server" id="txt_Attendance" /></span>
                                            </div>

                                        <div class="row">
                                                <span class="title"> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Punctuality%>" /></span>:
                                                <span> <asp:Literal  runat="server" id="txt_Punctuality" /></span>
                                        </div>
                                        <div class="row">
                                        <span class="title"> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Productivity%>" /></span>:
                                        <span> <asp:Literal  runat="server" id="txt_Productivity" /></span>
                                    </div>

                                        <div class="row">
                                            <span class="title"> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Creativity%>" /></span>:
                                            <span> <asp:Literal  runat="server" id="txt_Creativity" /></span>
                                        </div>
                                        <div class="row">
                                        <span class="title"> <asp:Literal  runat="server" Text="<%$ Resources:Labels,ClientRelation%>" /></span>:
                                        <span> <asp:Literal  runat="server" id="txt_ClientRelation" /></span>
                                    </div>

     
                                        <div class="row">
                                            <span class="title"> <asp:Literal  runat="server" Text="<%$ Resources:Labels,Initiative%>" /></span>:
                                            <span> <asp:Literal  runat="server" id="txt_Initiative" /></span>
                                        </div>

                                 
                                 
                                        </fieldset>
                        </div>
                        <div class="col-6">
                           <fieldset  class="report-fieldset">

                                        <legend class="legend"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Skills%>" />
                                        </legend>

                                            <div class="row">
                                                    <span class="title"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Communication %>" /></span>:
                                                    <span> <asp:Literal  runat="server" id="txt_Communication" /></span>
                                            </div>
                             

                                            <div class="row">
                                                <span class="title"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Cooperation%>" /></span>:
                                                    <span> <asp:Literal  runat="server" id="txt_Cooperation" /></span>
                                            </div>

                                        <div class="row">
                                                <span class="title"> <asp:Literal  runat="server" Text="<%$ Resources:Labels,StrategicThinking%>" /></span>:
                                                <span> <asp:Literal  runat="server" id="txt_StrategicThinking" /></span>
                                        </div>
                                        <div class="row">
                                        <span class="title"> <asp:Literal  runat="server" Text="<%$ Resources:Labels,HandleStressful%>" /></span>:
                                        <span> <asp:Literal  runat="server" id="txt_HandleStressful" /></span>
                                    </div>

                                        <div class="row">
                                            <span class="title"> <asp:Literal  runat="server" Text="<%$ Resources:Labels,ListeningSkills%>" /></span>:
                                            <span> <asp:Literal  runat="server" id="txt_ListeningSkills" /></span>
                                        </div>
                                        <div class="row">
                                        <span class="title"> <asp:Literal  runat="server" Text="<%$ Resources:Labels,MeetingDeadlines%>" /></span>:
                                        <span> <asp:Literal  runat="server" id="txt_MeetingDeadlines" /></span>
                                    </div>

     
                                        <div class="row">
                                           <span>&nbsp;</span>
                                        </div>

                                 
                                 
                                        </fieldset>
                        </div>
                </div> 
                

                 <div class="row">
                       
                        <div class="col-6">
                              <fieldset  class="report-fieldset">

                                        <legend class="legend"><asp:Literal  runat="server" Text="<%$ Resources:Labels,PerformanceIndicator%>" />
                                        </legend>

                                            <div class="row">
                                                    <span class="title"><asp:Literal  runat="server" Text="<%$ Resources:Labels,RespondResourcefully %>" /></span>:
                                                    <span> <asp:Literal  runat="server" id="txt_RespondResourcefully" /></span>
                                            </div>
                             

                                            <div class="row">
                                                <span class="title"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ConfrontsProblems%>" /></span>:
                                                    <span> <asp:Literal  runat="server" id="txt_ConfrontsProblems" /></span>
                                            </div>

                                        <div class="row">
                                                <span class="title"> <asp:Literal  runat="server" Text="<%$ Resources:Labels,CustomerNeeds%>" /></span>:
                                                <span> <asp:Literal  runat="server" id="txt_CustomerNeeds" /></span>
                                        </div>
                                        <div class="row">
                                        <span class="title"> <asp:Literal  runat="server" Text="<%$ Resources:Labels,OrganizationVision%>" /></span>:
                                        <span> <asp:Literal  runat="server" id="txt_OrganizationVision" /></span>
                                    </div>

                                        <div class="row">
                                            <span class="title"> <asp:Literal  runat="server" Text="<%$ Resources:Labels,StayFocused%>" /></span>:
                                            <span> <asp:Literal  runat="server" id="txt_StayFocused" /></span>
                                        </div>
 
                                 </fieldset>
                        </div>
                        <div class="col-6">
                           <fieldset  class="report-fieldset">

                                        <legend class="legend"><asp:Literal  runat="server" Text="<%$ Resources:Labels,OverAllProgress%>" />
                                        </legend>

                                            <div class="row">
                                                    <span class="title"><asp:Literal  runat="server" Text="<%$ Resources:Labels,OverAllProgress %>" /></span>:
                                                    <span> <asp:Literal  runat="server" id="txt_OverAllProgress" /></span>
                                            </div>
                             

                                            <div class="row">
                                                <span class="title"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Comment%>" /></span>:
                                                    <span> <asp:Literal  runat="server" id="txt_Comment" /></span>
                                            </div>

                                        <div class="row">
                                               <span>&nbsp;</span>
                                        </div>
                                        <div class="row">
                                         <span>&nbsp;</span>
                                   </div
     
                                        <div class="row">
                                           <span>&nbsp;</span>
                                        </div>

                                 
                                 
                                        </fieldset>
                        </div>
                </div>              
                 
        </div>

        </div>
    </section>
</asp:Content>
