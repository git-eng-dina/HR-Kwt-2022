using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Human_Resource.App_Code.GetData;

namespace Human_Resource.Views.ExecutiveProc
{
    public partial class Tasks : System.Web.UI.Page
      {
        protected void Page_Load(object sender, EventArgs e)
        {

            BindData();
            btn_new.Attributes.Add("OnClick", "ShowDialog('');");
        }

        protected void btn_Search_Click(object sender, EventArgs e)
        {
            try
            {
                string textSearch = txt_search.Value;
                BindData(textSearch);
            }
            catch { }
        }
        private void BindData(string textSearch = "")
        {
            TaskModel taskModel = new TaskModel();
            int userId = int.Parse(Session["user_id"].ToString());
            List<TaskModel> needApprove = new List<TaskModel>();
            List<TaskModel> executedTasks = new List<TaskModel>();
            if (Session["urole"] != null )
            {
                string role = Session["urole"].ToString();
                if (role == "GeneralDirector" || role == "CEO")
                {

                }
                else if (role == "Supervisor" )
                {
                    needApprove = taskModel.getNeedApproveForSupervisor(userId);
                    gv_approve.DataSource = needApprove;

                    executedTasks = taskModel.getExcutedForSupervisor(userId);
                    gv_executed.DataSource = executedTasks;
                }
                else if (role == "ManagementManager"  )
                {
                    needApprove = taskModel.getNeedApproveForManagement(userId);
                    gv_approve.DataSource = needApprove;
                }
            }
                var depts = taskModel.getActivity();
            if (textSearch != "")
                depts = depts.Where(x => x.RepeatedEvery.ToLower().Contains(textSearch.ToLower())
                                || x.Name.Contains(textSearch)
                                || x.Description.Contains(textSearch)
                                 || x.EmployeeName.ToLower().Contains(textSearch.ToLower())
                                 ).ToList();
            // gv_data.DataSource = depts;


            var repeatedTypes = GetData.repeatTypeList.ToList();
            repeatedTypes.Insert(0, new KeyValueString { key = "", value = "------" });
            sel_repeatedEvery.DataSource = repeatedTypes;
            sel_repeatedEvery.DataValueField = "key";
            sel_repeatedEvery.DataTextField = "value";



            EmployeeModel emp = new EmployeeModel();
            var employees = emp.GetEmployees(true, true);
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
        }

