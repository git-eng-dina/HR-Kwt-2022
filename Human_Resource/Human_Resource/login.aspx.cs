using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
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
            UsersPermissionModel userPermission = new UsersPermissionModel();

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

                Session["UserNameEN"] = loginUser.NameEn;
                Session["UserNameAR"] = loginUser.NameAr;
                Session["UserImage"] = loginUser.Image;
                Session["UserPermissions"] = userPermission.getEmployeePermission(loginUser.EmployeeID);
                TaskModel taskModel = new TaskModel();
                taskModel.ScheduleTasks();
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

        [WebMethod(EnableSession = true)]
        public static long GetMessagesCount(string searchText)
        {
            try
            {
                Message msg = new Message();
                var messages = msg.GetMessagesCount(long.Parse( HttpContext.Current.Session["user_id"].ToString()), searchText);
                return messages;
            }
            catch
            {
                return 0;

            }

        }
         [WebMethod(EnableSession = true)]
        public static List<Message> GetUserMessages(string skip,string searchText)
        {
            try
            {
                Message msg = new Message();
                var messages = msg.GetUserMessages(long.Parse( HttpContext.Current.Session["user_id"].ToString()),int.Parse(skip), searchText);
                return messages;
            }
            catch(Exception ex)
            {
                return null;

            }

        }
         [WebMethod(EnableSession = true)]
        public static Message GetMessageDetails(string usersMessageID)
        {
            try
            {
                Message msg = new Message();
                var message = msg.GetMessageDetails(long.Parse(usersMessageID), long.Parse(HttpContext.Current.Session["user_id"].ToString()));
                message.CultureName = HttpContext.Current.Session["CultureName"].ToString();
                return message;
            }
            catch(Exception ex)
            {
                return null;

            }

        }
        [WebMethod(EnableSession = true)]
        public static string SaveMessage(string toEmployeeID, string title, string content)
        {
            try
            {
                Message msg = new Message();
                var message = msg.AddMessage(long.Parse(toEmployeeID),
                            long.Parse(HttpContext.Current.Session["user_id"].ToString()),
                             title, content);

                return Resources.Labels.SaveSuccessfully;
            }
            catch(Exception ex)
            {
                return Resources.Labels.ErrorOccured;
            }

        }

        [WebMethod(EnableSession = true)]
        public static void AddMessageReply(string usersMessageID ,string replyText)
        {
            try
            {
                Message msg = new Message();
                var message = msg.AddReply(long.Parse(usersMessageID),
                            long.Parse(HttpContext.Current.Session["user_id"].ToString()),
                             replyText);

            }
            catch(Exception ex)
            {
                

            }

        }


        [WebMethod(EnableSession = true)]
        public static string logout()
        {
            try
            {
                // remove authintication
                FormsAuthentication.SignOut();
                HttpContext.Current.Session.Abandon();
                return "1";
            }
            catch
            {
                return "0";

            }

        }
    }
}