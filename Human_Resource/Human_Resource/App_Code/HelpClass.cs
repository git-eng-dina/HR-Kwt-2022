using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Human_Resource.App_Code
{
    public class HelpClass
    {
        public static HRSystemEntities entityForGet = new HRSystemEntities();
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