using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class HourlyPermissionModel
    {

        #region Attributes
        public long HourlyPermissionID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
        public Nullable<long> EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<long> CreateUserID { get; set; }
        public Nullable<long> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        #endregion

        #region methods
        public List<HourlyPermissionModel> getActivity()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.hourlyPermissions.Where(x => x.IsActive == true)
                                .Select(x => new HourlyPermissionModel()
                                {
                                    HourlyPermissionID = x.HourlyPermissionID,
                                    //Name = x.Name,
                                    Date = x.Date,
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
        public HourlyPermissionModel getHourlyPermission(int hourlyPermissionId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.hourlyPermissions.Where(x => x.HourlyPermissionID == hourlyPermissionId)
                                .Select(x => new HourlyPermissionModel()
                                {
                                    HourlyPermissionID = x.HourlyPermissionID,
                                    Date = x.Date,
                                    //Name = x.Name,
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

        public long SaveDept(HourlyPermissionModel dept)
        {
            try
            {
                hourlyPermissions hourlyPermission;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (dept.HourlyPermissionID.Equals(0))
                    {
                        hourlyPermission = new hourlyPermissions()
                        {
                             EmployeeID = dept.EmployeeID,
                            Date = dept.Date,
                            //Name = dept.Name,
                            Description = dept.Description,
                            IsActive = true,
                            CreateUserID = dept.CreateUserID,
                            UpdateUserID = dept.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        hourlyPermission = entity.hourlyPermissions.Add(hourlyPermission);
                    }
                    else
                    {
                        hourlyPermission = entity.hourlyPermissions.Find(dept.HourlyPermissionID);
                        hourlyPermission.EmployeeID = dept.EmployeeID;
                        hourlyPermission.Description = dept.Description;
                        //hourlyPermission.Name = dept.Name;
                        hourlyPermission.Date = dept.Date;
                        hourlyPermission.Notes = dept.Notes;
                        hourlyPermission.IsActive = true;
                        hourlyPermission.UpdateUserID = dept.UpdateUserID;
                        hourlyPermission.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return hourlyPermission.HourlyPermissionID;
            }

            catch
            {
                return 0;
            }
        }
        public bool DeleteDept(long deptId, long? userId)
        {
            try
            {
                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    var dept = entity.hourlyPermissions.Find(deptId);
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