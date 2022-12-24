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
    public partial class ExpiredPassports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindData();
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
            EmployeeModel emp = new EmployeeModel();
            if (Session["urole"] != null)
            {
                int userId = int.Parse(Session["user_id"].ToString());
                string role = Session["urole"].ToString();
                if (role == "GeneralDirector" || role == "CEO" || role == "Supervisor" || role == "HRManager"  || role.ToString() == "managmentManager")
                {
                    List<EmployeeModel> employees = new List<EmployeeModel>();
                    if (role == "managmentManager" )
                    {
                        employees = emp.GetEmployeesExpiredPassportsForManagement(userId);
                    }
                    else if (role == "Supervisor")
                    {
                        employees = emp.GetEmployeesExpiredPassportsForSupervisor(userId);
                    }
                    else
                    {
                        employees = emp.GetEmployeesExpiredPassports();
                    }


                    if (textSearch != "")
                        employees = employees.Where(x => x.NameAr.ToLower().Contains(textSearch.ToLower())
                                        || x.NameEn.ToLower().Contains(textSearch.ToLower())
                                        || x.IdentityNumber.ToLower().Contains(textSearch.ToLower())).ToList();
                    gv_employees.DataSource = employees;
                    DataBind();

                }
            }
           
         
        }

       
    }
}