using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.ExecutiveProc
{
    public partial class Charity : System.Web.UI.Page
   {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var role = Session["urole"].ToString();
                if (role != "GeneralDirector" && role != "CEO")
                    btn_new.Visible = false;

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
            CharityModel dept = new CharityModel();

            var depts = dept.getActivity();
            if (textSearch != "")
                depts = depts.Where(x => x.Reason.ToLower().Contains(textSearch.ToLower())
                                || x.Details.Contains(textSearch)
                                 || x.EmployeeName.ToLower().Contains(textSearch.ToLower())
                                 ).ToList();
            foreach (var item in depts)
            {
                if (item.EmployeeID is null)
                    item.EmployeeID = 0;
            }
            gv_data.DataSource = depts;

 


            EmployeeModel employeeModel = new EmployeeModel();
            List<EmployeeModel> employees = new List<EmployeeModel>();
            employees = employeeModel.GetHiredEmployees(true);

            var _emp = new EmployeeModel();
            _emp.NameEn = _emp.NameAr = "-";
            employees.Insert(0, _emp);

            emp.DataSource = employees;
            emp.DataValueField = "EmployeeID";
            if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                emp.DataTextField = "NameEn";
            else
                emp.DataTextField = "NameAr";


            DataBind();
        }
        [WebMethod(EnableSession = true)]
        public static string SaveCharity(string charityId, string employeeId, string reason, string details, string amount)
        {
            try
            {
                CharityModel dept = new CharityModel();
                if (charityId != "")
                    dept.CharityID = int.Parse(charityId);
                else
                    dept.CharityID = 0;
                if (employeeId != "0")
                    dept.EmployeeID = int.Parse(employeeId);
                dept.Reason = reason;
                dept.Details = details;
                if (!string.IsNullOrEmpty(amount))
                    dept.Amount = decimal.Parse(amount);
                else
                    dept.Amount = 0;

                if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                    dept.CreateUserID = dept.UpdateUserID = int.Parse(HttpContext.Current.Session["user_id"].ToString());


                int deptId = dept.SaveDept(dept);
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
        public static CharityModel GetCharity(string ID)
        {
            try
            {
                CharityModel dept = new CharityModel();

                int charityId = int.Parse(ID);
                dept = dept.getCharity(charityId);

                return dept;
            }
            catch
            {
                return null;

            }

        }
        protected void deletedatafromgrid(object sender, CommandEventArgs e)
        {

            try
            {
                CharityModel dept = new CharityModel();
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