
using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
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

                    #region fill drop down lists
                    EmployeeModel emp = new EmployeeModel();
                    var employees = emp.GetAllEmployees(true);

                    sel_generalDirector.DataSource = employees;
                    sel_generalDirector.DataValueField = "EmployeeID";

                    sel_CEO.DataSource = employees;
                    sel_CEO.DataValueField = "EmployeeID";

                    sel_financialManager.DataSource = employees;
                    sel_financialManager.DataValueField = "EmployeeID";

                    sel_HRManager.DataSource = employees;
                    sel_HRManager.DataValueField = "EmployeeID";

                    sel_legal.DataSource = employees;
                    sel_legal.DataValueField = "EmployeeID";

                    sel_advisor.DataSource = employees;
                    sel_advisor.DataValueField = "EmployeeID";

                    if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                    {
                        sel_generalDirector.DataTextField = "NameEN";
                        sel_CEO.DataTextField = "NameEN";
                        sel_financialManager.DataTextField = "NameEN";
                        sel_HRManager.DataTextField = "NameEN";
                        sel_legal.DataTextField = "NameEN";
                        sel_advisor.DataTextField = "NameEN";

                    }
                    else
                    {
                        sel_generalDirector.DataTextField = "NameAR";
                        sel_CEO.DataTextField = "NameAR";
                        sel_financialManager.DataTextField = "NameAR";
                        sel_HRManager.DataTextField = "NameAR";
                        sel_legal.DataTextField = "NameAR";
                        sel_advisor.DataTextField = "NameAR";
                    }
                    sel_generalDirector.DataBind();
                    sel_CEO.DataBind();
                    sel_financialManager.DataBind();
                    sel_HRManager.DataBind();
                    sel_legal.DataBind();
                    sel_advisor.DataBind();
                    #endregion
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
                        sel_generalDirector.Value = company.GeneralDirector.ToString();
                        sel_CEO.Value = company.CEO.ToString();
                        sel_financialManager.Value = company.FinancialManager.ToString();
                        sel_HRManager.Value = company.HRManager.ToString();
                        hid_companyID.Value = company.CompanyID.ToString();
                    }
                    #endregion
                }
                catch
                {

                }
            }
        }

        [WebMethod(EnableSession = true)]
        public static string SaveInfo(string Name,string Address,string Mobile,string Phone,string Fax,
            string Email,string Notes,string GeneralDirector,string CEO,string FinancialManager,
            string HRManager,string LegalManager,string userId,string companyId,string advisorsIds)
        {


            CompanyModel company = new CompanyModel();
            if (companyId == "")
                company.CompanyID = 0;
            else
                company.CompanyID = int.Parse(companyId);
            company.Name = Name;
            company.Address = Address;
            company.Mobile = Mobile;
            company.Phone = Phone;
            company.Fax = Fax;
            company.Email = Email;
            company.Notes = Notes;
            company.OurCompany = true;
            company.GeneralDirector = int.Parse(GeneralDirector);
            company.CEO = int.Parse(CEO);
            company.FinancialManager = int.Parse(FinancialManager);
            company.HRManager = int.Parse(HRManager);
            company.LegalManager = int.Parse(LegalManager);
            company.CreateUserID = company.UpdateUserID = int.Parse(userId);

            #region advisors
            if (advisorsIds.EndsWith(","))
                advisorsIds = advisorsIds.Substring(0, advisorsIds.Length - 1);
            List<string> advisorsStr = new List<string>();
            List<int> advisors = new List<int>();
            if (advisorsIds != "")
                advisorsStr = advisorsIds.Split(',').ToList();
            foreach (var sdv in advisorsStr)
                advisors.Add(int.Parse(sdv));
            #endregion
            companyId = company.SaveCompanyInfo(company, advisors).ToString();

            return companyId.ToString();

        }
        //protected void btn_edit_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        CompanyModel company = new CompanyModel();
        //        company.Name = txt_name.Text;
        //        company.Address = txt_address.Text;
        //        company.Mobile = txt_mobile.Text;
        //        company.Phone = txt_phone.Text;
        //        company.Fax = txt_fax.Text;
        //        company.Email = txt_email.Value;
        //        company.Notes = txt_notes.Text;
        //        company.OurCompany = true;
        //        company.GeneralDirector = int.Parse( sel_generalDirector.Value);
        //        company.CEO = int.Parse( sel_CEO.Value);
        //        company.FinancialManager = int.Parse( sel_financialManager.Value);
        //        company.HRManager = int.Parse( sel_HRManager.Value);
        //        company.LegalManager = int.Parse(sel_legal.Value);

              
        //        if(Session["user_id"] != null && Session["user_id"].ToString() != "")
        //            company.CreateUserID = company.UpdateUserID = int.Parse(Session["user_id"].ToString());

        //        if (!hid_companyID.Value.Equals(""))
        //            company.CompanyID = int.Parse(hid_companyID.Value);
        //        else
        //            company.CompanyID = 0;

        //        int companyId = company.SaveCompanyInfo(company);
        //        if (companyId != 0)
        //        {
        //            hid_companyID.Value = companyId.ToString();
        //            Response.Write("<script>alert('"+ Resources.Labels.SaveSuccessfully+"')</script>");
        //        }
        //    }
        //    catch { }
        //}
    }
}