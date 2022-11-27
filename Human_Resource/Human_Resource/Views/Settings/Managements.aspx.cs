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
    public partial class Managements : System.Web.UI.Page
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
            ManagementModel dept = new ManagementModel();

            var depts = dept.getActivity();
            if (textSearch != "")
                depts = depts.Where(x => x.Name.ToLower().Contains(textSearch.ToLower())
                                || x.Mobile.Contains(textSearch)
                                || x.Address.ToLower().Contains(textSearch.ToLower())
                                || x.ManagerName.ToLower().Contains(textSearch.ToLower())
                                || x.BranchName.ToLower().Contains(textSearch.ToLower())
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


            BranchModel branchModel = new BranchModel();
            List<BranchModel> branches = new List<BranchModel>();
            branches = branchModel.getCompanyDeps();
            branch.DataSource = branches;
            branch.DataValueField = "BranchID";
            branch.DataTextField = "Name";
 
            DataBind();
        }
        [WebMethod(EnableSession = true)]
        public static string SaveManagement(string managementId, string name, string mobile,   string managerId,string branchId)
        {
            try
            {
                ManagementModel dept = new ManagementModel();
                if (managementId != "")
                    dept.ManagementID = int.Parse(managementId);
                else
                    dept.ManagementID = 0;
                dept.Name = name;
                dept.Mobile = mobile;
                dept.ManagerID = int.Parse(managerId);
                dept.BranchID = int.Parse(branchId);

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
        public static ManagementModel GetManagement(string ID)
        {
            try
            {
                ManagementModel dept = new ManagementModel();

                int managementId = int.Parse(ID);
                dept = dept.getManagement(managementId);

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
                ManagementModel dept = new ManagementModel();
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