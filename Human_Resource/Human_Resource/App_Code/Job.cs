using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource
{
    public class JobModel
    {
        #region attributes
        public int JobID { get; set; }
        public string Name { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        #endregion

        #region methods
        public List<JobModel> GetActivity()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var jobs = entity.jobs.Where(x => x.IsActive == true )
                            .Select(x => new JobModel()
                            {
                                JobID = x.JobID,
                                Name=x.Name,
                                Notes = x.Notes,
                                CreateDate = x.CreateDate,
                                UpdateDate = x.UpdateDate,
                                CreateUserID = x.CreateUserID,
                                UpdateUserID = x.UpdateUserID,
                            }).ToList();
                return jobs;
            }
        }

       
         public JobModel getJob(int jobId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.jobs.Where(x => x.JobID == jobId)
                                .Select(x => new JobModel()
                                {
                                    JobID = x.JobID,
                                    Name = x.Name,
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).FirstOrDefault();
                return dept;
            }
        }

        public int SaveJob(JobModel dept)
        {
            try
            {
                jobs job;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (dept.JobID.Equals(0))
                    {
                        job = new jobs()
                        {
                            Name = dept.Name,
                            IsActive = true,
                            CreateUserID = dept.CreateUserID,
                            UpdateUserID = dept.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        job = entity.jobs.Add(job);
                    }
                    else
                    {
                        job = entity.jobs.Find(dept.JobID);
                        job.Name = dept.Name;
                        job.Notes = dept.Notes;
                        job.IsActive = true;
                        job.UpdateUserID = dept.UpdateUserID;
                        job.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return job.JobID;
            }

            catch
            {
                return 0;
            }
        }
        public bool DeleteJob(int deptId, int? userId)
        {
            try
            {
                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    var dept = entity.jobs.Find(deptId);
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