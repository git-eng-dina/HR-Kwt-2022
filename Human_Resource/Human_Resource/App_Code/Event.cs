﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class EventModel
    {
        #region Attributes
        public long id { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public DateTime start { get; set; }
        public DateTime end { get; set; }
        public Nullable<int> EmployeeID { get; set; }
        public Nullable<int> BranchManagerID { get; set; }
        public Nullable<int> ManagementManagerID { get; set; }
        public Nullable<bool> Approved { get; set; }

        public Attachment Attachment { get; set; }
        public List<EmployeeModel> Employees { get; set; }
        #endregion


        #region Methods

        public List<EventModel> getEvents(DateTime start, DateTime end,int employeeID)
        {
            using ( HRSystemEntities entity = new HRSystemEntities())
                {
                var events = entity.events.Where(x => x.IsActive == true && x.Approved == true
                               && x.StartDate >= start && x.EndDate <= end
                               && (x.EmployeeID ==employeeID || entity.EemployeesEvents.Where(e => e.EventID == x.EventID).Select(e => e.EmployeeID).Contains(employeeID) ))
                    .Select(x => new EventModel()
                    {
                       id = x.EventID,
                       title  = x.Name,
                       description = x.Description,
                        start = (DateTime)x.StartDate.Value,
                       end=(DateTime)x.EndDate.Value,
                       EmployeeID = x.EmployeeID,
                       Employees = entity.EemployeesEvents.Where(e => e.EventID == x.EventID).Select(e => new EmployeeModel() { EmployeeID = e.EmployeeID}).ToList(),
                    }).ToList();
                return events;
            }
        }

        public EventModel getEvent(int eventId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var eventObj = entity.events.Where(x => x.EventID == eventId)
                                .Select(x => new EventModel()
                                {
                                    id= x.EventID,
                                    title = x.Name,
                                    description = x.Description,
                                    start = (DateTime) x.StartDate.Value,
                                    end = (DateTime)x.EndDate.Value,
                                 
                                    Employees = entity.EemployeesEvents.Where(m => m.EventID == x.EventID && m.IsActive == true)
                                                .Select(m => new EmployeeModel()
                                                {
                                                    EmployeeID = m.EmployeeID,
                                                    NameAr = m.employees.NameAr,
                                                    NameEn = m.employees.NameEn,
                                                }).ToList(),
                                }).FirstOrDefault();
                return eventObj;
            }
        }
        public long Save(EventModel eventModel,List<int> empIds)
        {
            try
            {
                events events;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (eventModel.id.Equals(0))
                    {
                        events = new events()
                        {
                            Name = eventModel.title,
                            Description = eventModel.description,
                            EmployeeID = eventModel.EmployeeID,
                            StartDate = eventModel.start,
                            EndDate = eventModel.end,
                            
                            IsActive = true,
                            CreateUserID = eventModel.EmployeeID,
                            UpdateUserID = eventModel.EmployeeID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        events = entity.events.Add(events);
                    }
                    else
                    {
                        //delete event tags
                        var tags = entity.EemployeesEvents.Where(x => x.EventID == eventModel.id).ToList();
                        entity.EemployeesEvents.RemoveRange(tags);

                        events = entity.events.Find(eventModel.id);
                        events.Name = eventModel.title;
                        events.Description = eventModel.description;
                        events.StartDate = eventModel.start;
                        events.EndDate = eventModel.end;
                        events.UpdateUserID = eventModel.EmployeeID;
                        events.UpdateDate = DateTime.Now;
                    }
                  
                    entity.SaveChanges();

                    //add event tags
                    foreach(var id in empIds)
                    {
                        var empTag = new EemployeesEvents()
                        {
                            EventID = events.EventID,
                            EmployeeID = id,
                            IsActive = true,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                            CreateUserID = eventModel.EmployeeID,
                            UpdateUserID = eventModel.EmployeeID,
                        };
                        entity.EemployeesEvents.Add(empTag);
                    }
                    entity.SaveChanges();
                }
                return events.EventID;
            }

            catch
            {
                return 0;
            }
        }
        #endregion
    }
}