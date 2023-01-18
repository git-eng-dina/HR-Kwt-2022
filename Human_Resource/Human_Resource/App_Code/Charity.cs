using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class CharityModel
    {
        #region Attributes
        public int CharityID { get; set; }
        public Nullable<long> EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public string Reason { get; set; }
        public decimal Amount { get; set; }
        public string Details { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<long> CreateUserID { get; set; }
        public Nullable<long> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        #endregion

        #region methods
        public List<CharityModel> getActivity()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.charitys.Where(x => x.IsActive == true)
                                .Select(x => new CharityModel()
                                {
                                    CharityID = x.CharityID,
                                    Reason = x.Reason,
                                    Details = x.Details,
                                    Amount = x.Amount.Value,
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
        public CharityModel getCharity(int charityId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.charitys.Where(x => x.CharityID == charityId)
                                .Select(x => new CharityModel()
                                {
                                    CharityID = x.CharityID,
                                    Reason = x.Reason,
                                    Details = x.Details,
                                    Amount = x.Amount.Value,
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

        public int SaveDept(CharityModel dept)
        {
            try
            {
                charitys charity;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (dept.CharityID.Equals(0))
                    {
                        charity = new charitys()
                        {
                            Reason = dept.Reason,
                            EmployeeID = dept.EmployeeID,
                            Details = dept.Details,
                            Amount = dept.Amount,
                            IsActive = true,
                            CreateUserID = dept.CreateUserID,
                            UpdateUserID = dept.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        charity = entity.charitys.Add(charity);
                    }
                    else
                    {
                        charity = entity.charitys.Find(dept.CharityID);
                        charity.Reason = dept.Reason;
                        charity.EmployeeID = dept.EmployeeID;
                        charity.Details = dept.Details;
                        charity.Amount = dept.Amount;
                        charity.Notes = dept.Notes;
                        charity.IsActive = true;
                        charity.UpdateUserID = dept.UpdateUserID;
                        charity.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return charity.CharityID;
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
                    var dept = entity.charitys.Find(deptId);
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