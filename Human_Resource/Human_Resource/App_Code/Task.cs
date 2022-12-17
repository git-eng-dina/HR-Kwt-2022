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
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
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
        public Nullable<int> DailyTaskID { get; set; }

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
                var tasks = entity.tasks.Where(x => x.IsActive == true &&
                (x.EndDate == null || x.EndDate >= DateTime.Now) &&
            ( ( x.StartDate >= DateTime.Now && entity.employees.Where(e => e.managements.branches.ManagerID == managerId).Select(e => e.EmployeeID).ToList().Contains((int)x.EmployeeID))
              // ((entity.employees.Where(e => e.managements.branches.ManagerID == managerId).Select(e => e.EmployeeID).ToList().Contains((int)x.EmployeeID))
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
                                    StartDate = x.StartDate,
                                    EndDate = x.EndDate,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                    Approved = x.Approved,
                                    AddedBy = entity.employees.Where(e => e.EmployeeID == x.EmployeeID).Select(e => e.NameAr).FirstOrDefault(),
                                }).ToList();

                tasks = tasks.Where(x => (Convert.ToDateTime(x.StartDate.ToString()) >= DateTime.Now && x.EmployeeID != managerId) || x.EmployeeID == managerId).ToList();
                return tasks;
            }
        }
        public List<TaskModel> getExcutedForSupervisor(int managerId)
        {
            var result = new List<TaskModel>();
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var tasks =(from x in entity.tasks.Where(ex => ex.IsActive == true && ex.Approved== true
                            && ex.StartDate >= DateTime.Now
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
                                    AssignedEmployeeName = entity.employees.Where(y => y.EmployeeID == e.EmployeeID ).Select(y => y.NameAr).FirstOrDefault(),

                                }).ToList();

                foreach(var t in tasks)
                {
                    dailyTasks done = new dailyTasks();
                    switch (t.RepeatedEvery)
                    {
                        case "Daily":
                            done = entity.dailyTasks.Where(x => x.TaskID == t.TaskID && x.CreateDate == DateTime.Now &&
                                              x.EmployeeID == t.AssignedEmployeeID && x.EmpDone == true).FirstOrDefault();
                            break;
                        case "Weekly":
                            done = entity.dailyTasks.Where(x => x.TaskID == t.TaskID && x.CreateDate == DateTime.Now &&
                                             x.EmployeeID == t.AssignedEmployeeID && x.EmpDone == true).FirstOrDefault();
                            break;
                        case "Monthly":
                            break;
                        case "Annual":
                            break;
                    };
                  
                    if(done != null )
                    {
                        t.DailyTaskID = done.DailyTaskID;
                        t.EmpDone = done.EmpDone;
                        t.PossDone = done.BossDone;
                    }
                }
                return tasks;
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

        public int SaveTask(TaskModel tsk, string empIds)
        {
            try
            {
                tasks task;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (tsk.TaskID.Equals(0))
                    {
                        task = new tasks()
                        {
                            RepeatedEvery = tsk.RepeatedEvery,
                            EmployeeID = tsk.EmployeeID,
                            Name = tsk.Name,
                            Description = tsk.Description,
                            StartDate = tsk.StartDate,
                            EndDate = tsk.EndDate,
                             IsActive = true,
                            CreateUserID = tsk.CreateUserID,
                            UpdateUserID = tsk.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        task = entity.tasks.Add(task);
                    }
                    else
                    {
                        task = entity.tasks.Find(tsk.TaskID);
                        task.RepeatedEvery = tsk.RepeatedEvery;
                        task.EmployeeID = tsk.EmployeeID;
                        task.Name = tsk.Name;
                        task.Description = tsk.Description;
                         task.Notes = tsk.Notes;
                        task.IsActive = true;
                        task.UpdateUserID = tsk.UpdateUserID;
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
                            employeesTasks.CreateUserID = tsk.CreateUserID;
                            employeesTasks.UpdateUserID = tsk.UpdateUserID;
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

        public bool FinishTask(long? dailyTaskID, int? userId,string role,long? taskID )
        {
            try
            {
                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    dailyTasks taskObj = new dailyTasks();
                    if(dailyTaskID != null)
                    {
                       taskObj = entity.dailyTasks.Find(dailyTaskID);
                        taskObj.BossDone = true;
                    }
                    else
                    {
                        taskObj = new dailyTasks()
                        {
                            TaskID = (int)taskID,
                            EmployeeID = userId,
                            EmpDone= true,
                            CreateDate = DateTime.Now,
                            UpdateDate=DateTime.Now,
                            CreateUserID= userId,
                            UpdateUserID = userId,
                        };
                        entity.dailyTasks.Add(taskObj);
                    }

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