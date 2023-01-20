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
        string linkName = "li_vaccationTypes";
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

        protected void gv_data_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                string role = Session["urole"].ToString();
                if (role != "GeneralDirector")
                {
                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        var rowView = (EmployeeModel)e.Row.DataItem;
                        if (rowView != null)
                        {
                            List<UsersPermissionModel> permissions = Session["UserPermissions"] as List<UsersPermissionModel>;
                            var employees = permissions.Where(x => x.LiElementName.Trim().ToLower() == linkName).FirstOrDefault();
                            LinkButton LinkAttendance = (LinkButton)e.Row.FindControl("LinkAttendance");
                            if (employees != null && employees.EditObject == true)
                            {
                                LinkAttendance.Visible = true;
                            }
                            else
                            {
                                LinkAttendance.Visible = false;
                            }
                        }
                    }
                }
            }
            catch
            { }
        }
    }
}