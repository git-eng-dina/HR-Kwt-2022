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

            emp_id.Value = Request.QueryString["uid"];
            if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
            {
                sel_nationality.DataSource = emp.EngNationalities.OrderBy(x => x);
                sel_maritalStatus.DataSource = emp.EngMaritalStatus;
            }
            else
            {
                sel_nationality.DataSource = emp.ArabicNationalities.OrderBy(x => x);
                sel_maritalStatus.DataSource = emp.ArabicMaritalStatus;
            }

            sel_nationality.DataBind();
            sel_maritalStatus.DataBind();

            sel_position.DataSource = job.GetActivity().OrderBy(x => x.Name);
            sel_position.DataTextField = "Name";
            sel_position.DataValueField = "JobID";
            sel_position.DataBind();

            sel_department.DataSource = dept.getActivity().OrderBy(x => x.Name);
            sel_department.DataTextField = "Name";
            sel_department.DataValueField = "DepartmentID";
            sel_department.DataBind();
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            try
            {
                EmployeeModel employee = new EmployeeModel();
                if (emp_id.Value == "")
                    employee.EmployeeID = 0;
                else
                    employee.EmployeeID = int.Parse(emp_id.Value);

                employee.NameAr = txt_nameAR.Value;
                employee.NameEn = txt_nameEN.Value;
                employee.DOB = DateTime.Parse( dp_bod.Value);
                employee.Mobile = txt_mobile.Value;
                employee.MaritalStatus = sel_maritalStatus.Value;
                employee.Nationality = sel_nationality.Value;
                employee.BloodType = txt_blood.Value;
                employee.Gender = RadioButtonList1.SelectedValue;
                employee.IdentityNumber = txt_identityNumber.Value;
                #region certificates
                employee.EducationCertificate1 = txt_certificate1.Value;
                employee.EducationCertificateFromDate1 = DateTime.Parse(dp_fromCer1.Value);
                employee.EducationCertificateToDate1 = DateTime.Parse(dp_toCer1.Value);
                if(txt_certificate2.Value !="")
                {
                    employee.EducationCertificate2 = txt_certificate2.Value;
                    employee.EducationCertificateFromDate2 = DateTime.Parse(dp_fromCer2.Value);
                    employee.EducationCertificateToDate2 = DateTime.Parse(dp_toCer2.Value);
                }
                if (txt_certificate3.Value !="")
                {
                    employee.EducationCertificate3 = txt_certificate3.Value;
                    employee.EducationCertificateFromDate3 = DateTime.Parse(dp_fromCer3.Value);
                    employee.EducationCertificateToDate3 = DateTime.Parse(dp_toCer3.Value);
                }
                #endregion
                employee.WorkExperience1 = txt_experience1.Text;
                employee.WorkExperience2 = txt_experience2.Text;
                employee.WorkExperience3 = txt_experience3.Text;
                employee.JobID =int.Parse( sel_position.Value);
                employee.DepartmentID = int.Parse(sel_department.Value);
                employee.WorkHours = int.Parse(txt_workHours.Value);
                employee.BasicSalary = decimal.Parse(txt_salary.Value);
                employee.Email = txt_email.Value;
                employee.VacationsBalance = int.Parse(txt_vacationBalance.Value);
                employee.Guarantor = txt_guarantor.Value;
                employee.JobDescription = txt_jobDesc.Text;
                employee.PassportNumber = txt_passportNo.Value;
                employee.PassportReleaseDate = DateTime.Parse( dp_passportFromDate.Value);
                employee.PassportExpiryDate = DateTime.Parse( dp_passportEndDate.Value);
                employee.Sequence = txt_sequenceNum.Value;
                employee.UnifiedNumber = txt_unifiedNum.Value;

                if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                    employee.CreateUserID = employee.UpdateUserID = int.Parse(Session["user_id"].ToString());


                int empId = employee.SaveEmployee(employee);
               
            }
            catch { }
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