using Human_Resource.App_Code;
using LinqKit;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace Human_Resource
{
    public class PassportStatus
    {
        #region Attributes
        public int PassportCount { get; set; }
        public string Status { get; set; }
        #endregion

        #region Methods

        //Active - Expired
        public List<PassportStatus> getPassportCountForDirector()
        {
            List<PassportStatus> result = new List<PassportStatus>();
            var now = DateTime.Now.Date;

            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var searchPredicate = PredicateBuilder.New<employees>();

                searchPredicate = searchPredicate.And(x => x.IsActive == true);
                searchPredicate = searchPredicate.And(x => entity.confirms.Any(y => y.EmployeeID == x.EmployeeID
                            && (y.Role == "HRManager" || y.Role == "GeneralDirector" || y.Role == "CEO")
                            && y.ConfirmType == "emp_hiring"));               

                var user = entity.employees.Where(searchPredicate)
                            .Select(x => new EmployeeModel()
                            {
                                EmployeeID = x.EmployeeID,
 
                              PassportExpiryDate = x.PassportExpiryDate,
                            }).ToList();

                var expiredCount = user.Where(x => x.PassportExpiryDate < now).Count();
                if (expiredCount > 0)
                    result.Add(new PassportStatus() { Status = "Expired", PassportCount = expiredCount });

                 var activeCount = user.Where(x => x.PassportExpiryDate >= now).Count();
                if (activeCount > 0)
                    result.Add(new PassportStatus() { Status = "Active", PassportCount = activeCount });


                return result;
            }
        }
        public List<PassportStatus> getPassportCountForSupervisor(int supervisorId)
        {
            List<PassportStatus> result = new List<PassportStatus>();
            var now = DateTime.Now.Date;

            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var searchPredicate = PredicateBuilder.New<employees>();

                searchPredicate = searchPredicate.And(x => x.IsActive == true);
                searchPredicate = searchPredicate.And(x => entity.confirms.Any(y => y.EmployeeID == x.EmployeeID
                            && (y.Role == "HRManager" || y.Role == "GeneralDirector" || y.Role == "CEO")
                            && y.ConfirmType == "emp_hiring"));              
                searchPredicate = searchPredicate.And(x => x.managements.branches.ManagerID == supervisorId);              

                var user = entity.employees.Where(searchPredicate)
                            .Select(x => new EmployeeModel()
                            {
                                EmployeeID = x.EmployeeID,
 
                              PassportExpiryDate = x.PassportExpiryDate,
                            }).ToList();

                var expiredCount = user.Where(x => x.PassportExpiryDate < now).Count();
                if (expiredCount > 0)
                    result.Add(new PassportStatus() { Status = "Expired", PassportCount = expiredCount });

                 var activeCount = user.Where(x => x.PassportExpiryDate >= now).Count();
                if (activeCount > 0)
                    result.Add(new PassportStatus() { Status = "Active", PassportCount = activeCount });


                return result;
            }
        }
        public List<PassportStatus> getPassportCountForManagement(int managerId)
        {
            List<PassportStatus> result = new List<PassportStatus>();
            var now = DateTime.Now.Date;

            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var searchPredicate = PredicateBuilder.New<employees>();

                searchPredicate = searchPredicate.And(x => x.IsActive == true);
                searchPredicate = searchPredicate.And(x => entity.confirms.Any(y => y.EmployeeID == x.EmployeeID
                            && (y.Role == "HRManager" || y.Role == "GeneralDirector" || y.Role == "CEO")
                            && y.ConfirmType == "emp_hiring"));              
                searchPredicate = searchPredicate.And(x => x.managements.ManagerID == managerId);              

                var user = entity.employees.Where(searchPredicate)
                            .Select(x => new EmployeeModel()
                            {
                                EmployeeID = x.EmployeeID,
 
                              PassportExpiryDate = x.PassportExpiryDate,
                            }).ToList();

                var expiredCount = user.Where(x => x.PassportExpiryDate < now).Count();
                if (expiredCount > 0)
                    result.Add(new PassportStatus() { Status = "Expired", PassportCount = expiredCount });

                 var activeCount = user.Where(x => x.PassportExpiryDate >= now).Count();
                if (activeCount > 0)
                    result.Add(new PassportStatus() { Status = "Active", PassportCount = activeCount });


                return result;
            }
        }
        #endregion
    }
    public class EmployeeModel
    {
        #region Attributes
        public long EmployeeID { get; set; }
        public Nullable<int> DepartmentID { get; set; }
        public Nullable<long> ManagementID { get; set; }

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
        public byte[] Image { get; set; }
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
        public Nullable<long> CreateUserID { get; set; }
        public Nullable<long> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<decimal> BasicSalary { get; set; }
        public string TransportationCompensationType { get; set; }
        public string HousingCompensationType { get; set; }
        public Nullable<System.DateTime> ResidenceDate { get; set; }
        public Nullable<int> JobID { get; set; }
        public Nullable<int> WorkHours { get; set; }
        public string JobDescription { get; set; }

        public string Guarantor { get; set; }
        public string IDNumber { get; set; }

        public string WorkPermit { get; set; }
        public string WorkContract { get; set; }
        public Nullable<bool> IsBarcodeUser { get; set; }

        #endregion
        #region extra info
        public int Age { get; set; }
        public string Position { get; set; }
        public string DepartmentName { get; set; }
        public string ManagementName { get; set; }
        public string AddedBy { get; set; }
        public Attachment Certificate1 { get; set; }
        public Attachment Certificate2 { get; set; }
        public Attachment Certificate3 { get; set; }

        #endregion


        #region employee methods

        #region account methods
        public employees GetUser(string userName, string password)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var user = entity.employees.Where(x => x.Username == userName && x.Password == password && x.IsActive == true).FirstOrDefault();
                return user;
            }
        }

        public EmployeeModel GetAccountInfo(int empID)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var user = entity.employees.Where(x => x.EmployeeID == empID)
                    .Select(x => new EmployeeModel()
                    {
                        Username = x.Username,
                        IsBarcodeUser = x.IsBarcodeUser,
                    }).FirstOrDefault();
                return user;
            }
        }
        public bool ValidateUserName(int empID, string userName)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var found = entity.employees.Where(x => x.Username == userName && x.EmployeeID != empID).FirstOrDefault();
                if (found != null)
                    return false;
            }
            return true;
        }
        public void SaveAccount(EmployeeModel employee)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var emp = entity.employees.Find(employee.EmployeeID);
                emp.Username = employee.Username;
                emp.Password = employee.Password;
                emp.IsBarcodeUser = employee.IsBarcodeUser;
                emp.UpdateDate = DateTime.Now;
                emp.UpdateUserID = employee.UpdateUserID;

                entity.SaveChanges();
            }
        }
        public string getUserRole(long empId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var emp = entity.companies.Where(x => x.GeneralDirector == empId).FirstOrDefault();
                if (emp != null)
                    return "GeneralDirector";

                emp = entity.companies.Where(x => x.CEO == empId).FirstOrDefault();
                if (emp != null)
                    return "CEO";

                emp = entity.companies.Where(x => x.FinancialManager == empId).FirstOrDefault();
                if (emp != null)
                    return "FinancialManager";

                emp = entity.companies.Where(x => x.HRManager == empId).FirstOrDefault();
                if (emp != null)
                    return "HRManager";

                var branch = entity.branches.Where(x => x.ManagerID == empId).FirstOrDefault();
                if (branch != null)
                    return "Supervisor";

                var management = entity.managements.Where(x => x.ManagerID == empId).FirstOrDefault();
                if (management != null)
                    return "ManagementManager";

                

                var dept = entity.departments.Where(x => x.ManagerID == empId).FirstOrDefault();
                if (dept != null)
                    return "DepartmentManager";

                var higherMnager = entity.highrManagment.Where(x => x.EmployeeID == empId).FirstOrDefault();
                if (higherMnager != null)
                    return "Advisor";


            }
            return "Employee";
        }
        #endregion
        public EmployeeModel GetByID(long empId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var employee = entity.employees.Where(x => x.EmployeeID == empId )
                    .Select(x => new EmployeeModel()
                    {
                        NameAr = x.NameAr,
                        NameEn = x.NameEn,
                        DOB = x.DOB,
                        Image = x.Image,
                        Mobile = x.Mobile,
                        MaritalStatus = x.MaritalStatus,
                        Nationality = x.Nationality,
                        BloodType = x.BloodType,
                        Gender = x.Gender,
                        IdentityNumber = x.IdentityNumber,
                        #region certificates
                        EducationCertificate1 = x.EducationCertificate1,
                        EducationCertificateFromDate1 = x.EducationCertificateFromDate1,
                        EducationCertificateToDate1 = x.EducationCertificateToDate1,

                        EducationCertificate2 = x.EducationCertificate2,
                        EducationCertificateFromDate2 = x.EducationCertificateFromDate2,
                        EducationCertificateToDate2 = x.EducationCertificateToDate2,


                        EducationCertificate3 = x.EducationCertificate3,
                        EducationCertificateFromDate3 = x.EducationCertificateFromDate3,
                        EducationCertificateToDate3 = x.EducationCertificateToDate3,

                        #endregion
                        WorkExperience1 = x.WorkExperience1,
                        WorkExperience2 = x.WorkExperience2,
                        WorkExperience3 = x.WorkExperience3,
                        JobID = x.JobID,
                        ManagementID = x.ManagementID,
                        DepartmentID = x.DepartmentID,
                        WorkHours = x.WorkHours,
                        BasicSalary = x.BasicSalary,
                        Email = x.Email,
                        VacationsBalance = x.VacationsBalance,
                        Guarantor = x.Guarantor,
                        JobDescription = x.JobDescription,
                        WorkPermit=x.WorkPermit,
                        WorkContract=x.WorkContract,
                        PassportNumber = x.PassportNumber,
                        PassportReleaseDate = x.PassportReleaseDate,
                        PassportExpiryDate = x.PassportExpiryDate,
                        Sequence = x.Sequence,
                        UnifiedNumber = x.UnifiedNumber,
                        IDNumber = x.IDNumber,
                        CreateUserID = x.CreateUserID,
                        UpdateUserID = x.UpdateUserID,
                        CreateDate = x.CreateDate,
                        UpdateDate = x.UpdateDate,
                        IsActive = true,
                    }).FirstOrDefault();

                var certificates = entity.Images.Where(x => x.EmployeeID == empId)
                    .Select(x => new Attachment() {
                        docName = x.docName,
                        docnum= x.docnum,                        
                    }).ToList();

                if (certificates.Count > 0)
                {
                    employee.Certificate1 = certificates.Where(x => x.docnum.Contains("cer1")).FirstOrDefault();
                    employee.Certificate2 = certificates.Where(x => x.docnum.Contains("cer2")).FirstOrDefault();
                    employee.Certificate3 = certificates.Where(x => x.docnum.Contains("cer3")).FirstOrDefault();
                }
                return employee;
            }
        }
       public int GetVaccationBalance(int empId)
        {
            int balance = 0;
            using (HRSystemEntities entity = new HRSystemEntities())
            {
               var bal = entity.employees.Where(x => x.EmployeeID == empId )
                    .Select(x => 
                        x.VacationsBalance).FirstOrDefault();

                if (bal != null)
                    balance =(int) bal;

                return balance;
            }
        }

        public List<EmployeeModel> GetHiredEmployees(bool isActive)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var user = entity.employees.Where(x => x.IsActive == isActive && entity.confirms.Any(y => y.EmployeeID == x.EmployeeID
                            && (y.Role == "HRManager" || y.Role == "GeneralDirector" || y.Role == "CEO")
                            && y.ConfirmType == "emp_hiring"))
                            .Select(x => new EmployeeModel()
                            {
                                EmployeeID = x.EmployeeID,
                                IsActive = x.IsActive,
                                Username = x.Username,
                                NameAr = x.NameAr,
                                NameEn = x.NameEn,
                                BasicSalary = x.BasicSalary,
                                Position = x.jobs.Name,
                                DOB = x.DOB,
                                AddedBy = entity.employees.Where(m => m.EmployeeID == x.CreateUserID).Select(m => m.NameAr).FirstOrDefault(),
                            }).ToList();

                foreach (var emp in user)
                {
                    if(emp.DOB != null)
                        emp.Age = HelpClass.get_age((DateTime)emp.DOB);
                }
                return user;
            }
        }
        public List<EmployeeModel> GetEmployees(bool isActive,bool hired,int? supervisorId = null,int? managerId= null)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var searchPredicate = PredicateBuilder.New<employees>();

                searchPredicate = searchPredicate.And(x => x.IsActive == isActive);
                if(hired == true)
                    searchPredicate = searchPredicate.And(x => entity.confirms.Any(y => y.EmployeeID == x.EmployeeID
                            && (y.Role == "HRManager" || y.Role == "GeneralDirector" || y.Role == "CEO")
                            && y.ConfirmType == "emp_hiring"));
                else
                    searchPredicate = searchPredicate.And(x => !entity.confirms.Any(y => y.EmployeeID == x.EmployeeID
                            && (y.Role == "HRManager" || y.Role == "GeneralDirector" || y.Role == "CEO")
                            && y.ConfirmType == "emp_hiring"));

                if (supervisorId != null)
                    searchPredicate = searchPredicate.And(x => x.managements.branches.ManagerID == supervisorId);
                if (managerId != null)
                    searchPredicate = searchPredicate.And(x => x.managements.ManagerID == managerId);

                var user = entity.employees.Where(searchPredicate)
                            .Select(x => new EmployeeModel()
                            {
                                EmployeeID = x.EmployeeID,
                                IsActive = x.IsActive,
                                Username = x.Username,
                                NameAr = x.NameAr,
                                NameEn = x.NameEn,
                                BasicSalary = x.BasicSalary,
                                Position = x.jobs.Name,
                                DOB = x.DOB,
                                DepartmentName = x.departments.Name,
                                ManagementName = x.managements.Name,
                                AddedBy = entity.employees.Where(m => m.EmployeeID == x.CreateUserID).Select(m => m.NameAr).FirstOrDefault(),
                            }).ToList();

                foreach(var emp in user)
                {
                    if (emp.DOB != null)
                        emp.Age = HelpClass.get_age((DateTime)emp.DOB);
                }
                return user;
            }
        }

        public int GetEmployeesCount(bool isActive,bool hired,int? supervisorId = null,int? managerId= null)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var searchPredicate = PredicateBuilder.New<employees>();

                searchPredicate = searchPredicate.And(x => x.IsActive == isActive);
                if(hired == true)
                    searchPredicate = searchPredicate.And(x => entity.confirms.Any(y => y.EmployeeID == x.EmployeeID
                            && (y.Role == "HRManager" || y.Role == "GeneralDirector" || y.Role == "CEO")
                            && y.ConfirmType == "emp_hiring"));
                else
                    searchPredicate = searchPredicate.And(x => !entity.confirms.Any(y => y.EmployeeID == x.EmployeeID
                            && (y.Role == "HRManager" || y.Role == "GeneralDirector" || y.Role == "CEO")
                            && y.ConfirmType == "emp_hiring"));

                if (supervisorId != null)
                    searchPredicate = searchPredicate.And(x => x.managements.branches.ManagerID == supervisorId);
                if (managerId != null)
                    searchPredicate = searchPredicate.And(x => x.managements.ManagerID == managerId);

                var count = entity.employees.Where(searchPredicate)
                            .Select(x => new EmployeeModel()
                            {
                                EmployeeID = x.EmployeeID,
                                IsActive = x.IsActive,
                            }).ToList().Count();

                return count;
            }
        }
        public List<EmployeeModel> GetEmployeesExpiredPassports()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var searchPredicate = PredicateBuilder.New<employees>();

                searchPredicate = searchPredicate.And(x => x.IsActive == true);
                searchPredicate = searchPredicate.And(x => entity.confirms.Any(y => y.EmployeeID == x.EmployeeID
                            && (y.Role == "HRManager" || y.Role == "GeneralDirector" || y.Role == "CEO")
                            && y.ConfirmType == "emp_hiring"));
                searchPredicate = searchPredicate.And(x => x.PassportExpiryDate < DateTime.Now);

                var user = entity.employees.Where(searchPredicate)
                            .Select(x => new EmployeeModel()
                            {
                                EmployeeID = x.EmployeeID,
                                IsActive = x.IsActive,
                                Username = x.Username,
                                NameAr = x.NameAr,
                                NameEn = x.NameEn,
                                BasicSalary = x.BasicSalary,
                                Position = x.jobs.Name,
                                DepartmentName = x.departments.Name,
                                ManagementName = x.managements.Name,
                                DOB = x.DOB,
                                AddedBy = entity.employees.Where(m => m.EmployeeID == x.CreateUserID).Select(m => m.NameAr).FirstOrDefault(),
                            }).ToList();

                foreach (var emp in user)
                {
                    if (emp.DOB != null)
                        emp.Age = HelpClass.get_age((DateTime)emp.DOB);
                }
                return user;
            }
        }
        // ForManagement ForSupervisor
        public List<EmployeeModel> GetEmployeesExpiredPassportsForManagement(int managerId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var searchPredicate = PredicateBuilder.New<employees>();

                searchPredicate = searchPredicate.And(x => x.IsActive == true);
                searchPredicate = searchPredicate.And(x => entity.confirms.Any(y => y.EmployeeID == x.EmployeeID
                            && (y.Role == "HRManager" || y.Role == "GeneralDirector" || y.Role == "CEO")
                            && y.ConfirmType == "emp_hiring"));
                searchPredicate = searchPredicate.And(x => x.PassportExpiryDate < DateTime.Now);
                searchPredicate = searchPredicate.And(e => e.managements.ManagerID == managerId);

                var user = entity.employees.Where(searchPredicate)
                            .Select(x => new EmployeeModel()
                            {
                                EmployeeID = x.EmployeeID,
                                IsActive = x.IsActive,
                                Username = x.Username,
                                NameAr = x.NameAr,
                                NameEn = x.NameEn,
                                BasicSalary = x.BasicSalary,
                                Position = x.jobs.Name,
                                DepartmentName = x.departments.Name,
                                ManagementName = x.managements.Name,
                                DOB = x.DOB,
                                AddedBy = entity.employees.Where(m => m.EmployeeID == x.CreateUserID).Select(m => m.NameAr).FirstOrDefault(),
                            }).ToList();

                foreach (var emp in user)
                {
                    if (emp.DOB != null)
                        emp.Age = HelpClass.get_age((DateTime)emp.DOB);
                }
                return user;
            }
        }
        public List<EmployeeModel> GetEmployeesExpiredPassportsForSupervisor(int managerId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var searchPredicate = PredicateBuilder.New<employees>();

                searchPredicate = searchPredicate.And(x => x.IsActive == true);
                searchPredicate = searchPredicate.And(x => entity.confirms.Any(y => y.EmployeeID == x.EmployeeID
                            && (y.Role == "HRManager" || y.Role == "GeneralDirector" || y.Role == "CEO")
                            && y.ConfirmType == "emp_hiring"));
                searchPredicate = searchPredicate.And(x => x.PassportExpiryDate < DateTime.Now);
                searchPredicate = searchPredicate.And(e => e.managements.branches.ManagerID == managerId);

                var user = entity.employees.Where(searchPredicate)
                            .Select(x => new EmployeeModel()
                            {
                                EmployeeID = x.EmployeeID,
                                IsActive = x.IsActive,
                                Username = x.Username,
                                NameAr = x.NameAr,
                                NameEn = x.NameEn,
                                BasicSalary = x.BasicSalary,
                                Position = x.jobs.Name,
                                DepartmentName = x.departments.Name,
                                ManagementName = x.managements.Name,
                                DOB = x.DOB,
                                AddedBy = entity.employees.Where(m => m.EmployeeID == x.CreateUserID).Select(m => m.NameAr).FirstOrDefault(),
                            }).ToList();

                foreach (var emp in user)
                {
                    if (emp.DOB != null)
                        emp.Age = HelpClass.get_age((DateTime)emp.DOB);
                }
                return user;
            }
        }
        //for department manager
        public List<EmployeeModel> GetNotHiredEmployees(int deptManagerId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var searchPredicate = PredicateBuilder.New<employees>();

                searchPredicate = searchPredicate.And(x => x.IsActive == true);
                searchPredicate = searchPredicate.And(x => x.managements.branches.ManagerID == deptManagerId);
                searchPredicate = searchPredicate.And(x => !entity.confirms.Any(y => y.EmployeeID == x.EmployeeID
                                            &&( y.Role == "DepartmentManager" || y.Role == "GeneralDirector" || y.Role == "CEO") 
                                            && y.ConfirmType== "emp_hiring"));
                var user = entity.employees.Where(searchPredicate)
                            .Select(x => new EmployeeModel()
                            {
                                EmployeeID = x.EmployeeID,
                                IsActive = x.IsActive,
                                Username = x.Username,
                                NameAr = x.NameAr,
                                NameEn = x.NameEn,
                                BasicSalary = x.BasicSalary,
                                Position = x.jobs.Name,
                                DOB = x.DOB,
                                DepartmentName = x.departments.Name,
                                ManagementName= x.managements.Name,
                                AddedBy = entity.employees.Where(m => m.EmployeeID == x.CreateUserID).Select(m => m.NameAr).FirstOrDefault(),
                            }).ToList();

                foreach(var emp in user)
                {
                    if (emp.DOB != null)
                        emp.Age = HelpClass.get_age((DateTime)emp.DOB);
                }
                return user;
            }
        }

        //for HR
        public List<EmployeeModel> GetNotHiredEmployeesForHR(string role)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var searchPredicate = PredicateBuilder.New<employees>();

                searchPredicate = searchPredicate.And(x => x.IsActive == true && !entity.confirms.Any(y => y.EmployeeID == x.EmployeeID && y.Role == role && y.ConfirmType == "emp_hiring"));
                var user = entity.employees.Where(searchPredicate)
                            .Select(x => new EmployeeModel()
                            {
                                EmployeeID = x.EmployeeID,
                                IsActive = x.IsActive,
                                Username = x.Username,
                                NameAr = x.NameAr,
                                NameEn = x.NameEn,
                                BasicSalary = x.BasicSalary,
                                Position = x.jobs.Name,
                                DOB = x.DOB,
                                DepartmentName = x.departments.Name,
                                ManagementName=x.managements.Name,
                                AddedBy = entity.employees.Where(m => m.EmployeeID == x.CreateUserID).Select(m => m.NameAr).FirstOrDefault(),
                            }).ToList();

                foreach(var emp in user)
                {
                    if (emp.DOB != null)
                        emp.Age = HelpClass.get_age((DateTime)emp.DOB);
                }
                return user;
            }
        }
         public List<EmployeeModel> GetNotHiredEmpForHeigh()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var searchPredicate = PredicateBuilder.New<employees>();

                searchPredicate = searchPredicate.And(x => x.IsActive == true 
                            && !entity.confirms.Any(y => y.EmployeeID == x.EmployeeID 
                            &&( y.Role == "HRManager" || y.Role == "GeneralDirector" || y.Role == "CEO") 
                            && y.ConfirmType == "emp_hiring"));
                var user = entity.employees.Where(searchPredicate)
                            .Select(x => new EmployeeModel()
                            {
                                EmployeeID = x.EmployeeID,
                                IsActive = x.IsActive,
                                Username = x.Username,
                                NameAr = x.NameAr,
                                NameEn = x.NameEn,
                                BasicSalary = x.BasicSalary,
                                Position = x.jobs.Name,
                                DepartmentName = x.departments.Name,
                                ManagementName=x.managements.Name,
                                DOB = x.DOB,
                                AddedBy = entity.employees.Where(m => m.EmployeeID == x.CreateUserID).Select(m => m.NameAr).FirstOrDefault(),
                            }).ToList();

                foreach(var emp in user)
                {
                    if (emp.DOB != null)
                        emp.Age = HelpClass.get_age((DateTime)emp.DOB);
                }
                return user;
            }
        }
        public List<EmployeeModel> GetNotHiredEmpFinantial()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var searchPredicate = PredicateBuilder.New<employees>();

                searchPredicate = searchPredicate.And(x => x.IsActive == true && !entity.confirms.Any(y => y.EmployeeID == x.EmployeeID 
                            && y.Role == "FinancialManager" && y.ConfirmType == "emp_hiring"));
                var user = entity.employees.Where(searchPredicate)
                            .Select(x => new EmployeeModel()
                            {
                                EmployeeID = x.EmployeeID,
                                IsActive = x.IsActive,
                                Username = x.Username,
                                NameAr = x.NameAr,
                                NameEn = x.NameEn,
                                BasicSalary = x.BasicSalary,
                                Position = x.jobs.Name,
                                DOB = x.DOB,
                                DepartmentName = x.departments.Name,
                                ManagementName=x.managements.Name,
                                AddedBy = entity.employees.Where(m => m.EmployeeID == x.CreateUserID).Select(m => m.NameAr).FirstOrDefault(),
                            }).ToList();

                foreach(var emp in user)
                {
                    if (emp.DOB != null)
                        emp.Age = HelpClass.get_age((DateTime)emp.DOB);
                }
                return user;
            }
        }

        public List<EmployeeModel> GetAllEmployees(bool isActive)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var searchPredicate = PredicateBuilder.New<employees>();

                searchPredicate = searchPredicate.And(x => x.IsActive == isActive);

                var user = entity.employees.Where(searchPredicate)
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

        public long SaveEmployee(EmployeeModel employee)
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
                            Image = employee.Image,
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
                            ManagementID = employee.ManagementID,
                            WorkHours = employee.WorkHours,
                            BasicSalary = employee.BasicSalary ,
                            HiringDate = employee.HiringDate,
                            Email = employee.Email,
                            VacationsBalance = employee.VacationsBalance,
                            Guarantor = employee.Guarantor,
                            JobDescription= employee.JobDescription,
                            WorkContract = employee.WorkContract,
                            WorkPermit = employee.WorkPermit,
                            PassportNumber = employee.PassportNumber ,
                            PassportReleaseDate= employee.PassportReleaseDate,
                            PassportExpiryDate=employee.PassportExpiryDate,
                            Sequence= employee.Sequence ,
                            UnifiedNumber = employee.UnifiedNumber ,
                            IDNumber = employee.IDNumber,
                            CreateUserID =employee.CreateUserID ,
                            UpdateUserID = employee.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                            IsActive = true,
                    };
                        emp = entity.employees.Add(emp);
                    }
                    else
                    {
                        emp = entity.employees.Find(employee.EmployeeID);
                        emp.NameAr = employee.NameAr;
                        emp.NameEn = employee.NameEn;
                        emp.DOB = employee.DOB;
                        if(employee.Image != null)
                            emp.Image = employee.Image;
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
                        emp.ManagementID = employee.ManagementID;
                        emp.WorkHours = employee.WorkHours;
                        emp.BasicSalary = employee.BasicSalary;
                        emp.HiringDate = employee.HiringDate;
                        emp.Email = employee.Email;
                        emp.VacationsBalance = employee.VacationsBalance;
                        emp.Guarantor = employee.Guarantor;
                        emp.JobDescription = employee.JobDescription;
                        emp.WorkContract = employee.WorkContract;
                        emp.WorkPermit = employee.WorkPermit;
                        emp.PassportNumber = employee.PassportNumber;
                        emp.PassportReleaseDate = employee.PassportReleaseDate;
                        emp.PassportExpiryDate = employee.PassportExpiryDate;
                        emp.Sequence = employee.Sequence;
                        emp.UnifiedNumber = employee.UnifiedNumber;
                        emp.IDNumber = employee.IDNumber;
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

        public bool DeleteEmp(long empId, long? userId)
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