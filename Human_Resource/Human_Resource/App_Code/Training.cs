using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class TrainingModel
    {

        #region Attributes
        public int TrainingID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        #endregion

        #region methods
        public List<TrainingModel> getActivity()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.trainings.Where(x => x.IsActive == true)
                                .Select(x => new TrainingModel()
                                {
                                    TrainingID = x.TrainingID,
                                    Name = x.Name,
                                    Description = x.Description,
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).ToList();
                return depts;
            }
        }
        public TrainingModel getTraining(int trainingId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.trainings.Where(x => x.TrainingID == trainingId)
                                .Select(x => new TrainingModel()
                                {
                                    TrainingID = x.TrainingID,
                                    Name = x.Name,
                                    Description = x.Description,
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).FirstOrDefault();
                return dept;
            }
        }

        public int SaveDept(TrainingModel dept)
        {
            try
            {
                trainings training;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (dept.TrainingID.Equals(0))
                    {
                        training = new trainings()
                        {
                            Name = dept.Name,
                            Description = dept.Description,
                            IsActive = true,
                            CreateUserID = dept.CreateUserID,
                            UpdateUserID = dept.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        training = entity.trainings.Add(training);
                    }
                    else
                    {
                        training = entity.trainings.Find(dept.TrainingID);
                        training.Name = dept.Name;
                        training.Description = dept.Description;
                        training.Notes = dept.Notes;
                        training.IsActive = true;
                        training.UpdateUserID = dept.UpdateUserID;
                        training.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return training.TrainingID;
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
                    var dept = entity.trainings.Find(deptId);
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