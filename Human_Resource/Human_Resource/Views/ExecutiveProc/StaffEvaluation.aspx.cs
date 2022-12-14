using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.ExecutiveProc
{
    public partial class StaffEvaluation : System.Web.UI.Page
     {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindData();
                btn_new.Attributes.Add("OnClick", "NewEvaluation();");
            }
        }
        protected void btn_Search_Click(object sender, EventArgs e)
        {
            try
            {
                string textSearch = txt_search.Value;
                BindData(textSearch);
            }
            catch { }
        }
        private void BindData(string textSearch = "")
        {
            EvaluationModel emp = new EvaluationModel();
            
            var evaluations = emp.getActivity();
            if (textSearch != "")
                evaluations = evaluations.Where(x => x.EmployeeName.ToLower().Contains(textSearch.ToLower())
                || x.Comment.ToLower().Contains(textSearch.ToLower())
                                ).ToList();
            gv_evaluations.DataSource = evaluations;
            DataBind();
        }
        protected void deletedatafromgrid(object sender, CommandEventArgs e)
        {

            try
            {
                EvaluationModel emp = new EvaluationModel();
                int Ref = Convert.ToInt32(e.CommandArgument.ToString());

                int? userId = null;
                if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                    userId = emp.UpdateUserID = int.Parse(Session["user_id"].ToString());

                if (emp.DeleteDept(Ref, userId))
                {

                    Response.Write("<script>alert('" + Resources.Labels.DeleteSuccessfully + "')</script>");
                    BindData();
                }
                else
                {

                    Response.Write("<script>alert('" + Resources.Labels.ErrorOccured + "')</script>");
                }
            }
            catch (Exception ex)
            {
            }
        }

        
    }
}