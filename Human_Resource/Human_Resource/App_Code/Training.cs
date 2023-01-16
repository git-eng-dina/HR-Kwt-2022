using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class TrainingModel
    {

        #region Attributes
        public long TrainingID { get; set; }
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

        public List<EmployeeModel> Employees { get; set; }
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
                                    StartDate = x.StartDate,
                                    EndDate = x.EndDate,
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).ToList();
                return depts;
            }
        }
        public List<TrainingModel> getEmployeeTraining(int EmpID)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.trainings.Where(x => x.IsActive == true && x.employeesTrainings.Where(et => et.employees.EmployeeID == EmpID).Count() >0)
                                .Select(x => new TrainingModel()
                                {
                                    TrainingID = x.TrainingID,
                                    Name = x.Name,
                                    Description = x.Description,
                                    StartDate = x.StartDate,
                                    EndDate = x.EndDate,
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).ToList();
                return depts;
            }
        }
        public int GetActiveCount(int employeeId)
        {
            var now = DateTime.Now.Date;
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.trainings.Where(x => x.IsActive == true)
                                .Select(x => new TrainingModel()
                                {
                                    TrainingID = x.TrainingID,
                                    Name = x.Name,
                                    Description = x.Description,
                                    StartDate = x.StartDate,
                                    EndDate = x.EndDate,
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).ToList();
                return depts.Count();
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
                                    StartDate = x.StartDate,
                                    EndDate = x.EndDate,
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                    Employees = entity.employeesTrainings.Where(m => m.TrainingID == x.TrainingID && m.IsActive == true)
                                                .Select(m => new EmployeeModel() {
                                                EmployeeID = m.EmployeeID,
                                                NameAr = m.employees.NameAr,
                                                NameEn = m.employees.NameEn,
                                                }).ToList(),
                                }).FirstOrDefault();
                return dept;
            }
        }

        public long SaveDept(TrainingModel dept, string empIds)
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
                            StartDate = dept.StartDate,
                            EndDate = dept.EndDate,
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
                        training.StartDate = dept.StartDate;
                        training.EndDate = dept.EndDate;
                        training.Notes = dept.Notes;
                        training.IsActive = true;
                        training.UpdateUserID = dept.UpdateUserID;
                        training.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }

                if(training.TrainingID > 0)
                {
                    using (HRSystemEntities entity = new HRSystemEntities())
                    {
                        var employeesTrainingss = entity.employeesTrainings.Where(x => x.TrainingID == training.TrainingID);
                        entity.employeesTrainings.RemoveRange(
                            employeesTrainingss
                            );
                        entity.SaveChanges();

                        //"1,2,"
                        //empIds
                        var empIdsList = empIds.Split(',').Where(x => !string.IsNullOrWhiteSpace(x)).ToList();
                        foreach (var item in empIdsList)
                        {
                            employeesTrainings employeesTrainings = new employeesTrainings();
                            employeesTrainings.TrainingID = training.TrainingID;
                            employeesTrainings.EmployeeID = int.Parse(item);
                            employeesTrainings.IsActive = true;
                            employeesTrainings.CreateUserID = dept.CreateUserID;
                            employeesTrainings.UpdateUserID = dept.UpdateUserID;
                            employeesTrainings.CreateDate = DateTime.Now;
                            employeesTrainings.UpdateDate = DateTime.Now;

                            entity.employeesTrainings.Add(employeesTrainings);

                        }
                        entity.SaveChanges();
                    }
                }

                return training.TrainingID;
            }

            catch
            {
                return 0;
            }
        }
        public bool DeleteDept(long deptId, long? userId)
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