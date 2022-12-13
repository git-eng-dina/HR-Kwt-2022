<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEvaluation.aspx.cs" Inherits="Human_Resource.Views.ExecutiveProc.AddEvaluation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <script>
        

        
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
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Employee%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="emp" name="emp" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>

                              <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Reviewer%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="reviewer" name="reviewer" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>

                               <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,EvaluationDate%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                    <asp:TextBox ID="evaluationDate" runat="server" class="form-control input-lg hasdatepicker"  textMode="date" value="2000-11-01"></asp:TextBox>
                            </div>
                            </div>

                           

                             
                            
                   
                        </div>
                    </div>
                      </div>

                 <div class="col-md-6 float2" style="display:inline">
                       <div class="panel panel-brown" style="width:100%">
                        <div class="panel-heading">
                        <span> <asp:literal runat="server" text="<%$ Resources:Labels,PassportInfo%>"/></span>
                        </div>
                        <div class="c-form-box">
                          
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,JobKnowledge %>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_performance" name="slc_performance" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,JobKnowledge%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_jobKnowledge" name="slc_jobKnowledge" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,OrganizeIdea%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_organizeIdea" name="slc_organizeIdea" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                          
                           
                        </div>
                    </div>
                     </div>
        </div>
        </div>

        <div class="row">
        <div class="col-md-12">    
                <input type="hidden" runat="server" id="hid_eval_id" value="" />
                 <div class="col-md-6 float1" style="display:inline">
                    <div class="panel panel-green" style="width:100%">
                        <div class="panel-heading">
                        <span> <asp:literal runat="server" text="<%$ Resources:Labels,EmployeeMannerism%>"/></span>
                        </div>
                        <div class="c-form-box">

                        
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Behavior%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_behavior" name="slc_behavior" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Attendance%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_attendance" name="slc_attendance" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Punctuality%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_punctuality" name="slc_punctuality" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Productivity%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_productivity" name="slc_productivity" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Creativity%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_creativity" name="slc_creativity" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,ClientRelation%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_clientRelation" name="slc_clientRelation" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Initiative%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_initiative" name="slc_initiative" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>


 
                   
                        </div>
                    </div>
                      </div>              

  
                 <div class="col-md-6 float2" style="display:inline">
                  <div class="panel panel-yellow" style="width:100%">
                        <div class="panel-heading">
                        <span> <asp:literal runat="server" text="<%$ Resources:Labels,Skills%>"/></span>
                        </div>
                        <div class="c-form-box">
                            
                            
                          
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Communication%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_communication" name="slc_communication" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Cooperation%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_cooperation" name="slc_cooperation" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,StrategicThinking%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_strategicThinking" name="slc_strategicThinking" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,HandleStressful%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_handleStressful" name="slc_handleStressful" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,ListeningSkills%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_listeningSkills" name="slc_listeningSkills" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,MeetingDeadlines%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_meetingDeadlines" name="slc_meetingDeadlines" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                             <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span>&nbsp;</span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                            </div>
                            </div>


                           
                        </div>
                    </div>
                </div>


            </div>
        </div>
 

             <div class="row">
                 <div class="col-md-12">
                          <div class="col-md-6 float1" style="display:inline">
                        <div class="panel panel-primary">
                        <div class="panel-heading">
                        <span> <asp:literal runat="server" text="<%$ Resources:Labels,PerformanceIndicator%>"/></span>
                        </div>
                        <div class="c-form-box">

                        
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,RespondResourcefully%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_respondResourcefully" name="slc_respondResourcefully" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,ConfrontsProblems%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_confrontsProblems" name="slc_confrontsProblems" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,CustomerNeeds%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_customerNeeds" name="slc_customerNeeds" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,OrganizationVision%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_organizationVision" name="slc_organizationVision" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                            <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,StayFocused%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_stayFocused" name="slc_stayFocused" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>
                         
                           


 
                   
                        </div>
                    </div>
                         </div>
                 <div class="col-md-6 float2" style="display:inline">
                 <div class="panel panel-primary">
                        <div class="panel-heading">
                        <span> <asp:literal runat="server" text="<%$ Resources:Labels,PersonalInfo%>"/></span>
                        </div>
                        <div class="c-form-box">


                               <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,OverAllProgress%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                <select runat="server" id="slc_overAllProgress" name="slc_overAllProgress" style="width:80%" class="form-control input-lg"></select>
                            </div>
                            </div>

                             <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Comment%>" /></span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" >
                                        <asp:TextBox type="text" class="form-control input-lg textarea" ID="comment" name="comment"  TextMode="MultiLine" Rows="6" Columns="15" runat="server" value=""  />
                           
                                    </div>
                            </div>
                             <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span>&nbsp;</span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" ></div>
                            </div>
                             <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span>&nbsp;</span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" ></div>
                            </div>
                              <div class="form-group" style="display:block">
                                <div class="col-md-4 col-sm-4 col-xs-4 div1">
                                <span>&nbsp;</span>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8 div2" ></div>
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

