using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Employees
{
    public partial class empEvalution : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }

            EvaluationModel eval = new EvaluationModel();
            eval = eval.getEmpEvaluation(int.Parse(Session["user_id"].ToString()));

            #region display values
            if (eval != null)
            {
                txt_employee.Text = eval.EmployeeName;
                txt_reviewer.Text = eval.ReviewerName;
                txt_evaluationDate.Text = eval.EvaluationDate.Value.Date.ToShortDateString().ToString();
                txt_performance.Text = eval.Performance;
                txt_jobKnowledge.Text = eval.JobKnowledge;
                txt_organizeIdea.Text = eval.OrganizeIdea;
                txt_Behavior.Text = eval.Behavior;
                txt_Attendance.Text = eval.Attendance;
                txt_Punctuality.Text = eval.Punctuality;
                txt_Productivity.Text = eval.Productivity;
                txt_Creativity.Text = eval.Creativity;
                txt_ClientRelation.Text = eval.ClientRelation;
                txt_Initiative.Text = eval.Initiative;
                txt_Communication.Text = eval.Communication;
                txt_Cooperation.Text = eval.Cooperation;
                txt_StrategicThinking.Text = eval.StrategicThinking;
                txt_HandleStressful.Text = eval.HandleStressful;
                txt_ListeningSkills.Text = eval.ListeningSkills;
                txt_MeetingDeadlines.Text = eval.MeetingDeadlines;
                txt_RespondResourcefully.Text = eval.RespondResourcefully;
                txt_ConfrontsProblems.Text = eval.ConfrontsProblems;
                txt_CustomerNeeds.Text = eval.CustomerNeeds;
                txt_OrganizationVision.Text = eval.OrganizationVision;
                txt_StayFocused.Text = eval.StayFocused;
                txt_OverAllProgress.Text = eval.OverAllProgress;
                txt_Comment.Text = eval.Comment;
            }
            #endregion
        }
    }
}