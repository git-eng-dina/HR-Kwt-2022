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

        #region BloodTypes
        static public List<KeyValueString> bloodTypesList = getBloodTypesList().ToList();
        static IEnumerable<KeyValueString> getBloodTypesList()
        {
            maritalStatusList = new List<KeyValueString> {
                   new KeyValueString { key = "", value = "----"  },
                   new KeyValueString { key = "O+", value = "O+"  },
                   new KeyValueString { key =   "A+", value = "A+" },
                   new KeyValueString { key =   "B+", value = "B+" },
                   new KeyValueString { key =   "AB+", value = "AB+"},
                   new KeyValueString { key =   "AB-", value = "AB-" },
                   new KeyValueString { key =   "A-", value = "A-" },
                   new KeyValueString { key =   "B-", value = "B-" },
                   new KeyValueString { key =   "O-", value = "O-" },
                    };

            return maritalStatusList;
        }
        #endregion
        #region MaritalStatus
        static public List<KeyValueString> maritalStatusList = getMaritalStatusList().ToList();
        static IEnumerable<KeyValueString> getMaritalStatusList()
        {
             maritalStatusList = new List<KeyValueString> {
                   new KeyValueString { key = "Single"       , value = Resources.Labels.Single  },
                   new KeyValueString { key =   "Married", value = Resources.Labels.Married },
                   new KeyValueString { key =   "Absolute", value = Resources.Labels.Absoluto },
                   new KeyValueString { key =   "Widower", value = Resources.Labels.Widower },
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

        #region evaluationType
        static public List<KeyValueString> evaluationTypeList = getEvaluationTypeList().ToList();
        static IEnumerable<KeyValueString> getEvaluationTypeList()
        {
            evaluationTypeList = new List<KeyValueString> {
                   new KeyValueString { key = "Low"       , value = Resources.Labels.Low  },
                   new KeyValueString { key = "Fair", value = Resources.Labels.Fair },
                   new KeyValueString { key = "Good", value = Resources.Labels.Good },
                   new KeyValueString { key = "Excellent", value = Resources.Labels.Excellent },
                   new KeyValueString { key = "VeryExcellent", value = Resources.Labels.veryExcellent },
                     };
            return evaluationTypeList;
        }

        static public string EvaluationTypeConverter(string value)
        {
            switch (value)
            {
                case "Low":
                    return Resources.Labels.Low;
                case "Fair":
                    return Resources.Labels.Fair;
                case "Good":
                    return Resources.Labels.Good;
                case "Excellent":
                    return Resources.Labels.Excellent;
                case "VeryExcellent":
                    return Resources.Labels.veryExcellent;

                default:
                    break;
            }
            return value;
        }
        #endregion

    }
}