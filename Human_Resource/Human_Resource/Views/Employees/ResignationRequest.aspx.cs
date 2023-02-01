using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Employees
{
    public partial class ResignationRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }

            ResignationModel resignation = new ResignationModel();
            resignation = resignation.GetEmpResignation(long.Parse(Session["user_id"].ToString()));
            if(resignation != null)
            {
                li_requsetStatus.Visible = true;
                txt_reason.Text = resignation.Reason;
                txt_reason.Enabled = false;
                btn_save.Visible = false;
            }
            else
            {
                li_requsetStatus.Visible = false;
            }

        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            ResignationModel resignation = new ResignationModel();


            resignation.EmployeeID = long.Parse(Session["user_id"].ToString());
            resignation.Reason = txt_reason.Text;
            resignation.Type = "resignation";


            resignation.SaveResignation(resignation);

            Response.Redirect("ResignationRequest.aspx");
        }
    }
}