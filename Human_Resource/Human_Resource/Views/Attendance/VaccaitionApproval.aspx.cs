using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Attendance
{
    public partial class VaccaitionApproval : System.Web.UI.Page
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
            EmployeesVacationModel dept = new EmployeesVacationModel();

            var depts = dept.getActivity();
            if (textSearch != "")
                depts = depts.Where(x =>
                                  x.EmployeeName.ToLower().Contains(textSearch.ToLower())
                                 ).ToList();
            gv_data.DataSource = depts;






            EmployeeModel employeeModel = new EmployeeModel();
            List<EmployeeModel> employees = new List<EmployeeModel>();
            employees = employeeModel.GetHiredEmployees(true);
            emp.DataSource = employees;
            emp.DataValueField = "EmployeeID";
            if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                emp.DataTextField = "NameEn";
            else
                emp.DataTextField = "NameAr";

            VacationModel vacationModel = new VacationModel();
            List<VacationModel> vacations = new List<VacationModel>();
            vacations = vacationModel.GetActivity();
            vac.DataSource = vacations;
            vac.DataValueField = "VacationID";
            vac.DataTextField = "Name";


            DataBind();
        }
        [WebMethod(EnableSession = true)]
        public static string SaveEmployeesVacation(string employeesVacationId, string employeeId,string vacationId, string fromDate, string toDate)
        {
            try
            {
                CultureInfo cultures = new CultureInfo("en-US");

                EmployeesVacationModel dept = new EmployeesVacationModel();
                if (employeesVacationId != "")
                    dept.EmployeesVacationID = int.Parse(employeesVacationId);
                else
                    dept.EmployeesVacationID = 0;
                dept.EmployeeID = int.Parse(employeeId);
                dept.VacationID = int.Parse(vacationId);
                dept.FromDate = DateTime.ParseExact(fromDate, "yyyy-MM-dd", cultures); ;
                dept.ToDate = DateTime.ParseExact(toDate, "yyyy-MM-dd", cultures); ;

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
        public static EmployeesVacationModel GetEmployeesVacation(string ID)
        {
            try
            {
                EmployeesVacationModel dept = new EmployeesVacationModel();

                int employeesVacationId = int.Parse(ID);
                dept = dept.getEmployeesVacation(employeesVacationId);

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
                EmployeesVacationModel dept = new EmployeesVacationModel();
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