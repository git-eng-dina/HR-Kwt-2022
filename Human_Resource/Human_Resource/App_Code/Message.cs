using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class Reply
    {
        public long ReplyID { get; set; }
        public Nullable<long> UsersMessageID { get; set; }
        public Nullable<long> FromEmployee { get; set; }
        public Nullable<long> ToEmployee { get; set; }
        public string ContentMessage { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<long> CreateUserID { get; set; }
        public Nullable<long> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> IsRead { get; set; }
    }
    public class Message
    {
        #region Attributes
        public long UsersMessageID { get; set; }
        public Nullable<long> ToEmployeeID { get; set; }
        public string Title { get; set; }
        public string ContentMessage { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> IsRead { get; set; }

        public string FromEmployeeAr { get; set; }
        public string FromEmployeeEn { get; set; }
        public string CultureName { get; set; }
        public byte[] EmpImage { get; set; }
        public List<Reply> Replies { get; set; }
        #endregion

        #region Methods

        public List<Message> GetUserMessages(long empId,int skip)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var messages = entity.usersMessages
                                .Where(x => x.ToEmployeeID == empId && x.IsActive == true)
                                .Select(x=> new Message() {
                                Title = x.Title,
                                ContentMessage = x.ContentMessage,
                                IsRead = x.IsRead,
                                FromEmployeeAr = entity.employees.Where( y => y.EmployeeID == x.CreateUserID).Select(y => y.NameAr).FirstOrDefault(),
                                FromEmployeeEn = entity.employees.Where( y => y.EmployeeID == x.CreateUserID).Select(y => y.NameEn).FirstOrDefault(),
                                CreateDate = x.CreateDate,
                                UsersMessageID = x.UsersMessageID,
                                }).OrderBy(x => x.UsersMessageID).Skip(skip).Take(5).ToList();

                return messages;
            }
        }

        public Message GetMessageDetails(long usersMessageID)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var message = entity.usersMessages
                                .Where(x => x.UsersMessageID== usersMessageID )
                                .Select(x=> new Message() {
                                Title = x.Title,
                                ContentMessage = x.ContentMessage,
                                IsRead = x.IsRead,
                                FromEmployeeAr = entity.employees.Where( y => y.EmployeeID == x.CreateUserID).Select(y => y.NameAr).FirstOrDefault(),
                                FromEmployeeEn = entity.employees.Where( y => y.EmployeeID == x.CreateUserID).Select(y => y.NameEn).FirstOrDefault(),
                                CreateDate = x.CreateDate,
                                UsersMessageID = x.UsersMessageID,
                                EmpImage = entity.employees.Where(y => y.EmployeeID == x.CreateUserID).Select(y => y.Image).FirstOrDefault(),
                                }).FirstOrDefault();

                return message;
            }
        }

        public long GetMessagesCount(long empId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var messagesCount = entity.usersMessages
                                .Where(x => x.ToEmployeeID == empId && x.IsActive == true)
                                .Count();

                return messagesCount;
            }
        }
        public long AddMessage(Message msg)
        {
            try
            {
                usersMessages message;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    message = new usersMessages()
                    {
                        Title = msg.Title,
                        ContentMessage = msg.ContentMessage,
                        ToEmployeeID = msg.ToEmployeeID,
                        Notes = msg.Notes,
                        IsActive = true,
                        CreateUserID = msg.CreateUserID,
                        UpdateUserID = msg.UpdateUserID,
                        CreateDate = DateTime.Now,
                        UpdateDate = DateTime.Now,
                        IsRead = false,
                    };
                    message = entity.usersMessages.Add(message);
                  
                    entity.SaveChanges();
                }
                return message.UsersMessageID;
            }

            catch
            {
                return 0;
            }
        }

        public void DeleteMessage(long messageID)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var msg = entity.usersMessages.Find(messageID);
                msg.IsActive = false;
                entity.SaveChanges();
            }
        }

        public void SetMessageAsRead(long messageID)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var msg = entity.usersMessages.Find(messageID);

                msg.IsRead = true;
                entity.SaveChanges();
            }
        }
        public long AddReply(Reply rep)
        {
            try
            {
                MessageReply reply;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    reply = new MessageReply()
                    {
                        ContentMessage = rep.ContentMessage,
                        ToEmployee = rep.ToEmployee,
                        FromEmployee = rep.FromEmployee,
                        Notes = rep.Notes,
                        IsActive = true,
                        CreateUserID = rep.CreateUserID,
                        UpdateUserID = rep.UpdateUserID,
                        CreateDate = DateTime.Now,
                        UpdateDate = DateTime.Now,
                        IsRead = false,
                    };
                    reply = entity.MessageReply.Add(reply);
                  
                    entity.SaveChanges();
                }
                return reply.ReplyID;
            }

            catch
            {
                return 0;
            }
        }

        public void SetReplyAsRead(long messageID, long empID)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var msg = entity.MessageReply.Where(x => UsersMessageID == messageID
                                && x.ToEmployee == empID).ToList();

                foreach (var row in msg)
                {
                    row.IsRead = true;
                }
                entity.SaveChanges();
            }
        }
        #endregion
    }
}