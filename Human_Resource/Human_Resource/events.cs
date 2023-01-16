//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Human_Resource
{
    using System;
    using System.Collections.Generic;
    
    public partial class events
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public events()
        {
            this.confirms = new HashSet<confirms>();
            this.EemployeesEvents = new HashSet<EemployeesEvents>();
            this.Images = new HashSet<Images>();
        }
    
        public long EventID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<long> CreateUserID { get; set; }
        public Nullable<long> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public Nullable<System.DateTime> EventDate { get; set; }
        public Nullable<long> EmployeeID { get; set; }
        public Nullable<long> BranchManagerID { get; set; }
        public Nullable<long> ManagementManagerID { get; set; }
        public Nullable<bool> Approved { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<confirms> confirms { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EemployeesEvents> EemployeesEvents { get; set; }
        public virtual employees employees { get; set; }
        public virtual employees employees1 { get; set; }
        public virtual employees employees2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Images> Images { get; set; }
    }
}
