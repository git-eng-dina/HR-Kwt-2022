﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class HRSystemEntities : DbContext
    {
        public HRSystemEntities()
            : base("name=HRSystemEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<branches> branches { get; set; }
        public virtual DbSet<companies> companies { get; set; }
        public virtual DbSet<confirms> confirms { get; set; }
        public virtual DbSet<countriesName> countriesName { get; set; }
        public virtual DbSet<custodies> custodies { get; set; }
        public virtual DbSet<dailyTasks> dailyTasks { get; set; }
        public virtual DbSet<departments> departments { get; set; }
        public virtual DbSet<EemployeesEvents> EemployeesEvents { get; set; }
        public virtual DbSet<employees> employees { get; set; }
        public virtual DbSet<employeesScheduleVacations> employeesScheduleVacations { get; set; }
        public virtual DbSet<employeesTasks> employeesTasks { get; set; }
        public virtual DbSet<employeesTrainings> employeesTrainings { get; set; }
        public virtual DbSet<employeesVacations> employeesVacations { get; set; }
        public virtual DbSet<evaluations> evaluations { get; set; }
        public virtual DbSet<events> events { get; set; }
        public virtual DbSet<highrManagment> highrManagment { get; set; }
        public virtual DbSet<hourlyPermissions> hourlyPermissions { get; set; }
        public virtual DbSet<Images> Images { get; set; }
        public virtual DbSet<jobs> jobs { get; set; }
        public virtual DbSet<managements> managements { get; set; }
        public virtual DbSet<materialsConsumption> materialsConsumption { get; set; }
        public virtual DbSet<messages> messages { get; set; }
        public virtual DbSet<messagesTemplates> messagesTemplates { get; set; }
        public virtual DbSet<periods> periods { get; set; }
        public virtual DbSet<rewards> rewards { get; set; }
        public virtual DbSet<salaryIncreases> salaryIncreases { get; set; }
        public virtual DbSet<scheduleVacations> scheduleVacations { get; set; }
        //public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<tasks> tasks { get; set; }
        public virtual DbSet<trainings> trainings { get; set; }
        public virtual DbSet<vacations> vacations { get; set; }
    }
}
