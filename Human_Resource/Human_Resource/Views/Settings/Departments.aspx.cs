using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Settings
{
    public partial class Departments : System.Web.UI.Page
    {

            string linkName = "li_departments";
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
            DepartmentModel dept = new DepartmentModel();

            var depts = dept.getActivity();
            if (textSearch != "")
                depts = depts.Where(x => x.Name.ToLower().Contains(textSearch.ToLower())
                                || x.Mobile.Contains(textSearch)
                                || x.Address.ToLower().Contains(textSearch.ToLower())
                                || x.ManagerName.ToLower().Contains(textSearch.ToLower())
                                || x.ManagementName.ToLower().Contains(textSearch.ToLower())
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


            ManagementModel managementModel = new ManagementModel();
            List<ManagementModel> managements = new List<ManagementModel>();
            managements = managementModel.getActivity();
            management.DataSource = managements;
            management.DataValueField = "ManagementID";
            management.DataTextField = "Name";

            long userId = long.Parse(Session["user_id"].ToString());
            string role = Session["urole"].ToString();
            if (role != "GeneralDirector" && userId != 1)
            {
                List<UsersPermissionModel> permissions = Session["UserPermissions"] as List<UsersPermissionModel>;
                var employeesPermissions = permissions.Where(x => x.LiElementName.Trim().ToLower() == linkName).FirstOrDefault();

                if (employeesPermissions != null && employeesPermissions.EditObject == true)
                {
                    btn_new.Visible = true;
                }
                else
                {
                    btn_new.Visible = false;
                }
            }

            DataBind();
        }

        protected void gv_data_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            try
            {
                long userId = long.Parse(Session["user_id"].ToString());
                string role = Session["urole"].ToString();
                if (role != "GeneralDirector" && userId != 1)
                {
                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        var rowView = (DepartmentModel)e.Row.DataItem;
                        if (rowView != null)
                        {
                            List<UsersPermissionModel> permissions = Session["UserPermissions"] as List<UsersPermissionModel>;
                            var employees = permissions.Where(x => x.LiElementName.Trim().ToLower() == linkName).FirstOrDefault();
                            LinkButton editBtn = (LinkButton)e.Row.FindControl("LinkProducts");
                            ImageButton deleteBtn = (ImageButton)e.Row.FindControl("Image1");
                            if (employees != null && employees.EditObject == true)
                            {
                                editBtn.Visible = true;
                                deleteBtn.Visible = true;
                            }
                            else
                            {
                                editBtn.Visible = false;
                                deleteBtn.Visible = false;
                            }
                        }
                    }
                }
            }
            catch
            { }
        }

        [WebMethod(EnableSession = true)]
        public static string SaveDepartment(string departmentId, string name, string mobile, string managerId, string managementId)
        {
            try
            {
                DepartmentModel dept = new DepartmentModel();
                if (departmentId != "")
                    dept.DepartmentID = int.Parse(departmentId);
                else
                    dept.DepartmentID = 0;
                dept.Name = name;
                dept.Mobile = mobile;
                dept.ManagerID = int.Parse(managerId);
                dept.ManagementID = int.Parse(managementId);

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
        public static DepartmentModel GetDepartment(string ID)
        {
            try
            {
                DepartmentModel dept = new DepartmentModel();

                int departmentId = int.Parse(ID);
                dept = dept.getDepartment(departmentId);

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
                DepartmentModel dept = new DepartmentModel();
                int Ref = Convert.ToInt32(e.CommandArgument.ToString());

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