using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class CountriesNameModel
    {
        #region Attributes
        public int CountriesNameID { get; set; }
        public string NameEn { get; set; }
        public string NameAr { get; set; }
        
        #endregion

        #region methods
        public List<CountriesNameModel> get()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var depts = entity.countriesName
                                .Select(x => new CountriesNameModel()
                                {
                                    CountriesNameID = x.CountriesNameID,
                                    NameEn = x.NameEn,
                                    NameAr = x.NameAr,
                                }).ToList();
                return depts;
            }
        }
       
        #endregion
    }
}