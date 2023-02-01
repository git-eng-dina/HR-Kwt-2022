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
    public partial class Custodies : System.Web.UI.Page
    {
        string linkName = "li_custodies";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            if (!IsPostBack)
            {
                long userId = long.Parse(Session["user_id"].ToString());

               var role = Session["urole"].ToString();
                if (role != "GeneralDirector" && userId != 1)
                {
                    List<UsersPermissionModel> permissions = Session["UserPermissions"] as List<UsersPermissionModel>;
                    var employeesPermissions = permissions.Where(x => x.LiElementName.Trim().ToLower() == linkName).FirstOrDefault();

                    if (employeesPermissions != null && employeesPermissions.EditObject == true)
                    {
                        btn_new.Visible = true;
                    }
                    else
                    {
                        btn_new.Visible = false;
                    }
                }

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
            CustodieModel dept = new CustodieModel();

            var depts = dept.getActivity();
            if (textSearch != "")
                depts = depts.Where(x => x.Type.ToLower().Contains(textSearch.ToLower())
                                || x.Details.Contains(textSearch)
                                 || x.EmployeeName.ToLower().Contains(textSearch.ToLower())
                                 ).ToList();
            gv_data.DataSource = depts;


            dept_type.DataSource = GetData.custodiesTypeList;
            dept_type.DataValueField = "key";
            dept_type.DataTextField = "value";



            EmployeeModel employeeModel = new EmployeeModel();
            List<EmployeeModel> employees = new List<EmployeeModel>();
            employees = employeeModel.GetHiredEmployees(true);
            emp.DataSource = employees;
            emp.DataValueField = "EmployeeID";
            if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                emp.DataTextField = "NameEn";
            else
                emp.DataTextField = "NameAr";

            long userId = long.Parse(Session["user_id"].ToString());

            var role = Session["urole"].ToString();
            if (role != "GeneralDirector" && userId != 1)
            {
                List<UsersPermissionModel> permissions = Session["UserPermissions"] as List<UsersPermissionModel>;
                var employeesPermissions = permissions.Where(x => x.LiElementName.Trim().ToLower() == linkName).FirstOrDefault();

                if (employeesPermissions != null && employeesPermissions.EditObject == true)
                {
                    btn_new.Visible = true;
                }
                else
                {
                    btn_new.Visible = false;
                }
            }

            DataBind();
        }
        protected void gv_data_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                long userId = long.Parse(Session["user_id"].ToString());

                 string role = Session["urole"].ToString();
                if (role != "GeneralDirector" && role != "CEO" && userId != 1)
                {
                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        var rowView = (CustodieModel)e.Row.DataItem;
                        if (rowView != null)
                        {
                            List<UsersPermissionModel> permissions = Session["UserPermissions"] as List<UsersPermissionModel>;
                            var employees = permissions.Where(x => x.LiElementName.Trim().ToLower() == linkName).FirstOrDefault();
                            LinkButton editBtn = (LinkButton)e.Row.FindControl("LinkProducts");
                            ImageButton deleteBtn = (ImageButton)e.Row.FindControl("Image1");
                            if (employees != null && employees.EditObject == true)
                            {
                                editBtn.Visible = true;
                                deleteBtn.Visible = true;
                            }
                            else
                            {
                                editBtn.Visible = false;
                                deleteBtn.Visible = false;
                            }
                        }
                    }
                }
            }
            catch
            { }
        }
        [WebMethod(EnableSession = true)]
        public static string SaveCustodie(string custodieId, string employeeId, string type, string details, string isRecovery)
        {
            try
            {
                CustodieModel dept = new CustodieModel();
                if (custodieId != "")
                    dept.CustodieID = int.Parse(custodieId);
                else
                    dept.CustodieID = 0;
                dept.EmployeeID = int.Parse(employeeId);
                dept.Type = type;
                dept.Details = details;
                dept.IsRecovery = bool.Parse(isRecovery);

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
        public static void TypeChanged(string type)
        {
            //if (type == "Physical" || type == "Other")
            //    txt_detailsTitle.Text = Resources.Labels.Details; 
            //else if (type == "Cash")
            //    txt_detailsTitle.Text = Resources.Labels.Amount; 
            //else if (type == "Car")
            //    txt_detailsTitle.Text = Resources.Labels.CarNumber; 
        }
        protected void TypeChanged(object sender, EventArgs e)
        {
            //if (type == "Physical" || type == "Other")
            //    txt_detailsTitle.Text = Resources.Labels.Details; 
            //else if (type == "Cash")
            //    txt_detailsTitle.Text = Resources.Labels.Amount; 
            //else if (type == "Car")
            //    txt_detailsTitle.Text = Resources.Labels.CarNumber; 
        }

        [WebMethod]
        public static CustodieModel GetCustodie(string ID)
        {
            try
            {
                CustodieModel dept = new CustodieModel();

                int custodieId = int.Parse(ID);
                dept = dept.getCustodie(custodieId);

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
                CustodieModel dept = new CustodieModel();
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

        protected void gv_data_RowCreated(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[5].Visible = false;
            e.Row.Cells[6].Visible = false;
        }
    }
}