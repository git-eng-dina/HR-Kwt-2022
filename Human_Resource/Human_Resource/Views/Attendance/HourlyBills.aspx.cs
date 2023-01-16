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
    public partial class HourlyBills : System.Web.UI.Page
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
            HourlyPermissionModel dept = new HourlyPermissionModel();

            var depts = dept.getActivity();
            if (textSearch != "")
                depts = depts.Where(x => 
                //x.Name.Contains(textSearch)
                                 x.Description.Contains(textSearch)
                                  || x.EmployeeName.ToLower().Contains(textSearch.ToLower())
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


            DataBind();
        }
        [WebMethod(EnableSession = true)]
        //public static string SaveHourlyPermission(string hourlyPermissionId, string employeeId, string name, string description, string date)
        public static string SaveHourlyPermission(string hourlyPermissionId, string employeeId, string date,  string description)
        {
            try
            {
                CultureInfo cultures = new CultureInfo("en-US");

                HourlyPermissionModel dept = new HourlyPermissionModel();
                if (hourlyPermissionId != "")
                    dept.HourlyPermissionID = int.Parse(hourlyPermissionId);
                else
                    dept.HourlyPermissionID = 0;
                dept.EmployeeID = int.Parse(employeeId);
                dept.Date = DateTime.ParseExact(date, "yyyy-MM-dd", cultures); ;
                //dept.Name = name;
                dept.Description = description;

                if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                    dept.CreateUserID = dept.UpdateUserID = int.Parse(HttpContext.Current.Session["user_id"].ToString());


                long deptId = dept.SaveDept(dept);
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
        public static HourlyPermissionModel GetHourlyPermission(string ID)
        {
            try
            {
                HourlyPermissionModel dept = new HourlyPermissionModel();

                int hourlyPermissionId = int.Parse(ID);
                dept = dept.getHourlyPermission(hourlyPermissionId);

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
                HourlyPermissionModel dept = new HourlyPermissionModel();
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