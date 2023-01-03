using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.Settings
{
    public partial class Devices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                btn_new.Attributes.Add("OnClick", "ShowDialog('');");
            }
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
            Device device = new Device();

            var devices = device.GetActivity();
            if (textSearch != "")
                devices = devices.Where(x => x.Name.ToLower().Contains(textSearch.ToLower())
                            || x.Port.ToString().Contains(textSearch.ToLower())
                                ).ToList();
            gv_data.DataSource = devices;

            DataBind();
        }

        [WebMethod(EnableSession = true)]
        public static string SaveDevice(string id, string name,string port,string deviceNumber,string notes)
        {
            try
            {
                Device device = new Device();
                if (id != "")
                    device.ID = int.Parse(id);
                else
                    device.ID = 0;
                device.Name = name;
                device.Port = int.Parse(port);
                device.DeviceNumber = int.Parse(deviceNumber);
                device.Notes = notes;

                if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                    device.CreateUserID = device.UpdateUserID = int.Parse(HttpContext.Current.Session["user_id"].ToString());


                int deviceId = device.SaveDevice(device);
                if (deviceId != 0)
                {
                    return "1";
                }
                return "0";
            }
            catch
            {
                return "0";

            }

        }

        [WebMethod]
        public static Device GetDevice(string id)
        {
            try
            {
                Device device = new Device();

                int deviceId = int.Parse(id);
                device = device.getDevice(deviceId);

                return device;
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
                Device dept = new Device();
                int Ref = Convert.ToInt32(e.CommandArgument.ToString());

                int? userId = null;
                if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                    userId = dept.UpdateUserID = int.Parse(Session["user_id"].ToString());

                if (dept.DeleteDevice(Ref, userId))
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
    }
}