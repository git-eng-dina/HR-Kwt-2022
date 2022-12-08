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
                    emp.Password =  HelpClass.MD5Hash("Inc-m" + txt_password.Value.Trim());

                    if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                         emp.UpdateUserID = int.Parse(Session["user_id"].ToString());

                    emp.SaveAccount(emp);
                    lbl_msg.Attributes.Add("class", "label-success");
                    lbl_msg.InnerHtml = Resources.Labels.SaveSuccessfully;
                }
                else
                {
                    lbl_msg.Attributes.Add("class", "label-error");
                    lbl_msg.InnerHtml = Resources.Labels.UserNameExist;
                }

            }
            catch { }
        }
    }
}