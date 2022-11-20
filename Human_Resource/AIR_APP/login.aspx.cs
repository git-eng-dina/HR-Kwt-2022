using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataBind();
        }
        protected void login_Click(object sender, EventArgs e)
        {

            EmployeeModel user = new EmployeeModel();
            string passwordStr = HelpClass.MD5Hash("Inc-m" + password.Value);
            var loginUser = user.GetUser(username.Value, password.Value);

            if (loginUser == null)
            {
                lbl_error.Visible = true;
                lbl_error.Style.Add("display", "block");
            }
            else
            {
                Session["user_id"] = loginUser.EmployeeID;
                Response.Redirect("Views/Home/HomePage.aspx");

            }
        }
    }
}