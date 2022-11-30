using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class CompanyModel
    {
        #region Attributes
        public int CompanyID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string Notes { get; set; }
        public Nullable<bool> OurCompany { get; set; }
        public Nullable<int> GeneralDirector { get; set; }
        public Nullable<int> FinancialManager { get; set; }
        public Nullable<int> HRManager { get; set; }
        public Nullable<int> CEO { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }

        #endregion

        #region Methods
        public CompanyModel GetCompanyInfo()
        {
            CompanyModel com = new CompanyModel();
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                 com = entity.companies.Where(x =>x.IsActive == true)
                        .Select(x => new CompanyModel()
                        {
                            CompanyID = x.CompanyID,
                            Name = x.Name,
                            Email = x.Email,
                            Address = x.Address,
                            Fax = x.Fax,
                            Phone = x.Phone,
                            Mobile = x.Mobile,
                            OurCompany=x.OurCompany,
                            GeneralDirector = x.GeneralDirector,
                            CEO=x.CEO,
                            HRManager=x.HRManager,
                            FinancialManager = x.FinancialManager,
                             IsActive = x.IsActive,
                             Notes = x.Notes,
                             CreateUserID = x.CreateUserID,
                             UpdateUserID = x.UpdateUserID,
                        }).FirstOrDefault();
            }
            return com;
        }

        public int SaveCompanyInfo(CompanyModel company)
        {
            try
            {
                companies com;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (company.CompanyID.Equals(0))
                    {
                        com = new companies()
                        {
                            Name = company.Name,
                            Address = company.Address,
                            Email = company.Email,
                            Phone = company.Phone,
                            Fax = company.Fax,
                            Mobile = company.Mobile,
                            Notes = company.Notes,
                            OurCompany = company.OurCompany,
                            GeneralDirector = company.GeneralDirector,
                            CEO = company.CEO,
                            HRManager = company.HRManager,
                            FinancialManager = company.FinancialManager,
                            IsActive = true,
                            CreateUserID = company.CreateUserID,
                            UpdateUserID = company.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                       com = entity.companies.Add(com);
                    }
                    else
                    {
                        com = entity.companies.Find(company.CompanyID);
                        com.Name = company.Name;
                        com.Address = company.Address;
                        com.Email = company.Email;
                        com.Phone = company.Phone;
                        com.Fax = company.Fax;
                        com.Mobile = company.Mobile;
                        com.Notes = company.Notes;
                        com.OurCompany = company.OurCompany;
                        com.GeneralDirector = company.GeneralDirector;
                        com.CEO = company.CEO;
                        com.HRManager = company.HRManager;
                        com.FinancialManager = company.FinancialManager;
                        com.IsActive = true;
                        com.UpdateUserID = company.UpdateUserID;
                        com.UpdateDate = DateTime.Now;
                    }

                    var generalDirector = entity.employees.Find(company.GeneralDirector);
                    if (generalDirector.HiringDate == null)
                        generalDirector.HiringDate = DateTime.Now;

                    var CEO = entity.employees.Find(company.CEO);
                    if (CEO.HiringDate == null)
                        CEO.HiringDate = DateTime.Now;

                    var financialManager = entity.employees.Find(company.FinancialManager);
                    if (financialManager.HiringDate == null)
                        financialManager.HiringDate = DateTime.Now;

                    var hrManager = entity.employees.Find(company.HRManager);
                    if (hrManager.HiringDate == null)
                        hrManager.HiringDate = DateTime.Now;

                    entity.SaveChanges();
                }
                return com.CompanyID;
            }

            catch {
                return 0;
            }
        }
        #endregion
    }

    public class BranchModel
    {
        #region Attributes
        public int BranchID { get; set; }
        public string Name { get; set; }
        public Nullable<int> CompanyID { get; set; }
         public Nullable<int> ManagerID { get; set; }
        public string ManagerName { get; set; }
        public string Mobile { get; set; }

        public string Notes { get; set; }
        public string Address { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        #endregion

        #region methods
        public List<BranchModel> getCompanyBranches()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.branches.Where(x => x.CompanyID == entity.companies.Where(c => c.OurCompany == true && c.IsActive == true).Select(c => c.CompanyID).FirstOrDefault() && x.IsActive == true)
                                .Select(x=> new BranchModel() {
                                    BranchID = x.BranchID,
                                Name = x.Name,
                                Mobile = x.Mobile,
                                 ManagerID = x.ManagerID,
                                ManagerName = entity.employees.Where(m => m.EmployeeID == x.ManagerID).Select(m => m.NameAr).FirstOrDefault(),
                                CreateUserID = x.CreateUserID,
                                UpdateUserID = x.UpdateUserID,
                                Notes=x.Notes,
                                    Address= x.Address,
                                CreateDate = x.CreateDate,
                                UpdateDate= x.UpdateDate,
                                }).ToList();
                return depts;
            }
        }
         public BranchModel getBranch(int branchId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.branches.Where(x => x.BranchID == branchId)
                                .Select(x=> new BranchModel() {
                                    BranchID = x.BranchID,
                                Name = x.Name,
                                Mobile = x.Mobile,
                                 ManagerID = x.ManagerID,
                                ManagerName = entity.employees.Where(m => m.EmployeeID == x.ManagerID).Select(m => m.NameAr).FirstOrDefault(),
                                CreateUserID = x.CreateUserID,
                                UpdateUserID = x.UpdateUserID,
                                Notes=x.Notes,
                                    Address= x.Address,
                                CreateDate = x.CreateDate,
                                UpdateDate= x.UpdateDate,
                                }).FirstOrDefault();
                return dept;
            }
        }

        public int SaveDept(BranchModel dept)
        {
            try
            {
                branches branch;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (dept.BranchID.Equals(0))
                    {
                        branch = new branches()
                        {
                            Name = dept.Name,
                            ManagerID = dept.ManagerID,
                            Mobile = dept.Mobile,
                            Address = dept.Address,
                            CompanyID = entity.companies.Where(x => x.OurCompany == true).Select(x => x.CompanyID).FirstOrDefault(),
                            IsActive = true,
                            CreateUserID = dept.CreateUserID,
                            UpdateUserID = dept.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        branch = entity.branches.Add(branch);
                    }
                    else
                    {
                        branch = entity.branches.Find(dept.BranchID);
                        branch.Name = dept.Name;
                        branch.ManagerID = dept.ManagerID;
                        branch.Address = dept.Address;
                        branch.Mobile = dept.Mobile;
                        branch.Notes = dept.Notes;
                        branch.IsActive = true;
                        branch.UpdateUserID = dept.UpdateUserID;
                        branch.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return branch.BranchID;
            }

            catch
            {
                return 0;
            }
        }
        public bool DeleteDept(int deptId,int? userId)
        {
            try
            {
                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    var dept = entity.branches.Find(deptId);
                    dept.IsActive = false;
                    dept.UpdateDate = DateTime.Now;
                    dept.UpdateUserID = userId;
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

     
    public class ManagementModel
    {
        #region Attributes
        public int ManagementID { get; set; }
        public string Name { get; set; }
        public Nullable<int> BranchID { get; set; }
        public string BranchName { get; set; }
        public Nullable<int> ManagerID { get; set; }
        public string ManagerName { get; set; }
        public string Mobile { get; set; }

        public string Notes { get; set; }
        public string Address { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        #endregion

        #region methods
        public List<ManagementModel> getActivity()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.managements.Where(x => x.IsActive == true)
                                .Select(x => new ManagementModel()
                                {
                                    ManagementID = x.ManagementID,
                                    Name = x.Name,
                                    Mobile = x.Mobile,
                                    BranchID = x.BranchID,
                                    BranchName = entity.branches.Where(m => m.BranchID == x.BranchID).Select(m => m.Name).FirstOrDefault(),
                                    ManagerID = x.ManagerID,
                                    ManagerName = entity.employees.Where(m => m.EmployeeID == x.ManagerID).Select(m => m.NameAr).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).ToList();
                return depts;
            }
        }
        public List<ManagementModel> getManagementByBranch(int BranchID)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.managements.Where(x => x.BranchID == BranchID && x.IsActive == true)
                                .Select(x => new ManagementModel()
                                {
                                    ManagementID = x.ManagementID,
                                    Name = x.Name,
                                    Mobile = x.Mobile,
                                    BranchID = x.BranchID,
                                    BranchName = entity.branches.Where(m => m.BranchID == x.BranchID).Select(m => m.Name).FirstOrDefault(),
                                    ManagerID = x.ManagerID,
                                    ManagerName = entity.employees.Where(m => m.EmployeeID == x.ManagerID).Select(m => m.NameAr).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).ToList();
                return depts;
            }
        }
        public ManagementModel getManagement(int managementId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.managements.Where(x => x.ManagementID == managementId)
                                .Select(x => new ManagementModel()
                                {
                                    ManagementID = x.ManagementID,
                                    Name = x.Name,
                                    Mobile = x.Mobile,
                                    BranchID = x.BranchID,
                                    BranchName = entity.branches.Where(m => m.BranchID == x.BranchID).Select(m => m.Name).FirstOrDefault(),
                                    ManagerID = x.ManagerID,
                                    ManagerName = entity.employees.Where(m => m.EmployeeID == x.ManagerID).Select(m => m.NameAr).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).FirstOrDefault();
                return dept;
            }
        }

        public int SaveDept(ManagementModel dept)
        {
            try
            {
                managements management;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (dept.ManagementID.Equals(0))
                    {
                        management = new managements()
                        {
                            Name = dept.Name,
                            BranchID = dept.BranchID,
                            ManagerID = dept.ManagerID,
                            Mobile = dept.Mobile,
                            IsActive = true,
                            CreateUserID = dept.CreateUserID,
                            UpdateUserID = dept.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        management = entity.managements.Add(management);
                    }
                    else
                    {
                        management = entity.managements.Find(dept.ManagementID);
                        management.Name = dept.Name;
                        management.BranchID = dept.BranchID;
                        management.ManagerID = dept.ManagerID;
                        management.Mobile = dept.Mobile;
                        management.Notes = dept.Notes;
                        management.IsActive = true;
                        management.UpdateUserID = dept.UpdateUserID;
                        management.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return management.ManagementID;
            }

            catch
            {
                return 0;
            }
        }
        public bool DeleteDept(int deptId, int? userId)
        {
            try
            {
                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    var dept = entity.managements.Find(deptId);
                    dept.IsActive = false;
                    dept.UpdateDate = DateTime.Now;
                    dept.UpdateUserID = userId;
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

    
    public class DepartmentModel
    {
        #region Attributes
        public int DepartmentID { get; set; }
        public string Name { get; set; }
        public Nullable<int> ManagementID { get; set; }
        public string ManagementName { get; set; }
        public Nullable<int> ManagerID { get; set; }
        public string ManagerName { get; set; }
        public string Mobile { get; set; }

        public string Notes { get; set; }
        public string Address { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        #endregion

        #region methods
        public List<DepartmentModel> getActivity()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.departments.Where(x => x.IsActive == true)
                                .Select(x => new DepartmentModel()
                                {
                                    DepartmentID = x.DepartmentID,
                                    Name = x.Name,
                                    Mobile = x.Mobile,
                                    ManagementID = x.ManagementID,
                                    ManagementName = entity.managements.Where(m => m.ManagementID == x.ManagementID).Select(m => m.Name).FirstOrDefault(),
                                    ManagerID = x.ManagerID,
                                    ManagerName = entity.employees.Where(m => m.EmployeeID == x.ManagerID).Select(m => m.NameAr).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).ToList();
                return depts;
            }
        }
        public List<DepartmentModel> getDepartmentByManagement(int ManagementID)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.departments.Where(x => x.ManagementID == ManagementID && x.IsActive == true)
                                .Select(x => new DepartmentModel()
                                {
                                    DepartmentID = x.DepartmentID,
                                    Name = x.Name,
                                    Mobile = x.Mobile,
                                    ManagementID = x.ManagementID,
                                    ManagementName = entity.managements.Where(m => m.ManagementID == x.ManagementID).Select(m => m.Name).FirstOrDefault(),
                                    ManagerID = x.ManagerID,
                                    ManagerName = entity.employees.Where(m => m.EmployeeID == x.ManagerID).Select(m => m.NameAr).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).ToList();
                return depts;
            }
        }
        public DepartmentModel getDepartment(int departmentId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.departments.Where(x => x.DepartmentID == departmentId)
                                .Select(x => new DepartmentModel()
                                {
                                    DepartmentID = x.DepartmentID,
                                    Name = x.Name,
                                    Mobile = x.Mobile,
                                    ManagementID = x.ManagementID,
                                    ManagementName = entity.managements.Where(m => m.ManagementID == x.ManagementID).Select(m => m.Name).FirstOrDefault(),
                                    ManagerID = x.ManagerID,
                                    ManagerName = entity.employees.Where(m => m.EmployeeID == x.ManagerID).Select(m => m.NameAr).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).FirstOrDefault();
                return dept;
            }
        }

        public int SaveDept(DepartmentModel dept)
        {
            try
            {
                departments department;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (dept.DepartmentID.Equals(0))
                    {
                        department = new departments()
                        {
                            Name = dept.Name,
                            ManagementID = dept.ManagementID,
                            ManagerID = dept.ManagerID,
                            Mobile = dept.Mobile,
                            IsActive = true,
                            CreateUserID = dept.CreateUserID,
                            UpdateUserID = dept.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        department = entity.departments.Add(department);
                    }
                    else
                    {
                        department = entity.departments.Find(dept.DepartmentID);
                        department.Name = dept.Name;
                        department.ManagementID = dept.ManagementID;
                        department.ManagerID = dept.ManagerID;
                        department.Mobile = dept.Mobile;
                        department.Notes = dept.Notes;
                        department.IsActive = true;
                        department.UpdateUserID = dept.UpdateUserID;
                        department.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return department.DepartmentID;
            }

            catch
            {
                return 0;
            }
        }
        public bool DeleteDept(int deptId, int? userId)
        {
            try
            {
                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    var dept = entity.departments.Find(deptId);
                    dept.IsActive = false;
                    dept.UpdateDate = DateTime.Now;
                    dept.UpdateUserID = userId;
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

    public class VacationModel
    {
        #region attributes
        public int VacationID { get; set; }
        public string Name { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        #endregion

        #region methods
        public List<VacationModel> GetActivity()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var vacations = entity.vacations.Where(x => x.IsActive == true)
                            .Select(x => new VacationModel()
                            {
                                VacationID = x.VacationID,
                                Name = x.Name,
                                Notes = x.Notes,
                                CreateDate = x.CreateDate,
                                UpdateDate = x.UpdateDate,
                                CreateUserID = x.CreateUserID,
                                UpdateUserID = x.UpdateUserID,
                            }).ToList();
                return vacations;
            }
        }


        public VacationModel getVacation(int vacationId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.vacations.Where(x => x.VacationID == vacationId)
                                .Select(x => new VacationModel()
                                {
                                    VacationID = x.VacationID,
                                    Name = x.Name,
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).FirstOrDefault();
                return dept;
            }
        }

        public int SaveVacation(VacationModel dept)
        {
            try
            {
                vacations vacation;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (dept.VacationID.Equals(0))
                    {
                        vacation = new vacations()
                        {
                            Name = dept.Name,
                            IsActive = true,
                            CreateUserID = dept.CreateUserID,
                            UpdateUserID = dept.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        vacation = entity.vacations.Add(vacation);
                    }
                    else
                    {
                        vacation = entity.vacations.Find(dept.VacationID);
                        vacation.Name = dept.Name;
                        vacation.Notes = dept.Notes;
                        vacation.IsActive = true;
                        vacation.UpdateUserID = dept.UpdateUserID;
                        vacation.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return vacation.VacationID;
            }

            catch
            {
                return 0;
            }
        }
        public bool DeleteVacation(int deptId, int? userId)
        {
            try
            {
                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    var dept = entity.vacations.Find(deptId);
                    dept.IsActive = false;
                    dept.UpdateDate = DateTime.Now;
                    dept.UpdateUserID = userId;
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