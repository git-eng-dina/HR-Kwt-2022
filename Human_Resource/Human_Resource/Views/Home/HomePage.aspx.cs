using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Resources;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Home
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user_id"] == null)
                {
                    Response.Redirect("~/login.aspx");
                }
                string role = Session["urole"].ToString();

                int passportCount = 0;
                int tasksCount = 0;
                if (role != "Employee")
                {
                    getEmployeeCount();

                    passportCount = renderPassportsChart();
                }
                else
                {
                    div_employees.Visible = false;
                    div_passports.Visible = false;
                }

                getActiveEventCount();
                getActiveTrainingCount();
                getVacationCount(); //vacation from beggining of year
                tasksCount = renderTasksChart();

                if (passportCount == 0 && tasksCount == 0)
                {
                    passportsChart.Visible = false;
                    tasksChart.Visible = false;
                }
            }
        }

        private void getEmployeeCount()
        {
            int userId = int.Parse(Session["user_id"].ToString());
            string role = Session["urole"].ToString();

            int? supervisorId = null;
            int? managerId = null;
            if (role == "Supervisor")
                supervisorId = userId;
            else if (role == "ManagementManager")
                managerId = userId;

            EmployeeModel emp = new EmployeeModel();
            var employeesCount = emp.GetEmployeesCount(true,true,supervisorId,managerId);
            if (employeesCount == 0)
                lbl_employees.InnerText = Resources.Labels.NotFound;
            else
                lbl_employees.InnerText = employeesCount.ToString();
        }

        private void getActiveEventCount()
        {
            int userId = int.Parse(Session["user_id"].ToString());

            EventModel evt = new EventModel();  
            var count = evt.GetActiveEventCount(userId);
            if (count == 0)
                lbl_events.InnerText = Resources.Labels.NotFound;
            else
                lbl_events.InnerText = count.ToString() ;
        }

        private void getActiveTrainingCount()
        {
            int userId = int.Parse(Session["user_id"].ToString());

            TrainingModel evt = new TrainingModel();
            var count = evt.GetActiveCount(userId);
            if (count == 0)
                lbl_trainings.InnerText = Resources.Labels.NotFound;
            else
                lbl_trainings.InnerText = count.ToString();
        }

        private void getVacationCount()
        {
            int userId = int.Parse(Session["user_id"].ToString());

            EmployeesVacationModel evt = new EmployeesVacationModel();
            var count = evt.GetVacCount(userId);
            if (count == 0)
                lbl_vacations.InnerText = Resources.Labels.NotFound;
            else
                lbl_vacations.InnerText = count.ToString();
        }
        private int renderTasksChart()
        {
            int userId = int.Parse(Session["user_id"].ToString());

            TaskStatus taskStatus = new TaskStatus();
            var taskStatusRes = taskStatus.getTaskCount(userId);


            events_notFount.Visible = false;

            lbl_tasks.InnerText = taskStatusRes.Where(ts => ts.Status == "Doing").Select(ts => ts.TaskCount.ToString()).FirstOrDefault();

            string[] x = new string[taskStatusRes.Count];
            int[] y = new int[taskStatusRes.Count];
            for (int i = 0; i < taskStatusRes.Count; i++)
            {
                x[i] = HelpClass.getStringTranslate(taskStatusRes[i].Status);

                y[i] = taskStatusRes[i].TaskCount;
            }


            tasksChart.Series[0].Points.DataBindXY(x, y);
            tasksChart.Series[0].ChartType = SeriesChartType.Pie;
            tasksChart.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;

            tasksChart.Series[0].Label = "#VALY";
            tasksChart.Series[0].LegendText = "#VALX";

            ChartArea CA = tasksChart.ChartAreas[0];
            CA.InnerPlotPosition = new ElementPosition(0, 0, 92, 90);

            tasksChart.Legends[0].Enabled = true;

               
            return taskStatusRes.Count;
        }

        private int renderPassportsChart()
        {
            int userId = int.Parse(Session["user_id"].ToString());
            string role = Session["urole"].ToString();

            PassportStatus passportStatus = new PassportStatus();
            List<PassportStatus> result = new List<PassportStatus>();

            if (role == "GeneralDirector" || role == "CEO")
                result = passportStatus.getPassportCountForDirector();
            else if (role == "Supervisor")
                result = passportStatus.getPassportCountForSupervisor(userId);
            else if (role == "ManagementManager")
                result = passportStatus.getPassportCountForManagement(userId);


            lbl_expiredPassports.InnerText = result.Where(ts => ts.Status =="Expired").Select(ts => ts.PassportCount.ToString()).FirstOrDefault();

            string[] x = new string[result.Count];
            int[] y = new int[result.Count];
            for (int i = 0; i < result.Count; i++)
            {
                x[i] = HelpClass.getStringTranslate(result[i].Status);

                y[i] = result[i].PassportCount;
            }


            passportsChart.Series[0].Points.DataBindXY(x, y);
            passportsChart.Series[0].ChartType = SeriesChartType.Pie;
            passportsChart.ChartAreas["PassportChartArea"].Area3DStyle.Enable3D = true;

            passportsChart.Series[0].Label = "#VALY";
            passportsChart.Series[0].LegendText = "#VALX";

            ChartArea CA = passportsChart.ChartAreas[0];  
            CA.InnerPlotPosition = new ElementPosition(0, 0, 92, 90);

            passportsChart.Legends[0].Enabled = true;

            return result.Count;
        }
    }
}