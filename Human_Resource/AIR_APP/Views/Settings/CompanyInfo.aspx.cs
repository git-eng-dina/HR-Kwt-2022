using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Settings
{
    public partial class CompanyInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    CompanyModel company = new CompanyModel();
                    company = company.GetCompanyInfo();

                    #region fill text box
                    if (company != null)
                    {
                        txt_name.Text = company.Name;
                        txt_address.Text = company.Address;
                        txt_email.Value = company.Email;
                        txt_mobile.Text = company.Mobile;
                        txt_phone.Text = company.Phone;
                        txt_fax.Text = company.Fax;
                        txt_notes.Text = company.Notes;
                        hid_companyID.Value = company.CompanyID.ToString();
                    }
                    #endregion
                }
                catch
                {

                }
            }
        }

        protected void btn_edit_Click(object sender, EventArgs e)
        {
            try
            {
                CompanyModel company = new CompanyModel();
                company.Name = txt_name.Text;
                company.Address = txt_address.Text;
                company.Mobile = txt_mobile.Text;
                company.Phone = txt_phone.Text;
                company.Fax = txt_fax.Text;
                company.Email = txt_email.Value;
                company.Notes = txt_notes.Text;
                company.OurCompany = true;

                if(Session["user_id"] != null && Session["user_id"].ToString() != "")
                    company.CreateUserID = company.UpdateUserID = int.Parse(Session["user_id"].ToString());

                if (!hid_companyID.Value.Equals(""))
                    company.CompanyID = int.Parse(hid_companyID.Value);
                else
                    company.CompanyID = 0;

                int companyId = company.SaveCompanyInfo(company);
                if (companyId != 0)
                {
                    hid_companyID.Value = companyId.ToString();
                    Response.Write("<script>alert('"+ Resources.Labels.SaveSuccessfully+"')</script>");
                }
            }
            catch { }
        }
    }
}