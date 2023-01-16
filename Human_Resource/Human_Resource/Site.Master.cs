using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using HR.Views;
using System.Threading;
using System.Web.UI.HtmlControls;
using Human_Resource.App_Code;
using System.Web.Services;
using System.Web.Security;

namespace Human_Resource
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string path = "images/en.png";

            //profile image
            var res = Session["UserImage"] as byte[];
            if (res != null)
                img_profile.Src = "data:image;base64," + Convert.ToBase64String(res);
            else
                img_profile.Src = "~/images/no-image-icon-125x125.png";

            if (Session["CultureName"] != null)
            {             
                //selected language
                path = Session["CultureImage"].ToString();
                cultureImage.ImageUrl = path;


                Page.ClientScript.RegisterClientScriptInclude("jquery-2.1.3.min", ResolveUrl("~/Content/en/js/jquery-2.1.3.min.js"));

                LinkCss.AddCss("https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css", this.Page);

                #region link css and js files

                if (Session["CultureName"].ToString().ToLower() == "en-us")
                {
                    //profile user name
                    txt_profileName.Text = Session["UserNameEN"].ToString();

                    LinkCss.AddCss("/Content/en/css/bootstrap.css", this.Page);
                    LinkCss.AddCss("/Content/en/css/font-awesome.css", this.Page);
                    LinkCss.AddCss("/Content/en/css/style.css", this.Page);


                    Page.ClientScript.RegisterClientScriptInclude("jquery-2.1.3.min", ResolveUrl("~/Content/en/js/jquery-2.1.3.min.js"));
                    Page.ClientScript.RegisterClientScriptInclude("popper.min.js", ResolveUrl("~/Content/en/js/popper.min.js"));
                    Page.ClientScript.RegisterClientScriptInclude("bootstrap.min.js", ResolveUrl("~/Content/en/js/bootstrap.min.js"));
                    Page.ClientScript.RegisterClientScriptInclude("main.js", ResolveUrl("~/Content/en/js/main.js"));

                }
                else
                {
                    //profile user name
                    txt_profileName.Text = Session["UserNameAR"].ToString();

                    LinkCss.AddCss("/Content/ar/css/bootstrap-rtl.min.css", this.Page);
                    LinkCss.AddCss("/Content/ar/css/font-awesome.css", this.Page);
                    LinkCss.AddCss("/Content/ar/css/style.css", this.Page);


                    Page.ClientScript.RegisterClientScriptInclude("jquery-2.1.3.min", ResolveUrl("~/Content/ar/js/jquery-2.1.3.min.js"));
                    Page.ClientScript.RegisterClientScriptInclude("popper.min.js", ResolveUrl("~/Content/ar/js/popper.min.js"));
                    Page.ClientScript.RegisterClientScriptInclude("bootstrap.min.js", ResolveUrl("~/Content/ar/js/bootstrap.min.js"));
                    Page.ClientScript.RegisterClientScriptInclude("main.js", ResolveUrl("~/Content/ar/js/main.js"));
                }
               
                #endregion
            }
            else
            {
                txt_profileName.Text = Session["UserNameAR"].ToString();

                Session["CultureName"] = "ar-as";

                Session["CultureImage"] = path;
                cultureImage.ImageUrl = path;

                LinkCss.AddCss("/Content/ar/css/bootstrap-rtl.min.css", this.Page);
                LinkCss.AddCss("/Content/ar/css/font-awesome.css", this.Page);
                LinkCss.AddCss("/Content/ar/css/style.css", this.Page);


                Page.ClientScript.RegisterClientScriptInclude("jquery-2.1.3.min", ResolveUrl("~/Content/ar/js/jquery-2.1.3.min.js"));
                Page.ClientScript.RegisterClientScriptInclude("popper.min.js", ResolveUrl("~/Content/ar/js/popper.min.js"));
                Page.ClientScript.RegisterClientScriptInclude("bootstrap.min.js", ResolveUrl("~/Content/ar/js/bootstrap.min.js"));
                Page.ClientScript.RegisterClientScriptInclude("main.js", ResolveUrl("~/Content/ar/js/main.js"));
            }

            #region permissions
            var role = Session["urole"].ToString();
            if (role == "GeneralDirector" || role == "CEO")
            {
                li_rewardsPenalties.Visible = true;
            }
            else
            {
                li_rewardsPenalties.Visible = false;

            }


            if (role == "GeneralDirector" || role == "CEO" || role == "HRManager" || role == "Advisor")
            {
                li_basicInformation.Visible = true;

                if(role == "Advisor")
                {
                    li_attendanceReport.Visible = false;
                    li_workShifts.Visible = false;
                    li_addTrainings.Visible = false;
                }
                else
                {
                    li_attendanceReport.Visible = true;
                    li_workShifts.Visible = true;
                    li_addTrainings.Visible = true;
                }

                if (role == "GeneralDirector" || role == "CEO" || role == "Advisor")
                {
                    li_userAccounts.Visible = true;
                }
                else
                {
                    li_userAccounts.Visible = false;

                }
            }
            else
            {
                li_basicInformation.Visible = false;
                li_attendanceReport.Visible = false;
                li_workShifts.Visible = false;
                li_addTrainings.Visible = false;
                li_userAccounts.Visible = false;
            }

            if (role == "GeneralDirector" || role == "CEO" || role == "HRManager" 
                || role == "ManagementManager"|| role == "Supervisor")
            {

                li_vacationReport.Visible = true;
                li_employeesList.Visible = true;
                if(role == "HRManager")
                {
                    li_eventsApprove.Visible = false;
                }
                else
                {
                    li_eventsApprove.Visible = true;

                }
            }
            else if(role == "Advisor")
            {
                li_employeesInfo.Visible = false;
                li_expiredExports.Visible = false;
                li_newEmployee.Visible = true;
            }
            else 
            {
                li_vacationReport.Visible = false;
                li_eventsApprove.Visible = false;
                li_employeesList.Visible = false;


            }
            #endregion

        }



        protected void msgBtn_Click(object sender, ImageClickEventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "mykey", "openModal();", true);
        }
        protected void langBtn_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton theButton = (ImageButton)sender;
            if (Session["CultureName"] == null)
                Session["CultureName"] = "en-us";
            Session["CultureName"] = Session["CultureName"].ToString().ToLower() == "en-us" ? CultureInfo.CreateSpecificCulture("ar-as") : CultureInfo.CreateSpecificCulture("en-us");
            Session["CultureImage"] = Session["CultureName"].ToString().ToLower() == "ar-as" ? "images/en.png" : "images/ar.png";
            cultureImage.ImageUrl = Session["CultureImage"].ToString();


            HttpCookie cookie = new HttpCookie("CultureInfo");
            cookie.Value = Session["CultureName"].ToString();
            Response.SetCookie(cookie);

            Response.Redirect(Request.RawUrl);
        }

      
    }
}