﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class Attachment
    {
        #region Attributes
        public long ImageId { get; set; }
        public string docName { get; set; }
        public string docnum { get; set; }
        public string image { get; set; }
        public Nullable<long> EmployeeID { get; set; }
        public Nullable<long> TaskID { get; set; }
        public Nullable<long> EventID { get; set; }
        public Nullable<long> MessageID { get; set; }
        public Nullable<long> CharityID { get; set; }
        public long CustodieID { get; set; }

        #endregion

        #region Methods
        public long SaveAttach(Attachment attach)
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
                            TaskID = attach.TaskID,
                            MessageID = attach.MessageID,
                            EventID = attach.EventID,
                            CharityID = attach.CharityID,
                            CustodieID = attach.CustodieID,
                            
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

        public void DeleteCertificateAttach(long empID)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var attach = entity.Images.Where(x => x.EmployeeID == empID && x.MessageID == null).ToList();
                entity.Images.RemoveRange(attach);
                entity.SaveChanges();
            }
        }

        public void DeleteTaskAttach(long taskId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var attach = entity.Images.Where(x => x.TaskID == taskId && x.MessageID == null).ToList();
                entity.Images.RemoveRange(attach);
                entity.SaveChanges();
            }
        }
        public void DeleteEventAttach(long eventId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var attach = entity.Images.Where(x => x.EventID == eventId && x.MessageID == null).ToList();
                entity.Images.RemoveRange(attach);
                entity.SaveChanges();
            }
        }

        public void DeleteCharityAttach(long charityID)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var attach = entity.Images.Where(x => x.CharityID == charityID && x.MessageID == null).ToList();
                entity.Images.RemoveRange(attach);
                entity.SaveChanges();
            }
        }

        public void DeleteCustodyAttach(long costudyID)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var attach = entity.Images.Where(x => x.CustodieID == costudyID && x.MessageID == null).ToList();
                entity.Images.RemoveRange(attach);
                entity.SaveChanges();
            }
        }
        #endregion
    }
}