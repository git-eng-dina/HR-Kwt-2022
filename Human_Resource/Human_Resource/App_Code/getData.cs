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
         static public List<KeyValueString> maritalStatusList = getMaritalStatusList().ToList();
        static IEnumerable<KeyValueString> getMaritalStatusList()
        {
             maritalStatusList = new List<KeyValueString> {
                   new KeyValueString { key = "Soltero"       , value = Resources.Labels.Soltero  },
                   new KeyValueString { key =   "Casado", value = Resources.Labels.Casado },
                   new KeyValueString { key =   "Absoluto", value = Resources.Labels.Absoluto },
                   new KeyValueString { key =   "Viudo", value = Resources.Labels.Viudo },
                    };

            return maritalStatusList;
        }
        #endregion
        #region custodiesType
        static public List<KeyValueString> custodiesTypeList = getCustodiesTypeList().ToList();
        static IEnumerable<KeyValueString> getCustodiesTypeList()
        {
            custodiesTypeList = new List<KeyValueString> {
                   new KeyValueString { key = "Physical"       , value = Resources.Labels.Physical  },
                   new KeyValueString { key =   "Cash", value = Resources.Labels.Cash },
                   new KeyValueString { key =   "Car", value = Resources.Labels.Car },
                   new KeyValueString { key =   "Other", value = Resources.Labels.Other },
                    };
            return custodiesTypeList;
        }
        #endregion
        #region repeatType
        static public List<KeyValueString> repeatTypeList = getRepeatTypeList().ToList();
        static IEnumerable<KeyValueString> getRepeatTypeList()
        {
            repeatTypeList = new List<KeyValueString> {
                   new KeyValueString { key = "Daily"       , value = Resources.Labels.Daily  },
                   new KeyValueString { key =   "Weekly", value = Resources.Labels.Weekly },
                   new KeyValueString { key =   "Monthly", value = Resources.Labels.Monthly },
                   new KeyValueString { key =   "Annual", value = Resources.Labels.Annual },
                    };
            return repeatTypeList;
        }
        #endregion
        #region rewardsType
        static public List<KeyValueString> rewardsTypeList = getRewardsTypeList().ToList();
        static IEnumerable<KeyValueString> getRewardsTypeList()
        {
            rewardsTypeList = new List<KeyValueString> {
                   new KeyValueString { key = "Reward"       , value = Resources.Labels.Reward  },
                   new KeyValueString { key = "Penalty", value = Resources.Labels.Penalty },
                     };
            return rewardsTypeList;
        }
        #endregion
        #region increaseType
        static public List<KeyValueString> increaseTypeList = getIncreaseTypeList().ToList();
        static IEnumerable<KeyValueString> getIncreaseTypeList()
        {
            increaseTypeList = new List<KeyValueString> {
                   new KeyValueString { key = "Ratio"       , value = Resources.Labels.Ratio  },
                   new KeyValueString { key = "Value", value = Resources.Labels.Value },
                     };
            return increaseTypeList;
        }
        #endregion

    }
}