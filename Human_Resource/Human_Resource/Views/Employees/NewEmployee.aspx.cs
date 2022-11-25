using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Employees
{
    public partial class NewEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EmployeeModel emp = new EmployeeModel();
            JobModel job = new JobModel();

            nationality.DataSource = emp.Nationalities.OrderBy(x => x);
            nationality.DataBind();

            //sel_position.DataSource = job.GetJobs();
            //sel_position.DataTextField = "Name";
            //sel_position.DataValueField = "JobID";
            //sel_position.DataBind();
        }
    }
}