using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Employees
{
    public partial class UserAccounts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EmployeeModel emp = new EmployeeModel();
                var employees = emp.GetEmployees(true, true);

                sel_employee.DataSource = employees;
                sel_employee.DataValueField = "EmployeeID";
                if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                {
                    sel_employee.DataTextField = "NameEn";

                }
                else
                {
                    sel_employee.DataTextField = "NameAr";
                }
                DataBind();
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            try
            {
                EmployeeModel emp = new EmployeeModel();

                int empID = int.Parse(sel_employee.Value);

                var userNameValid = emp.ValidateUserName(empID, txt_userName.Text);
                if (userNameValid)
                {
                    emp.EmployeeID = empID;
                    emp.Username = txt_userName.Text;
                    emp.Password =  HelpClass.MD5Hash( txt_password.Value);

                    if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                         emp.UpdateUserID = int.Parse(Session["user_id"].ToString());

                    emp.SaveAccount(emp);
                   
                }
                else
                {
                    lbl_msg.Visible = true;
                    lbl_msg.InnerHtml = "اسم المستخدم موجود مسبقا";
                }

            }
            catch { }
        }
    }
}