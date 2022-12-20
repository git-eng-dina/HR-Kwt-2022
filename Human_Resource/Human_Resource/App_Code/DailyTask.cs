using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class DailyTaskModel
    {
        #region Attributes
        public long DailyTaskID { get; set; }
        public Nullable<int> EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public Nullable<long> TaskID { get; set; }
        public string TaskName { get; set; }
        public string Status { get; set; }

        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        #endregion

        #region methods
        public List<DailyTaskModel> getActivity()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.dailyTasks.Where(x => x.IsActive == true)
                                .Select(x => new DailyTaskModel()
                                {
                                    DailyTaskID = x.DailyTaskID,
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
        public DailyTaskModel getDailyTask(int dailyTaskId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.dailyTasks.Where(x => x.DailyTaskID == dailyTaskId)
                                .Select(x => new DailyTaskModel()
                                {
                                    DailyTaskID = x.DailyTaskID,
                                   // EmpDone = x.EmpDone.Value,
                                   // BossDone = x.BossDone.Value,
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

        //public long SaveDept(DailyTaskModel dept)
        //{
        //    try
        //    {
        //        dailyTasks dailyTask;

        //        using (HRSystemEntities entity = new HRSystemEntities())
        //        {
        //            if (dept.DailyTaskID.Equals(0))
        //            {
        //                dailyTask = new dailyTasks()
        //                {
        //                    //Type = dept.Type,
        //                    EmployeeID = dept.EmployeeID,
        //                    TaskID = dept.TaskID,
        //                    //EmpDone = dept.EmpDone,
        //                   // BossDone = dept.BossDone,
        //                    IsActive = true,
        //                    CreateUserID = dept.CreateUserID,
        //                    UpdateUserID = dept.UpdateUserID,
        //                    CreateDate = DateTime.Now,
        //                    UpdateDate = DateTime.Now,
        //                };
        //                dailyTask = entity.dailyTasks.Add(dailyTask);
        //            }
        //            else
        //            {
        //                dailyTask = entity.dailyTasks.Find(dept.DailyTaskID);
        //                //dailyTask.Type = dept.Type;
        //                dailyTask.EmployeeID = dept.EmployeeID;
        //                dailyTask.TaskID = dept.TaskID;
        //               // dailyTask.EmpDone = dept.EmpDone;
        //               // dailyTask.BossDone = dept.BossDone;
        //                dailyTask.Notes = dept.Notes;
        //                dailyTask.IsActive = true;
        //                dailyTask.UpdateUserID = dept.UpdateUserID;
        //                dailyTask.UpdateDate = DateTime.Now;
        //            }
        //            entity.SaveChanges();
        //        }
        //        return dailyTask.DailyTaskID;
        //    }

        //    catch
        //    {
        //        return 0;
        //    }
        //}
        public bool DeleteDept(int deptId, int? userId)
        {
            try
            {
                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    var dept = entity.dailyTasks.Find(deptId);
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