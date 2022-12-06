using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Home
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var employeesCount = 10;
            var expiredPassCount = 15;
            var eventsCount = 15;
            var tasksCount = 15;
            var trainingsCount = 15;
            var vacations = 20;

            lbl_employees.InnerText = employeesCount.ToString();
            lbl_expiredPassports.InnerText = expiredPassCount.ToString();
            lbl_events.InnerText = eventsCount.ToString();
            lbl_tasks.InnerText = tasksCount.ToString();
            lbl_trainings.InnerText = trainingsCount.ToString();
            lbl_vacations.InnerText = vacations.ToString();
        }
    }
}