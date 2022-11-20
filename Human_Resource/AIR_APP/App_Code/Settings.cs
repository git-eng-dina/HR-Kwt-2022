using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class CompanyModel
    {
        #region Attributes
        public int CompanyID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string Notes { get; set; }
        public Nullable<bool> OurCompany { get; set; }

        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }

        #endregion

        #region Methods
        public CompanyModel GetCompanyInfo()
        {
            CompanyModel com = new CompanyModel();
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                 com = entity.companies.Where(x =>x.IsActive == true)
                        .Select(x => new CompanyModel()
                        {
                            CompanyID = x.CompanyID,
                            Name = x.Name,
                            Email = x.Email,
                            Address = x.Address,
                            Fax = x.Fax,
                            Phone = x.Phone,
                            Mobile = x.Mobile,
                            OurCompany=x.OurCompany,
                             IsActive = x.IsActive,
                             Notes = x.Notes,
                             CreateUserID = x.CreateUserID,
                             UpdateUserID = x.UpdateUserID,
                        }).FirstOrDefault();
            }
            return com;
        }

        public int SaveCompanyInfo(CompanyModel company)
        {
            try
            {
                companies com;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (company.CompanyID.Equals(0))
                    {
                        com = new companies()
                        {
                            Name = company.Name,
                            Address = company.Address,
                            Email = company.Email,
                            Phone = company.Phone,
                            Fax = company.Fax,
                            Mobile = company.Mobile,
                            Notes = company.Notes,
                            OurCompany = company.OurCompany,
                            IsActive = true,
                            CreateUserID = company.CreateUserID,
                            UpdateUserID = company.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                       com = entity.companies.Add(com);
                    }
                    else
                    {
                        com = entity.companies.Find(company.CompanyID);
                        com.Name = company.Name;
                        com.Address = company.Address;
                        com.Email = company.Email;
                        com.Phone = company.Phone;
                        com.Fax = company.Fax;
                        com.Mobile = company.Mobile;
                        com.Notes = company.Notes;
                        com.OurCompany = company.OurCompany;
                        com.IsActive = true;
                        com.UpdateUserID = company.UpdateUserID;
                        com.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return com.CompanyID;
            }

            catch {
                return 0;
            }
        }
        #endregion
    }

    public class DepartmentModel
    {
        #region Attributes
        public int DepartmentID { get; set; }
        public string Name { get; set; }
        public Nullable<int> CompanyID { get; set; }
        public Nullable<int> ParentDepartmentID { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        #endregion
    }
}