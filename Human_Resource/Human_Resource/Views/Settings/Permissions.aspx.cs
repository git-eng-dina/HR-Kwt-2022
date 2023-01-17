using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Settings
{
    public partial class Permissions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();

            }
        }

        private void BindData(string textSearch = "")
        {

            EmployeeModel employeeModel = new EmployeeModel();
            List<EmployeeModel> employees = new List<EmployeeModel>();
            employees = employeeModel.GetHiredEmployees(true);
            employees = employees.Where(x => x.EmployeeID != 1).ToList();

            var newEmp = new EmployeeModel() { NameAr = Resources.Labels.SelectHere,NameEn= Resources.Labels.SelectHere, EmployeeID = 0 };
            employees.Insert(0, newEmp);

            emp.DataSource = employees;
            emp.DataValueField = "EmployeeID";
            if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                emp.DataTextField = "NameEn";
            else
                emp.DataTextField = "NameAr";

            DataBind();

            #region display links
            appObjectsModel objectsModel = new appObjectsModel();
            var appObjects = objectsModel.GetAppObjects() ;
            foreach (var row in appObjects)
            {
                HtmlGenericControl li = new HtmlGenericControl("li");
               if( Session["CultureName"].ToString().ToLower() == "en-us")
                li.Attributes.Add("id", row.NameEn);
               else
                    li.Attributes.Add("id", row.NameAr);

                lst_links.Controls.Add(li);

            }
            #endregion
        }

        [WebMethod]
        public static EmployeeModel GetEmpInfo(string ID)
        {
            try
            {
                EmployeeModel emp = new EmployeeModel();

                long employeeID = long.Parse(ID);
                emp = emp.GetByID(employeeID);

                return emp;
            }
            catch
            {
                return null;

            }

        }
    }
}