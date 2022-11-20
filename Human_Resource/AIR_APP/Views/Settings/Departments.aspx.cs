using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Settings
{
    public partial class Departments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //UserModel user = new UserModel();
            //var users = user.GetAllUsers(1);
            //gv_departments.DataSource = users;
            //DataBind();

            btn_new.Attributes.Add("OnClick", "ShowDialog();");
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