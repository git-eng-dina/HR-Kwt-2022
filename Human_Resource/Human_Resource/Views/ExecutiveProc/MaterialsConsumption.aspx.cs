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
    public partial class MaterialsConsumption : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
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
            MaterialsConsumptionModel dept = new MaterialsConsumptionModel();

            var depts = dept.getActivity();
            if (textSearch != "")
                depts = depts.Where(x => x.Type.ToLower().Contains(textSearch.ToLower())
                                || x.Details.Contains(textSearch)
                                 || x.EmployeeName.ToLower().Contains(textSearch.ToLower())
                                 ).ToList();
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

             
            DataBind();
        }
        [WebMethod(EnableSession = true)]
        public static string SaveMaterialsConsumption(string materialsConsumptionId, string type, string details, string employeeId)
        {
            try
            {
                MaterialsConsumptionModel dept = new MaterialsConsumptionModel();
                if (materialsConsumptionId != "")
                    dept.MaterialsConsumptionID = int.Parse(materialsConsumptionId);
                else
                    dept.MaterialsConsumptionID = 0;
                dept.Type = type;
                dept.Details = details;
                dept.EmployeeID = int.Parse(employeeId);
 
                if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                    dept.CreateUserID = dept.UpdateUserID = int.Parse(HttpContext.Current.Session["user_id"].ToString());


                long deptId = dept.SaveDept(dept);
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
        public static MaterialsConsumptionModel GetMaterialsConsumption(string ID)
        {
            try
            {
                MaterialsConsumptionModel dept = new MaterialsConsumptionModel();

                int materialsConsumptionId = int.Parse(ID);
                dept = dept.getMaterialsConsumption(materialsConsumptionId);

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
                MaterialsConsumptionModel dept = new MaterialsConsumptionModel();
                long Ref = Convert.ToInt32(e.CommandArgument.ToString());

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