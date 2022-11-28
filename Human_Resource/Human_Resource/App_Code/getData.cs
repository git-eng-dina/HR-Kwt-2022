using Resources;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class GetData
    {
        public class KeyValueString
        {
            public string key { get; set; }
            public string value { get; set; }
        }
        #region  City
        static public CountriesNameModel countriesName = new CountriesNameModel();
        static public List<CountriesNameModel> citysList = countriesName.get();
        #endregion

        #region MaritalStatus
         static public List<KeyValueString> maritalStatusList;
        IEnumerable<KeyValueString> getMaritalStatusList(string lang)
        {
             maritalStatusList = new List<KeyValueString> {
                   new KeyValueString { key = "Soltero"       , value = ""  },
                   new KeyValueString { key =   "Casado", value = "" },
                   new KeyValueString { key =   "Absoluto", value = "" },
                   new KeyValueString { key =   "Viudo", value = "" },
                    };

            return maritalStatusList;
        }


        #endregion

    }
}