        [WebMethod(EnableSession = true)]
        public static string SaveTask(string taskId,  string name, string description, string repeatedEvery,
                                string start,string end,string empIds, string postedFile1)
        {
            //try
            {
                TaskModel taskObj = new TaskModel();
                Attachment attach = new Attachment();
                if (taskId != "")
                {
                    attach.DeleteTaskAttach(int.Parse(taskId));
                    taskObj.TaskID = int.Parse(taskId);
                }
                else
                    taskObj.TaskID = 0;

                taskObj.RepeatedEvery = repeatedEvery;
                taskObj.Name = name;
                taskObj.Description = description;
                // taskObj.Attachment =

                taskObj.StartDate = DateTime.ParseExact(start, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                if(end !="")
                    taskObj.EndDate = DateTime.ParseExact(end, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                    taskObj.CreateUserID = taskObj.UpdateUserID = taskObj.EmployeeID = int.Parse(HttpContext.Current.Session["user_id"].ToString());


               int taskIdInt = taskObj.SaveTask(taskObj, empIds);
                if (taskIdInt != 0)
                {
                  //  if(attachment != "")
                     //   UploadFile(attachment, taskIdInt, "task");
                    return "1";
                }
                return "0";
            }
            //catch
            //{
            //    return "0";

            //}

        }


        public static void UploadFile(string fileName, int taskId, string tag)
        {
            //save file in the specified folder and path
            string extension = Path.GetExtension(fileName);
            var newFileName = HelpClass.MD5Hash(taskId.ToString()) + "-" + tag + extension;
            string FilePath = Path.Combine(HostingEnvironment.MapPath("~/Upload"), newFileName);

            MemoryStream ms = new MemoryStream();
            using (FileStream file = new FileStream(fileName, FileMode.Open, FileAccess.Read))
                file.CopyTo(ms);

            int length = 0;
            using (FileStream writer = new FileStream(FilePath, FileMode.Create))
            {
                int readCount;
                var buffer = new byte[8192];
                while ((readCount = ms.Read(buffer, 0, buffer.Length)) != 0)
                {
                    writer.Write(buffer, 0, readCount);
                    length += readCount;
                }
            }

          

            var attach = new Attachment()
            {
                docnum = newFileName,
                docName = Path.GetFileNameWithoutExtension(fileName),
                TaskID = taskId,
            };
            attach.SaveAttach(attach);

        }
        [WebMethod]
        public static TaskModel GetTask(string ID)
        {
            try
            {
                TaskModel dept = new TaskModel();

                int taskId = int.Parse(ID);
                dept = dept.getTask(taskId);

                return dept;
            }
            catch
            {
                return null;

            }

        }
        protected void deletedatafromgrid(object sender, CommandEventArgs e)
        {

            try
            {
                TaskModel dept = new TaskModel();
                int Ref = Convert.ToInt32(e.CommandArgument.ToString());

                int? userId = null;
                if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                    userId = dept.UpdateUserID = int.Parse(Session["user_id"].ToString());

                if (dept.DeleteTask(Ref, userId))
                {

                    Response.Write("<script>alert('" + Resources.Labels.DeleteSuccessfully + "')</script>");
                    BindData();
                }
                else
                {

                    Response.Write("<script>alert('" + Resources.Labels.ErrorOccured + "')</script>");
                }
            }
            catch (Exception ex)
            {
            }
        }

        [WebMethod(EnableSession = true)]
        public static string ApproveTask(string TaskID , string userID)
        {
            try
            {
                TaskModel confirm = new TaskModel();
                confirm.EditApprove(int.Parse(TaskID),true,int.Parse(userID));

                return "1";
            }
            catch
            {
                return "0";

            }

        }

        [WebMethod(EnableSession = true)]
        public static string RejectTask(string TaskID , string userID)
        {
            try
            {
                TaskModel confirm = new TaskModel();
                confirm.EditApprove(int.Parse(TaskID),false,int.Parse(userID));

                return "1";
            }
            catch
            {
                return "0";

            }

        }
        [WebMethod(EnableSession = true)]
        public static string FinishTask(string DailyTaskID, string userID,string role,string taskID)
        {
            try
            {
                long? DailyTaskIDInt = null;
                long? TaskIDInt = null;
                if (DailyTaskID != "")
                    DailyTaskIDInt = long.Parse(DailyTaskID);
                if (taskID != "")
                    TaskIDInt = long.Parse(taskID);

                TaskModel confirm = new TaskModel();
                confirm.FinishTask(DailyTaskIDInt,int.Parse(userID), role,TaskIDInt);

                return "1";
            }
            catch
            {
                return "0";

            }

        }

        protected void gv_approve_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                var rowView =(TaskModel) e.Row.DataItem;
                if (rowView != null)
                {
                    var approved = rowView.Approved;
                    if (approved == true)
                    {
                        LinkButton imgBtn = (LinkButton)e.Row.FindControl("approveTask");
                        imgBtn.Visible = false;

                        e.Row.CssClass = "acceptedRow";
                        //e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#5fbf00");
                    }
                    else if(approved == false)
                    {
                        LinkButton imgBtn = (LinkButton)e.Row.FindControl("rejectTask");
                        imgBtn.Visible = false;
                        e.Row.CssClass = "rejectedRow";
                        //e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#5fbf00");

                    }
                    else
                        e.Row.CssClass = "normalRow";
                }
            }
        }

        protected void gv_executed_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                var rowView =(TaskModel) e.Row.DataItem;
                if (rowView != null)
                {

                    var status = rowView.Status;
                    if (status == "Doing")
                    {
                        LinkButton imgBtn = (LinkButton)e.Row.FindControl("finishTask");
                        imgBtn.Visible = false;

                        Label lbl = (Label)e.Row.FindControl("LblStatus");
                        lbl.Text = Resources.Labels.Doing;
                        e.Row.CssClass = "doingRow";
                    }
                    else if(status == "Complete")
                    {
                        Label lbl = (Label)e.Row.FindControl("LblStatus");
                        lbl.Visible = false;

                        e.Row.CssClass = "acceptedRow";

                    }
                    else
                        e.Row.CssClass = "normalRow";
                }
            }
        }

        protected void btn_ads_Click(object sender, EventArgs e)
        {
            //try
            {
                TaskModel taskObj = new TaskModel();
                Attachment attach = new Attachment();
                int taskId = 0;
                if (hid_taskId.Value != "")
                    taskId = int.Parse(hid_taskId.Value);
                if (taskId != 0)
                {
                    attach.DeleteTaskAttach(taskId);
                    taskObj.TaskID = taskId;
                }
                else
                    taskObj.TaskID = 0;

                taskObj.RepeatedEvery = sel_repeatedEvery.Value;
                taskObj.Name = txt_name.Value;
                taskObj.Description = txt_description.Value;
                // taskObj.Attachment =

                taskObj.StartDate = DateTime.ParseExact(dp_start.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                if (dp_end.Text != "")
                    taskObj.EndDate = DateTime.ParseExact(dp_end.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                    taskObj.CreateUserID = taskObj.UpdateUserID = taskObj.EmployeeID = int.Parse(HttpContext.Current.Session["user_id"].ToString());


                int taskIdInt = taskObj.SaveTask(taskObj, hdn_empIds.Value);
                if (taskIdInt != 0)
                {
                    if (file.FileName != "")
                        UploadFile(file.FileName, taskIdInt, "task");
                    // return "1";
                }
                //return "0";
            }
            //catch
            //{
            //    return "0";

            //}
        }
    }
}