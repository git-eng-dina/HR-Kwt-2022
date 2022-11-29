using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource
{
    public class EmployeeModel
    {
        #region Attributes
        public int EmployeeID { get; set; }
        public Nullable<int> DepartmentID { get; set; }

        public string Username { get; set; }
        public string Password { get; set; }
        public Nullable<int> VacationsBalance { get; set; }
        public Nullable<bool> WarningPeriod { get; set; }
        public string NameAr { get; set; }
        public string NameEn { get; set; }

        public Nullable<System.DateTime> DOB { get; set; }
        public string Gender { get; set; }
        public string MaritalStatus { get; set; }
        public Nullable<int>  Nationality { get; set; }
        public string Religion { get; set; }
        public string BloodType { get; set; }
        public string Image { get; set; }
        public string IdentityType { get; set; }
        public string IdentityNumber { get; set; }
        public Nullable<System.DateTime> IdentityReleaseDate { get; set; }
        public Nullable<System.DateTime> IdentityExpiryDate { get; set; }
        public string PassportNumber { get; set; }
        public Nullable<System.DateTime> PassportReleaseDate { get; set; }
        public Nullable<System.DateTime> PassportExpiryDate { get; set; }
        public string PassportCountry { get; set; }
        public string Phone { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public Nullable<bool> NoConviction { get; set; }
        public string BankAccount { get; set; }
        public string BankName { get; set; }
        public Nullable<System.DateTime> HiringDate { get; set; }
        public string Sequence { get; set; }
        public string UnifiedNumber { get; set; }
        public string IBANNumber { get; set; }
        public string SWIFTCODE { get; set; }
        public string PaymentType { get; set; }
        public string EducationCertificate1 { get; set; }
        public Nullable<System.DateTime> EducationCertificateFromDate1 { get; set; }
        public Nullable<System.DateTime> EducationCertificateToDate1 { get; set; }
        public string EducationCertificateSource1 { get; set; }
        public string EducationCertificate2 { get; set; }
        public Nullable<System.DateTime> EducationCertificateFromDate2 { get; set; }
        public Nullable<System.DateTime> EducationCertificateToDate2 { get; set; }
        public string EducationCertificateSource2 { get; set; }
        public string EducationCertificate3 { get; set; }
        public Nullable<System.DateTime> EducationCertificateFromDate3 { get; set; }
        public Nullable<System.DateTime> EducationCertificateToDate3 { get; set; }
        public string EducationCertificateSource3 { get; set; }
        public string WorkExperience1 { get; set; }
        public string WorkExperience2 { get; set; }
        public string WorkExperience3 { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<decimal> BasicSalary { get; set; }
        public string TransportationCompensationType { get; set; }
        public string HousingCompensationType { get; set; }
        public Nullable<System.DateTime> ResidenceDate { get; set; }
        public Nullable<int> JobID { get; set; }
        public Nullable<int> WorkHours { get; set; }
        public string JobDescription { get; set; }

        public string Guarantor { get; set; }

        #endregion
        #region extra info
        public int Age { get; set; }
        public string Position { get; set; }
        public string AddedBy { get; set; }

        #endregion


        #region employee methods
        public employees GetUser(string userName, string password)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var user = entity.employees.Where(x => x.Username == userName && x.Password == password && x.IsActive == true).FirstOrDefault();
                return user;
            }
        }

        public List<EmployeeModel> GetHiredEmployees(bool isActive)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var user = entity.employees.Where(x => x.IsActive == isActive && x.HiringDate != null)
                            .Select(x => new EmployeeModel()
                            {
                                EmployeeID = x.EmployeeID,
                                IsActive = x.IsActive,
                                Username = x.Username,
                                NameAr = x.NameAr,
                                NameEn = x.NameEn,
                                BasicSalary = x.BasicSalary,
                                Position = x.jobs.Name,
                                AddedBy = entity.employees.Where(m => m.EmployeeID == x.CreateUserID).Select(m => m.NameAr).FirstOrDefault(),
                            }).ToList();
                return user;
            }
        }
        public List<EmployeeModel> GetUnHiredEmployees(bool isActive)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var user = entity.employees.Where(x => x.IsActive == isActive && x.HiringDate == null)
                            .Select(x => new EmployeeModel()
                            {
                                EmployeeID = x.EmployeeID,
                                IsActive = x.IsActive,
                                Username = x.Username,
                                NameAr = x.NameAr,
                                NameEn = x.NameEn,
                                BasicSalary = x.BasicSalary,
                                Position = x.jobs.Name,
                                AddedBy = entity.employees.Where(m => m.EmployeeID == x.CreateUserID).Select(m => m.NameAr).FirstOrDefault(),
                            }).ToList();
                return user;
            }
        }
        public int SaveEmployee(EmployeeModel employee)
        {
            try
            {
                employees emp;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (employee.EmployeeID.Equals(0))
                    {
                        emp = new employees()
                        {
                            NameAr = employee.NameAr,
                            NameEn = employee.NameEn,
                            DOB = employee.DOB,
                            Mobile = employee.Mobile,
                            MaritalStatus = employee.MaritalStatus,
                            Nationality = employee.Nationality,
                            BloodType = employee.BloodType,
                            Gender = employee.Gender,
                            IdentityNumber = employee.IdentityNumber ,
                            #region certificates
                            EducationCertificate1= employee.EducationCertificate1,
                            EducationCertificateFromDate1 = employee.EducationCertificateFromDate1,
                            EducationCertificateToDate1 = employee.EducationCertificateToDate1,

                            EducationCertificate2= employee.EducationCertificate2,
                            EducationCertificateFromDate2= employee.EducationCertificateFromDate2 ,
                            EducationCertificateToDate2 = employee.EducationCertificateToDate2,


                            EducationCertificate3 =employee.EducationCertificate3 ,
                            EducationCertificateFromDate3 =employee.EducationCertificateFromDate3,
                            EducationCertificateToDate3=employee.EducationCertificateToDate3 ,

                            #endregion
                            WorkExperience1 = employee.WorkExperience1 ,
                            WorkExperience2= employee.WorkExperience2 ,
                            WorkExperience3= employee.WorkExperience3,
                            JobID = employee.JobID ,
                            DepartmentID = employee.DepartmentID ,
                            WorkHours = employee.WorkHours,
                            BasicSalary = employee.BasicSalary ,
                            Email = employee.Email,
                            VacationsBalance = employee.VacationsBalance,
                            Guarantor = employee.Guarantor,
                            JobDescription= employee.JobDescription,
                            PassportNumber = employee.PassportNumber ,
                            PassportReleaseDate= employee.PassportReleaseDate,
                            PassportExpiryDate=employee.PassportExpiryDate,
                            Sequence= employee.Sequence ,
                            UnifiedNumber = employee.UnifiedNumber ,

                            CreateUserID =employee.CreateUserID ,
                            UpdateUserID = employee.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                    };
                        emp = entity.employees.Add(emp);
                    }
                    else
                    {
                        emp = entity.employees.Find(employee.EmployeeID);
                        emp.NameAr = employee.NameAr;
                        emp.NameEn = employee.NameEn;
                        emp.DOB = employee.DOB;
                        emp.Mobile = employee.Mobile;
                        emp.MaritalStatus = employee.MaritalStatus;
                        emp.Nationality = employee.Nationality;
                        emp.BloodType = employee.BloodType;
                        emp.Gender = employee.Gender;
                        emp.IdentityNumber = employee.IdentityNumber;
                        #region certificates
                        emp.EducationCertificate1 = employee.EducationCertificate1;
                        emp.EducationCertificateFromDate1 = employee.EducationCertificateFromDate1;
                        emp.EducationCertificateToDate1 = employee.EducationCertificateToDate1;
                        emp.EducationCertificate2 = employee.EducationCertificate2;
                        emp.EducationCertificateFromDate2 = employee.EducationCertificateFromDate2;
                        emp.EducationCertificateToDate2 = employee.EducationCertificateToDate2;


                        emp.EducationCertificate3 = employee.EducationCertificate3;
                        emp.EducationCertificateFromDate3 = employee.EducationCertificateFromDate3;
                        emp.EducationCertificateToDate3 = employee.EducationCertificateToDate3;

                        #endregion
                        emp.WorkExperience1 = employee.WorkExperience1;
                        emp.WorkExperience2 = employee.WorkExperience2;
                        emp.WorkExperience3 = employee.WorkExperience3;
                        emp.JobID = employee.JobID;
                        emp.DepartmentID = employee.DepartmentID;
                        emp.WorkHours = employee.WorkHours;
                        emp.BasicSalary = employee.BasicSalary;
                        emp.Email = employee.Email;
                        emp.VacationsBalance = employee.VacationsBalance;
                        emp.Guarantor = employee.Guarantor;
                        emp.JobDescription = employee.JobDescription;
                        emp.PassportNumber = employee.PassportNumber;
                        emp.PassportReleaseDate = employee.PassportReleaseDate;
                        emp.PassportExpiryDate = employee.PassportExpiryDate;
                        emp.Sequence = employee.Sequence;
                        emp.UnifiedNumber = employee.UnifiedNumber;

                        emp.UpdateUserID = employee.UpdateUserID;
                        emp.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return emp.EmployeeID;
            }

            catch
            {
                return 0;
            }
        }

        public bool DeleteEmp(int empId, int? userId)
        {
            try
            {
                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    var emp = entity.employees.Find(empId);
                    emp.IsActive = false;
                    emp.UpdateDate = DateTime.Now;
                    emp.UpdateUserID = userId;
                    entity.SaveChanges();
                }
                return true;
            }

            catch
            {
                return false;
            }
        }

        #endregion

    }
}