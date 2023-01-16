using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
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
                ManagementModel management = new ManagementModel();

                hid_emp_id.Value = Request.QueryString["uid"];
                hdnButtonID.Value = btnSave.UniqueID;

                sel_maritalStatus.DataSource = GetData.maritalStatusList;
                sel_maritalStatus.DataValueField = "Key";
                sel_maritalStatus.DataTextField = "Value";
                sel_maritalStatus.DataBind();

                
                sel_nationality.DataValueField = "CountriesNameID";
                if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                {
                    sel_nationality.DataSource = country.get().OrderBy(x => x.NameEn);
                    sel_nationality.DataTextField ="NameEN";
    
                }
                else
                {
                    sel_nationality.DataSource = country.get().OrderBy(x => x.NameAr);
                    sel_nationality.DataTextField = "NameAR";
                }

                sel_nationality.DataBind();

                sel_position.DataSource = job.GetActivity().OrderBy(x => x.Name);
                sel_position.DataTextField = "Name";
                sel_position.DataValueField = "JobID";
                sel_position.DataBind();

                var managements = management.getActivity().OrderBy(x => x.Name).ToList();
                var newManag = new ManagementModel() { Name = Resources.Labels.SelectHere, ManagementID = 0 };
                managements.Insert(0,newManag);
                sel_management.DataSource = managements;
                sel_management.DataTextField = "Name";
                sel_management.DataValueField = "ManagementID";
                sel_management.DataBind();

                sel_department.DataTextField = "Name";
                sel_department.DataValueField = "DepartmentID";


                #region get employee info
                if (Request.QueryString["uid"] != null && Request.QueryString["uid"] != "")
                {
                    long empId = long.Parse(Request.QueryString["uid"]);
                    emp = emp.GetByID(empId);
                    #region fill inputs
                    txt_nameAR.Value = emp.NameAr;
                    txt_nameEN.Value = emp.NameEn;
                    if(emp.DOB != null)
                        dp_bod.Text = HelpClass.setDateFormat(emp.DOB.Value); 
                   txt_mobile.Value = emp.Mobile;
                   
                    if(emp.Image != null)
                        img_Emp.Src = "data:image;base64," + Convert.ToBase64String(emp.Image);

                    sel_maritalStatus.Value = emp.MaritalStatus;
                    sel_nationality.Value = emp.Nationality.ToString();
                    txt_blood.Value = emp.BloodType;
                    rd_gender.SelectedValue = emp.Gender;
                    txt_identityNumber.Value = emp.IdentityNumber;

                    
                    #region fill certificates
                    //certificate 1
                    txt_certificate1.Value = emp.EducationCertificate1;
                    if(emp.EducationCertificateFromDate1 != null)
                        dp_fromCer1.Text = HelpClass.setDateFormat(emp.EducationCertificateFromDate1.Value); 

                    if(emp.EducationCertificateToDate1 != null)
                        dp_toCer1.Text = HelpClass.setDateFormat(emp.EducationCertificateToDate1.Value);
                    if (emp.Certificate1 != null)
                    {
                        lbl_certificate1.Text = "";
                        hr_cer1.InnerHtml= emp.Certificate1.docName;
                        hr_cer1.HRef = "../../Upload/CV/"+ emp.Certificate1.docnum;
                    }
                    //certificate 2
                    if(emp.EducationCertificate2 != null)
                    {
                        frm_certificate2.Style.Add("visibility", "visible");
                        txt_certificate2.Value = emp.EducationCertificate2;
                        dp_fromCer2.Text = HelpClass.setDateFormat(emp.EducationCertificateFromDate2.Value);

                        dp_toCer2.Text = HelpClass.setDateFormat(emp.EducationCertificateToDate2.Value);
                        if (emp.Certificate2 != null)
                        {
                            lbl_certificate2.Text = "";
                            hr_cer2.InnerHtml = emp.Certificate2.docName;
                            hr_cer2.HRef = "../../Upload/CV/" + emp.Certificate2.docnum;
                        }
                    }


                    //certificate 3
                    if (emp.EducationCertificate3 != null)
                    {
                        frm_certificate3.Style.Add("visibility", "visible");

                        txt_certificate3.Value = emp.EducationCertificate3;
                        dp_fromCer3.Text = HelpClass.setDateFormat(emp.EducationCertificateFromDate3.Value);
                        dp_toCer3.Text = HelpClass.setDateFormat(emp.EducationCertificateToDate3.Value);
                        if (emp.Certificate3 != null)
                        {
                            lbl_certificate3.Visible = false;
                            hr_cer3.InnerHtml = emp.Certificate3.docName;
                            hr_cer3.HRef = "../../Upload/CV/" + emp.Certificate3.docnum;

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
                    sel_management.Value = emp.ManagementID.ToString();
                    sel_department.Value = emp.DepartmentID.ToString();
                    txt_IDNumber.Value = emp.IDNumber;
                    txt_workHours.Value = emp.WorkHours.ToString();
                    txt_salary.Value = emp.BasicSalary.ToString();
                    if (emp.HiringDate != null)
                    {
                        txt_hiringDate.Text = HelpClass.setDateFormat(emp.HiringDate.Value);
                    }
                    txt_email.Value = emp.Email;
                    txt_vacationBalance.Value = emp.VacationsBalance.ToString();
                    txt_guarantor.Value = emp.Guarantor;
                    txt_jobDesc.Text = emp.JobDescription;
                    if(emp.WorkPermit != null && emp.WorkPermit != "")
                    {
                        lbl_permit.Visible = false;
                        hrf_permit.InnerHtml = emp.WorkPermit;
                        hrf_permit.HRef = "../../Upload/WorkPermit/" + emp.WorkPermit;
                    }
                    if (emp.WorkContract != null && emp.WorkContract != "")
                    {
                        lbl_contract.Visible = false;
                        hrf_contract.InnerHtml = emp.WorkPermit;
                        hrf_contract.HRef = "../../Upload/WorkContract/" + emp.WorkContract;
                    }
                    #endregion

                    #region fill passport info
                    txt_passportNo.Value = emp.PassportNumber;

                    if (emp.PassportReleaseDate != null)
                    {
                        //dt = emp.PassportReleaseDate.Value.ToString().Split(' ');
                        dp_passportFromDate.Text = HelpClass.setDateFormat(emp.PassportReleaseDate.Value);
                    }
                    if (emp.PassportExpiryDate != null)
                    {
                        //dt = emp.PassportExpiryDate.Value.ToString().Split(' ');
                        dp_passportEndDate.Text = HelpClass.setDateFormat(emp.PassportExpiryDate.Value);
                    }
                    txt_sequenceNum.Value = emp.Sequence;
                    txt_unifiedNum.Value = emp.UnifiedNumber;
                    #endregion

                    #endregion
                }
                else
                {
                    frm_certificate2.Style.Add("visibility", "hidden");
                    frm_certificate3.Style.Add("visibility", "hidden");
                }
                #endregion

            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            //try
            {
                CultureInfo cultures = new CultureInfo("en-US");
                Attachment attachment = new Attachment();

                EmployeeModel employee = new EmployeeModel();
                if (hid_emp_id.Value == "")
                    employee.EmployeeID = 0;
                else
                    employee.EmployeeID = int.Parse(hid_emp_id.Value);

                #region personal info
                employee.NameAr = txt_nameAR.Value;
                employee.NameEn = txt_nameEN.Value;

                if (file_image.FileName != "")
                {
                   employee.Image = file_image.FileBytes;
                }
                var arrDOB = dp_bod.Text.Split('/');
                var d = new DateTime(int.Parse(arrDOB[2]), int.Parse(arrDOB[0]), int.Parse(arrDOB[1]));
                employee.DOB = d;

                employee.Mobile = txt_mobile.Value;
                employee.MaritalStatus = sel_maritalStatus.Value;
                employee.Nationality = int.Parse(sel_nationality.Value);
                employee.BloodType = txt_blood.Value;
                employee.Gender = rd_gender.SelectedValue;
                employee.IdentityNumber = txt_identityNumber.Value;

                #region certificates
                employee.EducationCertificate1 = txt_certificate1.Value;

                var arrFrom = dp_fromCer1.Text.Split('/');
                 d = new DateTime(int.Parse(arrFrom[2]), int.Parse(arrFrom[0]), int.Parse(arrFrom[1]));
                employee.EducationCertificateFromDate1 =d;
                var arrTo = dp_toCer1.Text.Split('/');
                d = new DateTime(int.Parse(arrTo[2]), int.Parse(arrTo[1]), int.Parse(arrTo[0]));
                employee.EducationCertificateToDate1 =d;

                if (txt_certificate2.Value !="")
                {
                    employee.EducationCertificate2 = txt_certificate2.Value;
                    employee.EducationCertificateFromDate2 = DateTime.ParseExact(dp_fromCer2.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture); 
                    employee.EducationCertificateToDate2 = DateTime.ParseExact(dp_toCer2.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture); 

                }
                if (txt_certificate3.Value !="")
                {
                    employee.EducationCertificate3 = txt_certificate3.Value;
                    employee.EducationCertificateFromDate3 = DateTime.ParseExact(dp_fromCer3.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                    employee.EducationCertificateToDate3 = DateTime.ParseExact(dp_toCer3.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture); 
                }
                #endregion
                employee.WorkExperience1 = txt_experience1.Text;
                employee.WorkExperience2 = txt_experience2.Text;
                employee.WorkExperience3 = txt_experience3.Text;

                #endregion

                #region work details
                employee.JobID =int.Parse( sel_position.Value);
                if(sel_management.Value != "" && int.Parse(sel_management.Value) != 0)
                    employee.ManagementID = int.Parse(sel_management.Value);
                if(sel_department.Value != "" && sel_department.Value != "0")
                    employee.DepartmentID = int.Parse(sel_department.Value);
                employee.IDNumber = txt_IDNumber.Value;
                if(txt_workHours.Value != "")
                    employee.WorkHours = int.Parse(txt_workHours.Value);
                employee.BasicSalary = decimal.Parse(txt_salary.Value);
                employee.Email = txt_email.Value;

                if (txt_hiringDate.Text != "")
                {
                    var arrhiring = txt_hiringDate.Text.Split('/');
                    d = new DateTime(int.Parse(arrhiring[2]), int.Parse(arrhiring[0]), int.Parse(arrhiring[1]));
                    employee.HiringDate = d;
                }

                if (txt_vacationBalance.Value != "")
                    employee.VacationsBalance = int.Parse(txt_vacationBalance.Value);
                employee.Guarantor = txt_guarantor.Value;
                employee.JobDescription = txt_jobDesc.Text;

               
                #endregion
                employee.PassportNumber = txt_passportNo.Value;

                var arr= dp_passportFromDate.Text.Split('/');
                d = new DateTime(int.Parse(arr[2]), int.Parse(arr[0]), int.Parse(arr[1]));
                employee.PassportReleaseDate = d;

                arr = dp_passportEndDate.Text.Split('/');
                d = new DateTime(int.Parse(arr[2]), int.Parse(arr[0]), int.Parse(arr[1]));
                employee.PassportExpiryDate = d;
                employee.Sequence = txt_sequenceNum.Value;
                employee.UnifiedNumber = txt_unifiedNum.Value;

                if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                    employee.CreateUserID = employee.UpdateUserID = int.Parse(Session["user_id"].ToString());

                #region delete previous certificates
                if (employee.EmployeeID != 0)
                    attachment.DeleteCertificateAttach(employee.EmployeeID);
                #endregion

                long empId = employee.SaveEmployee(employee);
                employee.EmployeeID = empId;
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

                #region upload work permit - contract
                if (permitFile.FileName != "" || contractFile.FileName != "")
                {
                    if (permitFile.FileName != "")
                            employee.WorkPermit = uploadFile(permitFile.FileName, empId, "permit", HelpClass.WorkPermit);
                    if (contractFile.FileName != "")
                        employee.WorkContract = uploadFile(contractFile.FileName, empId, "contract", HelpClass.WorkContract);

                    employee.SaveEmployee(employee);
                }

                #endregion

                HelpClass.ShowMessage(this.Page, Resources.Labels.SaveSuccessfully);
                //Response.Redirect("NewEmployee.aspx?uid="+ hid_emp_id.Value);
            }
            //catch { }
        }
        protected void UploadFile(string fileName,long empId,string tag)
        {
            //folder path to save uploaded file
            string folderPath = Server.MapPath(HelpClass.CVUpload);

            //Check whether Directory (Folder) exists, although we have created, if it si not created this code will check
            if (!Directory.Exists(folderPath))
            {
                //If folder does not exists. Create it.
                Directory.CreateDirectory(folderPath);
            }

            //save file in the specified folder and path
            string extension = Path.GetExtension(fileName);
            var newFileName = HelpClass.MD5Hash(empId.ToString()) + "-" +tag+extension;
            file_certificate1.SaveAs(folderPath + Path.GetFileName(newFileName));

           var attach =new  Attachment ()
            {
                docnum = newFileName,
                docName = Path.GetFileNameWithoutExtension( fileName),
                EmployeeID = empId,
            };
            attach.SaveAttach(attach);
            
        }


        private string uploadFile(string fileName, long empId, string tag,string folderPath1)
        {
            //folder path to save uploaded file
            string folderPath = Server.MapPath(folderPath1);

            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            //save file in the specified folder and path
            string extension = Path.GetExtension(fileName);
            var newFileName = HelpClass.MD5Hash(empId.ToString()) + "-" + tag + extension;
            permitFile.SaveAs(folderPath + Path.GetFileName(newFileName));

            return newFileName;
        }

        [WebMethod(EnableSession = true)]
        public static string GetDepartments(string ID)
        {
            try
            {
                DepartmentModel dept = new DepartmentModel();

               var depts = dept.getManagementDept(int.Parse(ID)).OrderBy(x => x.Name).ToList();
                var newDept = new DepartmentModel() { Name = Resources.Labels.SelectHere, DepartmentID = 0 };
                depts.Insert(0, newDept);
                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                var json = js.Serialize(depts.ToList());
                return json;
               
            }
            catch
            {
                return "";

            }

        }
    }
}