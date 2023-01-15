using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Employees
{
    public partial class Employees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

                BindData();
                btn_new.Attributes.Add("OnClick", "NewEmployee();");
            }
        }
        protected void btn_Search_Click(object sender, EventArgs e)
        {
            //try
            {
                string textSearch = txt_search.Value;
                BindData(textSearch);
            }
            //catch { }
        }
        private void BindData(string textSearch = "")
        {
            EmployeeModel emp = new EmployeeModel();

            List<EmployeeModel> unHiredEmployees = new List<EmployeeModel>();
            int userId = int.Parse(Session["user_id"].ToString());
            string role = Session["urole"].ToString();
            if (role == "GeneralDirector" || role == "CEO" || role == "Supervisor" || role == "HRManager" || role.ToString() == "FinancialManager")
            {
                if (role == "GeneralDirector" || role == "CEO")
                    unHiredEmployees = emp.GetNotHiredEmpForHeigh();
                else if (role == "Supervisor")//branch manager
                    unHiredEmployees = emp.GetNotHiredEmployees(userId);//not get any approval
                else if (role == "HRManager")
                    unHiredEmployees = emp.GetNotHiredEmployeesForHR(role);
                else if (role.ToString() == "FinancialManager")
                    unHiredEmployees = emp.GetNotHiredEmpFinantial();


                if (textSearch != "")
                    unHiredEmployees = unHiredEmployees.Where(x => x.NameAr.ToLower().Contains(textSearch.ToLower())
                                    || x.NameEn.ToLower().Contains(textSearch.ToLower())
                                    || (x.ManagementName != null && x.ManagementName.ToLower().Contains(textSearch.ToLower()))
                                    || (x.DepartmentName != null && x.DepartmentName.ToLower().Contains(textSearch.ToLower()))
                                    || (x.Position != null && x.Position.ToLower().Contains(textSearch.ToLower()))
                                    || x.Age.ToString().Contains(textSearch)
                                    || (x.BasicSalary!= null && x.BasicSalary.ToString().Contains(textSearch))
                                    || x.AddedBy.ToString().Contains(textSearch.ToLower())
                                    || x.IdentityNumber.ToLower().Contains(textSearch.ToLower())).ToList();
                gv_unhiredEmp.DataSource = unHiredEmployees;
            }
            else
            {
                gv_unhiredEmp.Visible = false;
                gv_unhiredEmp_title.Visible = false;
            }

            int? supervisorId = null;
            int? managerId = null;
            if (role == "Supervisor")
                supervisorId = userId;
            else if (role == "ManagementManager")
                managerId = userId;

            var employees = emp.GetEmployees(true,true,supervisorId,managerId);
            if (textSearch != "")
                employees = employees.Where(x => x.NameAr.ToLower().Contains(textSearch.ToLower())
                                    || x.NameEn.ToLower().Contains(textSearch.ToLower())
                                    || (x.ManagementName != null && x.ManagementName.ToLower().Contains(textSearch.ToLower()))
                                    || (x.DepartmentName != null && x.DepartmentName.ToLower().Contains(textSearch.ToLower()))
                                    || (x.Position != null && x.Position.ToLower().Contains(textSearch.ToLower()))
                                    || x.Age.ToString().Contains(textSearch)
                                    || (x.BasicSalary != null && x.BasicSalary.ToString().Contains(textSearch))
                                    || (x.AddedBy != null && x.AddedBy.ToString().Contains(textSearch.ToLower()))
                                    ||(x.IdentityNumber != null && x.IdentityNumber.ToLower().Contains(textSearch.ToLower()))).ToList();
            gv_employees.DataSource = employees;
            DataBind();
        }
        protected void deletedatafromgrid(object sender, CommandEventArgs e)
        {

            try
            {
                EmployeeModel emp = new EmployeeModel();
                int Ref = Convert.ToInt32(e.CommandArgument.ToString());

                int? userId = null;
                if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                    userId = emp.UpdateUserID = int.Parse(Session["user_id"].ToString());

                if (emp.DeleteEmp(Ref, userId))
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

        [WebMethod(EnableSession = true)]
        public static string ApproveEmployee(string employeeID)
        {
            try
            {
                ConfirmModel confirm = new ConfirmModel();
                EmployeeModel emp = new EmployeeModel();

                confirm.EmployeeID = int.Parse(employeeID);
                confirm.Role = HttpContext.Current.Session["urole"].ToString();
                confirm.ConfirmType = "emp_hiring";

                if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                    confirm.CreateUserID = confirm.UpdateUserID = int.Parse(HttpContext.Current.Session["user_id"].ToString());


                long confirmId = confirm.AddConfirm(confirm);
                if (confirmId != 0)
                {
                    //emp.SetHireDate(int.Parse(employeeID));
                    return "1";
                }
                return "0";
            }
            catch
            {
                return "0";

            }

        }
    }
}