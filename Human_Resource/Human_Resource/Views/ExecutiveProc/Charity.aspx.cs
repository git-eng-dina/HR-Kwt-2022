using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.ExecutiveProc
{
    public partial class Charity : System.Web.UI.Page
   {
        string linkName = "li_charity";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }

            if (!IsPostBack)
            {
                var role = Session["urole"].ToString();
                if (role != "GeneralDirector" && role != "CEO")
                    btn_new.Visible = false;

                BindData();
                btn_new.Attributes.Add("OnClick", "ShowDialog('');");
                hdnButtonID.Value = btn_ads.UniqueID;

            }
        }

        protected void btn_Search_Click(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            try
            {
                string textSearch = txt_search.Value;

                DateTime? from = null;
                if (dp_fromSearch.Text != "")
                    from = DateTime.ParseExact(dp_fromSearch.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture); 

                DateTime? to = null;
                if (dp_toSearch.Text != "")
                    to = DateTime.ParseExact(dp_toSearch.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                BindData(from,to, textSearch);

            }
            catch { }
        }
        private void BindData(DateTime? from = null, DateTime? to = null,string textSearch = "")
        {
            CharityModel dept = new CharityModel();

            var depts = dept.getActivity(from,to);

            if (textSearch != "")
                depts = depts.Where(x => x.Reason.ToLower().Contains(textSearch.ToLower())
                                || x.Details.ToLower().Contains(textSearch)
                                 || (x.EmployeeName != null && x.EmployeeName.ToLower().Contains(textSearch.ToLower()))
                                 ).ToList();
            foreach (var item in depts)
            {
                if (item.EmployeeID is null)
                    item.EmployeeID = 0;
            }
            gv_data.DataSource = depts;

 


            EmployeeModel employeeModel = new EmployeeModel();
            List<EmployeeModel> employees = new List<EmployeeModel>();
            employees = employeeModel.GetHiredEmployees(true);
            employees = employees.Where(x => x.EmployeeID != 1).ToList();

            var _emp = new EmployeeModel();
            _emp.NameEn = _emp.NameAr = "-";
            _emp.EmployeeID = 0;
            employees.Insert(0, _emp);

            sel_emp.DataSource = employees;
            sel_emp.DataValueField = "EmployeeID";
            if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                sel_emp.DataTextField = "NameEn";
            else
                sel_emp.DataTextField = "NameAr";

            long userId = long.Parse(Session["user_id"].ToString());
            string role = Session["urole"].ToString();
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

        protected void gv_data_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                long userId = long.Parse(Session["user_id"].ToString());
                string role = Session["urole"].ToString();
                if (role != "GeneralDirector" && userId != 1)
                {
                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        var rowView = (CharityModel)e.Row.DataItem;
                        if (rowView != null)
                        {
                            List<UsersPermissionModel> permissions = Session["UserPermissions"] as List<UsersPermissionModel>;
                            var employees = permissions.Where(x => x.LiElementName.Trim().ToLower() == linkName).FirstOrDefault();
                            LinkButton editBtn = (LinkButton)e.Row.FindControl("LinkProducts");
                            ImageButton deleteBtn = (ImageButton)e.Row.FindControl("Image1");
                            if (employees != null && employees.EditObject == true)
                            {
                                editBtn.Visible = true;
                                deleteBtn.Visible = true;
                            }
                            else
                            {
                                editBtn.Visible = false;
                                deleteBtn.Visible = false;
                            }
                        }
                    }
                }
            }
            catch
            { }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {

            try
            {
                if (Session["user_id"] == null)
                {
                    Response.Redirect("~/login.aspx");
                }

                CharityModel charity = new CharityModel();
                if (hid_charityId.Value != "")
                    charity.CharityID = long.Parse(hid_charityId.Value);
                else
                    charity.CharityID= 0;

                if(sel_emp.Value != "0")
                charity.EmployeeID = int.Parse(sel_emp.Value);
                charity.Reason = txt_reason.Value;
                charity.Details = txt_details.Value;
                charity.CharityDate = DateTime.ParseExact(dp_charityDate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                if (!string.IsNullOrEmpty(txt_amount.Value))
                    charity.Amount = decimal.Parse(txt_amount.Value);
                else
                    charity.Amount = 0;

                if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                    charity.CreateUserID = charity.UpdateUserID = int.Parse(HttpContext.Current.Session["user_id"].ToString());



                long deptId = charity.SaveCharity(charity);

                if (file.FileName != "")
                {
                    //folder path to save uploaded file
                    string folderPath = Server.MapPath(HelpClass.CharityUpload);

                    //Check whether Directory (Folder) exists, although we have created, if it si not created this code will check
                    if (!Directory.Exists(folderPath))
                    {
                        //If folder does not exists. Create it.
                        Directory.CreateDirectory(folderPath);
                    }
                    string extension = Path.GetExtension(file.FileName);
                    string newFileName = HelpClass.MD5Hash(deptId.ToString()) + "-charity" + extension;
                    string filePath = Path.Combine(HostingEnvironment.MapPath(HelpClass.EventUpload), newFileName);
                    file.SaveAs(filePath);
                    UploadFile(newFileName, Path.GetFileNameWithoutExtension(file.FileName), deptId);
                }
                else if (hid_charityId.Value != "" && hasFiles.Value == "")
                {
                    var attach = new Attachment();
                    attach.DeleteCharityAttach(deptId);
                }

                Response.Redirect("Charity.aspx");
            }
            catch(Exception ex)
            {

            }
        }

        public static void UploadFile(string fileName, string docTitle, long charityID)
        {

            var attach = new Attachment()
            {
                docnum = fileName,
                docName = docTitle,
                CharityID = charityID,
            };
            attach.DeleteCharityAttach(charityID);
            attach.SaveAttach(attach);

        }
        [WebMethod(EnableSession = true)]
        public static string SaveCharity(string charityId, string employeeId, string reason, string details, string amount)
        {
            try
            {
                CharityModel dept = new CharityModel();
                if (charityId != "")
                    dept.CharityID = int.Parse(charityId);
                else
                    dept.CharityID = 0;
                if (employeeId != "0")
                    dept.EmployeeID = int.Parse(employeeId);
                dept.Reason = reason;
                dept.Details = details;
                if (!string.IsNullOrEmpty(amount))
                    dept.Amount = decimal.Parse(amount);
                else
                    dept.Amount = 0;

                if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                    dept.CreateUserID = dept.UpdateUserID = int.Parse(HttpContext.Current.Session["user_id"].ToString());


                long deptId = dept.SaveCharity(dept);
                if (deptId != 0)
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
        public static CharityModel GetCharity(string ID)
        {
            try
            {
                CharityModel dept = new CharityModel();

                int charityId = int.Parse(ID);
                dept = dept.getCharity(charityId);

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
                CharityModel dept = new CharityModel();
                int Ref = Convert.ToInt32(e.CommandArgument.ToString());

                long? userId = null;
                if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                    userId = dept.UpdateUserID = long.Parse(Session["user_id"].ToString());

                if (dept.DeleteCharity(Ref, userId))
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