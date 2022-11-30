using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
            var unHiredEmployees = emp.GetEmployees(true,false);
            if (textSearch != "")
                unHiredEmployees = unHiredEmployees.Where(x => x.NameAr.ToLower().Contains(textSearch.ToLower())
                                || x.NameEn.ToLower().Contains(textSearch.ToLower())
                                || x.IdentityNumber.ToLower().Contains(textSearch.ToLower())).ToList();
            gv_unhiredEmp.DataSource = unHiredEmployees;

            var employees = emp.GetEmployees(true,true);
            if (textSearch != "")
                employees = employees.Where(x => x.NameAr.ToLower().Contains(textSearch.ToLower())
                                || x.NameEn.ToLower().Contains(textSearch.ToLower())
                                || x.IdentityNumber.ToLower().Contains(textSearch.ToLower())).ToList();
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
    }
}