using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Attendance
{
    public partial class VaccaitionApproval : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                btn_new.Attributes.Add("OnClick", "ShowDialog('');");
            }
        }

        protected void btn_Search_Click(object sender, EventArgs e)
        {
            try
            {
                string textSearch = txt_search.Value;
                BindData(textSearch);
            }
            catch { }
        }
        private void BindData(string textSearch = "")
        {
            string role = Session["urole"].ToString();
            int userId = int.Parse(Session["user_id"].ToString());

            EmployeesVacationModel vac = new EmployeesVacationModel();
            List<EmployeesVacationModel> needApprove = new List<EmployeesVacationModel>();

            if (role == "GeneralDirector" || role == "CEO")
            {
                needApprove = vac.getNeedApproveForDirector();
            }
            else if (role == "Supervisor")
            {
                needApprove = vac.getNeedApproveForSupervisor(userId);
            }
            else if (role == "ManagementManager")
            {
                needApprove = vac.getNeedApproveForManagement(userId);
            }
            else
            {
                gv_approve_title.Visible = false;
                gv_needApprove.Visible = false;
                gv_Blank.Visible = false;
            }
           
            var depts = vac.getActivity(userId);
            if (textSearch != "")
            {
                needApprove = needApprove.Where(x => 
                                x.EmployeeName.ToLower().Contains(textSearch.ToLower())
                                || x.VacationName.ToLower().Contains(textSearch.ToLower())
                                || x.VacationsBalance.ToString().Contains(textSearch.ToLower())
                                ).ToList();

                depts = depts.Where(x =>
                                  x.EmployeeName.ToLower().Contains(textSearch.ToLower())
                                  || x.VacationName.ToLower().Contains(textSearch.ToLower())
                                   || x.VacationsBalance.ToString().Contains(textSearch.ToLower())
                                 ).ToList();
            }
            gv_needApprove.DataSource = needApprove;
            gv_data.DataSource = depts;


            EmployeeModel employeeModel = new EmployeeModel();
            List<EmployeeModel> employees = new List<EmployeeModel>();
            employees = employeeModel.GetHiredEmployees(true);
            emp.DataSource = employees;
            emp.DataValueField = "EmployeeID";
            if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                emp.DataTextField = "NameEn";
            else
                emp.DataTextField = "NameAr";

            VacationModel vacationModel = new VacationModel();
            List<VacationModel> vacations = new List<VacationModel>();
            vacations = vacationModel.GetActivity();
            this.vac.DataSource = vacations;
            this.vac.DataValueField = "VacationID";
            this.vac.DataTextField = "Name";


            DataBind();
            var vacBalance = employeeModel.GetVaccationBalance(userId);
            lbl_balance.Text = vacBalance.ToString();
        }

        protected void gv_approve_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                var rowView = (EmployeesVacationModel)e.Row.DataItem;
                if (rowView != null)
                {
                    var approved = rowView.Approved;
                    if (approved == true)
                    {
                        LinkButton approveBtn = (LinkButton)e.Row.FindControl("approveVac");
                        approveBtn.Visible = false;

                        e.Row.CssClass = "acceptedRow";
                    }
                    else if (approved == false)
                    {
                        LinkButton rejectBtn = (LinkButton)e.Row.FindControl("rejectVac");
                        rejectBtn.Visible = false;

                        e.Row.CssClass = "rejectedRow";

                    }
                    else
                        e.Row.CssClass = "normalRow";
                }
            }
        }

        protected void gv_data_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                var rowView = (EmployeesVacationModel)e.Row.DataItem;
                if (rowView != null)
                {
                    var approved = rowView.Approved;
                    if (approved == true)
                    {
                        LinkButton editBtn = (LinkButton)e.Row.FindControl("btnEdit");
                        editBtn.Visible = false;
                        ImageButton delBtn = (ImageButton)e.Row.FindControl("btnDelete");
                        delBtn.Visible = false;

                        e.Row.CssClass = "acceptedRow";
                    }
                    else if (approved == false)
                    {

                       e.Row.CssClass = "rejectedRow";

                    }
                    else
                        e.Row.CssClass = "normalRow";
                }
            }
        }
        [WebMethod(EnableSession = true)]
        public static string SaveEmployeesVacation(string employeesVacationId, string employeeId,string vacationId, string fromDate, string toDate)
        {
            try
            {
                CultureInfo cultures = new CultureInfo("en-US");

                EmployeesVacationModel dept = new EmployeesVacationModel();
                if (employeesVacationId != "")
                    dept.EmployeesVacationID = int.Parse(employeesVacationId);
                else
                    dept.EmployeesVacationID = 0;
                dept.EmployeeID = int.Parse(employeeId);
                dept.VacationID = int.Parse(vacationId);
                dept.FromDate = DateTime.ParseExact(fromDate, "MM/dd/yyyy", cultures);
                dept.ToDate = DateTime.ParseExact(toDate, "MM/dd/yyyy", cultures) ;

                if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                    dept.CreateUserID = dept.UpdateUserID = int.Parse(HttpContext.Current.Session["user_id"].ToString());


                long deptId = dept.SaveVacation(dept);
                if (deptId != 0)
                {
                    return "1";
                }
                return "0";

            }
            catch
            {
                return "0";

            }

        }

        [WebMethod]
        public static EmployeesVacationModel GetEmployeesVacation(string ID)
        {
            try
            {
                EmployeesVacationModel dept = new EmployeesVacationModel();

                int employeesVacationId = int.Parse(ID);
                dept = dept.getEmployeesVacation(employeesVacationId);

                return dept;
            }
            catch
            {
                return null;

            }

        }
        [WebMethod(EnableSession = true)]
        public static void Approve(string employeeVacationID, string userID)
        {
            try
            {
                EmployeesVacationModel confirm = new EmployeesVacationModel();
                confirm.EditApprove(int.Parse(employeeVacationID), true, int.Parse(userID));
            }
            catch
            {

            }

        }

        [WebMethod(EnableSession = true)]
        public static void Reject(string employeeVacationID, string userID)
        {
            try
            {
                EmployeesVacationModel confirm = new EmployeesVacationModel();
                confirm.EditApprove(int.Parse(employeeVacationID), false, int.Parse(userID));
            }
            catch
            {

            }

        }
        protected void deletedatafromgrid(object sender, CommandEventArgs e)
        {

            try
            {
                EmployeesVacationModel dept = new EmployeesVacationModel();
                int Ref = Convert.ToInt32(e.CommandArgument.ToString());

                long? userId = null;
                if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                    userId = dept.UpdateUserID = long.Parse(Session["user_id"].ToString());

                if (dept.DeleteDept(Ref, userId))
                {

                    Response.Write("<script>alert('" + Resources.Labels.DeleteSuccessfully + "')</script>");
                    BindData();
                }
                else
                {

                    Response.Write("<script>alert('" + Resources.Labels.ErrorOccured + "')</script>");
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}