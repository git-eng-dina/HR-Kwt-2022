using System;
using System.Collections.Generic;
using System.IO;
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


        protected void UploadFile(object sender, EventArgs e)
        {
            //folder path to save uploaded file
            string folderPath = Server.MapPath("~/Upload/");

            //Check whether Directory (Folder) exists, although we have created, if it si not created this code will check
            if (!Directory.Exists(folderPath))
            {
                //If folder does not exists. Create it.
                Directory.CreateDirectory(folderPath);
            }

            //save file in the specified folder and path
            file_certificate1.SaveAs(folderPath + Path.GetFileName(file_certificate1.FileName));

            //once file is uploaded show message to user in label control
            lbl_certificate1.Text = Path.GetFileName(file_certificate1.FileName) + " has been uploaded.";
        }
    }
}