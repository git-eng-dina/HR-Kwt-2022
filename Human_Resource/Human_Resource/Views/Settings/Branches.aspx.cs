
using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using System.Web.Mvc;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Settings
{
    public partial class Branches : System.Web.UI.Page
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
        private void BindData(string textSearch="")
        {
            BranchModel dept = new BranchModel();

            var depts = dept.getCompanyDeps();
            if (textSearch != "")
                depts = depts.Where(x => x.Name.ToLower().Contains(textSearch.ToLower()) 
                                || x.Mobile.Contains(textSearch)
                                || x.Address.ToLower().Contains(textSearch.ToLower())
                                || x.ManagerName.ToLower().Contains(textSearch.ToLower())).ToList();
            gv_data.DataSource = depts;


            EmployeeModel employeeModel = new EmployeeModel();
            List<EmployeeModel> employees = new List<EmployeeModel>();
            employees = employeeModel.GetHiredEmps(true);
            emp.DataSource = employees;
            emp.DataValueField = "EmployeeID";
            if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                emp.DataTextField = "NameEn";
            else
                emp.DataTextField = "NameAr";

            DataBind();
        }
        [WebMethod(EnableSession = true)]
        public static string SaveBranch(string departmentId,string name, string mobile, string address, string managerId)
        {
            try
            {
                BranchModel dept = new BranchModel();
                if (departmentId != "")
                    dept.BranchID = int.Parse(departmentId);
                else
                    dept.BranchID = 0;
                dept.Name = name;
                dept.Mobile = mobile;
                dept.Address = address;
                dept.ManagerID = int.Parse(managerId);

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
        public static BranchModel GetBranch(string ID)
        {
            try
            {
                BranchModel dept = new BranchModel();

                int departmentId = int.Parse(ID);
                dept = dept.getBranch(departmentId);

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
                BranchModel dept = new BranchModel();
                int Ref = Convert.ToInt32(e.CommandArgument.ToString());

                int? userId = null;
                if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                    userId = dept.UpdateUserID = int.Parse(Session["user_id"].ToString());

                if (dept.DeleteDept(Ref,userId))
                {

                    Response.Write("<script>alert('" + Resources.Labels.DeleteSuccessfully + "')</script>");
                    BindData();
                }
                else
                {

                    Response.Write("<script>alert('" + Resources.Labels.DeleteSuccessfully + "')</script>");
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}