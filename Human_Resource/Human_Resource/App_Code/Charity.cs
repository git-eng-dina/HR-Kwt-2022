using LinqKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class CharityModel
    {
        #region Attributes
        public long CharityID { get; set; }
        public Nullable<long> EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public string Reason { get; set; }
        public decimal Amount { get; set; }
        public string Details { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CharityDate { get; set; }

        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<long> CreateUserID { get; set; }
        public Nullable<long> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }

        public Attachment Attachment { get; set; }
        #endregion

        #region methods
        public List<CharityModel> getActivity(DateTime? from,DateTime? to)
        {

            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var searchPredicate = PredicateBuilder.New<charitys>();
                searchPredicate = searchPredicate.And(x => x.IsActive == true);
                if (from != null)
                    searchPredicate = searchPredicate.And(x => x.CharityDate >= from);
                if (to != null)
                    searchPredicate = searchPredicate.And(x => x.CharityDate <=to);

                var depts = entity.charitys.Where(searchPredicate)
                                .Select(x => new CharityModel()
                                {
                                    CharityID = x.CharityID,
                                    Reason = x.Reason,
                                    Details = x.Details,
                                    Amount = x.Amount.Value,
                                    CharityDate = x.CharityDate,
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
                                    CharityDate = x.CharityDate,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                    Attachment = entity.Images.Where(m => m.CharityID == charityId)
                                            .Select(m => new Attachment()
                                            {
                                                docName = m.docName,
                                                docnum = m.docnum
                                            }).FirstOrDefault(),
                                }).FirstOrDefault();
                return dept;
            }
        }

        public long SaveCharity(CharityModel ch)
        {
            try
            {
                charitys charity;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (ch.CharityID.Equals(0))
                    {
                        charity = new charitys()
                        {
                            Reason = ch.Reason,
                            EmployeeID = ch.EmployeeID,
                            Details = ch.Details,
                            Amount = ch.Amount,
                            CharityDate = ch.CharityDate,
                            IsActive = true,
                            CreateUserID = ch.CreateUserID,
                            UpdateUserID = ch.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        charity = entity.charitys.Add(charity);
                    }
                    else
                    {
                        charity = entity.charitys.Find(ch.CharityID);
                        charity.Reason = ch.Reason;
                        charity.EmployeeID = ch.EmployeeID;
                        charity.Details = ch.Details;
                        charity.Amount = ch.Amount;
                        charity.Notes = ch.Notes;
                        charity.CharityDate = ch.CharityDate;
                        charity.IsActive = true;
                        charity.UpdateUserID = ch.UpdateUserID;
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
        public bool DeleteCharity(int deptId, long? userId)
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