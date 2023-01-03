using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class Device
    {

        #region Attributes
        public int ID { get; set; }
        public string Name { get; set; }
        public Nullable<int> Port { get; set; }
        public Nullable<int> DeviceNumber { get; set; }
        public string Notes { get; set; }

        public Nullable<bool> IsActive { get; set; }
        public Nullable<int> CreateUserID { get; set; }
        public Nullable<int> UpdateUserID { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }

        public string AddedBy { get; set; }
        #endregion


        #region Methods

        public List<Device> GetActivity()
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var devices = entity.Devices.Where(x => x.IsActive == true)
                            .Select(x => new Device()
                            {
                                ID = x.ID,
                                Name = x.Name,
                                Port = x.Port,
                                DeviceNumber = x.DeviceNumber,
                                Notes = x.Notes,
                                CreateDate = x.CreateDate,
                                UpdateDate = x.UpdateDate,
                                CreateUserID = x.CreateUserID,
                                UpdateUserID = x.UpdateUserID,
                                AddedBy = entity.employees.Where(m => m.EmployeeID == x.CreateUserID).Select(m => m.NameAr).FirstOrDefault(),
                            }).ToList();
                return devices;
            }
        }


        public Device getDevice(int deviceId)
        {
            using (HRSystemEntities entity = new HRSystemEntities())
            {
                var device = entity.Devices.Where(x => x.ID == deviceId)
                                .Select(x => new Device()
                                {
                                    ID = x.ID,
                                    Name = x.Name,
                                    Port=x.Port,
                                    DeviceNumber = x.DeviceNumber,
                                    CreateUserID = x.CreateUserID,
                                    UpdateUserID = x.UpdateUserID,
                                    Notes = x.Notes,
                                    CreateDate = x.CreateDate,
                                    UpdateDate = x.UpdateDate,
                                }).FirstOrDefault();
                return device;
            }
        }

        public int SaveDevice(Device device)
        {
            try
            {
                Devices dev;

                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    if (device.ID.Equals(0))
                    {
                        dev = new Devices()
                        {
                            Name = device.Name,
                            Port=device.Port,
                            DeviceNumber = device.DeviceNumber,
                            Notes =device.Notes,
                            IsActive = true,
                            CreateUserID = device.CreateUserID,
                            UpdateUserID = device.UpdateUserID,
                            CreateDate = DateTime.Now,
                            UpdateDate = DateTime.Now,
                        };
                        dev = entity.Devices.Add(dev);
                    }
                    else
                    {
                        dev = entity.Devices.Find(device.ID);
                        dev.Name = device.Name;
                        dev.Port = device.Port;
                        dev.DeviceNumber = device.DeviceNumber;
                        dev.Notes = device.Notes;
                        dev.IsActive = true;
                        dev.UpdateUserID = device.UpdateUserID;
                        dev.UpdateDate = DateTime.Now;
                    }
                    entity.SaveChanges();
                }
                return dev.ID;
            }

            catch
            {
                return 0;
            }
        }
        public bool DeleteDevice(int Id, int? userId)
        {
            try
            {
                using (HRSystemEntities entity = new HRSystemEntities())
                {
                    var device = entity.Devices.Find(Id);
                    device.IsActive = false;
                    device.UpdateDate = DateTime.Now;
                    device.UpdateUserID = userId;
                    entity.SaveChanges();
                }
                return true;
            }

            catch
            {
                return false;
            }
        }

        #endregion
    }
}