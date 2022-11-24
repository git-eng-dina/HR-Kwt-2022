
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
    public partial class Departments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DepartmentModel dept = new DepartmentModel();
               
            var depts = dept.getCompanyDeps();
            gv_departments.DataSource = depts;


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
            btn_new.Attributes.Add("OnClick", "ShowDialog();");

        }

        [WebMethod]

        public static string SaveDepartment(string name,string mobile,string address,string managerId)
        {
            try
            {
                DepartmentModel dept = new DepartmentModel();
                 dept.Name = name;
                dept.Mobile = mobile;
                dept.Address = address;
                dept.ManagerID =int.Parse( managerId);

                //if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                //    dept.CreateUserID = dept.UpdateUserID = int.Parse(Session["user_id"].ToString());


                int deptId = dept.SaveDept(dept);
                if (deptId != 0)
                {
                    return "1";
                }
                return "0";
            }
            catch {
                return "0";

            }

        }
        protected void btn_Add_Click(object sender, EventArgs e)
        {
            try
            {
                DepartmentModel dept = new DepartmentModel();
               // dept.Name = txt_name.Value;
                dept.Mobile = txt_mobile.Value;
                dept.ManagerID = int.Parse(emp.Value);

                if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                    dept.CreateUserID = dept.UpdateUserID = int.Parse(Session["user_id"].ToString());


                int deptId = dept.SaveDept(dept);
                if (deptId != 0)
                {
                    Response.Write("<script>alert('" + Resources.Labels.SaveSuccessfully + "')</script>");
                }
            }
            catch { }
        }
        protected void deletedatafromgrid(object sender, CommandEventArgs e)
        {

            try
            {
                int Ref = Convert.ToInt32(e.CommandArgument.ToString());
                //if (service.deletedatafromgird(Ref))
                //{

                //    Response.Write("<script>alert('La ligne a été supprimée')</script>");
                //    vadminservice.Contacts_Fact[] Data = service.Getallcontacts();
                //    BindDataSourceToGridview(Data);
                //}
                //else
                //{

                //    Response.Write("<script>alert('Row n'a pas été supprimé')</script>");
                //}
            }
            catch (Exception ex)
            {
            }
        }
    }
}