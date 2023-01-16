using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class EvaluationModel
    {
        #region Attributes
        public long EvaluationID { get; set; }
        public Nullable<long> EmployeeID { get; set; }
        public string EmployeeName { get; set; }
        public Nullable<long> ReviewerID { get; set; }
        public string ReviewerName { get; set; }
        public Nullable<System.DateTime> EvaluationDate { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<long> CreateUserID { get; set; }
        public Nullable<long> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }

        //Behavior 
        //Attendance  
        //Punctuality 
        //Productivity    
        //Creativity   
        //ClientRelation   
        //Initiative  
        //Communication    
        //Cooperation 
        //StrategicThinking   
        //HandleStressful     
        //ListeningSkills     
        //MeetingDeadlines    
        //Performance  
        //JobKnowledge    
        //OrganizeIdea    
        //RespondResourcefully     
        //ConfrontsProblems   
        //CustomerNeeds    
        //OrganizationVision  
        //StayFocused  
        //OverAllProgress  
        //Comment   

        //Employee Mannerism Group
        public string Behavior { get; set; }
        public string Attendance { get; set; }
        public string Punctuality { get; set; }
        public string Productivity { get; set; }
        public string Creativity { get; set; }
        public string ClientRelation { get; set; }
        public string Initiative { get; set; }
        //Skills Group
        public string Communication { get; set; }
        public string Cooperation { get; set; }
        public string StrategicThinking { get; set; }
        public string HandleStressful { get; set; }
        public string ListeningSkills { get; set; }
        public string MeetingDeadlines { get; set; }
        //Job Knowledge Group
        public string Performance { get; set; }
        public string JobKnowledge { get; set; }
        public string OrganizeIdea { get; set; }
        //performance indicator Group
        public string RespondResourcefully { get; set; }
        public string ConfrontsProblems { get; set; }
        public string CustomerNeeds { get; set; }
        public string OrganizationVision { get; set; }
        public string StayFocused { get; set; }
        public string OverAllProgress { get; set; }
        public string Comment { get; set; }

        #endregion

        #region methods
        public List<EvaluationModel> getActivity()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.evaluations.Where(x => x.IsActive == true)
                                .Select(x => new EvaluationModel()
                                {
                                    EvaluationID = x.EvaluationID,
                                    Behavior = x.Behavior,
                                    Attendance = x.Attendance,
                                    Punctuality = x.Punctuality,
                                    Productivity = x.Productivity,
                                    Creativity = x.Creativity,
                                    ClientRelation = x.ClientRelation,
                                    Initiative = x.Initiative,
                                    Communication = x.Communication,
                                    Cooperation = x.Cooperation,
                                    StrategicThinking = x.StrategicThinking,
                                    HandleStressful = x.HandleStressful,
                                    ListeningSkills = x.ListeningSkills,
                                    MeetingDeadlines = x.MeetingDeadlines,
                                    Performance = x.Performance,
                                    JobKnowledge = x.JobKnowledge,
                                    OrganizeIdea = x.OrganizeIdea,
                                    RespondResourcefully = x.RespondResourcefully,
                                    ConfrontsProblems = x.ConfrontsProblems,
                                    CustomerNeeds = x.CustomerNeeds,
                                    OrganizationVision = x.OrganizationVision,
                                    StayFocused = x.StayFocused,
                                    OverAllProgress = x.OverAllProgress,
                                    Comment = x.Comment,
                                    EmployeeID = x.EmployeeID,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameAr).FirstOrDefault(),
                                    ReviewerID = x.ReviewerID,
                                    ReviewerName = entity.employees.Where(m => m.EmployeeID == x.ReviewerID).Select(m => m.NameAr).FirstOrDefault(),
                                    EvaluationDate = x.EvaluationDate,
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).ToList();
                return depts;
            }
        }
        public EvaluationModel getEmpEvaluation(int empId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var evaluations = entity.evaluations.Where(x => x.IsActive == true
                                && x.EmployeeID == empId)
                                .Select(x => new EvaluationModel()
                                {
                                    EvaluationID = x.EvaluationID,
                                    Behavior = x.Behavior,
                                    Attendance = x.Attendance,
                                    Punctuality = x.Punctuality,
                                    Productivity = x.Productivity,
                                    Creativity = x.Creativity,
                                    ClientRelation = x.ClientRelation,
                                    Initiative = x.Initiative,
                                    Communication = x.Communication,
                                    Cooperation = x.Cooperation,
                                    StrategicThinking = x.StrategicThinking,
                                    HandleStressful = x.HandleStressful,
                                    ListeningSkills = x.ListeningSkills,
                                    MeetingDeadlines = x.MeetingDeadlines,
                                    Performance = x.Performance,
                                    JobKnowledge = x.JobKnowledge,
                                    OrganizeIdea = x.OrganizeIdea,
                                    RespondResourcefully = x.RespondResourcefully,
                                    ConfrontsProblems = x.ConfrontsProblems,
                                    CustomerNeeds = x.CustomerNeeds,
                                    OrganizationVision = x.OrganizationVision,
                                    StayFocused = x.StayFocused,
                                    OverAllProgress = x.OverAllProgress,
                                    Comment = x.Comment,
                                    EmployeeID = x.EmployeeID,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameAr).FirstOrDefault(),
                                    ReviewerID = x.ReviewerID,
                                    ReviewerName = entity.employees.Where(m => m.EmployeeID == x.ReviewerID).Select(m => m.NameAr).FirstOrDefault(),
                                    EvaluationDate = x.EvaluationDate,
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).ToList();

                var eval = evaluations.Where(x => x.EvaluationID == evaluations.Max(y => y.EvaluationID)).FirstOrDefault();
                return eval;
            }
        }
        public EvaluationModel getEvaluation(int evaluationId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var dept = entity.evaluations.Where(x => x.EvaluationID == evaluationId)
                                .Select(x => new EvaluationModel()
                                {
                                    EvaluationID = x.EvaluationID,
                                    Behavior = x.Behavior,
                                    Attendance = x.Attendance,
                                    Punctuality = x.Punctuality,
                                    Productivity = x.Productivity,
                                    Creativity = x.Creativity,
                                    ClientRelation = x.ClientRelation,
                                    Initiative = x.Initiative,
                                    Communication = x.Communication,
                                    Cooperation = x.Cooperation,
                                    StrategicThinking = x.StrategicThinking,
                                    HandleStressful = x.HandleStressful,
                                    ListeningSkills = x.ListeningSkills,
                                    MeetingDeadlines = x.MeetingDeadlines,
                                    Performance = x.Performance,
                                    JobKnowledge = x.JobKnowledge,
                                    OrganizeIdea = x.OrganizeIdea,
                                    RespondResourcefully = x.RespondResourcefully,
                                    ConfrontsProblems = x.ConfrontsProblems,
                                    CustomerNeeds = x.CustomerNeeds,
                                    OrganizationVision = x.OrganizationVision,
                                    StayFocused = x.StayFocused,
                                    OverAllProgress = x.OverAllProgress,
                                    Comment = x.Comment,
                                    EmployeeID = x.EmployeeID,
                                    EmployeeName = entity.employees.Where(m => m.EmployeeID == x.EmployeeID).Select(m => m.NameAr).FirstOrDefault(),
                                    ReviewerID = x.ReviewerID,
                                    ReviewerName = entity.employees.Where(m => m.EmployeeID == x.ReviewerID).Select(m => m.NameAr).FirstOrDefault(),
                                    EvaluationDate = x.EvaluationDate,
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).FirstOrDefault();
                return dept;
            }
        }

        public long SaveDept(EvaluationModel dept)
        {
            try
            {
                evaluations evaluation;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (dept.EvaluationID.Equals(0))
                    {
                        evaluation = new evaluations()
                        {
                            EmployeeID = dept.EmployeeID,
                            ReviewerID = dept.ReviewerID,
                            EvaluationDate = dept.EvaluationDate,
                            Behavior = dept.Behavior,
                            Attendance = dept.Attendance,
                            Punctuality = dept.Punctuality,
                            Productivity = dept.Productivity,
                            Creativity = dept.Creativity,
                            ClientRelation = dept.ClientRelation,
                            Initiative = dept.Initiative,
                            Communication = dept.Communication,
                            Cooperation = dept.Cooperation,
                            StrategicThinking = dept.StrategicThinking,
                            HandleStressful = dept.HandleStressful,
                            ListeningSkills = dept.ListeningSkills,
                            MeetingDeadlines = dept.MeetingDeadlines,
                            Performance = dept.Performance,
                            JobKnowledge = dept.JobKnowledge,
                            OrganizeIdea = dept.OrganizeIdea,
                            RespondResourcefully = dept.RespondResourcefully,
                            ConfrontsProblems = dept.ConfrontsProblems,
                            CustomerNeeds = dept.CustomerNeeds,
                            OrganizationVision = dept.OrganizationVision,
                            StayFocused = dept.StayFocused,
                            OverAllProgress = dept.OverAllProgress,
                            Comment = dept.Comment,
                            IsActive = true,
                            CreateUserID = dept.CreateUserID,
                            UpdateUserID = dept.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        evaluation = entity.evaluations.Add(evaluation);
                    }
                    else
                    {
                        evaluation = entity.evaluations.Find(dept.EvaluationID);
                        evaluation.EmployeeID = dept.EmployeeID;
                        evaluation.ReviewerID = dept.ReviewerID;
                        evaluation.EvaluationDate = dept.EvaluationDate;
                        evaluation.Behavior = dept.Behavior;
                        evaluation.Attendance = dept.Attendance;
                        evaluation.Punctuality = dept.Punctuality;
                        evaluation.Productivity = dept.Productivity;
                        evaluation.Creativity = dept.Creativity;
                        evaluation.ClientRelation = dept.ClientRelation;
                        evaluation.Initiative = dept.Initiative;
                        evaluation.Communication = dept.Communication;
                        evaluation.Cooperation = dept.Cooperation;
                        evaluation.StrategicThinking = dept.StrategicThinking;
                        evaluation.HandleStressful = dept.HandleStressful;
                        evaluation.ListeningSkills = dept.ListeningSkills;
                        evaluation.MeetingDeadlines = dept.MeetingDeadlines;
                        evaluation.Performance = dept.Performance;
                        evaluation.JobKnowledge = dept.JobKnowledge;
                        evaluation.OrganizeIdea = dept.OrganizeIdea;
                        evaluation.RespondResourcefully = dept.RespondResourcefully;
                        evaluation.ConfrontsProblems = dept.ConfrontsProblems;
                        evaluation.CustomerNeeds = dept.CustomerNeeds;
                        evaluation.OrganizationVision = dept.OrganizationVision;
                        evaluation.StayFocused = dept.StayFocused;
                        evaluation.OverAllProgress = dept.OverAllProgress;
                        evaluation.Comment = dept.Comment;
                        evaluation.Notes = dept.Notes;
                        evaluation.IsActive = true;
                        evaluation.UpdateUserID = dept.UpdateUserID;
                        evaluation.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return evaluation.EvaluationID;
            }

            catch(Exception ex)
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
                    var dept = entity.evaluations.Find(deptId);
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