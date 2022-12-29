using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Employees
{
    public partial class EmpTrainings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
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
            TrainingModel dept = new TrainingModel();
            if (!string.IsNullOrWhiteSpace( Session["user_id"].ToString()))
            {
                int userId = int.Parse(Session["user_id"].ToString());
           
                var depts = dept.getEmployeeTraining(userId);
                if (textSearch != "")
                    depts = depts.Where(x => x.Name.Contains(textSearch)
                                    || x.Description.Contains(textSearch)
                                     ).ToList();
                gv_data.DataSource = depts;



                DataBind();
            }
        }

      
    }
}