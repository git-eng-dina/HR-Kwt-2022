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
        #endregion

        #region methods
        public List<EmployeesVacationModel> getActivity()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.employeesVacations.Where(x => x.IsActive == true)
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
                                }).ToList();
                return depts;
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

        public int SaveDept(EmployeesVacationModel dept)
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

                        #region update employee vacation balance
                        if(employeesVacation.EmployeesVacationID>0)
                        {
                            int dayCount = (int)(employeesVacation.ToDate - employeesVacation.FromDate).Value.TotalDays+1;
                            employees emp = entity.employees.Find(employeesVacation.EmployeeID);
                            if (emp.VacationsBalance != null)
                                emp.VacationsBalance += dayCount;
                            else
                                emp.VacationsBalance = dayCount;
                            entity.SaveChanges();
                        }
                        #endregion
                    }
                    else
                    {
                        employeesVacation = entity.employeesVacations.Find(dept.EmployeesVacationID);

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
                                emp.VacationsBalance += dayCount;
                            else
                                emp.VacationsBalance = dayCount;
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
                            emp.VacationsBalance -= dayCount;
                        else
                            emp.VacationsBalance = 0;
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