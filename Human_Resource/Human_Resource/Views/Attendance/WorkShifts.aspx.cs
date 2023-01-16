using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Attendance
{
    public partial class WorkShifts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData(Request.QueryString["my"]);
                btn_new.Attributes.Add("OnClick", "ShowDialog('');");
            }
        }

        protected void btn_Search_Click(object sender, EventArgs e)
        {
            try
            {
                string textSearch = txt_search.Value;
                string my = myPeriods.Value;
                BindData(my, textSearch);
            }
            catch { }
        }
        private void BindData(string my, string textSearch = "")
        {
            int empId = 0;
            if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                empId = int.Parse(HttpContext.Current.Session["user_id"].ToString());

            PeriodModel dept = new PeriodModel();

            var depts = dept.getActivity();
            depts = depts.Where(x => x.EmployeeID == empId).ToList();
            if (textSearch != "")
                depts = depts.Where(x =>
                                 x.Name.Contains(textSearch)
                                 ).ToList();
            gv_data.DataSource = depts;


          

            DataBind();
        }
        [WebMethod(EnableSession = true)]
        //public static string SavePeriod(string periodId,  string name,  string startTime,  string endTime)
        public static string SavePeriod(string periodId,  string name, string startTime, string endTime)
        {
            try
            {
                PeriodModel dept = new PeriodModel();
                if (periodId != "")
                    dept.PeriodID = int.Parse(periodId);
                else
                    dept.PeriodID = 0;
                dept.Name = name;
                dept.StartTime = DateTime.Parse(startTime);
                dept.EndTime = DateTime.Parse(endTime);

                if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                    dept.EmployeeID = dept.CreateUserID = dept.UpdateUserID = int.Parse(HttpContext.Current.Session["user_id"].ToString());


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
        public static PeriodModel GetPeriod(string ID)
        {
            try
            {
                PeriodModel dept = new PeriodModel();

                int periodId = int.Parse(ID);
                dept = dept.getPeriod(periodId);

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
                PeriodModel dept = new PeriodModel();
                long Ref = Convert.ToInt32(e.CommandArgument.ToString());

                long? userId = null;
                if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                    userId = dept.UpdateUserID = long.Parse(Session["user_id"].ToString());

                if (dept.DeleteDept(Ref, userId))
                {

                    Response.Write("<script>alert('" + Resources.Labels.DeleteSuccessfully + "')</script>");
                    BindData(Request.QueryString["my"]);
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