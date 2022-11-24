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
            EmployeeModel emp = new EmployeeModel();
            var users = emp.GetHiredEmps(true);
            gv_employees.DataSource = users;
            DataBind();

            btn_new.Attributes.Add("OnClick", "NewEmployee();");
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