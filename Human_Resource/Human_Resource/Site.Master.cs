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
            Page.ClientScript.RegisterClientScriptInclude("messages.js", ResolveUrl("~/Scripts/messages.js"));


            //messages notification
            UpdateTimer_Tick(null,null);
            #region permissions
            applyPermissionOnLinks();
            #endregion

            #region load employee

            EmployeeModel employeeModel = new EmployeeModel();
            List<EmployeeModel> employees = new List<EmployeeModel>();
            employees = employeeModel.GetHiredEmployees(true);
            employees = employees.Where(x => x.EmployeeID != long.Parse(Session["user_id"].ToString())).ToList();

            var emp = new EmployeeModel() { EmployeeID = 0, NameAr = Resources.Labels.SelectHere,NameEn = Resources.Labels.SelectHere };
            employees.Insert(0, emp);

            sel_emp.DataSource = employees;
            sel_emp.DataValueField = "EmployeeID";
            if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                sel_emp.DataTextField = "NameEn";
            else
                sel_emp.DataTextField = "NameAr";

            sel_emp.DataBind();
            #endregion
        }

        protected void applyPermissionOnLinks()
        {
            long userId = long.Parse(HttpContext.Current.Session["user_id"].ToString());
            if (userId != 1)
            {
                var role = Session["urole"].ToString();
                #region only general director
                if (role == "GeneralDirector")
                {
                    li_resignations.Visible = true;
                    li_employeeDismissal.Visible = true;
                }
                else
                {
                    li_resignations.Visible = false;
                    li_employeeDismissal.Visible = false;
                }
                #endregion
                if (role == "GeneralDirector" || role == "CEO")
                {
                    li_rewardsPenalties.Visible = true;
                    li_permissions.Visible = true;
                }
                else
                {
                    li_rewardsPenalties.Visible = false;
                    li_permissions.Visible = false;

                }


                if (role == "GeneralDirector" || role == "CEO" || role == "HRManager" || role == "Advisor")
                {
                    li_basicInformation.Visible = true;

                    if (role == "Advisor")
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
                    || role == "ManagementManager" || role == "Supervisor")
                {

                    li_vacationReport.Visible = true;
                    li_employeesList.Visible = true;
                    if (role == "HRManager")
                    {
                        li_eventsApprove.Visible = false;
                    }
                    else
                    {
                        li_eventsApprove.Visible = true;

                    }
                }
                else if (role == "Advisor")
                {
                    li_employeesInfo.Visible = false;
                    li_expiredExports.Visible = false;
                    li_newEmployee.Visible = true;
                    li_permissions.Visible = true;
                }
                else
                {
                    li_vacationReport.Visible = false;
                    li_eventsApprove.Visible = false;
                    li_employeesList.Visible = false;
                    li_permissions.Visible = false;
                }

                #region view links according to special permissions
                if (role != "GeneralDirector")
                {
                    List<UsersPermissionModel> permissions = Session["UserPermissions"] as List<UsersPermissionModel>;

                    #region employees
                    bool employeeSection = false;

                    var employees = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_employeesinfo").FirstOrDefault();
                    if (employees != null && employees.ViewObject == true)
                    {
                        li_employeesInfo.Visible = true;
                        employeeSection = true;
                    }
                    else
                        li_employeesInfo.Visible = false;

                    var newEmployee = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_newemployee").FirstOrDefault();
                    if (newEmployee != null && newEmployee.ViewObject == true)
                    {
                        li_newEmployee.Visible = true;
                        employeeSection = true;
                    }
                    else
                        li_newEmployee.Visible = false;

                    var expiredPassport = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_expiredexports").FirstOrDefault();
                    if (expiredPassport != null && expiredPassport.ViewObject == true)
                    {
                        li_expiredExports.Visible = true;
                        employeeSection = true;
                    }
                    else
                        li_expiredExports.Visible = false;

                    if (!employeeSection)
                        li_employeesList.Visible = false;
                    else
                        li_employeesList.Visible = true;
                    #endregion

                    #region executiveProcedures
                    bool executiveProcedures = false;

                    var custodies = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_custodies").FirstOrDefault();
                    if (custodies != null && custodies.ViewObject == true)
                    {
                        li_custodies.Visible = true;
                        executiveProcedures = true;
                    }
                    else
                        li_custodies.Visible = false;

                    var eventsApprove = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_eventsapprove").FirstOrDefault();
                    if (eventsApprove != null && eventsApprove.ViewObject == true)
                    {
                        li_eventsApprove.Visible = true;
                        executiveProcedures = true;
                    }
                    else
                        li_eventsApprove.Visible = false;

                    var addTrainings = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_addtrainings").FirstOrDefault();
                    if (addTrainings != null && addTrainings.ViewObject == true)
                    {
                        li_addTrainings.Visible = true;
                        executiveProcedures = true;
                    }
                    else
                        li_addTrainings.Visible = false;

                    var penalties = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_rewardspenalties").FirstOrDefault();
                    if (penalties != null && penalties.ViewObject == true)
                    {
                        li_rewardsPenalties.Visible = true;
                        executiveProcedures = true;
                    }
                    else
                        li_rewardsPenalties.Visible = false;

                    var evaluation = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_staffevaluation").FirstOrDefault();
                    if (evaluation != null && evaluation.ViewObject == true)
                    {
                        li_staffEvaluation.Visible = true;
                        executiveProcedures = true;
                    }
                    else
                        li_staffEvaluation.Visible = false;

                    var charity = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_charity").FirstOrDefault();
                    if (charity != null && charity.ViewObject == true)
                    {
                        li_charity.Visible = true;
                        executiveProcedures = true;
                    }
                    else
                        li_charity.Visible = false;

                    if (!executiveProcedures)
                        li_executiveProcedures.Visible = false;
                    else
                        li_executiveProcedures.Visible = true;
                    #endregion

                    #region attendanceAndVacations
                    bool attendanceAndVacations = false;

                    var hourlyBills = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_hourlybills").FirstOrDefault();
                    if (hourlyBills != null && hourlyBills.ViewObject == true)
                    {
                        li_hourlyBills.Visible = true;
                        attendanceAndVacations = true;
                    }
                    else
                        li_hourlyBills.Visible = false;

                    var scheduleVacation = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_schedulevacation").FirstOrDefault();
                    if (scheduleVacation != null && scheduleVacation.ViewObject == true)
                    {
                        li_scheduleVacation.Visible = true;
                        attendanceAndVacations = true;
                    }
                    else
                        li_scheduleVacation.Visible = false;

                    var vacationReport = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_vacationreport").FirstOrDefault();
                    if (vacationReport != null && vacationReport.ViewObject == true)
                    {
                        li_vacationReport.Visible = true;
                        attendanceAndVacations = true;
                    }
                    else
                        li_vacationReport.Visible = false;

                    var workShifts = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_workshifts").FirstOrDefault();
                    if (workShifts != null && workShifts.ViewObject == true)
                    {
                        li_workShifts.Visible = true;
                        attendanceAndVacations = true;
                    }
                    else
                        li_workShifts.Visible = false;

                    var attendanceReport = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_attendancereport").FirstOrDefault();
                    if (attendanceReport != null && attendanceReport.ViewObject == true)
                    {
                        li_attendanceReport.Visible = true;
                        attendanceAndVacations = true;
                    }
                    else
                        li_attendanceReport.Visible = false;

                    //if (!attendanceAndVacations)
                    //    li_attendanceAndVacations.Visible = false;
                    //else
                    //    li_attendanceAndVacations.Visible = true;
                    #endregion

                    #region settings
                    bool settings = false;

                    var companyInfo = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_companyinfo").FirstOrDefault();
                    if (companyInfo != null && companyInfo.ViewObject == true)
                    {
                        li_companyInfo.Visible = true;
                        settings = true;
                    }
                    else
                        li_companyInfo.Visible = false;

                    var companyList = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_companylist").FirstOrDefault();
                    if (companyList != null && companyList.ViewObject == true)
                    {
                        li_companyList.Visible = true;
                        settings = true;
                    }
                    else
                        li_companyList.Visible = false;

                    var branches = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_branches").FirstOrDefault();
                    if (branches != null && branches.ViewObject == true)
                    {
                        li_branches.Visible = true;
                        settings = true;
                    }
                    else
                        li_branches.Visible = false;

                    var managements = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_managements").FirstOrDefault();
                    if (managements != null && managements.ViewObject == true)
                    {
                        li_managements.Visible = true;
                        settings = true;
                    }
                    else
                        li_managements.Visible = false;

                    var departments = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_departments").FirstOrDefault();
                    if (departments != null && departments.ViewObject == true)
                    {
                        li_departments.Visible = true;
                        settings = true;
                    }
                    else
                        li_departments.Visible = false;

                    var jobsTitle = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_jobstitle").FirstOrDefault();
                    if (jobsTitle != null && jobsTitle.ViewObject == true)
                    {
                        li_jobsTitle.Visible = true;
                        settings = true;
                    }
                    else
                        li_jobsTitle.Visible = false;

                    var vaccationTypes = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_vaccationtypes").FirstOrDefault();
                    if (vaccationTypes != null && vaccationTypes.ViewObject == true)
                    {
                        li_vaccationTypes.Visible = true;
                        settings = true;
                    }
                    else
                        li_vaccationTypes.Visible = false;

                    var devices = permissions.Where(x => x.LiElementName.Trim().ToLower() == "li_devices").FirstOrDefault();
                    if (devices != null && devices.ViewObject == true)
                    {
                        li_devices.Visible = true;
                        settings = true;
                    }
                    else
                        li_devices.Visible = false;

                    if (!settings)
                        li_basicInformation.Visible = false;
                    else
                        li_basicInformation.Visible = true;
                    #endregion


                }
                #endregion
            }
        }

        protected void UpdateTimer_Tick(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }

            long userId = long.Parse(Session["user_id"].ToString());

            Message msg = new Message();
            var messages = msg.GetUnReadMessagesCount(userId);

            if(messages == 0)
            {
                div_countNotification.Visible = false;
            }
            else if (messages > 9)
                div_countNotification.InnerHtml = "9+";
            else
                div_countNotification.InnerHtml = messages.ToString();

            #region vaccations count notification
            string role = Session["urole"].ToString();

            int vacationCount = 0;
            EmployeesVacationModel vac = new EmployeesVacationModel();
            if (role == "GeneralDirector" || role == "CEO")
            {
                vacationCount = vac.getNeedApproveCountForDirector();
            }
            else if (role == "Supervisor")
            {
                vacationCount = vac.getNeedApproveCountForSupervisor(userId);
            }
            else if (role == "ManagementManager")
            {
                vacationCount = vac.getNeedApproveCountForManagement(userId);
            }

            if (vacationCount == 0)
            {
                div_vacationsCount.Visible = false;
            }
            else if (vacationCount > 9)
                div_vacationsCount.InnerHtml = "9+";
            else
                div_vacationsCount.InnerHtml = vacationCount.ToString();
            #endregion

            #region resignation count notification
            if (role == "GeneralDirector")
            {
                ResignationModel resignation = new ResignationModel();
               int resCount = resignation.GetResignationCount();

                if (resCount == 0)
                {
                    div_resignationsCount.Visible = false;
                }
                else if (resCount > 9)
                    div_resignationsCount.InnerHtml = "9+";
                else
                    div_resignationsCount.InnerHtml = resCount.ToString();
                
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