using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Globalization;
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
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
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
        public static string SaveTraining(string trainingId, string name, string description,string empIds, string startDate, string endDate)
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

                if (startDate != "")
                dept.StartDate = DateTime.ParseExact(startDate, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                if (endDate != "")
                    dept.EndDate = DateTime.ParseExact(endDate, "MM/dd/yyyy", CultureInfo.InvariantCulture);


                if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                    dept.CreateUserID = dept.UpdateUserID = int.Parse(HttpContext.Current.Session["user_id"].ToString());


                long deptId = dept.SaveDept(dept,  empIds);
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
                TrainingModel training = new TrainingModel();

                int trainingId = int.Parse(ID);
                training = training.getTraining(trainingId);

                return training;
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
                long Ref = Convert.ToInt32(e.CommandArgument.ToString());

                long? userId = null;
                if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                    userId = dept.UpdateUserID = long.Parse(Session["user_id"].ToString());

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