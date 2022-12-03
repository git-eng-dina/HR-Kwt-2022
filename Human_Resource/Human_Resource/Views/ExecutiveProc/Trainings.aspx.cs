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
    public partial class Trainings : System.Web.UI.Page
     {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                btn_new.Attributes.Add("OnClick", "ShowDialog('');");
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
            TrainingModel dept = new TrainingModel();

            var depts = dept.getActivity();
            if (textSearch != "")
                depts = depts.Where(x =>   x.Name.Contains(textSearch)
                                || x.Description.Contains(textSearch)
                                 ).ToList();
            gv_data.DataSource = depts;


            EmployeeModel emp = new EmployeeModel();
            var employees = emp.GetEmployees(true, true);
            sel_employee.DataSource = employees;
            sel_employee.DataValueField = "EmployeeID";
            if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
            {
                sel_employee.DataTextField = "NameEn";

            }
            else
            {
                sel_employee.DataTextField = "NameAr";
            }

            DataBind();
        }
        [WebMethod(EnableSession = true)]
        public static string SaveTraining(string trainingId, string name, string description,string empIds)
        {
            try
            {
                TrainingModel dept = new TrainingModel();
                if (trainingId != "")
                    dept.TrainingID = int.Parse(trainingId);
                else
                    dept.TrainingID = 0;
                dept.Name = name;
                dept.Description = description;

                if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                    dept.CreateUserID = dept.UpdateUserID = int.Parse(HttpContext.Current.Session["user_id"].ToString());


                int deptId = dept.SaveDept(dept);
                if (deptId != 0)
                {
                    return "1";
                }
                return "0";
            }
            catch
            {
                return "0";

            }

        }

        [WebMethod]
        public static TrainingModel GetTraining(string ID)
        {
            try
            {
                TrainingModel dept = new TrainingModel();

                int trainingId = int.Parse(ID);
                dept = dept.getTraining(trainingId);

                return dept;
            }
            catch
            {
                return null;

            }

        }
        protected void deletedatafromgrid(object sender, CommandEventArgs e)
        {

            try
            {
                TrainingModel dept = new TrainingModel();
                int Ref = Convert.ToInt32(e.CommandArgument.ToString());

                int? userId = null;
                if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                    userId = dept.UpdateUserID = int.Parse(Session["user_id"].ToString());

                if (dept.DeleteDept(Ref, userId))
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