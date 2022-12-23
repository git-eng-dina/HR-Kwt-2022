using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
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
 
            hdnButtonID.Value = btn_save.UniqueID;
            if (!IsPostBack)
            {
                BindData();
                btn_new.Attributes.Add("OnClick", "ShowDialog('');");
            }
        }

        protected void btn_Search_Click(object sender, EventArgs e)
        {
            //try
            {
                string textSearch = txt_search.Value;
                BindData(textSearch);
            }
            //catch { }
        }
        private void BindData(string textSearch = "")
        {
            TaskModel taskModel = new TaskModel();
            int userId = int.Parse(Session["user_id"].ToString());
            List<TaskModel> needApprove = new List<TaskModel>();
            List<TaskModel> executedTasks = new List<TaskModel>();
            List<TaskModel> myAddedTasks = new List<TaskModel>();
            if (Session["urole"] != null )
            {
                string role = Session["urole"].ToString();

                if (role == "GeneralDirector" || role == "CEO")
                {
                    needApprove = taskModel.getNeedApproveForDirector();

                    executedTasks = taskModel.getExcutedForDirector();

                    gv_myAddedTasks.Visible = false;
                    gv_myAddedTasksBlank.Visible = false;
                    gv_myAddedTasks_title.Visible = false;
                }
                else if (role == "Supervisor" )
                {
                    needApprove = taskModel.getNeedApproveForSupervisor(userId);
                   
                    executedTasks = taskModel.getExcutedForSupervisor(userId);

                    gv_myAddedTasks.Visible = false;
                    gv_myAddedTasksBlank.Visible = false;
                    gv_myAddedTasks_title.Visible = false;
                }
                else if (role == "ManagementManager")
                {
                    needApprove = taskModel.getNeedApproveForManagement(userId);
                    executedTasks = taskModel.getExcutedForManagement(userId);

                    gv_myAddedTasks.Visible = false;
                    gv_myAddedTasksBlank.Visible = false;
                    gv_myAddedTasks_title.Visible = false;
                }
                else
                {
                   myAddedTasks = taskModel.getMyAddedTasks(userId);

                    gv_approve_title.Visible = false;
                    gv_approve.Visible = false;
                    gv_executed_title.Visible = false;
                    gv_executed.Visible = false;
                    gv_executedBlank.Visible=false;
                }
            }


            //for logged in employee
            var myTasks = taskModel.getActivity(userId);
            if (textSearch != "")
            {
                needApprove = needApprove.Where(x => x.RepeatedEvery.ToLower().Contains(textSearch.ToLower())
                                || x.Name.Contains(textSearch)
                                || x.Description.Contains(textSearch)
                                 || x.EmployeeName.ToLower().Contains(textSearch.ToLower())
                                 ).ToList();
                 executedTasks = executedTasks.Where(x => x.RepeatedEvery.ToLower().Contains(textSearch.ToLower())
                                || x.Name.Contains(textSearch)
                                || x.Description.Contains(textSearch)
                                 || x.EmployeeName.ToLower().Contains(textSearch.ToLower())
                                 || x.AssignedEmployeeName.ToLower().Contains(textSearch.ToLower())
                                 ).ToList();
                myTasks = myTasks.Where(x => x.RepeatedEvery.ToLower().Contains(textSearch.ToLower())
                                || x.Name.Contains(textSearch)
                                || x.Description.Contains(textSearch)
                                 || x.EmployeeName.ToLower().Contains(textSearch.ToLower())
                                 ).ToList();

                myAddedTasks = myAddedTasks.Where(x => x.RepeatedEvery.ToLower().Contains(textSearch.ToLower())
                                || x.Name.Contains(textSearch)
                                || x.Description.Contains(textSearch)
                                 ).ToList();
            }
            gv_approve.DataSource = needApprove;
            gv_executed.DataSource = executedTasks;
            gv_myTasks.DataSource = myTasks;
            gv_myAddedTasks.DataSource = myAddedTasks;

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


        public static void UploadFile(string fileName,string docTitle, long taskId)
        {
           
            var attach = new Attachment()
            {
                docnum = fileName,
                docName = docTitle,
                TaskID = taskId,
            };
            attach.DeleteTaskAttach(taskId);
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
        public static string EditTaskStatus(string taskID , string userID,string status)
        {
            try
            {
                TaskModel confirm = new TaskModel();
                confirm.EditTaskStatus(int.Parse(taskID),status,int.Parse(userID));

                return "1";
            }
            catch
            {
                return "0";

            }

        }
        [WebMethod(EnableSession = true)]
        public static string FinishTask(string employeeTaskId, string userID,string role,string status)
        {
            try
            {

                TaskModel confirm = new TaskModel();
                confirm.FinishTask(long.Parse(employeeTaskId),int.Parse(userID), role,status);

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
                        LinkButton approveBtn = (LinkButton)e.Row.FindControl("approveTask");
                        approveBtn.Visible = false;
                        LinkButton rejectBtn = (LinkButton)e.Row.FindControl("rejectTask");
                        rejectBtn.Visible = false;

                        e.Row.CssClass = "acceptedRow";
                    }
                    else if(approved == false)
                    {
                        LinkButton approveBtn = (LinkButton)e.Row.FindControl("approveTask");
                        approveBtn.Visible = false;
                        LinkButton rejectBtn = (LinkButton)e.Row.FindControl("rejectTask");
                        rejectBtn.Visible = false;

                        e.Row.CssClass = "rejectedRow";

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
                    if (status == "Doing" || status == null)
                    {
                        if (rowView.EndDate < DateTime.Now)
                            rowView.Status = Resources.Labels.TimeExpired;
                        else
                            rowView.Status = Resources.Labels.Doing;
                        //LinkButton imgBtn = (LinkButton)e.Row.FindControl("finishTask");
                        //imgBtn.Visible = false;

                       
                        e.Row.CssClass = "doingRow";
                    }
                    else if (status == "Complete")
                    {
                        rowView.Status = Resources.Labels.Done;

                        //Label lbl = (Label)e.Row.FindControl("LblStatus");
                        //lbl.Visible = false;

                        e.Row.CssClass = "acceptedRow";

                    }
                    Label lbl = (Label)e.Row.FindControl("LblStatusExecuted");
                    lbl.Text = rowView.Status;
                    //else
                    //{
                    //    e.Row.CssClass = "normalRow";
                    //}
                }
            }
        }
       protected void gv_myTasks_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                var rowView =(TaskModel) e.Row.DataItem;
                if (rowView != null)
                {

                    var status = rowView.Status;
                    if (status == "Doing")
                    {
                                          
                        e.Row.CssClass = "doingRow";
                    }
                    else if(status == "Complete")
                    {
                        LinkButton imgBtn = (LinkButton)e.Row.FindControl("finishMyTask");
                        imgBtn.Visible = false;

                        Label lbl = (Label)e.Row.FindControl("LblStatus3");
                        lbl.Text = Resources.Labels.Done;

                        e.Row.CssClass = "acceptedRow";

                    }

                }
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {

            //try
            {
              //if (!IsPostBack)
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


                    long taskIdInt = taskObj.SaveTask(taskObj, hdn_empIds.Value);
                    if (taskIdInt != 0)
                    {

                        if (file.FileName != "")
                        {
                            //folder path to save uploaded file
                            string folderPath = Server.MapPath(HelpClass.TaskUpload);

                            //Check whether Directory (Folder) exists, although we have created, if it si not created this code will check
                            if (!Directory.Exists(folderPath))
                            {
                                //If folder does not exists. Create it.
                                Directory.CreateDirectory(folderPath);
                            }
                            string extension = Path.GetExtension(file.FileName);
                            string newFileName = HelpClass.MD5Hash(taskId.ToString()) + "-task" + extension;
                            string filePath = Path.Combine(HostingEnvironment.MapPath(HelpClass.TaskUpload), newFileName);
                            file.SaveAs(filePath);
                            UploadFile(newFileName, Path.GetFileNameWithoutExtension(file.FileName), taskIdInt);
                        }
                        // return "1";
                    }
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