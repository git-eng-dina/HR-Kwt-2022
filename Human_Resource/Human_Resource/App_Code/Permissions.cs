using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class appObjectsModel
    {
        #region Attributes
        public int AppObjectID { get; set; }
        public string Name { get; set; }
        public string NameEn { get; set; }
        public string NameAr { get; set; }
        #endregion

        #region Methods

        public List<appObjects> GetAppObjects()
        {
            List<appObjects> result;;
           

            using (HRSystemEntities entity = new HRSystemEntities())
            {
                result = entity.appObjects.ToList();

                return result;
            }
        }
        #endregion
    }
    public class Permissions
    {
    }
}