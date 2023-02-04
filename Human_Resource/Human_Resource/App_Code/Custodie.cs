using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class CustodieModel
    {

        #region Attributes
        public long CustodieID { get; set; }
        public string Type { get; set; }
        public string Details { get; set; }
        public Nullable<bool> IsRecovery { get; set; }
        public Nullable<long> EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<long> CreateUserID { get; set; }
        public Nullable<long> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Attachment Attachment { get; set; }
        #endregion

        #region methods
        public List<CustodieModel> getActivity()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.custodies.Where(x => x.IsActive == true)
                                .Select(x => new CustodieModel()
                                {
                                    CustodieID = x.CustodieID,
                                    Type = x.Type,
                                    Details = x.Details,
                                    IsRecovery = x.IsRecovery,
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
        public CustodieModel getCustodie(int custodieId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.custodies.Where(x => x.CustodieID == custodieId)
                                .Select(x => new CustodieModel()
                                {
                                    CustodieID = x.CustodieID,
                                    Type = x.Type,
                                    Details = x.Details,
                                    IsRecovery = x.IsRecovery,
                                    EmployeeID = x.EmployeeID,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameAr).FirstOrDefault(),
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                    Attachment = entity.Images.Where(m => m.CustodieID == custodieId)
                                            .Select(m => new Attachment()
                                            {
                                                docName = m.docName,
                                                docnum = m.docnum
                                            }).FirstOrDefault(),
                                }).FirstOrDefault();
                return dept;
            }
        }

        public long SaveCustody(CustodieModel custody)
        {
            try
            {
                custodies custodie;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (custody.CustodieID.Equals(0))
                    {
                        custodie = new custodies()
                        {
                            Type = custody.Type,
                            EmployeeID = custody.EmployeeID,
                            Details = custody.Details,
                            IsRecovery = custody.IsRecovery,
                            IsActive = true,
                            CreateUserID = custody.CreateUserID,
                            UpdateUserID = custody.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        custodie = entity.custodies.Add(custodie);
                    }
                    else
                    {
                        custodie = entity.custodies.Find(custody.CustodieID);
                        custodie.Type = custody.Type;
                        custodie.EmployeeID = custody.EmployeeID;
                        custodie.Details = custody.Details;
                        custodie.IsRecovery = custody.IsRecovery;
                        custodie.Notes = custody.Notes;
                        custodie.IsActive = true;
                        custodie.UpdateUserID = custody.UpdateUserID;
                        custodie.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return custodie.CustodieID;
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
                    var dept = entity.custodies.Find(deptId);
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