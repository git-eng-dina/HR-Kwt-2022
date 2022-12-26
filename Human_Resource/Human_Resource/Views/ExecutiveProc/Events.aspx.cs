﻿using Human_Resource.App_Code;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Hosting;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.ExecutiveProc
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            {
                EmployeeModel emp = new EmployeeModel();
                var employees = emp.GetEmployees(true, true);

                if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                    employees = employees.Where(x => x.EmployeeID != int.Parse(HttpContext.Current.Session["user_id"].ToString())).ToList();
                sel_employee.DataSource = employees;
                sel_employee.DataValueField = "EmployeeID";
                if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                {
                    sel_employee.DataTextField = "NameEn";

                }
                else
                {
                    sel_employee.DataTextField = "NameAr";
                }

                DataBind();

                hdnButtonID.Value = btn_ads.UniqueID;
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {

            //try
            if (!IsPostBack)
            {

                EventModel eventModel = new EventModel();
                if (eventId.Value != "")
                    eventModel.id = long.Parse(eventId.Value);
                else
                    eventModel.id = 0;
                eventModel.title = txt_title.Value;
                eventModel.description = description.Text;


                //try
                //{
                //    var result = DateTime.Parse(start.Value);
              
                //    //DateTimeFormatInfo sdf = new DateTimeFormatInfo();
                //    //sdf.LongDatePattern = Locale(identifier: "en_US_POSIX")
                //    //sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
                //    //System.out.println(sdf.format(result)); //prints date in the format sdf
                //}
                //catch { }

                eventModel.start = DateTime.Parse(start.Value);
                eventModel.end = DateTime.Parse(end.Value);
                //eventModel.start = DateTime.Parse(start);
                //eventModel.end = DateTime.Parse(end);

                if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                    eventModel.EmployeeID = int.Parse(HttpContext.Current.Session["user_id"].ToString());

                string empIds = hdn_empIds.Value;
                if (empIds.EndsWith(","))
                    empIds = empIds.Substring(0, empIds.Length - 1);

                List<int> idsList = new List<int>();
                if (empIds != "")
                {
                    var Ids = empIds.Split(',');

                    for (int i = 0; i < Ids.Length; i++)
                    {

                        idsList.Add(int.Parse(Ids[i]));
                    }
                }

                long eventIdRes = eventModel.Save(eventModel, idsList);

                if (file.FileName != "")
                {
                    //folder path to save uploaded file
                    string folderPath = Server.MapPath(HelpClass.EventUpload);

                    //Check whether Directory (Folder) exists, although we have created, if it si not created this code will check
                    if (!Directory.Exists(folderPath))
                    {
                        //If folder does not exists. Create it.
                        Directory.CreateDirectory(folderPath);
                    }
                    string extension = Path.GetExtension(file.FileName);
                    string newFileName = HelpClass.MD5Hash(eventIdRes.ToString()) + "-event" + extension;
                    string filePath = Path.Combine(HostingEnvironment.MapPath(HelpClass.EventUpload), newFileName);
                    file.SaveAs(filePath);
                    UploadFile(newFileName, Path.GetFileNameWithoutExtension(file.FileName), eventIdRes);
                }
            }
            //catch
            //{

            //}
        }

        public static void UploadFile(string fileName, string docTitle, long eventId)
        {

            var attach = new Attachment()
            {
                docnum = fileName,
                docName = docTitle,
                EventID = eventId,
            };
            attach.DeleteEventAttach(eventId);
            attach.SaveAttach(attach);

        }
        //[WebMethod(EnableSession = true)]
        //public static string SaveEvent(string title, string description, string start, string end, string empIds, string eventId)
        //{
        //    try
        //    {
        //        EventModel eventModel = new EventModel();
        //        if (eventId != "")
        //            eventModel.id = long.Parse(eventId);
        //        else
        //            eventModel.id = 0;
        //        eventModel.title = title;
        //        eventModel.description = description;
        //        eventModel.start = DateTime.Parse(start);
        //        eventModel.end = DateTime.Parse(end);

        //        if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
        //            eventModel.EmployeeID = int.Parse(HttpContext.Current.Session["user_id"].ToString());

        //        if (empIds.EndsWith(","))
        //            empIds = empIds.Substring(0, empIds.Length - 1);

        //        List<int> idsList = new List<int>();
        //        if (empIds != "")
        //        {
        //            var Ids = empIds.Split(',');

        //            for (int i = 0; i < Ids.Length; i++)
        //            {

        //                idsList.Add( int.Parse(Ids[i]));
        //            }
        //        }

        //        long eventIdRes = eventModel.Save(eventModel, idsList);
        //        if (eventIdRes != 0)
        //        {
        //            return eventIdRes.ToString();
        //        }
        //        return "0";
        //    }
        //    catch
        //    {
        //        return "0";

        //    }

        //}

        [WebMethod]
        public static EventModel GetEvent(string ID)
        {
            try
            {
                EventModel eventModel = new EventModel();

                int eventId = int.Parse(ID);
                eventModel = eventModel.getEvent(eventId);

                return eventModel;
            }
            catch
            {
                return null;

            }

        }
    }
}