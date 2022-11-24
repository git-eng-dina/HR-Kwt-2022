using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Employees
{
    public partial class Employees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

                BindData();
                btn_new.Attributes.Add("OnClick", "NewEmployee();");
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
            EmployeeModel emp = new EmployeeModel();
            var employees = emp.GetHiredEmps(true);
            if (textSearch != "")
                employees = employees.Where(x => x.NameAr.ToLower().Contains(textSearch.ToLower())
                                || x.NameEn.ToLower().Contains(textSearch.ToLower())).ToList();
            gv_employees.DataSource = employees;
            DataBind();
        }
        protected void deletedatafromgrid(object sender, CommandEventArgs e)
        {

            try
            {
                int Ref = Convert.ToInt32(e.CommandArgument.ToString());
                //if (service.deletedatafromgird(Ref))
                //{

                //    Response.Write("<script>alert('La ligne a été supprimée')</script>");
                //    vadminservice.Contacts_Fact[] Data = service.Getallcontacts();
                //    BindDataSourceToGridview(Data);
                //}
                //else
                //{

                //    Response.Write("<script>alert('Row n'a pas été supprimé')</script>");
                //}
            }
            catch (Exception ex)
            {
            }
        }
    }
}