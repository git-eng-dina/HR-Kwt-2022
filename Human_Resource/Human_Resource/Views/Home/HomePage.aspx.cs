﻿using Human_Resource.App_Code;
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
            

            renderTasksChart();

            var employeesCount = 10;
            var expiredPassCount = 15;
            var eventsCount = 15;
            var trainingsCount = 15;
            var vacations = 20;

            lbl_employees.InnerText = employeesCount.ToString();
            lbl_expiredPassports.InnerText = expiredPassCount.ToString();
            lbl_events.InnerText = eventsCount.ToString();
            
            lbl_trainings.InnerText = trainingsCount.ToString();
            lbl_vacations.InnerText = vacations.ToString();
        }

        private void renderTasksChart()
        {
            int userId = int.Parse(Session["user_id"].ToString());

            TaskStatus taskStatus = new TaskStatus();
            var taskStatusRes = taskStatus.getTaskCount(userId);

            lbl_tasks.InnerText = taskStatusRes.Where(ts => ts.Status =="Doing").Select(ts => ts.TaskCount.ToString()).FirstOrDefault();

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

            tasksChart.Legends[0].Enabled = true;
        }
    }
}