using Human_Resource.App_Code;
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
            Device device = new Device();

            var devices = device.GetActivity().OrderBy(x => x.Name).ToList();
            var newDevice = new Device() { Name = Resources.Labels.SelectHere, ID = 0 };
            devices.Insert(0, newDevice);

            sel_device.DataSource = devices;
            sel_device.DataTextField = "Name";
            sel_device.DataValueField = "ID";
            sel_device.DataBind();
        }
        protected void btn_Search_Click(object sender, EventArgs e)
        {
            var ip = "192.168.1.201";
            try
            {
                Device device = new Device();
                device = device.getDevice(int.Parse(sel_device.Value));

                zkeuemkeeper.CZKEUEM axCZKEM1 = new zkeuemkeeper.CZKEUEM();
                bool bIsConnected = axCZKEM1.Connect_Net(ip, (int)device.Port);   // 4370 is port no of attendance machine
                if (bIsConnected == true)
                {
                    var dwMachineNumber = (int)device.DeviceNumber;

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