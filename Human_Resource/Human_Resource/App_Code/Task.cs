using System;
using System.Collections.Generic;
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
                                }).FirstOrDefault();
                return dept;
            }
        }

        public int SaveDept(TaskModel dept)
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
        #endregion
    }
}