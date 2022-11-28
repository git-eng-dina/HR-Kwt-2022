using Human_Resource.App_Code;
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
            DepartmentModel dept = new DepartmentModel();

            if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
            {
                nationality.DataSource = emp.EngNationalities.OrderBy(x => x);
                maritalStatus.DataSource = emp.EngMaritalStatus;
            }
            else
            {
                nationality.DataSource = emp.ArabicNationalities.OrderBy(x => x);
                maritalStatus.DataSource = emp.ArabicMaritalStatus;
            }

            nationality.DataBind();
            maritalStatus.DataBind();

            sel_position.DataSource = job.GetActivity().OrderBy(x => x.Name);
            sel_position.DataTextField = "Name";
            sel_position.DataValueField = "JobID";
            sel_position.DataBind();

            sel_department.DataSource = dept.getActivity().OrderBy(x => x.Name);
            sel_department.DataTextField = "Name";
            sel_department.DataValueField = "DepartmentID";
            sel_department.DataBind();
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