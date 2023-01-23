using LinqKit;
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

        public string FromEmployeeAr { get; set; }
        public string FromEmployeeEn { get; set; }
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

        public List<Message> GetUserMessages(long empId,int skip,string searchText)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var searchPredicate = PredicateBuilder.New<usersMessages>();

                if (searchText != "")
                {
                    searchPredicate = searchPredicate.Or(x => x.ContentMessage.Contains(searchText));
                    searchPredicate = searchPredicate.Or(x => x.Title.Contains(searchText));

                    searchPredicate = searchPredicate.Or(x => entity.employees.Where(y => y.EmployeeID == x.CreateUserID).Select(y => y.NameAr).FirstOrDefault().Contains(searchText));
                    searchPredicate = searchPredicate.Or(x => entity.employees.Where(y => y.EmployeeID == x.CreateUserID).Select(y => y.NameEn).FirstOrDefault().Contains(searchText));
                }
                else
                {
                    searchPredicate = searchPredicate.And(x => true);
                }
                var messages =(from x in entity.usersMessages.Where(searchPredicate)
                               join r in entity.MessageReply on x.UsersMessageID equals r.UsersMessageID into lj
                               from rep in lj.DefaultIfEmpty()
                               where  (x.ToEmployeeID == empId || rep.ToEmployee == empId) && x.IsActive == true
                               select  new Message() {
                                Title = x.Title,
                                IsRead = x.IsRead,
                                ToEmployeeID = x.ToEmployeeID,
                                FromEmployeeAr = entity.employees.Where( y => y.EmployeeID == x.CreateUserID).Select(y => y.NameAr).FirstOrDefault(),
                                FromEmployeeEn = entity.employees.Where( y => y.EmployeeID == x.CreateUserID).Select(y => y.NameEn).FirstOrDefault(),
                                CreateDate = x.CreateDate,
                                UsersMessageID = x.UsersMessageID,
                                }).Distinct().OrderBy(x => x.UsersMessageID).Skip(skip).Take(5).ToList();

                foreach (var msg in messages)
                {

                    bool isRead = true;
                    if (msg.ToEmployeeID == empId)
                        isRead =(bool) msg.IsRead;

                    if (isRead)
                    {
                        var replies = entity.MessageReply.Where(x => x.UsersMessageID == msg.UsersMessageID && x.IsActive == true).ToList();
                        foreach (var rep in replies)
                        {
                            if (rep.ToEmployee == empId && rep.IsRead == false)
                            {
                                isRead = false;
                                break;
                            }
                        }
                        msg.IsRead = isRead;
                    }
                    msg.ContentMessage = entity.usersMessages.Find(msg.UsersMessageID).ContentMessage;
                }
                return messages;
            }
        }
         public int GetUnReadMessagesCount(long empId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var unReadMsg = entity.usersMessages.Where(x => x.ToEmployeeID == empId && x.IsActive == true && x.IsRead == false).ToList().Count();

                var unReadRep = (from x in entity.MessageReply
                                where  x.ToEmployee == empId && x.IsActive == true && x.IsRead == false
                                select new Reply()
                                {
                                    UsersMessageID = x.UsersMessageID,
                                    ToEmployee=x.ToEmployee,
                                }).Distinct().ToList().Count();

                return unReadMsg + unReadRep;
            }
        }

        public long GetMessagesCount(long empId,string searchText="")
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var searchPredicate = PredicateBuilder.New<usersMessages>();
              
                if(searchText != "")
                {
                   
                  searchPredicate = searchPredicate.Or(x => x.ContentMessage.Contains(searchText));
                    searchPredicate = searchPredicate.Or(x => x.Title.Contains(searchText));
              
                    searchPredicate = searchPredicate.Or(x => entity.employees.Where(y => y.EmployeeID == x.CreateUserID).Select(y => y.NameAr).FirstOrDefault().Contains(searchText));
                    searchPredicate = searchPredicate.Or(x => entity.employees.Where(y => y.EmployeeID == x.CreateUserID).Select(y => y.NameEn).FirstOrDefault().Contains(searchText));
                }
                else
                {
                    searchPredicate = searchPredicate.And(x=> true);
                }

                var messagesCount = (from x in entity.usersMessages.Where(searchPredicate)
                                join r in entity.MessageReply on x.UsersMessageID equals r.UsersMessageID into lj
                                from rep in lj.DefaultIfEmpty()
                                where (x.ToEmployeeID == empId || rep.ToEmployee == empId) && x.IsActive == true
                                     select new Message()
                                {
                                    Title = x.Title,
                                    ToEmployeeID = x.ToEmployeeID,
                                    CreateDate = x.CreateDate,
                                }).Distinct().Count();

                return messagesCount;
            }
        }
        public Message GetMessageDetails(long usersMessageID,long empId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var message = entity.usersMessages
                                .Where(x => x.UsersMessageID == usersMessageID)
                                .Select(x => new Message() {
                                    Title = x.Title,
                                    ContentMessage = x.ContentMessage,
                                    IsRead = x.IsRead,
                                    ToEmployeeID = x.ToEmployeeID,
                                    FromEmployeeAr = entity.employees.Where(y => y.EmployeeID == x.CreateUserID).Select(y => y.NameAr).FirstOrDefault(),
                                    FromEmployeeEn = entity.employees.Where(y => y.EmployeeID == x.CreateUserID).Select(y => y.NameEn).FirstOrDefault(),
                                    CreateDate = x.CreateDate,
                                    UsersMessageID = x.UsersMessageID,
                                    EmpImage = entity.employees.Where(y => y.EmployeeID == x.CreateUserID).Select(y => y.Image).FirstOrDefault(),
                                    Replies = entity.MessageReply.Where(y => y.UsersMessageID == x.UsersMessageID && y.IsActive == true)
                                        .Select(y => new Reply() { IsRead = y.IsRead,
                                        ContentMessage = y.ContentMessage,
                                        ReplyID = y.ReplyID,
                                        CreateDate = y.CreateDate,
                                        FromEmployee = y.FromEmployee,
                                        ToEmployee = y.ToEmployee,
                                        FromEmployeeAr = entity.employees.Where(z => z.EmployeeID == y.CreateUserID).Select(z => z.NameAr).FirstOrDefault(),
                                        FromEmployeeEn = entity.employees.Where(z => z.EmployeeID == y.CreateUserID).Select(z => z.NameEn).FirstOrDefault(),
                                        }).ToList(),

                                }).FirstOrDefault();

                if (message.ToEmployeeID == empId)
                {
                    var msg = entity.usersMessages.Find(usersMessageID);
                    msg.IsRead = true;
                    entity.SaveChanges();
                }

                foreach (var rep in message.Replies)
                {
                    if (rep.ToEmployee == empId && rep.IsRead == false)
                    {
                        var r = entity.MessageReply.Find(rep.ReplyID);
                        r.IsRead = true;
                    }
                }
                entity.SaveChanges();           

                return message;
            }
        }

      
        public long AddMessage(long toEmployeeID,long fromEmployeeID, string title, string content)
        {
            try
            {
                usersMessages message;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    message = new usersMessages()
                    {
                        Title = title,
                        ContentMessage = content,
                        ToEmployeeID = toEmployeeID,
                        IsActive = true,
                        CreateUserID = fromEmployeeID,
                        UpdateUserID = fromEmployeeID,
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
        public long AddReply(long userMessageID,long fromEmpID, string reply)
        {
            try
            {

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    var message = entity.usersMessages.Find(userMessageID);

                    long toEmpID = 0;
                    if (fromEmpID == message.CreateUserID)
                        toEmpID = (long)message.ToEmployeeID;
                    else
                        toEmpID = (long)message.CreateUserID;

                    MessageReply replyObj = new MessageReply()
                    {
                        UsersMessageID = userMessageID,
                        ContentMessage = reply,
                        ToEmployee = toEmpID,
                        FromEmployee = fromEmpID,
                        IsActive = true,
                        CreateUserID = fromEmpID,
                        UpdateUserID = fromEmpID,
                        CreateDate = DateTime.Now,
                        UpdateDate = DateTime.Now,
                        IsRead = false,
                    };
                    replyObj = entity.MessageReply.Add(replyObj);
                  
                    entity.SaveChanges();
                }
                return 1;
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