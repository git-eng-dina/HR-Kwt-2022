using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.ExecutiveProc
{
    public partial class EventsApprove : System.Web.UI.Page
    {
        string linkName = "li_eventsApprove";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }

            if (!IsPostBack)
            {

                BindData();
                btn_new.Attributes.Add("OnClick", "NewEvent();");
            }
        }

        private void BindData(string textSearch = "")
        {
            EventModel evnt = new EventModel();

            List<EventModel> needApprove = new List<EventModel>();
            int userId = int.Parse(Session["user_id"].ToString());
            string role = Session["urole"].ToString();

            if (role == "GeneralDirector" || role == "CEO")
               needApprove = evnt.getNeedApproveForDirector();
            else if (role == "Supervisor")
                needApprove = evnt.getNeedApproveForSupervisor(userId);//not get any approval
            else if (role == "ManagementManager")
                needApprove = evnt.getNeedApproveForManagement(userId);


            if (textSearch != "")
                needApprove = needApprove.Where(x => x.EmployeeName.ToLower().Contains(textSearch.ToLower())
                                || x.title.ToLower().Contains(textSearch.ToLower())).ToList();


            gv_events.DataSource = needApprove;


            if (role != "GeneralDirector" && userId != 1)
            {
                List<UsersPermissionModel> permissions = Session["UserPermissions"] as List<UsersPermissionModel>;
                var employeesPermissions = permissions.Where(x => x.LiElementName.Trim().ToLower() == linkName).FirstOrDefault();

                if (employeesPermissions != null && employeesPermissions.EditObject == true)
                {
                    btn_new.Visible = true;
                }
                else
                {
                    btn_new.Visible = false;
                }
            }

            DataBind();
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

        [WebMethod(EnableSession = true)]
        public static string Approve(string eventID, string userID)
        {
            try
            {
                EventModel confirm = new EventModel();
                confirm.EditApprove(long.Parse(eventID), true, int.Parse(userID));

                return "1";
            }
            catch
            {
                return "0";

            }

        }

        [WebMethod(EnableSession = true)]
        public static string Reject(string eventID, string userID)
        {
            try
            {
                EventModel confirm = new EventModel();
                confirm.EditApprove(long.Parse(eventID), false, int.Parse(userID));

                return "1";
            }
            catch
            {
                return "0";

            }

        }

        protected void gv_events_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                var rowView = (EventModel)e.Row.DataItem;
                if (rowView != null)
                {
                    var approved = rowView.Approved;
                    if (approved == true)
                    {
                        LinkButton approveBtn = (LinkButton)e.Row.FindControl("approve");
                        approveBtn.Visible = false;


                        e.Row.CssClass = "acceptedRow";
                    }
                    else if (approved == false)
                    {

                        LinkButton rejectBtn = (LinkButton)e.Row.FindControl("reject");
                        rejectBtn.Visible = false;

                        e.Row.CssClass = "rejectedRow";

                    }
                    else
                        e.Row.CssClass = "normalRow";


                }
            }

            try
            {
                long userId = long.Parse(Session["user_id"].ToString());
                string role = Session["urole"].ToString();
                if (role != "GeneralDirector" && userId != 1)
                {
                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        var rowView = (EventModel)e.Row.DataItem;
                        if (rowView != null)
                        {
                            List<UsersPermissionModel> permissions = Session["UserPermissions"] as List<UsersPermissionModel>;
                            var employees = permissions.Where(x => x.LiElementName.Trim().ToLower() == linkName).FirstOrDefault();
                            LinkButton approve = (LinkButton)e.Row.FindControl("approve");
                            LinkButton reject = (LinkButton)e.Row.FindControl("reject");
                            if (employees != null && employees.EditObject == true)
                            {
                                approve.Visible = true;
                                reject.Visible = true;
                            }
                            else
                            {
                                approve.Visible = false;
                                reject.Visible = false;
                            }
                        }
                    }
                }
            }
            catch
            { }
        }
    }
}