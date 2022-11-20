//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Human_Resource
{
    using System;
    using System.Collections.Generic;
    
    public partial class confirms
    {
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
    
        public virtual departments departments { get; set; }
        public virtual employees employees { get; set; }
        public virtual hourlyPermissions hourlyPermissions { get; set; }
        public virtual jobs jobs { get; set; }
        public virtual messagesTemplates messagesTemplates { get; set; }
        public virtual salaryIncrease salaryIncrease { get; set; }
        public virtual tasks tasks { get; set; }
    }
}
