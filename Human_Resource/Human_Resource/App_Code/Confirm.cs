using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class ConfirmModel
    {
        #region Attributes
        public long ConfirmID { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<int> TaskID { get; set; }
        public Nullable<int> SalaryIncreaseID { get; set; }
        public Nullable<int> MessagesTemplateID { get; set; }
        public Nullable<int> HourlyPermissionID { get; set; }
        public Nullable<int> JobID { get; set; }
        public Nullable<int> DepartmentID { get; set; }
        public string ConfirmType { get; set; }
        public Nullable<int> EmployeeID { get; set; }
        public string Role { get; set; }
        #endregion

        #region Methods
        public long AddConfirm(ConfirmModel confirm)
        {
            try
            {
                confirms con;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    con = new confirms()
                    {
                        Role = confirm.Role,
                        ConfirmType = confirm.ConfirmType,
                        EmployeeID = confirm.EmployeeID,
                        HourlyPermissionID = confirm.HourlyPermissionID,
                        JobID = confirm.JobID,
                        MessagesTemplateID = confirm.MessagesTemplateID,
                        Notes = confirm.Notes,
                        SalaryIncreaseID = confirm.SalaryIncreaseID,
                        TaskID = confirm.TaskID,
                        DepartmentID = confirm.DepartmentID,
                        IsActive = true,
                        CreateUserID = confirm.CreateUserID,
                        UpdateUserID = confirm.UpdateUserID,
                        CreateDate = DateTime.Now,
                        UpdateDate = DateTime.Now,
                    };
                    con = entity.confirms.Add(con);
                    
                    entity.SaveChanges();
                }
                return con.ConfirmID;
            }

            catch
            {
                return 0;
            }
        }
        #endregion
    }
}