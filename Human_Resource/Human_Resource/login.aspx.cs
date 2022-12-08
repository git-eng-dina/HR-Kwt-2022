using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
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
            string passwordStr = HelpClass.MD5Hash("Inc-m" + password.Value.Trim());
            var loginUser = user.GetUser(username.Value, passwordStr);

            if (loginUser == null)
            {
                lbl_error.Visible = true;
                lbl_error.Style.Add("display", "block");
            }
            else
            {
                Session["user_id"] = loginUser.EmployeeID;
                Session["urole"] = user.getUserRole(loginUser.EmployeeID);
                //FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket
                //              (
                //              1,
                //              loginUser.Username,
                //              DateTime.Now,
                //              DateTime.Now.AddMinutes(15), // expiry
                //              false,
                //              "",
                //              "/"
                //              );

                ////encrypt the ticket and add it to a cookie
                //string enTicket = FormsAuthentication.Encrypt(authTicket);
                //HttpCookie cookie = new HttpCookie("POSCookie", enTicket);
                //cookie.Expires = DateTime.Now.AddMinutes(15);
                //cookie.HttpOnly = false;
                //cookie.Values.Add("UserName", HttpUtility.UrlEncode(loginUser.Username));
                //cookie.Values.Add("UserId", loginUser.EmployeeID.ToString());


                //Response.Charset = "UTF-8";
                //Response.Cookies.Add(cookie);
                Response.Redirect("Views/Home/HomePage.aspx");

            }
        }
    }
}