using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Attendance
{
    public partial class AttendanceReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_Search_Click(object sender, EventArgs e)
        {
            try
            {
                zkeuemkeeper.CZKEUEM axCZKEM1 = new zkeuemkeeper.CZKEUEM();
                bool bIsConnected = axCZKEM1.Connect_Net("localhost", 4370);   // 4370 is port no of attendance machine
                if (bIsConnected == true)
                {
                    var IsRead = axCZKEM1.ReadGeneralLogData(dwMachineNumber);
                }
                 string deviceID = txt_deviceNum.Value;
                string port = txt_port.Value;
                // BindData(textSearch);
            }
            catch { }
        }
    }
}