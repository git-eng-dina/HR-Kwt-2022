using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Web;

namespace Human_Resource.App_Code
{
    public class HelpClass
    {
        public static HRSystemEntities entityForGet = new HRSystemEntities();
        public static string CVUpload="~/Upload/CV/";
        public static string WorkPermit="~/Upload/WorkPermit/";
        public static string WorkContract= "~/Upload/WorkContract/";
        public static string TaskUpload="~/Upload/Tasks/";
        public static string EventUpload="~/Upload/Events/";
        public static string MD5Hash(string text)
        {
            MD5 md5 = new MD5CryptoServiceProvider();

            //compute hash from the bytes of text  
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(text));

            //get hash result after compute it  
            byte[] result = md5.Hash;

            StringBuilder strBuilder = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                //change it into 2 hexadecimal digits  
                //for each byte  
                strBuilder.Append(result[i].ToString("x2"));
            }

            return strBuilder.ToString();
        }

        public static string getStringTranslate(string str)
        {
            System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("Resources.Labels", global::System.Reflection.Assembly.Load("App_GlobalResources"));

            return temp.GetString(str);
        }
        public static int get_age(DateTime dob)
        {
            int age = 0;
            age = DateTime.Now.AddYears(-dob.Year).Year;
            return age;
        }

        public static string setDateFormat(DateTime date)
        {
            var day = date.Day;
            var month = date.Month;
            var year = date.Year;
            var dt = month + "/" + day + "/" + year;

           
            return dt;
        }
    }
}