using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Attendance
{
    public partial class VacationReport : System.Web.UI.Page
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
            
            var employees = emp.GetEmployees(true, true);
            if (textSearch != "")
                employees = employees.Where(x => x.NameAr.ToLower().Contains(textSearch.ToLower())
                                || x.NameEn.ToLower().Contains(textSearch.ToLower())
                                ).ToList();
            gv_employees.DataSource = employees;
            DataBind();
        }

      
    }
}