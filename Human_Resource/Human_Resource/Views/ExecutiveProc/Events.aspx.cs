﻿using Human_Resource.App_Code;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.ExecutiveProc
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        public void ProcessRequest(string startDate,string endDate)
        {
           // context.Response.ContentType = "application/json";

            DateTime start = new DateTime(1970, 1, 1);
            DateTime end = new DateTime(1970, 1, 1);


            //if(context.Request.QueryString["start"] != null)
            //{
            //    start = start.AddSeconds(double.Parse(context.Request.QueryString["start"]));
            //}
            //if(context.Request.QueryString["end"] != null)
            //{
            //    end = end.AddSeconds(double.Parse(context.Request.QueryString["end"]));
            //}
            //start = start.AddSeconds(double.Parse(context.Request.QueryString["start"]));
            //end = end.AddSeconds(double.Parse(context.Request.QueryString["end"]));
            start = start.AddSeconds(double.Parse(startDate));
            end = end.AddSeconds(double.Parse(endDate));


            String result = String.Empty;

            result += "[";

            List<long> idList = new List<long>();
            EventModel eventModel = new EventModel();
            foreach (EventModel cevent in eventModel.getEvents(start, end))
            {
                result += convertCalendarEventIntoString(cevent);
                idList.Add(cevent.id);
            }

            if (result.EndsWith(","))
            {
                result = result.Substring(0, result.Length - 1);
            }

            result += "]";
            //store list of event ids in Session, so that it can be accessed in web methods
            Context.Session["idList"] = idList;

           Context.Response.Write(result);
        }
        private String convertCalendarEventIntoString(EventModel cevent)
        {
            String allDay = "true";
            if (ConvertToTimestamp(cevent.start).ToString().Equals(ConvertToTimestamp(cevent.end).ToString()))
            {

                if (cevent.start.Hour == 0 && cevent.start.Minute == 0 && cevent.start.Second == 0)
                {
                    allDay = "true";
                }
                else
                {
                    allDay = "false";
                }
            }
            else
            {
                if (cevent.start.Hour == 0 && cevent.start.Minute == 0 && cevent.start.Second == 0
                    && cevent.end.Hour == 0 && cevent.end.Minute == 0 && cevent.end.Second == 0)
                {
                    allDay = "true";
                }
                else
                {
                    allDay = "false";
                }
            }
            return "{" +
                      "id: '" + cevent.id + "'," +
                      "title: '" + HttpContext.Current.Server.HtmlEncode(cevent.title) + "'," +
                      "start:  " + ConvertToTimestamp(cevent.start).ToString() + "," +
                      "end: " + ConvertToTimestamp(cevent.end).ToString() + "," +
                      "allDay:" + allDay + "," +
                      "description: '" + HttpContext.Current.Server.HtmlEncode(cevent.description) + "'" +
                      "},";
        }

        private long ConvertToTimestamp(DateTime value)
        {


            long epoch = (value.ToUniversalTime().Ticks - 621355968000000000) / 10000000;
            return epoch;

        }

        [WebMethod(EnableSession = true)]
        public static string SaveEvent(string title, string description, string start, string end,string eventId, string empIds)
        {
            try
            {
                EventModel eventModel = new EventModel();
                if (eventId != "")
                    eventModel.id = long.Parse(eventId);
                else
                    eventModel.id = 0;
                eventModel.title = title;
                eventModel.description = description;
                eventModel.start = DateTime.Parse(start);
                eventModel.end = DateTime.Parse(end);

                if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                    eventModel.EmployeeID = int.Parse(HttpContext.Current.Session["user_id"].ToString());

                if (empIds.EndsWith(","))
                    empIds = empIds.Substring(0, empIds.Length - 1);
                var Ids = empIds.Split(',');

               int[] IdsArray =  new int[Ids.Length];
                for (int i = 0; i < Ids.Length; i++)
                {

                    IdsArray[i] = int.Parse(Ids[i]);
                }

                int eventIdRes = eventModel.Save(eventModel, IdsArray);
                if (eventIdRes != 0)
                {
                    return "1";
                }
                return "0";
            }
            catch
            {
                return "0";

            }

        }
    }
}