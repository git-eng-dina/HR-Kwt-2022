﻿using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace Human_Resource.Views.ExecutiveProc
{
    /// <summary>
    /// Summary description for EventResponse
    /// </summary>
    public class EventResponse : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";

            DateTime start = new DateTime(1970, 1, 1);
            DateTime end = new DateTime(1970, 1, 1);

            //start = start.AddSeconds(double.Parse(context.Request.QueryString["start"]));
            //end = end.AddSeconds(double.Parse(context.Request.QueryString["end"]));



            //String result = String.Empty;

            //result += "[";

            List<long> idList = new List<long>();
            EventModel eventModel = new EventModel();

            var listCalender = eventModel.getEvents(start, end,int.Parse(context.Session["user_id"].ToString()));
            //System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            //var ss = js.Serialize(listCalender);
           // context.Response.Write(js.Serialize(listCalender));

            var result = "[";
           foreach (EventModel cevent in listCalender)
            {
                result += convertCalendarEventIntoString(cevent);
                idList.Add(cevent.id);
            }

            if (result.EndsWith(","))
            {
                result = result.Substring(0, result.Length - 1);
            }

            result += "]";
            // //store list of event ids in Session, so that it can be accessed in web methods
            //  context.Session["idList"] = idList;
            result = result.Replace("'", "\"");
            context.Response.Write(result);


        }
        private  String convertCalendarEventIntoString(EventModel cevent)
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
                      "'id': '" + cevent.id + "'," +
                      "'title': '" + HttpContext.Current.Server.HtmlEncode(cevent.title) + "'," +
                     "'start': '" + cevent.start.ToString("s") + "'," +
                     "'end': '" + cevent.end.ToString("s") + "'," +
                      "'allDay':" + allDay + "," +
                      "'description': '" + HttpContext.Current.Server.HtmlEncode(cevent.description) + "'" +
                      "},";
        }
        private long ConvertToTimestamp(DateTime value)
        {


            long epoch = (value.ToUniversalTime().Ticks - 621355968000000000) / 10000000;
            return epoch;

        }
        //public void ProcessRequest(HttpContext context)
        //{
        //    context.Response.ContentType = "text/plain";
        //    context.Response.Write("Hello World");
        //}

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}