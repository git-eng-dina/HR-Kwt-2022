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

namespace Human_Resource
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = "images/en.png";
            if (Session["CultureName"] != null)
            {
                path = Session["CultureImage"].ToString();
                cultureImage.ImageUrl = path;


                Page.ClientScript.RegisterClientScriptInclude("jquery-2.1.3.min", ResolveUrl("~/Content/en/js/jquery-2.1.3.min.js"));

                LinkCss.AddCss("https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css", this.Page);
                
                #region link css and js files

                if (Session["CultureName"].ToString().ToLower() == "en-us")
                {
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
                cultureImage.ImageUrl = path;

                LinkCss.AddCss("/Content/ar/css/bootstrap-rtl.min.css", this.Page);
                LinkCss.AddCss("/Content/ar/css/font-awesome.css", this.Page);
                LinkCss.AddCss("/Content/ar/css/style.css", this.Page);
                LinkCss.AddCss("/Content/ar/css/calendar-blue.css", this.Page);


                Page.ClientScript.RegisterClientScriptInclude("jquery-2.1.3.min", ResolveUrl("~/Content/ar/js/jquery-2.1.3.min.js"));
                Page.ClientScript.RegisterClientScriptInclude("popper.min.js", ResolveUrl("~/Content/ar/js/popper.min.js"));
                Page.ClientScript.RegisterClientScriptInclude("bootstrap.min.js", ResolveUrl("~/Content/ar/js/bootstrap.min.js"));
                Page.ClientScript.RegisterClientScriptInclude("main.js", ResolveUrl("~/Content/ar/js/main.js"));
            }


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