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
            AppObjectModel objectsModel = new AppObjectModel();
            var appObjects = objectsModel.GetAppObjects() ;
            foreach (var row in appObjects)
            {
                HtmlGenericControl div = new HtmlGenericControl("div");

                div.Attributes.Add("id", row.AppObjectID.ToString());
                div.Attributes.Add("class", "row object");


                HtmlGenericControl spanName = new HtmlGenericControl("span");
                spanName.Attributes.Add("class", "value-list");
                if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                    spanName.InnerText = row.NameEn;
                else
                    spanName.InnerText = row.NameAr;

                div.Controls.Add(spanName);

                #region details div
                HtmlGenericControl detailsDiv = new HtmlGenericControl("div");
                detailsDiv.Attributes.Add("class", "details");
                
                HtmlGenericControl i = new HtmlGenericControl("i");
                i.Attributes.Add("class", "fa fa-eye hidden permission-icon");
                detailsDiv.Controls.Add(i);

                i = new HtmlGenericControl("i");
                i.Attributes.Add("class", "fa fa-edit hidden permission-icon");
                detailsDiv.Controls.Add(i);

                div.Controls.Add(detailsDiv);
                #endregion

                lst_links.Controls.Add(div);

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

        [WebMethod]
        public static List<UsersPermissionModel> GetEmpPermissions(string ID)
        {
            try
            {
                UsersPermissionModel empModel = new UsersPermissionModel();

                long employeeID = long.Parse(ID);
                var emp = empModel.getEmployeePermission(employeeID);

                return emp;
            }
            catch
            {
                return null;

            }

        }
    }
}