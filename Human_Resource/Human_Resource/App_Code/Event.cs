using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class EventModel
    {
        #region Attributes
        public int id { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public DateTime start { get; set; }
        public DateTime end { get; set; }
        #endregion


        #region Methods

        public List<EventModel> getEvents(DateTime start, DateTime end)
        {
            using ( HRSystemEntities entity = new HRSystemEntities())
                {
                var events = entity.events.Where(x => x.IsActive == true)
                            //    && x.StartDate >= start && x.EndDate <= end)
                    .Select(x => new EventModel()
                    {
                       id = x.EventID,
                       title  = x.Name,
                       description = x.Description,
                       start=(DateTime)x.StartDate,
                       end=(DateTime)x.EndDate,
                       
                    }).ToList();
                return events;
            }
        }
        #endregion
    }
}