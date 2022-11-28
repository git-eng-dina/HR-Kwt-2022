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
        public int CompanyID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public Nullable<int> VacationsBalance { get; set; }
        public Nullable<bool> WarningPeriod { get; set; }
        public string NameAr { get; set; }
        public string NameEn { get; set; }

        public Nullable<System.DateTime> DOB { get; set; }
        public string Gender { get; set; }
        public string MaritalStatus { get; set; }
        public string Nationality { get; set; }
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
        #endregion

        #region fixed lists
        public List<string> ArabicNationalities { get; } = new List<string>()
        {
            "بحريني",
            "مصري",
            "عراقي",
            "أردني",
            "كويتي",
            "لبناني",
            "ليبي",
            "موريتاني",
            "مغربي",
            "عماني",
            "فلسطيني",
            "قطري",
            "سعودي",
            "صومالي",
            "سوداني",
            "سوري",
            "اماراتي",
            "يمني",
        };
        public List<string> EngNationalities { get; } = new List<string>()
        {
            "بحريني",
            "مصري",
            "عراقي",
            "أردني",
            "كويتي",
            "لبناني",
            "ليبي",
            "موريتاني",
            "مغربي",
            "عماني",
            "فلسطيني",
            "قطري",
            "سعودي",
            "صومالي",
            "سوداني",
            "سوري",
            "اماراتي",
            "يمني",
        };
        public List<string> ArabicMaritalStatus { get; } = new List<string>()
        {
            "أعزب",
            "متزوج",

        };
        public List<string> EngMaritalStatus { get; } = new List<string>()
        {
            "أعزب",
            "متزوج",

        };

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
                            }).ToList();
                return user;
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