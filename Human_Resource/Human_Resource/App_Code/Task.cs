using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class TaskModel
     {

        #region Attributes
        public int TaskID { get; set; }
        public string RepeatedEvery { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public Nullable<int> EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> Approved { get; set; }
        public Nullable<bool> EmpDone { get; set; }
        public Nullable<bool> PossDone { get; set; }
        public Nullable<int> BranchManagerID { get; set; }
        public Nullable<int> ManagementManagerID { get; set; }
        public string Attachment { get; set; }
        public string AddedBy { get; set; }
        public Nullable<int> AssignedEmployeeID { get; set; }
        public string AssignedEmployeeName { get; set; }

        public List<EmployeeModel> Employees { get; set; }
        #endregion

        #region methods
        public List<TaskModel> getActivity()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.tasks.Where(x => x.IsActive == true)
                                .Select(x => new TaskModel()
                                {
                                    TaskID = x.TaskID,
                                    RepeatedEvery = x.RepeatedEvery,
                                    Name = x.Name,
                                    Description = x.Description,
                                     EmployeeID = x.EmployeeID,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameAr).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                    Approved = x.Approved,
                                    AddedBy = entity.employees.Where(e => e.EmployeeID == x.EmployeeID).Select(e => e.NameAr).FirstOrDefault(),
                                }).ToList();
                return depts;
            }
        }
        public List<TaskModel> getNeedApproveForSupervisor(int managerId)
        {

            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.tasks.Where(x => x.IsActive == true &&
              // ( (x.StartDate >= DateTime.Now && entity.employees.Where(e => e.managements.branches.ManagerID == managerId).Select(e => e.EmployeeID).ToList().Contains((int)x.EmployeeID))
               ( (entity.employees.Where(e => e.managements.branches.ManagerID == managerId).Select(e => e.EmployeeID).ToList().Contains((int)x.EmployeeID))
                || x.EmployeeID== managerId))
                                .Select(x => new TaskModel()
                                {
                                    TaskID = x.TaskID,
                                    RepeatedEvery = x.RepeatedEvery,
                                    Name = x.Name,
                                    Description = x.Description,
                                     EmployeeID = x.EmployeeID,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameAr).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                    Approved = x.Approved,
                                    AddedBy = entity.employees.Where(e => e.EmployeeID == x.EmployeeID).Select(e => e.NameAr).FirstOrDefault(),
 
                                }).ToList();
                return depts;
            }
        }
        public List<TaskModel> getExcutedForSupervisor(int managerId)
        {
            var result = new List<TaskModel>();
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var tasks =(from x in entity.tasks.Where(ex => ex.IsActive == true && ex.Approved== true
               && entity.employees.Where(ee => ee.managements.branches.ManagerID == managerId).Select(ee => ee.EmployeeID).ToList().Contains((int)ex.EmployeeID))
                            join e in entity.employeesTasks.Where(em => em.IsActive == true) on x.TaskID equals e.TaskID
                            
                                select new TaskModel()
                                {
                                    TaskID = x.TaskID,
                                    RepeatedEvery = x.RepeatedEvery,
                                    Name = x.Name,
                                    Description = x.Description,
                                     EmployeeID = x.EmployeeID,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameAr).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                    Approved = x.Approved,
                                    AddedBy = entity.employees.Where(ex => ex.EmployeeID == x.EmployeeID).Select(ex => ex.NameAr).FirstOrDefault(),
                                    AssignedEmployeeID=e.EmployeeID,
                                }).ToList();

                foreach(var t in tasks)
                {
                    var done = entity.dailyTasks.Where(x => x.TaskID == t.TaskID && x.EmployeeID == t.AssignedEmployeeID && x.EmpDone == true).FirstOrDefault();
                    if(done != null && done.BossDone == null)
                    {
                        result.Add(t);
                    }
                }
                return result;
            }
        }
        public List<TaskModel> getNeedApproveForManagement(int managerId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                //  var now = DateTime.Today;
                var now = DateTime.Now.ToString(System.Globalization.CultureInfo.InvariantCulture);
                var depts = entity.tasks.Where(x => x.IsActive == true &&
                ((DbFunctions.TruncateTime(x.StartDate) >= DateTime.Parse(now) && x.EmployeeID == entity.employees.Where(e => e.managements.ManagerID == managerId && e.EmployeeID == x.EmployeeID).Select(e => e.EmployeeID).FirstOrDefault())
                || x.EmployeeID == managerId))
                                .Select(x => new TaskModel()
                                {
                                    TaskID = x.TaskID,
                                    RepeatedEvery = x.RepeatedEvery,
                                    Name = x.Name,
                                    Description = x.Description,
                                     EmployeeID = x.EmployeeID,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameAr).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                    Approved = x.Approved,
                                    AddedBy = entity.employees.Where(e => e.EmployeeID == x.EmployeeID).Select(e => e.NameAr).FirstOrDefault(),
                                }).ToList();
                return depts;
            }
        }
        public TaskModel getTask(int taskId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.tasks.Where(x => x.TaskID == taskId)
                                .Select(x => new TaskModel()
                                {
                                    TaskID = x.TaskID,
                                    RepeatedEvery = x.RepeatedEvery,
                                    Name = x.Name,
                                    Description = x.Description,
                                     EmployeeID = x.EmployeeID,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameAr).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                    Employees = entity.employeesTasks.Where(m => m.TaskID == x.TaskID && m.IsActive == true)
                                                .Select(m => new EmployeeModel()
                                                {
                                                    EmployeeID = m.EmployeeID.Value,
                                                    NameAr = m.employees.NameAr,
                                                    NameEn = m.employees.NameEn,
                                                }).ToList(),
                                }).FirstOrDefault();
                return dept;
            }
        }

        public int SaveDept(TaskModel dept, string empIds)
        {
            try
            {
                tasks task;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (dept.TaskID.Equals(0))
                    {
                        task = new tasks()
                        {
                            RepeatedEvery = dept.RepeatedEvery,
                            EmployeeID = dept.EmployeeID,
                            Name = dept.Name,
                            Description = dept.Description,
                             IsActive = true,
                            CreateUserID = dept.CreateUserID,
                            UpdateUserID = dept.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        task = entity.tasks.Add(task);
                    }
                    else
                    {
                        task = entity.tasks.Find(dept.TaskID);
                        task.RepeatedEvery = dept.RepeatedEvery;
                        task.EmployeeID = dept.EmployeeID;
                        task.Name = dept.Name;
                        task.Description = dept.Description;
                         task.Notes = dept.Notes;
                        task.IsActive = true;
                        task.UpdateUserID = dept.UpdateUserID;
                        task.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }


                if (task.TaskID > 0)
                {
                    using (HRSystemEntities entity = new HRSystemEntities())
                    {
                        var employeesTaskss = entity.employeesTasks.Where(x => x.TaskID == task.TaskID);
                        entity.employeesTasks.RemoveRange(
                            employeesTaskss
                            );
                        entity.SaveChanges();

                        //"1,2,"
                        //empIds
                        var empIdsList = empIds.Split(',').Where(x => !string.IsNullOrWhiteSpace(x)).ToList();
                        foreach (var item in empIdsList)
                        {
                            employeesTasks employeesTasks = new employeesTasks();
                            employeesTasks.TaskID = task.TaskID;
                            employeesTasks.EmployeeID = int.Parse(item);
                            employeesTasks.IsActive = true;
                            employeesTasks.CreateUserID = dept.CreateUserID;
                            employeesTasks.UpdateUserID = dept.UpdateUserID;
                            employeesTasks.CreateDate = DateTime.Now;
                            employeesTasks.UpdateDate = DateTime.Now;

                            entity.employeesTasks.Add(employeesTasks);

                        }
                        entity.SaveChanges();
                    }
                }
                return task.TaskID;
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
                    var dept = entity.tasks.Find(deptId);
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
        public bool EditApprove(int taskId,bool approve, int? userId)
        {
            try
            {
                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    var taskObj = entity.tasks.Find(taskId);
                    taskObj.Approved = approve;
                    taskObj.UpdateDate = DateTime.Now;
                    taskObj.UpdateUserID = userId;
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