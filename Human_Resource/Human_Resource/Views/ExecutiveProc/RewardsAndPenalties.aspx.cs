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
    public partial class RewardsAndPenalties : System.Web.UI.Page
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
            RewardModel dept = new RewardModel();

            var depts = dept.getActivity();
            if (textSearch != "")
                depts = depts.Where(x => 
                //x.Type.ToLower().Contains(textSearch.ToLower())
                                  x.Title.Contains(textSearch)
                                || x.Description.Contains(textSearch)
                                 || x.EmployeeName.ToLower().Contains(textSearch.ToLower())
                                 ).ToList();
            gv_data.DataSource = depts;


            //dept_type.DataSource = GetData.rewardsTypeList;
            //dept_type.DataValueField = "key";
            //dept_type.DataTextField = "value";



            EmployeeModel employeeModel = new EmployeeModel();
            List<EmployeeModel> employees = new List<EmployeeModel>();
            employees = employeeModel.GetHiredEmployees(true);
            emp.DataSource = employees;
            emp.DataValueField = "EmployeeID";
            if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                emp.DataTextField = "NameEn";
            else
                emp.DataTextField = "NameAr";


            DataBind();
        }
        [WebMethod(EnableSession = true)]
        //public static string SaveReward(string rewardId, string employeeId, string type, string title, string description,string value)
        public static string SaveReward(string rewardId, string employeeId,  string title, string description,string value)
        {
            try
            {
                RewardModel dept = new RewardModel();
                if (rewardId != "")
                    dept.RewardID = int.Parse(rewardId);
                else
                    dept.RewardID = 0;
                dept.EmployeeID = int.Parse(employeeId);
                //dept.Type = type;
                dept.Title = title;
                dept.Description = description;
                dept.Value = value;
 
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
        public static RewardModel GetReward(string ID)
        {
            try
            {
                RewardModel dept = new RewardModel();

                int rewardId = int.Parse(ID);
                dept = dept.getReward(rewardId);

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
                RewardModel dept = new RewardModel();
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