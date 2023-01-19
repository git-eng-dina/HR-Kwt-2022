using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.ExecutiveProc
{
    public partial class AddEvaluation : System.Web.UI.Page
    {
        public object empId { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            if (!IsPostBack)
            {

                EvaluationModel evaluation = new EvaluationModel();

                hid_eval_id.Value = Request.QueryString["uid"];
                hdnButtonID.Value = btnSave.UniqueID;

                #region fill select
                //Employee Mannerism Group

                slc_behavior.DataSource = GetData.evaluationTypeList;
                slc_behavior.DataValueField = "Key";
                slc_behavior.DataTextField = "Value";
                slc_behavior.DataBind();

                slc_attendance.DataSource = GetData.evaluationTypeList;
                slc_attendance.DataValueField = "Key";
                slc_attendance.DataTextField = "Value";
                slc_attendance.DataBind();

                slc_punctuality.DataSource = GetData.evaluationTypeList;
                slc_punctuality.DataValueField = "Key";
                slc_punctuality.DataTextField = "Value";
                slc_punctuality.DataBind();

                slc_productivity.DataSource = GetData.evaluationTypeList;
                slc_productivity.DataValueField = "Key";
                slc_productivity.DataTextField = "Value";
                slc_productivity.DataBind();

                slc_creativity.DataSource = GetData.evaluationTypeList;
                slc_creativity.DataValueField = "Key";
                slc_creativity.DataTextField = "Value";
                slc_creativity.DataBind();

                slc_clientRelation.DataSource = GetData.evaluationTypeList;
                slc_clientRelation.DataValueField = "Key";
                slc_clientRelation.DataTextField = "Value";
                slc_clientRelation.DataBind();

                slc_initiative.DataSource = GetData.evaluationTypeList;
                slc_initiative.DataValueField = "Key";
                slc_initiative.DataTextField = "Value";
                slc_initiative.DataBind();




                //Skills Group

                slc_communication.DataSource = GetData.evaluationTypeList;
                slc_communication.DataValueField = "Key";
                slc_communication.DataTextField = "Value";
                slc_communication.DataBind();

                slc_cooperation.DataSource = GetData.evaluationTypeList;
                slc_cooperation.DataValueField = "Key";
                slc_cooperation.DataTextField = "Value";
                slc_cooperation.DataBind();

                slc_strategicThinking.DataSource = GetData.evaluationTypeList;
                slc_strategicThinking.DataValueField = "Key";
                slc_strategicThinking.DataTextField = "Value";
                slc_strategicThinking.DataBind();

                slc_handleStressful.DataSource = GetData.evaluationTypeList;
                slc_handleStressful.DataValueField = "Key";
                slc_handleStressful.DataTextField = "Value";
                slc_handleStressful.DataBind();

                slc_listeningSkills.DataSource = GetData.evaluationTypeList;
                slc_listeningSkills.DataValueField = "Key";
                slc_listeningSkills.DataTextField = "Value";
                slc_listeningSkills.DataBind();

                slc_meetingDeadlines.DataSource = GetData.evaluationTypeList;
                slc_meetingDeadlines.DataValueField = "Key";
                slc_meetingDeadlines.DataTextField = "Value";
                slc_meetingDeadlines.DataBind();


                //Job Knowledge Group
                slc_performance.DataSource = GetData.evaluationTypeList;
                slc_performance.DataValueField = "Key";
                slc_performance.DataTextField = "Value";
                slc_performance.DataBind();

                slc_jobKnowledge.DataSource = GetData.evaluationTypeList;
                slc_jobKnowledge.DataValueField = "Key";
                slc_jobKnowledge.DataTextField = "Value";
                slc_jobKnowledge.DataBind();

                slc_organizeIdea.DataSource = GetData.evaluationTypeList;
                slc_organizeIdea.DataValueField = "Key";
                slc_organizeIdea.DataTextField = "Value";
                slc_organizeIdea.DataBind();

                //performance indicator Group

                slc_respondResourcefully.DataSource = GetData.evaluationTypeList;
                slc_respondResourcefully.DataValueField = "Key";
                slc_respondResourcefully.DataTextField = "Value";
                slc_respondResourcefully.DataBind();

                slc_confrontsProblems.DataSource = GetData.evaluationTypeList;
                slc_confrontsProblems.DataValueField = "Key";
                slc_confrontsProblems.DataTextField = "Value";
                slc_confrontsProblems.DataBind();

                slc_customerNeeds.DataSource = GetData.evaluationTypeList;
                slc_customerNeeds.DataValueField = "Key";
                slc_customerNeeds.DataTextField = "Value";
                slc_customerNeeds.DataBind();

                slc_organizationVision.DataSource = GetData.evaluationTypeList;
                slc_organizationVision.DataValueField = "Key";
                slc_organizationVision.DataTextField = "Value";
                slc_organizationVision.DataBind();

                slc_stayFocused.DataSource = GetData.evaluationTypeList;
                slc_stayFocused.DataValueField = "Key";
                slc_stayFocused.DataTextField = "Value";
                slc_stayFocused.DataBind();

                slc_overAllProgress.DataSource = GetData.evaluationTypeList;
                slc_overAllProgress.DataValueField = "Key";
                slc_overAllProgress.DataTextField = "Value";
                slc_overAllProgress.DataBind();

                #endregion


                EmployeeModel employeeModel = new EmployeeModel();
                List<EmployeeModel> employees = new List<EmployeeModel>();
                employees = employeeModel.GetHiredEmployees(true);

                emp.DataSource = employees;
                emp.DataValueField = "EmployeeID";
                if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                    emp.DataTextField = "NameEn";
                else
                    emp.DataTextField = "NameAr";
                emp.DataBind();

                reviewer.DataSource = employees;
                reviewer.DataValueField = "EmployeeID";
                if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                    reviewer.DataTextField = "NameEn";
                else
                    reviewer.DataTextField = "NameAr";
                reviewer.DataBind();



                #region get employee info
                if (Request.QueryString["uid"] != null && Request.QueryString["uid"] != "")
                {
                    int evaluationID = int.Parse(Request.QueryString["uid"]);
                    evaluation = evaluation.getEvaluation(evaluationID);
                    #region fill inputs
                    //txt_nameAR.Value = emp.NameAr;
                    //dp_bod.Text = emp.DOB.ToString();
                    //sel_maritalStatus.Value = emp.MaritalStatus;
                    //sel_nationality.Value = emp.Nationality.ToString();

                    emp.Value = evaluation.EmployeeID.ToString();
                    reviewer.Value = evaluation.ReviewerID.ToString();
                    evaluationDate.Text = evaluation.EvaluationDate.ToString();
                    comment.Text = evaluation.Comment;

                    slc_behavior.Value = evaluation.Behavior;
                    slc_attendance.Value = evaluation.Attendance;
                    slc_punctuality.Value = evaluation.Punctuality;
                    slc_productivity.Value = evaluation.Productivity;
                    slc_creativity.Value = evaluation.Creativity;
                    slc_clientRelation.Value = evaluation.ClientRelation;
                    slc_initiative.Value = evaluation.Initiative;
                    slc_communication.Value = evaluation.Communication;
                    slc_cooperation.Value = evaluation.Cooperation;
                    slc_strategicThinking.Value = evaluation.StrategicThinking;
                    slc_handleStressful.Value = evaluation.HandleStressful;
                    slc_listeningSkills.Value = evaluation.ListeningSkills;
                    slc_meetingDeadlines.Value = evaluation.MeetingDeadlines;
                    slc_performance.Value = evaluation.Performance;
                    slc_jobKnowledge.Value = evaluation.JobKnowledge;
                    slc_organizeIdea.Value = evaluation.OrganizeIdea;
                    slc_respondResourcefully.Value = evaluation.RespondResourcefully;
                    slc_confrontsProblems.Value = evaluation.ConfrontsProblems;
                    slc_customerNeeds.Value = evaluation.CustomerNeeds;
                    slc_organizationVision.Value = evaluation.OrganizationVision;
                    slc_stayFocused.Value = evaluation.StayFocused;
                    slc_overAllProgress.Value = evaluation.OverAllProgress;




                    #endregion
                }

                #endregion

            }
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            try
            {
                CultureInfo cultures = new CultureInfo("en-US");
                Attachment attachment = new Attachment();

                EvaluationModel evaluation = new EvaluationModel();
                if (hid_eval_id.Value == "")
                    evaluation.EvaluationID = 0;
                else
                    evaluation.EvaluationID = int.Parse(hid_eval_id.Value);
 

                evaluation.EmployeeID = int.Parse(emp.Value);
                evaluation.ReviewerID = int.Parse(reviewer.Value);
                evaluation.EvaluationDate = DateTime.ParseExact(evaluationDate.Text, "yyyy-MM-dd", cultures);
                evaluation.Comment = comment.Text;


                evaluation.Behavior = slc_behavior.Value;
                evaluation.Attendance = slc_attendance.Value;
                evaluation.Punctuality = slc_punctuality.Value;
                evaluation.Productivity = slc_productivity.Value;
                evaluation.Creativity = slc_creativity.Value;
                evaluation.ClientRelation = slc_clientRelation.Value;
                evaluation.Initiative = slc_initiative.Value;
                evaluation.Communication = slc_communication.Value;
                evaluation.Cooperation = slc_cooperation.Value;
                evaluation.StrategicThinking = slc_strategicThinking.Value;
                evaluation.HandleStressful = slc_handleStressful.Value;
                evaluation.ListeningSkills = slc_listeningSkills.Value;
                evaluation.MeetingDeadlines = slc_meetingDeadlines.Value;
                evaluation.Performance = slc_performance.Value;
                evaluation.JobKnowledge = slc_jobKnowledge.Value;
                evaluation.OrganizeIdea = slc_organizeIdea.Value;
                evaluation.RespondResourcefully = slc_respondResourcefully.Value;
                evaluation.ConfrontsProblems = slc_confrontsProblems.Value;
                evaluation.CustomerNeeds = slc_customerNeeds.Value;
                evaluation.OrganizationVision = slc_organizationVision.Value;
                evaluation.StayFocused = slc_stayFocused.Value;
                evaluation.OverAllProgress = slc_overAllProgress.Value;


                #region


                #endregion



                if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                    evaluation.CreateUserID = evaluation.UpdateUserID = int.Parse(Session["user_id"].ToString());

                #region delete previous certificates
                if (evaluation.EvaluationID != 0)
                    attachment.DeleteCertificateAttach(evaluation.EvaluationID);
                #endregion

                long evalId = evaluation.SaveDept(evaluation);
                hid_eval_id.Value = evalId.ToString();

                HelpClass.ShowMessage(this.Page, Resources.Labels.SaveSuccessfully);

            }
            catch { }
        }
     }
}