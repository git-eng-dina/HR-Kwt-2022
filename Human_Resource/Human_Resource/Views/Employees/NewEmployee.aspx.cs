using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Globalization;
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
            if (!IsPostBack)
            {
                EmployeeModel emp = new EmployeeModel();
                JobModel job = new JobModel();
                CountriesNameModel country = new CountriesNameModel();
                DepartmentModel dept = new DepartmentModel();

                hid_emp_id.Value = Request.QueryString["uid"];

                sel_maritalStatus.DataSource = GetData.maritalStatusList;
                sel_maritalStatus.DataValueField = "Key";
                sel_maritalStatus.DataTextField = "Value";
                sel_maritalStatus.DataBind();

                sel_nationality.DataSource = country.get();
                sel_nationality.DataValueField = "CountriesNameID";
                if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                {
                    sel_nationality.DataTextField ="NameEN";
    
                }
                else
                {
                    sel_nationality.DataTextField = "NameAR";
                }

                sel_nationality.DataBind();

                sel_position.DataSource = job.GetActivity().OrderBy(x => x.Name);
                sel_position.DataTextField = "Name";
                sel_position.DataValueField = "JobID";
                sel_position.DataBind();

                sel_department.DataSource = dept.getActivity().OrderBy(x => x.Name);
                sel_department.DataTextField = "Name";
                sel_department.DataValueField = "DepartmentID";
                sel_department.DataBind();

                #region get employee info
                if(Request.QueryString["uid"] != null && Request.QueryString["uid"] != "")
                {
                    int empId = int.Parse(Request.QueryString["uid"]);
                    emp = emp.GetByID(empId);
                    #region fill inputs
                    txt_nameAR.Value = emp.NameAr;
                    txt_nameEN.Value = emp.NameEn;
                    dp_bod.Text = emp.DOB.ToString();
                    txt_mobile.Value = emp.Mobile;
                   
                    sel_maritalStatus.Value = emp.MaritalStatus;
                    sel_nationality.Value = emp.Nationality.ToString();
                    txt_blood.Value = emp.BloodType;
                    rd_gender.SelectedValue = emp.Gender;
                    txt_identityNumber.Value = emp.IdentityNumber;

                    
                    #region fill certificates
                    //certificate 1
                    txt_certificate1.Value = emp.EducationCertificate1;
                    dp_fromCer1.Value = emp.EducationCertificateFromDate1.ToString();
                    dp_toCer1.Value = emp.EducationCertificateToDate1.ToString();
                    if (emp.Certificate1 != null)
                    {
                        lbl_certificate1.Text = emp.Certificate1.docName;
                    }
                    //certificate 2
                    if(emp.EducationCertificate2 != "")
                    {
                        txt_certificate2.Value = emp.EducationCertificate2;
                        dp_fromCer2.Value = emp.EducationCertificateFromDate2.ToString();
                        dp_toCer2.Value = emp.EducationCertificateToDate2.ToString();
                        if (emp.Certificate2 != null)
                        {
                            lbl_certificate2.Text = emp.Certificate2.docName;
                        }
                    }
                    //certificate 3
                    if(emp.EducationCertificate3 != "")
                    {
                        txt_certificate3.Value = emp.EducationCertificate3;
                        dp_fromCer3.Value = emp.EducationCertificateFromDate3.ToString();
                        dp_toCer3.Value = emp.EducationCertificateToDate3.ToString();
                        if (emp.Certificate3 != null)
                        {
                            lbl_certificate3.Text = emp.Certificate3.docName;
                        }
                    }
                    #endregion

                    #region fill experiences
                    txt_experience1.Text = emp.WorkExperience1;
                    if(emp.WorkExperience2 !="")
                    {
                        txt_experience2.Text = emp.WorkExperience2;
                    }
                    if (emp.WorkExperience3 !="")
                    {
                        txt_experience3.Text = emp.WorkExperience3;
                    }
                    #endregion

                    #region fill job details
                    sel_position.Value = emp.JobID.ToString();
                    sel_department.Value = emp.DepartmentID.ToString();
                    txt_workHours.Value = emp.WorkHours.ToString();
                    txt_salary.Value = emp.BasicSalary.ToString();
                    if (emp.HiringDate != null)
                        txt_hiringDate.Value = emp.HiringDate.ToString();
                    txt_email.Value = emp.Email;
                    txt_vacationBalance.Value = emp.VacationsBalance.ToString();
                    txt_guarantor.Value = emp.Guarantor;
                    txt_jobDesc.Text = emp.JobDescription;
                    #endregion

                    #region fill passport info
                    txt_passportNo.Value = emp.PassportNumber;
                    dp_passportFromDate.Value = emp.PassportReleaseDate.ToString();
                    dp_passportEndDate.Value = emp.PassportExpiryDate.ToString();
                    txt_sequenceNum.Value = emp.Sequence;
                    txt_unifiedNum.Value = emp.UnifiedNumber;
                    #endregion

                    #endregion
                }
                #endregion

            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            //try
            {
                CultureInfo cultures = new CultureInfo("en-US");

                EmployeeModel employee = new EmployeeModel();
                if (hid_emp_id.Value == "")
                    employee.EmployeeID = 0;
                else
                    employee.EmployeeID = int.Parse(hid_emp_id.Value);

                employee.NameAr = txt_nameAR.Value;
                employee.NameEn = txt_nameEN.Value;

                employee.DOB = DateTime.ParseExact(dp_bod.Text, "yyyy-MM-dd", cultures);
            
                employee.Mobile = txt_mobile.Value;
                employee.MaritalStatus = sel_maritalStatus.Value;
                employee.Nationality = int.Parse(sel_nationality.Value);
                employee.BloodType = txt_blood.Value;
                employee.Gender = rd_gender.SelectedValue;
                employee.IdentityNumber = txt_identityNumber.Value;

                #region certificates
                employee.EducationCertificate1 = txt_certificate1.Value;
                //employee.EducationCertificateFromDate1 = DateTime.ParseExact(dp_fromCer1.Value, "dd/MM/yyyy", new CultureInfo(("en-US")));
                employee.EducationCertificateFromDate1 = DateTime.ParseExact(dp_fromCer1.Value, "yyyy-MM-dd", cultures);
                employee.EducationCertificateToDate1 = DateTime.ParseExact(dp_toCer1.Value, "yyyy-MM-dd", cultures);

                if (txt_certificate2.Value !="")
                {
                    employee.EducationCertificate2 = txt_certificate2.Value;
                    employee.EducationCertificateFromDate2 = DateTime.ParseExact(dp_fromCer2.Value, "yyyy-MM-dd", cultures);
                    employee.EducationCertificateToDate2 = DateTime.ParseExact(dp_toCer2.Value, "yyyy-MM-dd", cultures);

                }
                if (txt_certificate3.Value !="")
                {
                    employee.EducationCertificate3 = txt_certificate3.Value;
                    employee.EducationCertificateFromDate3 = DateTime.ParseExact(dp_fromCer3.Value, "yyyy-MM-dd", cultures);
                    employee.EducationCertificateToDate3 = DateTime.ParseExact(dp_toCer3.Value, "yyyy-MM-dd", cultures);
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
                employee.PassportReleaseDate = DateTime.ParseExact( dp_passportFromDate.Value, "yyyy-MM-dd", cultures);
                employee.PassportExpiryDate = DateTime.ParseExact( dp_passportEndDate.Value, "yyyy-MM-dd", cultures);
                employee.Sequence = txt_sequenceNum.Value;
                employee.UnifiedNumber = txt_unifiedNum.Value;

                if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                    employee.CreateUserID = employee.UpdateUserID = int.Parse(Session["user_id"].ToString());


                int empId = employee.SaveEmployee(employee);
                hid_emp_id.Value = empId.ToString();
                #region upload cerificates

                UploadFile(file_certificate1.FileName,empId,"cer1");
                if (txt_certificate2.Value != "")
                {
                    UploadFile(file_certificate2.FileName, empId, "cer2");
                }
                if (txt_certificate3.Value != "")
                {
                    UploadFile(file_certificate3.FileName, empId, "cer3");
                }
                #endregion
            }
            //catch { }
        }
        protected void UploadFile(string fileName,int empId,string tag)
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
            string extension = Path.GetExtension(fileName);
            var newFileName = HelpClass.MD5Hash(empId.ToString()) + "-" +tag;
            file_certificate1.SaveAs(folderPath + Path.GetFileName(newFileName));

           var attach =new  Attachment ()
            {
                docnum = newFileName,
                docName = Path.GetFileNameWithoutExtension( fileName),
                EmployeeID = empId,
            };
            attach.SaveAttach(attach);
            
        }
    }
}