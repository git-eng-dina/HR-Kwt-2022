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
        public Nullable<int> JobLevel { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        #endregion

        #region methods
        public List<JobModel> GetJobs()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var jobs = entity.jobs.Where(x => x.IsActive == true )
                            .Select(x => new JobModel()
                            {
                                JobID = x.JobID,
                                Name=x.Name,
                                JobLevel = x.JobLevel,
                                Notes = x.Notes,
                                CreateDate = x.CreateDate,
                                UpdateDate = x.UpdateDate,
                                CreateUserID = x.CreateUserID,
                                UpdateUserID = x.UpdateUserID,
                            }).ToList();
                return jobs;
            }
        }
        #endregion
    }
}