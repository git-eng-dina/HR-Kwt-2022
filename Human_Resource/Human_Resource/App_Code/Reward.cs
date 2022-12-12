using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class RewardModel
     {
        #region Attributes
        public int RewardID { get; set; }
        //public string Type { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Value { get; set; }
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
        public List<RewardModel> getActivity()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.rewards.Where(x => x.IsActive == true)
                                .Select(x => new RewardModel()
                                {
                                    RewardID = x.RewardID,
                                    //Type = x.Type,
                                    Title = x.Title,
                                    Description = x.Description,
                                    Value = x.Value,
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
        public List<RewardModel> getBranchEmpPenalties(int managerId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.rewards.Where(x => x.IsActive == true
                            && x.employees.managements.branches.ManagerID == managerId)
                                .Select(x => new RewardModel()
                                {
                                    RewardID = x.RewardID,
                                    //Type = x.Type,
                                    Title = x.Title,
                                    Description = x.Description,
                                    Value = x.Value,
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
        public List<RewardModel> getManagementEmpPenalties(int managerId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.rewards.Where(x => x.IsActive == true
                            && x.employees.managements.ManagerID == managerId)
                                .Select(x => new RewardModel()
                                {
                                    RewardID = x.RewardID,
                                    //Type = x.Type,
                                    Title = x.Title,
                                    Description = x.Description,
                                    Value = x.Value,
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
        public List<RewardModel> getEmpPenalties(int empId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.rewards.Where(x => x.IsActive == true && x.EmployeeID==empId)
                                .Select(x => new RewardModel()
                                {
                                    RewardID = x.RewardID,
                                    //Type = x.Type,
                                    Title = x.Title,
                                    Description = x.Description,
                                    Value = x.Value,
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
        public RewardModel getReward(int rewardId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.rewards.Where(x => x.RewardID == rewardId)
                                .Select(x => new RewardModel()
                                {
                                    RewardID = x.RewardID,
                                    //Type = x.Type,
                                    Title = x.Title,
                                    Description = x.Description,
                                    Value = x.Value,
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

        public int SaveDept(RewardModel dept)
        {
            try
            {
                rewards reward;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (dept.RewardID.Equals(0))
                    {
                        reward = new rewards()
                        {
                            //Type = dept.Type,
                            EmployeeID = dept.EmployeeID,
                            Title = dept.Title,
                            Description = dept.Description,
                            Value = dept.Value,
                             IsActive = true,
                            CreateUserID = dept.CreateUserID,
                            UpdateUserID = dept.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        reward = entity.rewards.Add(reward);
                    }
                    else
                    {
                        reward = entity.rewards.Find(dept.RewardID);
                        //reward.Type = dept.Type;
                        reward.EmployeeID = dept.EmployeeID;
                        reward.Title = dept.Title;
                        reward.Description = dept.Description;
                        reward.Value = dept.Value;
                         reward.Notes = dept.Notes;
                        reward.IsActive = true;
                        reward.UpdateUserID = dept.UpdateUserID;
                        reward.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return reward.RewardID;
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
                    var dept = entity.rewards.Find(deptId);
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