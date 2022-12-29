using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class EmployeesVacationModel
     {

        #region Attributes
        public int EmployeesVacationID { get; set; }
        public Nullable<System.DateTime> FromDate { get; set; }
        public Nullable<System.DateTime> ToDate { get; set; }
        public Nullable<int> VacationID { get; set; }
        public string VacationName { get; set; }
        public Nullable<int> EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }

        public Nullable<bool> Approved { get; set; }
        public Nullable<int> VacationsBalance { get; set; }
        
        #endregion

        #region methods
        public List<EmployeesVacationModel> getActivity(int employeeId)
        {
            var now = DateTime.Now.Year;
            var year = new DateTime(now, 1, 1);

            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.employeesVacations.Where(x => x.IsActive == true
                && x.EmployeeID == employeeId && x.FromDate >= year)
                                .Select(x => new EmployeesVacationModel()
                                {
                                    EmployeesVacationID = x.EmployeesVacationID,
                                    FromDate = x.FromDate,
                                    ToDate = x.ToDate,
                                    VacationID = x.VacationID,
                                    VacationName = entity.vacations.Where(m => m.VacationID == x.VacationID).Select(m => m.Name).FirstOrDefault(),
                                    EmployeeID = x.EmployeeID,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameAr).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                    Approved = x.Approved,
                                }).ToList();
                return depts;
            }
        }

        public int GetVacCount(int employeeId)
        {
            var now = DateTime.Now.Year;
            var year = new DateTime(now, 1, 1);
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var lst = entity.employeesVacations.Where(x => x.IsActive == true
                                && x.Approved == true 
                                && x.FromDate >= year
                                && x.EmployeeID == employeeId)
                                .Select(x => new EmployeesVacationModel()
                                {
                                    EmployeesVacationID = x.EmployeesVacationID,
                                    FromDate = x.FromDate,
                                    ToDate = x.ToDate,
                                }).ToList();

                int count = 0;
                foreach(var row in lst)
                {
                    int dayCount = (int)(row.ToDate - row.FromDate).Value.TotalDays + 1;
                    count += dayCount;
                }
                return count;
            }
        }
        public bool EditApprove(int empVacId, bool approve, int? userId)
        {
            try
            {
                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    var vac = entity.employeesVacations.Find(empVacId);
                    vac.Approved = approve;
                    vac.UpdateDate = DateTime.Now;
                    vac.UpdateUserID = userId;

                    #region update employee vacation balance
                    int dayCount = (int)(vac.ToDate - vac.FromDate).Value.TotalDays + 1;
                    employees emp = entity.employees.Find(vac.EmployeeID);
                    if (approve == true)
                    {
                        if (emp.VacationsBalance != null)
                            emp.VacationsBalance -= dayCount;
                        else
                            emp.VacationsBalance = 0;                       
                    }
                    else
                    {
                        if (emp.VacationsBalance != null)
                            emp.VacationsBalance += dayCount;
                        else
                            emp.VacationsBalance = 0;
                    }
                    #endregion
                    entity.SaveChanges();
                }
                return true;
            }

            catch
            {
                return false;
            }
        }

        public List<EmployeesVacationModel> getNeedApproveForDirector()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var now = DateTime.Now.Date;
                var tasks = entity.employeesVacations.Where(x => x.IsActive == true &&
                                x.ToDate >= now )
                                .Select(x => new EmployeesVacationModel()
                                {
                                    EmployeesVacationID = x.EmployeesVacationID,
                                    EmployeeID = x.EmployeeID,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameAr).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    FromDate = x.FromDate,
                                    ToDate = x.ToDate,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                    Approved = x.Approved,
                                    VacationName = x.vacations.Name,
                                    VacationsBalance = x.employees.VacationsBalance,
                                }).ToList();

                return tasks;
            }
        }
        public List<EmployeesVacationModel> getNeedApproveForSupervisor(int managerId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var now = DateTime.Now.Date;
                var tasks = entity.employeesVacations.Where(x => x.IsActive == true &&
                                 x.ToDate >= now &&
                                 (entity.employees.Where(e => e.managements.branches.ManagerID == managerId).Select(e => e.EmployeeID).ToList().Contains((int)x.EmployeeID) || x.EmployeeID == managerId))
                                .Select(x => new EmployeesVacationModel()
                                {
                                    EmployeesVacationID = x.EmployeesVacationID,
                                    EmployeeID = x.EmployeeID,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameAr).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    FromDate = x.FromDate,
                                    ToDate = x.ToDate,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                    Approved = x.Approved,
                                    VacationName = x.vacations.Name,
                                    VacationsBalance = x.employees.VacationsBalance,
                                }).ToList();

                return tasks;
            }
        }

        public List<EmployeesVacationModel> getNeedApproveForManagement(int managerId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var now = DateTime.Now.Date;
                var tasks = entity.employeesVacations.Where(x => x.IsActive == true &&
                                 x.ToDate >= now &&
                                 (entity.employees.Where(e => e.managements.ManagerID == managerId).Select(e => e.EmployeeID).ToList().Contains((int)x.EmployeeID) || x.EmployeeID == managerId))
                                .Select(x => new EmployeesVacationModel()
                                {
                                    EmployeesVacationID = x.EmployeesVacationID,
                                    EmployeeID = x.EmployeeID,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameAr).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    FromDate = x.FromDate,
                                    ToDate = x.ToDate,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                    Approved = x.Approved,
                                    VacationName = x.vacations.Name,
                                    VacationsBalance = x.employees.VacationsBalance,
                                }).ToList();

                return tasks;
            }
        }
        public EmployeesVacationModel getEmployeesVacation(int employeesVacationId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.employeesVacations.Where(x => x.EmployeesVacationID == employeesVacationId)
                                .Select(x => new EmployeesVacationModel()
                                {
                                    EmployeesVacationID = x.EmployeesVacationID,
                                    FromDate = x.FromDate,
                                    ToDate = x.ToDate,
                                    VacationID = x.VacationID,
                                    VacationName = entity.vacations.Where(m => m.VacationID == x.VacationID).Select(m => m.Name).FirstOrDefault(),
                                    EmployeeID = x.EmployeeID,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameAr).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).FirstOrDefault();
                return dept;
            }
        }

        public int SaveVacation(EmployeesVacationModel dept)
        {
            try
            {
                employeesVacations employeesVacation;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (dept.EmployeesVacationID.Equals(0))
                    {
                        employeesVacation = new employeesVacations()
                        {
                            VacationID = dept.VacationID,
                            EmployeeID = dept.EmployeeID,
                            FromDate = dept.FromDate,
                            ToDate = dept.ToDate,
                            IsActive = true,
                            CreateUserID = dept.CreateUserID,
                            UpdateUserID = dept.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        employeesVacation = entity.employeesVacations.Add(employeesVacation);
                        entity.SaveChanges();

                        //#region update employee vacation balance
                        //if(employeesVacation.EmployeesVacationID>0)
                        //{
                        //    int dayCount = (int)(employeesVacation.ToDate - employeesVacation.FromDate).Value.TotalDays+1;
                        //    employees emp = entity.employees.Find(employeesVacation.EmployeeID);
                        //    if (emp.VacationsBalance != null)
                        //        emp.VacationsBalance -= dayCount;
                        //    else
                        //        emp.VacationsBalance = 0;
                        //    entity.SaveChanges();
                        //}
                        //#endregion
                    }
                    else
                    {
                        employeesVacation = entity.employeesVacations.Find(dept.EmployeesVacationID);

                        //#region update employee vacation balance
                        //if (employeesVacation.EmployeesVacationID > 0)
                        //{
                        //    int dayCount = (int)(employeesVacation.ToDate - employeesVacation.FromDate).Value.TotalDays + 1;
                        //    employees emp = entity.employees.Find(employeesVacation.EmployeeID);
                        //    if (emp.VacationsBalance != null)
                        //        emp.VacationsBalance += dayCount;
                        //    else
                        //        emp.VacationsBalance = dayCount;
                        //    entity.SaveChanges();
                        //}
                        //#endregion

                        employeesVacation.VacationID = dept.VacationID;
                        employeesVacation.EmployeeID = dept.EmployeeID;
                        employeesVacation.FromDate = dept.FromDate;
                        employeesVacation.ToDate = dept.ToDate;
                        employeesVacation.Notes = dept.Notes;
                        employeesVacation.IsActive = true;
                        employeesVacation.UpdateUserID = dept.UpdateUserID;
                        employeesVacation.UpdateDate = DateTime.Now;
                    entity.SaveChanges();

                        #region update employee vacation balance
                        if (employeesVacation.EmployeesVacationID > 0)
                        {
                            int dayCount = (int)(employeesVacation.ToDate - employeesVacation.FromDate).Value.TotalDays + 1;
                            employees emp = entity.employees.Find(employeesVacation.EmployeeID);
                            if (emp.VacationsBalance != null)
                                emp.VacationsBalance -= dayCount;
                            else
                                emp.VacationsBalance = 0;
                            entity.SaveChanges();
                        }
                        #endregion
                    }
                }
                return employeesVacation.EmployeesVacationID;
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
                    var employeesVacation = entity.employeesVacations.Find(deptId);
                    employeesVacation.IsActive = false;
                    employeesVacation.UpdateDate = DateTime.Now;
                    employeesVacation.UpdateUserID = userId;
                    entity.SaveChanges();
                    #region update employee vacation balance
                    if (employeesVacation.EmployeesVacationID > 0)
                    {
                        int dayCount = (int)(employeesVacation.ToDate - employeesVacation.FromDate).Value.TotalDays + 1;
                        employees emp = entity.employees.Find(employeesVacation.EmployeeID);
                        if (emp.VacationsBalance != null)
                            emp.VacationsBalance += dayCount;
                        else
                            emp.VacationsBalance = dayCount;
                        entity.SaveChanges();
                    }
                    #endregion
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