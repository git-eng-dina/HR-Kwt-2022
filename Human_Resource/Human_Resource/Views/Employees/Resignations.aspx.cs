using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Employees
{
    public partial class Resignations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            if (!IsPostBack)
            {
                ResignationModel resignation = new ResignationModel();
                List<EmployeeModel> employees = new List<EmployeeModel>();

                employees = resignation.GetResignationEmployees();

                var emp = new EmployeeModel() { EmployeeID = 0, NameAr = Resources.Labels.SelectHere, NameEn = Resources.Labels.SelectHere };
                employees.Insert(0, emp);

                sel_emp.DataSource = employees;
                sel_emp.DataValueField = "EmployeeID";
                if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                {
                    sel_emp.DataTextField = "NameEN";

                }
                else
                {
                    sel_emp.DataTextField = "NameAR";
                }

                sel_emp.DataBind();
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            ResignationModel resignation = new ResignationModel();

            resignation.ApproveDate = DateTime.Now;
            resignation.EmployeeID = long.Parse(sel_emp.Value);

            decimal dues = 0;
            if (txt_dues.Value != "")
                dues = decimal.Parse(txt_dues.Value);
            resignation.Dues = dues;
            resignation.VacationsAccount = decimal.Parse(hdn_vacationsAccountValue.Value);
            resignation.Reward = decimal.Parse(hdn_rewardValue.Value);

            resignation.ApprovalID = resignation.CreateUserID = resignation.UpdateUserID = long.Parse(Session["user_id"].ToString());

            resignation.ApproveResignation(resignation);

            Response.Redirect("Resignations.aspx");
        }

        protected void btn_reject_Click(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            ResignationModel resignation = new ResignationModel();

            resignation.ApproveDate = DateTime.Now;
            resignation.EmployeeID = long.Parse(sel_emp.Value);


            resignation.ApprovalID = resignation.CreateUserID = resignation.UpdateUserID = long.Parse(Session["user_id"].ToString());

            resignation.RejectResignation(resignation);

            Response.Redirect("Resignations.aspx");
        }

        [WebMethod]
        public static ResignationModel GetEmpInfo(string ID)
        {
            try
            {
                ResignationModel emp = new ResignationModel();

                long employeeID = long.Parse(ID);
                emp = emp.getResignationEmpInfo(employeeID);

                return emp;
            }
            catch
            {
                return null;

            }

        }
    }
}