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
    
    public partial class employees
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public employees()
        {
            this.confirms = new HashSet<confirms>();
            this.custodies = new HashSet<custodies>();
            this.employeesScheduleVacations = new HashSet<employeesScheduleVacations>();
            this.employeesTasks = new HashSet<employeesTasks>();
            this.employeesTrainings = new HashSet<employeesTrainings>();
            this.employeesVacations = new HashSet<employeesVacations>();
            this.hourlyPermissions = new HashSet<hourlyPermissions>();
            this.Images = new HashSet<Images>();
            this.materialsConsumption = new HashSet<materialsConsumption>();
            this.messages = new HashSet<messages>();
            this.offices = new HashSet<offices>();
            this.periods = new HashSet<periods>();
            this.rewards = new HashSet<rewards>();
        }
    
        public int EmployeeID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public Nullable<int> VacationsBalance { get; set; }
        public Nullable<bool> WarningPeriod { get; set; }
        public string NameAr { get; set; }
        public string NameEn { get; set; }
        public Nullable<System.DateTime> DOB { get; set; }
        public string Gender { get; set; }
        public string MaritalStatus { get; set; }
        public string Nationality { get; set; }
        public string Religion { get; set; }
        public string BloodType { get; set; }
        public string Image { get; set; }
        public string IdentityType { get; set; }
        public string IdentityNumber { get; set; }
        public Nullable<System.DateTime> IdentityReleaseDate { get; set; }
        public Nullable<System.DateTime> IdentityExpiryDate { get; set; }
        public string PassportNumber { get; set; }
        public Nullable<System.DateTime> PassportReleaseDate { get; set; }
        public Nullable<System.DateTime> PassportExpiryDate { get; set; }
        public string PassportCountry { get; set; }
        public string Phone { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public Nullable<bool> NoConviction { get; set; }
        public string BankAccount { get; set; }
        public string BankName { get; set; }
        public string IBANNumber { get; set; }
        public string SWIFTCODE { get; set; }
        public string PaymentType { get; set; }
        public string EducationCertificate1 { get; set; }
        public Nullable<System.DateTime> EducationCertificateFromDate1 { get; set; }
        public Nullable<System.DateTime> EducationCertificateToDate1 { get; set; }
        public string EducationCertificateSource1 { get; set; }
        public string EducationCertificate2 { get; set; }
        public Nullable<System.DateTime> EducationCertificateFromDate2 { get; set; }
        public Nullable<System.DateTime> EducationCertificateToDate2 { get; set; }
        public string EducationCertificateSource2 { get; set; }
        public string EducationCertificate3 { get; set; }
        public Nullable<System.DateTime> EducationCertificateFromDate3 { get; set; }
        public Nullable<System.DateTime> EducationCertificateToDate3 { get; set; }
        public string EducationCertificateSource3 { get; set; }
        public string WorkExperience1 { get; set; }
        public string WorkExperience2 { get; set; }
        public string WorkExperience3 { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<decimal> BasicSalary { get; set; }
        public string TransportationCompensationType { get; set; }
        public string HousingCompensationType { get; set; }
        public Nullable<int> CompanyID { get; set; }
        public Nullable<System.DateTime> HiringDate { get; set; }
        public string Sequence { get; set; }
        public string UnifiedNumber { get; set; }
    
        public virtual companies companies { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<confirms> confirms { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<custodies> custodies { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<employeesScheduleVacations> employeesScheduleVacations { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<employeesTasks> employeesTasks { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<employeesTrainings> employeesTrainings { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<employeesVacations> employeesVacations { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<hourlyPermissions> hourlyPermissions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Images> Images { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<materialsConsumption> materialsConsumption { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<messages> messages { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<offices> offices { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<periods> periods { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<rewards> rewards { get; set; }
    }
}