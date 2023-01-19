
using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Settings
{
    public partial class CompanyInfo : System.Web.UI.Page
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

                        #region fill Advisors
                        if (company.Advisors != null)
                        {
                            foreach (var adv in company.Advisors)
                            {
                                HtmlGenericControl li = new HtmlGenericControl("li");
                                li.Attributes.Add("id", adv.EmployeeID.ToString());
                                lst_employee.Controls.Add(li);

                                HtmlGenericControl span = new HtmlGenericControl("span");
                                span.Attributes.Add("class", "delete-row-span");
                                span.Attributes.Add("onClick", "delete-row-span");
                                li.Controls.Add(span);

                                HtmlGenericControl i = new HtmlGenericControl("i");
                                i.Attributes.Add("class", "fa fa-close delete-row-list");
                                span.Controls.Add(i);

                                HtmlGenericControl spanName = new HtmlGenericControl("span");
                                spanName.Attributes.Add("class", "value-list");
                                if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                                    spanName.InnerText = adv.NameEn;
                                else
                                    spanName.InnerText = adv.NameAr;

                                li.Controls.Add(spanName);
                            }
                        }
                        #endregion
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

            #region confirm Managers
            ConfirmModel confirm = new ConfirmModel();
         
            confirm.Role = "GeneralDirector";
            confirm.ConfirmType = "emp_hiring";
            confirm.CreateUserID = int.Parse(userId);
            confirm.UpdateUserID = int.Parse(userId);

            //confirm general director
            confirm.EmployeeID = int.Parse(GeneralDirector);
            confirm.AddConfirm(confirm); 
            //confirm CEO
            confirm.EmployeeID = int.Parse(CEO);
            confirm.AddConfirm(confirm);
            //confirm FinancialManager
            confirm.EmployeeID = int.Parse(FinancialManager);
            confirm.AddConfirm(confirm);
            //confirm HRManager
            confirm.EmployeeID = int.Parse(HRManager);
            confirm.AddConfirm(confirm);

            //confirm LegalManager
            confirm.EmployeeID = int.Parse(LegalManager);
            confirm.AddConfirm(confirm);

            //confirm advisors
            foreach (var v in advisors)
            {
                confirm.EmployeeID = v;
                confirm.AddConfirm(confirm);
            }
            #endregion

            #region refresh session 
            EmployeeModel emp = new EmployeeModel();
            HttpContext.Current.Session["urole"] = emp.getUserRole(int.Parse(userId));
            #endregion
            return companyId.ToString();

        }
 
    }
}