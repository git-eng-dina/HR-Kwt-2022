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
                BindData(Request.QueryString["my"]);
                btn_new.Attributes.Add("OnClick", "ShowDialog('');");
            }
        }

        protected void btn_Search_Click(object sender, EventArgs e)
        {
            try
            {
                string textSearch = txt_search.Value;
                string my = myPenalties.Value;
                BindData(my,textSearch);
            }
            catch { }
        }
        private void BindData(string my,string textSearch = "")
        {
            RewardModel dept = new RewardModel();
            if (my != "1")
            {
                var penalties = new List<RewardModel>();
                if (Session["urole"].ToString() == "GeneralDirector" || Session["urole"].ToString() == "CEO")
                    penalties = dept.getActivity();
                else if (Session["urole"].ToString() == "Supervisor")
                    penalties = dept.getBranchEmpPenalties(int.Parse(Session["user_id"].ToString()));
                else if (Session["urole"].ToString() == "ManagementManager")
                    penalties = dept.getManagementEmpPenalties(int.Parse(Session["user_id"].ToString()));
                
                if (textSearch != "")
                    penalties = penalties.Where(x =>
                                      x.Title.Contains(textSearch)
                                    || x.Description.Contains(textSearch)
                                     || x.EmployeeName.ToLower().Contains(textSearch.ToLower())
                                     ).ToList();
                gv_data.DataSource = penalties;


                EmployeeModel employeeModel = new EmployeeModel();
                List<EmployeeModel> employees = new List<EmployeeModel>();
                employees = employeeModel.GetHiredEmployees(true);
                emp.DataSource = employees;
                emp.DataValueField = "EmployeeID";
                if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                    emp.DataTextField = "NameEn";
                else
                    emp.DataTextField = "NameAr";

                gv_myPenalties.Visible = false;
                gv_myPenalties_title.Visible = false;

            }
            else
            {
                gv_data.Visible = false;
                gv_data_title.Visible = false;
                btn_new.Visible = false;

                var myPenalities = dept.getEmpPenalties(int.Parse(Session["user_id"].ToString()));
                if (textSearch != "")
                    myPenalities = myPenalities.Where(x =>
                                      x.Title.Contains(textSearch)
                                    || x.Description.Contains(textSearch)
                                     || x.EmployeeName.ToLower().Contains(textSearch.ToLower())
                                     ).ToList();
                gv_myPenalties.DataSource = myPenalities;
            }

            DataBind();
        }
        [WebMethod(EnableSession = true)]
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