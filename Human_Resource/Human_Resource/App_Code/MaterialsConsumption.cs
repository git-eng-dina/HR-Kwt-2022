using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource
{
    public class MaterialsConsumptionModel
    {
        
        #region Attributes
        public int MaterialsConsumptionID { get; set; }
        public string Type { get; set; }
        public string Details { get; set; }
        public Nullable<int> EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        #endregion

        #region methods
        public List<MaterialsConsumptionModel> getActivity()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.materialsConsumption.Where(x => x.IsActive == true)
                                .Select(x => new MaterialsConsumptionModel()
                                {
                                    MaterialsConsumptionID = x.MaterialsConsumptionID,
                                    Type = x.Type,
                                    Details = x.Details,
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
         public MaterialsConsumptionModel getMaterialsConsumption(int materialsConsumptionId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.materialsConsumption.Where(x => x.MaterialsConsumptionID == materialsConsumptionId)
                                .Select(x => new MaterialsConsumptionModel()
                                {
                                    MaterialsConsumptionID = x.MaterialsConsumptionID,
                                    Type = x.Type,
                                    Details = x.Details,
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

        public int SaveDept(MaterialsConsumptionModel dept)
        {
            try
            {
                materialsConsumption materialsConsumption;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (dept.MaterialsConsumptionID.Equals(0))
                    {
                        materialsConsumption = new materialsConsumption()
                        {
                            Type = dept.Type,
                             EmployeeID = dept.EmployeeID,
                            Details = dept.Details,
                            IsActive = true,
                            CreateUserID = dept.CreateUserID,
                            UpdateUserID = dept.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        materialsConsumption = entity.materialsConsumption.Add(materialsConsumption);
                    }
                    else
                    {
                        materialsConsumption = entity.materialsConsumption.Find(dept.MaterialsConsumptionID);
                        materialsConsumption.Type = dept.Type;
                         materialsConsumption.EmployeeID = dept.EmployeeID;
                        materialsConsumption.Details = dept.Details;
                        materialsConsumption.Notes = dept.Notes;
                        materialsConsumption.IsActive = true;
                        materialsConsumption.UpdateUserID = dept.UpdateUserID;
                        materialsConsumption.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return materialsConsumption.MaterialsConsumptionID;
            }

            catch
            {
                return 0;
            }
        }
        public bool DeleteDept(int deptId, int? userId)
        {
            try
            {
                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    var dept = entity.materialsConsumption.Find(deptId);
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