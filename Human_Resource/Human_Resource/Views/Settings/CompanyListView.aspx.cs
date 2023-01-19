using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Settings
{
    public partial class CompanyListView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            if (!IsPostBack)
            {
                try
                {
                    CompanyModel company = new CompanyModel();
                    var list = company.GetCompanyList();

                    if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                        companyList1.Text = list.CompanyListEn;
                    else
                        companyList1.Text = list.CompanyListAr;
                }
                catch { }
            }
        }
    }
}