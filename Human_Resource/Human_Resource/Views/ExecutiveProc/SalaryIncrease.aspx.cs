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
    public partial class SalaryIncrease : System.Web.UI.Page
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
            SalaryIncreaseModel dept = new SalaryIncreaseModel();

            var depts = dept.getActivity();
            if (textSearch != "")
                depts = depts.Where(x => x.IncreaseType.ToLower().Contains(textSearch.ToLower())
                                || x.IncreaseValue.Contains(textSearch)
                                || x.Name.Contains(textSearch)
                                  ).ToList();
            gv_data.DataSource = depts;


            dept_increaseType.DataSource = GetData.increaseTypeList;
            dept_increaseType.DataValueField = "key";
            dept_increaseType.DataTextField = "value";


 


            DataBind();
        }
        [WebMethod(EnableSession = true)]
        public static string SaveSalaryIncrease(string salaryIncreaseId,  string increaseType, string increaseValue, string name)
        {
            try
            {
                SalaryIncreaseModel dept = new SalaryIncreaseModel();
                if (salaryIncreaseId != "")
                    dept.SalaryIncreaseID = int.Parse(salaryIncreaseId);
                else
                    dept.SalaryIncreaseID = 0;
                 dept.IncreaseType = increaseType;
                dept.IncreaseValue = increaseValue;
                dept.Name = name;

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
        public static void IncreaseTypeChanged(string increaseType)
        {
            //if (increaseType == "Physical" || increaseType == "Other")
            //    txt_nameIncreaseValue.Text = Resources.Labels.Name; 
            //else if (increaseType == "Cash")
            //    txt_nameIncreaseValue.Text = Resources.Labels.Amount; 
            //else if (increaseType == "Car")
            //    txt_nameIncreaseValue.Text = Resources.Labels.CarNumber; 
        }

        [WebMethod]
        public static SalaryIncreaseModel GetSalaryIncrease(string ID)
        {
            try
            {
                SalaryIncreaseModel dept = new SalaryIncreaseModel();

                int salaryIncreaseId = int.Parse(ID);
                dept = dept.getSalaryIncrease(salaryIncreaseId);

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
                SalaryIncreaseModel dept = new SalaryIncreaseModel();
                int Ref = Convert.ToInt32(e.CommandArgument.ToString());

                int? userId = null;
                if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                    userId = dept.UpdateUserID = int.Parse(Session["user_id"].ToString());

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