using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class EmployeesTaskModel
    {
        #region Attributes
        public int EmployeesTaskID { get; set; }
        public Nullable<int> EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public Nullable<int> TaskID { get; set; }
        public string TaskName { get; set; }
        public string Notes { get; set; }
        public bool BossDone { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        #endregion

        #region methods
        public List<EmployeesTaskModel> getActivity()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.employeesTasks.Where(x => x.IsActive == true)
                                .Select(x => new EmployeesTaskModel()
                                {
                                    EmployeesTaskID = x.EmployeesTaskID,
                                     
                                    EmployeeID = x.EmployeeID,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameAr).FirstOrDefault(),
                                    TaskID = x.TaskID,
                                    TaskName = entity.tasks.Where(m => m.TaskID == x.TaskID).Select(m => m.Name).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).ToList();
                return depts;
            }
        }
        public EmployeesTaskModel getEmployeesTask(int employeesTaskId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.employeesTasks.Where(x => x.EmployeesTaskID == employeesTaskId)
                                .Select(x => new EmployeesTaskModel()
                                {
                                    EmployeesTaskID = x.EmployeesTaskID,
                                    EmployeeID = x.EmployeeID,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameAr).FirstOrDefault(),
                                    TaskID = x.TaskID,
                                    TaskName = entity.tasks.Where(m => m.TaskID == x.TaskID).Select(m => m.Name).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).FirstOrDefault();
                return dept;
            }
        }

        public int SaveDept(EmployeesTaskModel dept)
        {
            try
            {
                employeesTasks employeesTask;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (dept.EmployeesTaskID.Equals(0))
                    {
                        employeesTask = new employeesTasks()
                        {
                            //Type = dept.Type,
                            EmployeeID = dept.EmployeeID,
                            TaskID = dept.TaskID,
                            IsActive = true,
                            CreateUserID = dept.CreateUserID,
                            UpdateUserID = dept.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        employeesTask = entity.employeesTasks.Add(employeesTask);
                    }
                    else
                    {
                        employeesTask = entity.employeesTasks.Find(dept.EmployeesTaskID);
                        employeesTask.EmployeeID = dept.EmployeeID;
                        employeesTask.TaskID = dept.TaskID;
                        employeesTask.Notes = dept.Notes;
                        employeesTask.IsActive = true;
                        employeesTask.UpdateUserID = dept.UpdateUserID;
                        employeesTask.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return employeesTask.EmployeesTaskID;
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
                    var dept = entity.employeesTasks.Find(deptId);
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