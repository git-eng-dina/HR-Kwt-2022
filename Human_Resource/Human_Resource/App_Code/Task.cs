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
        public long TaskID { get; set; }
        public long EmployeeTaskID { get; set; }
        public string RepeatedEvery { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Status { get; set; }
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
        public Nullable<bool> IsBasic { get; set; }
        public Nullable<bool> Approved { get; set; }
        public Nullable<bool> BossDone { get; set; }
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
        public List<TaskModel> getActivity(int employeeId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var tasks = (from x in entity.tasks.Where(ex => ex.IsActive == true && ex.Approved == true && 
                             ex.StartDate <= DateTime.Now &&
                             ( ex.EndDate == null || ex.EndDate >= DateTime.Now ))

                             join e in entity.employeesTasks.Where(em => em.IsActive == true && em.BossDone == null && em.EmployeeID == employeeId) on x.TaskID equals e.TaskID

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
                                 StartDate = x.StartDate,
                                 EndDate = x.EndDate,
                                 CreateDate = x.CreateDate,
                                 UpdateDate = x.UpdateDate,
                                 Approved = x.Approved,
                                 AddedBy = entity.employees.Where(ex => ex.EmployeeID == x.EmployeeID).Select(ex => ex.NameAr).FirstOrDefault(),
                                 AssignedEmployeeID = e.EmployeeID,
                                 AssignedEmployeeName = entity.employees.Where(y => y.EmployeeID == e.EmployeeID).Select(y => y.NameAr).FirstOrDefault(),
                                 Status = entity.dailyTasks.Where(y => y.DailyTaskID == entity.dailyTasks.Where(m => m.TaskID == x.TaskID && m.EmployeeID == e.EmployeeID).Max(m => m.DailyTaskID)).Select(y => y.Status).FirstOrDefault(),
                             })
                             .ToList().Where( x=> x.Status == "Doing" || x.Status == "Complete").ToList();

                foreach (var t in tasks)
                {
                    switch (t.RepeatedEvery)
                    {
                        case "Daily":
                            t.EndDate = t.StartDate;
                            break;
                            //        case "Weekly":
                            //            done = entity.dailyTasks.Where(x => x.TaskID == t.TaskID && x.CreateDate == DateTime.Now &&
                            //                             x.EmployeeID == t.AssignedEmployeeID && x.EmpDone == true).FirstOrDefault();
                            //            break;
                            //        case "Monthly":
                            //            break;
                            //        case "Annual":
                            //            break;
                            //    };

                            //    if(done != null )
                            //    {
                            //        t.DailyTaskID = done.DailyTaskID;
                            //        t.EmpDone = done.EmpDone;
                            //        t.PossDone = done.BossDone;
                    };

                       
                }
                return tasks;
            }
        }
        public List<TaskModel> getNeedApproveForSupervisor(int managerId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var tasks = entity.tasks.Where(x => x.IsActive == true  &&
                (x.EndDate == null || x.EndDate >= DateTime.Now) && x.StartDate >= DateTime.Now &&
            ( entity.employees.Where(e => e.managements.branches.ManagerID == managerId).Select(e => e.EmployeeID).ToList().Contains((int)x.EmployeeID)|| x.EmployeeID == managerId))
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
                       //     && ex.StartDate >= DateTime.Now
               && entity.employees.Where(ee => ee.managements.branches.ManagerID == managerId).Select(ee => ee.EmployeeID).ToList().Contains((int)ex.EmployeeID))
                            join e in entity.employeesTasks.Where(em => em.IsActive == true && em.BossDone == null) on x.TaskID equals e.TaskID
                        
                                select new TaskModel()
                                {
                                    TaskID = x.TaskID,
                                    EmployeeTaskID = e.EmployeesTaskID,
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
                                    AddedBy = entity.employees.Where(ex => ex.EmployeeID == x.EmployeeID).Select(ex => ex.NameAr).FirstOrDefault(),
                                    AssignedEmployeeID=e.EmployeeID,
                                    AssignedEmployeeName = entity.employees.Where(y => y.EmployeeID == e.EmployeeID ).Select(y => y.NameAr).FirstOrDefault(),
                                    Status = entity.dailyTasks.Where(y => y.DailyTaskID == entity.dailyTasks.Where(m => m.TaskID == x.TaskID && m.EmployeeID == e.EmployeeID).Max(m => m.DailyTaskID)).Select(y => y.Status).FirstOrDefault(),
                                }).ToList();

                foreach(var t in tasks)
              {
                //    dailyTasks done = new dailyTasks();
                  switch (t.RepeatedEvery)
                   {
                       case "Daily":
                            t.EndDate = t.StartDate;
                            break;
                //        case "Weekly":
                //            done = entity.dailyTasks.Where(x => x.TaskID == t.TaskID && x.CreateDate == DateTime.Now &&
                //                             x.EmployeeID == t.AssignedEmployeeID && x.EmpDone == true).FirstOrDefault();
                //            break;
                //        case "Monthly":
                //            break;
                //        case "Annual":
                //            break;
                //    };
                  
                //    if(done != null )
                //    {
                //        t.DailyTaskID = done.DailyTaskID;
                //        t.EmpDone = done.EmpDone;
                //        t.PossDone = done.BossDone;
                    };
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

        public long SaveTask(TaskModel tsk, string empIds)
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
                             IsBasic = true,
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

                            employeesTasks = entity.employeesTasks.Add(employeesTasks);


                        }
                        
                    }
                }
                return task.TaskID;
            }

            catch
            {
                return 0;
            }
        }
        public bool DeleteTask(int deptId, int? userId)
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

        public void ScheduleTasks()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var schedule = entity.scheduledJobs.Where(x => x.Name == "DialyTasks").FirstOrDefault();
                if(schedule.ScheduleDate == null || schedule.ScheduleDate <= DateTime.Now.Date)
                {
                    schedule.ScheduleDate = DateTime.Now;

                    var dailyTasks = entity.tasks.Where(x => x.IsActive == true &&
                                    x.RepeatedEvery== "Daily" && x.Approved == true &&
                                   x.IsBasic ==true && x.StartDate < DateTime.Now  && 
                                    (x.EndDate == null || x.EndDate >=DateTime.Now)).ToList();
                    foreach(var dTask in dailyTasks)
                    {
                        long taskID = dTask.TaskID;
                        var newTask = new tasks()
                        {
                            Name = dTask.Name,
                            Description = dTask.Description,
                            ManagementManagerID = dTask.ManagementManagerID,
                            BranchManagerID = dTask.BranchManagerID,
                            Approved = dTask.Approved,
                            RepeatedEvery = dTask.RepeatedEvery,
                            StartDate = DateTime.Now,
                            EndDate = DateTime.Now,
                            Notes = dTask.Notes,
                            Attachment = dTask.Attachment,
                            CreateDate = dTask.CreateDate,
                            UpdateDate = dTask.UpdateDate,
                            CreateUserID = dTask.CreateUserID,
                            UpdateUserID = dTask.UpdateUserID,
                            EmployeeID = dTask.EmployeeID,
                            IsActive = dTask.IsActive,  
                            IsBasic = false,
                        };

                        newTask = entity.tasks.Add(newTask);
                        entity.SaveChanges();

                        var taskEmp = entity.employeesTasks.Where(x => x.TaskID == taskID && x.IsActive == true).ToList();
                        foreach(var emp in taskEmp)
                        {
                            var newEmp = new employeesTasks()
                            {
                                EmployeeID = emp.EmployeeID,
                                TaskID = newTask.TaskID,
                                CreateUserID = emp.CreateUserID,
                                UpdateUserID=emp.UpdateUserID,
                                IsActive = emp.IsActive,
                                Notes = emp.Notes,
                                CreateDate = emp.CreateDate,
                                UpdateDate = emp.UpdateDate,
                            };

                            entity.employeesTasks.Add(newEmp);
                            var dailyTask = new dailyTasks()
                            {
                                TaskID = newTask.TaskID,
                                EmployeeID = emp.EmployeeID,
                                CreateDate = DateTime.Now,
                                UpdateDate = DateTime.Now,
                                IsActive = true,
                                Status = "Doing"
                            };
                            entity.dailyTasks.Add(dailyTask);
                        }
                        
                    }
                    entity.SaveChanges();
                }
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

                    if(approve == true)
                    {
                        var dTasks = entity.dailyTasks.Where(x => x.TaskID == taskId).ToList();
                        if(dTasks.Count() ==0)
                        {
                            var taskEmp = entity.employeesTasks.Where(x => x.TaskID == TaskID && x.IsActive == true).ToList();
                            foreach(var emp in taskEmp)
                            {
                                var dailyTask = new dailyTasks()
                                {
                                TaskID = taskId,
                                EmployeeID = emp.EmployeeID,
                                CreateDate = DateTime.Now,
                                UpdateDate = DateTime.Now,
                                CreateUserID = userId,
                                UpdateUserID = userId,
                                IsActive = true,
                                Status ="Doing"
                                };
                                entity.dailyTasks.Add(dailyTask);
                            }
                        }
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
         public bool EditTaskStatus(long taskId,string status, int? userId)
        {
            try
            {
                using (HRSystemEntities entity = new HRSystemEntities())
                {

                    var dailyTask = new dailyTasks()
                    {
                    TaskID = taskId,
                    EmployeeID = userId,
                    CreateDate = DateTime.Now,
                    UpdateDate = DateTime.Now,
                    CreateUserID = userId,
                    UpdateUserID = userId,
                    IsActive = true,
                    Status =status,
                    };
                    entity.dailyTasks.Add(dailyTask);
                  
                    entity.SaveChanges();

                }
                return true;
            }

            catch
            {
                return false;
            }
        }

        public bool FinishTask(long employeeTaskId, int? userId,string role,string status )
        {
            try
            {

              
                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    var t = entity.employeesTasks.Find(employeeTaskId);
                    EditTaskStatus((long)t.TaskID, status, userId);
                    t.BossDone = true;


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