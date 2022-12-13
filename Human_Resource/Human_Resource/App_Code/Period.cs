using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class PeriodModel
    {
        #region Attributes
        public int PeriodID { get; set; }
        public string Name { get; set; }
        public Nullable<int> EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        #endregion

        #region methods
        public List<PeriodModel> getActivity()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.periods.Where(x => x.IsActive == true)
                                .Select(x => new PeriodModel()
                                {
                                    PeriodID = x.PeriodID,
                                    Name = x.Name,
                                    StartTime = (DateTime) x.StartTime.Value,
                                    EndTime = (DateTime) x.EndTime.Value,
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
        public List<PeriodModel> getBranchEmpPenalties(int managerId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.periods.Where(x => x.IsActive == true
                            && x.employees.managements.branches.ManagerID == managerId)
                                .Select(x => new PeriodModel()
                                {
                                    PeriodID = x.PeriodID,
                                     Name = x.Name,
                                    StartTime = (DateTime)x.StartTime.Value,
                                    EndTime = (DateTime)x.EndTime.Value,
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
        public List<PeriodModel> getManagementEmpPenalties(int managerId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.periods.Where(x => x.IsActive == true
                            && x.employees.managements.ManagerID == managerId)
                                .Select(x => new PeriodModel()
                                {
                                    PeriodID = x.PeriodID,
                                    Name = x.Name,
                                    StartTime = (DateTime)x.StartTime.Value,
                                    EndTime = (DateTime)x.EndTime.Value,
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
        public List<PeriodModel> getEmpPenalties(int empId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.periods.Where(x => x.IsActive == true && x.EmployeeID == empId)
                                .Select(x => new PeriodModel()
                                {
                                    PeriodID = x.PeriodID,
                                    Name = x.Name,
                                    StartTime = (DateTime)x.StartTime.Value,
                                    EndTime = (DateTime)x.EndTime.Value,
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
        public PeriodModel getPeriod(int periodId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.periods.Where(x => x.PeriodID == periodId)
                                .Select(x => new PeriodModel()
                                {
                                    PeriodID = x.PeriodID,
                                    Name = x.Name,
                                    StartTime = (DateTime)x.StartTime.Value,
                                    EndTime = (DateTime)x.EndTime.Value,
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

        public int SaveDept(PeriodModel dept)
        {
            try
            {
                periods period;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (dept.PeriodID.Equals(0))
                    {
                        period = new periods()
                        {
                            //Type = dept.Type,
                            EmployeeID = dept.EmployeeID,
                            Name = dept.Name,
                            StartTime =dept.StartTime,
                            EndTime = dept.EndTime,
                            IsActive = true,
                            CreateUserID = dept.CreateUserID,
                            UpdateUserID = dept.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        period = entity.periods.Add(period);
                    }
                    else
                    {
                        period = entity.periods.Find(dept.PeriodID);
                        //period.Type = dept.Type;
                        period.EmployeeID = dept.EmployeeID;
                        period.Name = dept.Name;
                        period.StartTime = dept.StartTime;
                        period.EndTime = dept.EndTime;
                        period.Notes = dept.Notes;
                        period.IsActive = true;
                        period.UpdateUserID = dept.UpdateUserID;
                        period.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return period.PeriodID;
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
                    var dept = entity.periods.Find(deptId);
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