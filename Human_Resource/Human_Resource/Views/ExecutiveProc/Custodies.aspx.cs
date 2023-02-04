using Human_Resource.App_Code;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Human_Resource.Views.ExecutiveProc
{
    public partial class Custodies : System.Web.UI.Page
    {
        string linkName = "li_custodies";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            if (!IsPostBack)
            {
                long userId = long.Parse(Session["user_id"].ToString());

               var role = Session["urole"].ToString();
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

                BindData();
                btn_new.Attributes.Add("OnClick", "ShowDialog('');");
                hdnButtonID.Value = btn_ads.UniqueID;
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
            CustodieModel dept = new CustodieModel();

            var depts = dept.getActivity();
            if (textSearch != "")
                depts = depts.Where(x => x.Type.ToLower().Contains(textSearch.ToLower())
                                || x.Details.Contains(textSearch)
                                 || x.EmployeeName.ToLower().Contains(textSearch.ToLower())
                                 ).ToList();
            gv_data.DataSource = depts;


            dept_type.DataSource = GetData.custodiesTypeList;
            dept_type.DataValueField = "key";
            dept_type.DataTextField = "value";



            EmployeeModel employeeModel = new EmployeeModel();
            List<EmployeeModel> employees = new List<EmployeeModel>();
            employees = employeeModel.GetHiredEmployees(true);
            sel_emp.DataSource = employees;
            sel_emp.DataValueField = "EmployeeID";
            if (Session["CultureName"] != null && Session["CultureName"].ToString().ToLower() == "en-us")
                sel_emp.DataTextField = "NameEn";
            else
                sel_emp.DataTextField = "NameAr";

            long userId = long.Parse(Session["user_id"].ToString());

            var role = Session["urole"].ToString();
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
                
                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        var rowView = (CustodieModel)e.Row.DataItem;
                        if (rowView != null)
                        {
                        LinkButton editBtn = (LinkButton)e.Row.FindControl("LinkProducts");
                        ImageButton deleteBtn = (ImageButton)e.Row.FindControl("Image1");
                        if (role != "GeneralDirector"  && userId != 1)
                        {
                            List<UsersPermissionModel> permissions = Session["UserPermissions"] as List<UsersPermissionModel>;
                            var employees = permissions.Where(x => x.LiElementName.Trim().ToLower() == linkName).FirstOrDefault();
                            
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
                        else
                        {
                            editBtn.Visible = true;
                            deleteBtn.Visible = true;
                        }
                    }
                }
            }
            catch
            { }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }

            CustodieModel custody = new CustodieModel();
            if (hid_custodieId.Value != "")
                custody.CustodieID = int.Parse(hid_custodieId.Value);
            else
                custody.CustodieID = 0;
            custody.EmployeeID = int.Parse(sel_emp.Value);
            custody.Type = dept_type.Value;
            custody.Details = txt_details.Value;
            custody.IsRecovery = chk_isRecovery.Checked;

            if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
                custody.CreateUserID = custody.UpdateUserID = int.Parse(HttpContext.Current.Session["user_id"].ToString());


            long custodyId = custody.SaveCustody(custody);

            if (file.FileName != "")
            {
                //folder path to save uploaded file
                string folderPath = Server.MapPath(HelpClass.CustodyUpload);

                //Check whether Directory (Folder) exists, although we have created, if it si not created this code will check
                if (!Directory.Exists(folderPath))
                {
                    //If folder does not exists. Create it.
                    Directory.CreateDirectory(folderPath);
                }
                string extension = Path.GetExtension(file.FileName);
                string newFileName = HelpClass.MD5Hash(custodyId.ToString()) + "-custody" + extension;
                string filePath = Path.Combine(HostingEnvironment.MapPath(HelpClass.EventUpload), newFileName);
                file.SaveAs(filePath);
                UploadFile(newFileName, Path.GetFileNameWithoutExtension(file.FileName), custodyId);
            }
            else if (hid_custodieId.Value != "" && hasFiles.Value =="")
            {
                var attach = new Attachment();
                attach.DeleteCustodyAttach(custodyId);
            }

            Response.Redirect("Custodies.aspx");
        }

        public static void UploadFile(string fileName, string docTitle, long custodyID)
        {

            var attach = new Attachment()
            {
                docnum = fileName,
                docName = docTitle,
                CustodieID = custodyID,
            };
            attach.DeleteCustodyAttach(custodyID);
            attach.SaveAttach(attach);

        }
        //[WebMethod(EnableSession = true)]
        //public static string SaveCustodie(string custodieId, string employeeId, string type, string details, string isRecovery)
        //{
        //    try
        //    {
        //        CustodieModel dept = new CustodieModel();
        //        if (custodieId != "")
        //            dept.CustodieID = int.Parse(custodieId);
        //        else
        //            dept.CustodieID = 0;
        //        dept.EmployeeID = int.Parse(employeeId);
        //        dept.Type = type;
        //        dept.Details = details;
        //        dept.IsRecovery = bool.Parse(isRecovery);

        //        if (HttpContext.Current.Session["user_id"] != null && HttpContext.Current.Session["user_id"].ToString() != "")
        //            dept.CreateUserID = dept.UpdateUserID = int.Parse(HttpContext.Current.Session["user_id"].ToString());


        //        long deptId = dept.SaveDept(dept);
        //        if (deptId != 0)
        //        {
        //            return "1";
        //        }
        //        return "0";
        //    }
        //    catch
        //    {
        //        return "0";

        //    }

        //}
        [WebMethod]
        public static void TypeChanged(string type)
        {
            //if (type == "Physical" || type == "Other")
            //    txt_detailsTitle.Text = Resources.Labels.Details; 
            //else if (type == "Cash")
            //    txt_detailsTitle.Text = Resources.Labels.Amount; 
            //else if (type == "Car")
            //    txt_detailsTitle.Text = Resources.Labels.CarNumber; 
        }
        protected void TypeChanged(object sender, EventArgs e)
        {
            //if (type == "Physical" || type == "Other")
            //    txt_detailsTitle.Text = Resources.Labels.Details; 
            //else if (type == "Cash")
            //    txt_detailsTitle.Text = Resources.Labels.Amount; 
            //else if (type == "Car")
            //    txt_detailsTitle.Text = Resources.Labels.CarNumber; 
        }

        [WebMethod]
        public static CustodieModel GetCustodie(string ID)
        {
            try
            {
                CustodieModel dept = new CustodieModel();

                int custodieId = int.Parse(ID);
                dept = dept.getCustodie(custodieId);

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
                CustodieModel dept = new CustodieModel();
                int Ref = Convert.ToInt32(e.CommandArgument.ToString());

                long? userId = null;
                if (Session["user_id"] != null && Session["user_id"].ToString() != "")
                    userId = dept.UpdateUserID = long.Parse(Session["user_id"].ToString());

                if (dept.DeleteDept(Ref, userId))
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