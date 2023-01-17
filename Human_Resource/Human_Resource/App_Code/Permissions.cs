using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class AppObjectModel
    {
        #region Attributes
        public int AppObjectID { get; set; }
        public string Name { get; set; }
        public string NameEn { get; set; }
        public string NameAr { get; set; }
        #endregion

        #region Methods

        public List<appObjects> GetAppObjects()
        {
            List<appObjects> result;;
           

            using (HRSystemEntities entity = new HRSystemEntities())
            {
                result = entity.appObjects.ToList();

                return result;
            }
        }

         public AppObjectModel getAppObject(int appObjectId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var appObject = entity.appObjects.Where(x => x.AppObjectID == appObjectId)
                                .Select(x => new AppObjectModel()
                                {
                                    AppObjectID = x.AppObjectID,
                                    Name = x.Name,
                                    NameEn = x.NameEn,
                                    NameAr = x.NameAr,
                                }).FirstOrDefault();
                return appObject;
            }
        }

        #endregion
    }
    public class UsersPermissionModel
    {
        #region Attributes
        public int UsersPermissionID { get; set; }
        public int AppObjectID { get; set; }
        public string AppObjectName { get; set; }
        public long EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public Nullable<bool> ViewObject { get; set; }
        public Nullable<bool> EditObject { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<long> CreateUserID { get; set; }
        public Nullable<long> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        #endregion

        #region methods
        public List<UsersPermissionModel> getAll()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.usersPermissions.Where(x => x.IsActive == true)
                                .Select(x => new UsersPermissionModel()
                                {
                                    UsersPermissionID = x.UsersPermissionID,
                                    AppObjectID = x.AppObjectID.Value,
                                    AppObjectName = entity.appObjects.Where(m => m.AppObjectID == x.AppObjectID).Select(m => m.NameEn).FirstOrDefault(),
                                    EmployeeID = x.EmployeeID.Value,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameEn).FirstOrDefault(),
                                    ViewObject = x.ViewObject,
                                    EditObject = x.EditObject,
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).ToList();
                return depts;
            }
        }
        public UsersPermissionModel getUsersPermission(int usersPermissionId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.usersPermissions.Where(x => x.UsersPermissionID == usersPermissionId)
                                .Select(x => new UsersPermissionModel()
                                {
                                    UsersPermissionID = x.UsersPermissionID,
                                    AppObjectID = x.AppObjectID.Value,
                                    AppObjectName = entity.appObjects.Where(m => m.AppObjectID == x.AppObjectID).Select(m => m.NameEn).FirstOrDefault(),
                                    EmployeeID = x.EmployeeID.Value,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameEn).FirstOrDefault(),
                                    ViewObject = x.ViewObject,
                                    EditObject = x.EditObject,
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).FirstOrDefault();
                return dept;
            }
        }

        public int SaveDept(UsersPermissionModel dept)
        {
            try
            {
                usersPermissions usersPermission;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (dept.UsersPermissionID.Equals(0))
                    {
                        usersPermission = new usersPermissions()
                        {
                            AppObjectID = dept.AppObjectID,
                            EmployeeID = dept.EmployeeID,
                            ViewObject = dept.ViewObject,
                            EditObject = dept.EditObject,

                            IsActive = true,
                            CreateUserID = dept.CreateUserID,
                            UpdateUserID = dept.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        usersPermission = entity.usersPermissions.Add(usersPermission);
                    }
                    else
                    {
                        usersPermission = entity.usersPermissions.Find(dept.UsersPermissionID);
                        usersPermission.AppObjectID = dept.AppObjectID;
                        usersPermission.EmployeeID = dept.EmployeeID;
                        usersPermission.ViewObject = dept.ViewObject;
                        usersPermission.EditObject = dept.EditObject;

                        usersPermission.Notes = dept.Notes;
                        usersPermission.IsActive = true;
                        usersPermission.UpdateUserID = dept.UpdateUserID;
                        usersPermission.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return usersPermission.UsersPermissionID;
            }

            catch
            {
                return 0;
            }
        }
        public bool DeleteDept(int deptId, long? userId)
        {
            try
            {
                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    var dept = entity.usersPermissions.Find(deptId);
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