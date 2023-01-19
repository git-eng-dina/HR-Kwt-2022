using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Settings
{
    public partial class CompanyList : System.Web.UI.Page
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

                    hid_companyID.Value = list.CompanyID.ToString();
                    companyListAr.Text = list.CompanyListAr;
                    companyListEn.Text = list.CompanyListEn;
                }
                catch { }
            }
        }

        [WebMethod(EnableSession = true)]
        public static string SaveList(string companyListAr,string companyListEn, string companyId)
        {
            CompanyModel company = new CompanyModel();
            if (companyId == "")
                company.CompanyID = 0;
            else
                company.CompanyID = int.Parse(companyId);

            company.CompanyListAr = companyListAr;
            company.CompanyListEn = companyListEn;

            companyId = company.SaveCompanyList(company).ToString();
            return companyId.ToString();
        }
    }
}