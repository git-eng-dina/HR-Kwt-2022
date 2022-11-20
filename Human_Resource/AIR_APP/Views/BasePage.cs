using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI.WebControls;

namespace HR.Views
{
    public class BasePage : System.Web.UI.Page
    {

        protected override void InitializeCulture()
        {
            if (Session["CultureName"] != null)
            {
                String selectedLanguage = Context.Session["CultureName"].ToString();
                UICulture = selectedLanguage;
                Culture = selectedLanguage;

                Thread.CurrentThread.CurrentCulture =
                    CultureInfo.CreateSpecificCulture(selectedLanguage);
                Thread.CurrentThread.CurrentUICulture = new
                    CultureInfo(selectedLanguage);
            }
            base.InitializeCulture();
        }
    }
}