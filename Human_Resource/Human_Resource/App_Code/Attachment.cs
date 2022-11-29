using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class Attachment
    {
        #region Attributes
        public int ImageId { get; set; }
        public string docName { get; set; }
        public string docnum { get; set; }
        public string image { get; set; }
        public Nullable<int> EmployeeID { get; set; }
        public Nullable<int> MessageID { get; set; }
        #endregion

        #region Methods
        public int SaveAttach(Attachment attach)
        {
            try
            {
                Images img;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (attach.ImageId.Equals(0))
                    {
                        img = new Images()
                        {
                            docName = attach.docName,
                            docnum = attach.docnum,
                            EmployeeID = attach.EmployeeID,
                            MessageID = attach.MessageID,
                            
                        };
                        img = entity.Images.Add(img);
                    }
                    else
                    {
                        img = entity.Images.Find(attach.ImageId);
                        img.docName = attach.docName;
                        img.docnum = attach.docnum;
                     
                    }
                    entity.SaveChanges();
                }
                return img.ImageId;
            }

            catch
            {
                return 0;
            }
        }
        #endregion
    }
}