using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Human_Resource.App_Code
{
    public class ResignationModel
    {

        #region Attributes
        public long ResignationID { get; set; }
        public Nullable<long> EmployeeID { get; set; }
        public Nullable<long> ApprovalID { get; set; }
        public string Type { get; set; }
        public Nullable<bool> IsApproved { get; set; }
        public Nullable<System.DateTime> ApproveDate { get; set; }
        public decimal Dues { get; set; }
        public decimal VacationsAccount { get; set; }
        public decimal Reward { get; set; }
        public Nullable<System.DateTime> CreatDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<long> CreateUserID { get; set; }
        public Nullable<long> UpdateUserID { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public string Reason { get; set; }

        public int YearsOfWork { get; set; }
        public EmployeeModel Employee { get; set; }
        #endregion

        #region Methods

        public ResignationModel getDismissalEmpInfo(long empId)
        {
            ResignationModel resignation = new ResignationModel();
            EmployeeModel emp = new EmployeeModel();

            resignation.Employee = emp.GetByID(empId);

            if (resignation.Employee.HiringDate != null)
            {
                var hiringDate = (DateTime)resignation.Employee.HiringDate;
                DateTime now = DateTime.Now;

                TimeSpan span = now - hiringDate;
                DateTime zeroTime = new DateTime(1, 1, 1);
                int yearsOfWork = (zeroTime + span).Year - 1;
                resignation.YearsOfWork = yearsOfWork;
            }

            //calculate vacations Account
            decimal salaryInDay = resignation.Employee.BasicSalary / 30;
            var vacAccount = resignation.Employee.VacationsBalance * salaryInDay;
            resignation.VacationsAccount = vacAccount;
            // calculate reward
            resignation.Reward = calculateDismissalIndemnity(resignation.Employee);

            return resignation;
            
        }
        public decimal calculateDismissalIndemnity(EmployeeModel emp)
        {
            decimal Indemnity = 0;

            DateTime zeroTime = new DateTime(1, 1, 1);
            if (emp.HiringDate != null)
            {
                var hiringDate = (DateTime)emp.HiringDate;
                DateTime now = DateTime.Now;

                TimeSpan span = now - hiringDate;
                int yearsOfWork = (zeroTime + span).Year - 1;

                decimal salaryInDay = emp.BasicSalary / 30;
                //first 5 years
                if (yearsOfWork > 5)
                {
                    // (راتب شهري)× 12(عدد الاشهر) × (15 / 365) × 5(عدد السنوات)
                    //Indemnity += emp.BasicSalary * 12 * (365 / 15) * 5;
                   Indemnity += emp.BasicSalary /2 * 5;
                    yearsOfWork = yearsOfWork - 5;

                    //الراتب الشهري للعامل × عدد سنوات الخدمة
                    Indemnity += emp.BasicSalary * yearsOfWork;
                }
                else
                    Indemnity += emp.BasicSalary / 2 * 5;


                //compare Indemnity with salary of year and half
                decimal yearSalary = emp.BasicSalary * 12;
                if (Indemnity > (yearSalary + (yearSalary / 2)))
                    Indemnity = (yearSalary + (yearSalary / 2));

            }
            return Indemnity;
        }
        public ResignationModel getResignationEmpInfo(long empId)
        {
            ResignationModel resignation = new ResignationModel();
            EmployeeModel emp = new EmployeeModel();

            using (var entity = new HRSystemEntities())
            {
                resignation = entity.Resignation.Where(x => x.EmployeeID == empId
                                && x.IsActive == true && x.IsApproved == null
                                && x.Type == "resignation")
                    .Select(x => new ResignationModel()
                    {
                        Reason = x.Reason,
                    }).FirstOrDefault();
            }

            resignation.Employee = emp.GetByID(empId);

            if (resignation.Employee.HiringDate != null)
            {
                var hiringDate = (DateTime)resignation.Employee.HiringDate;
                DateTime now = DateTime.Now;

                TimeSpan span = now - hiringDate;
                DateTime zeroTime = new DateTime(1, 1, 1);
                int yearsOfWork = (zeroTime + span).Year - 1;
                resignation.YearsOfWork = yearsOfWork;
            }

            //calculate vacations Account
            decimal salaryInDay = resignation.Employee.BasicSalary / 30;
            var vacAccount = resignation.Employee.VacationsBalance * salaryInDay;
            resignation.VacationsAccount = vacAccount;
            // calculate reward
            resignation.Reward = calculateResignationIndemnity(resignation.Employee);

            return resignation;
            
        }
        public decimal calculateResignationIndemnity(EmployeeModel emp)
        {
            decimal Indemnity = 0;

            DateTime zeroTime = new DateTime(1, 1, 1);
            if (emp.HiringDate != null)
            {
                var hiringDate = (DateTime)emp.HiringDate;
                DateTime now = DateTime.Now;

                TimeSpan span = now - hiringDate;
                int yearsOfWork = (zeroTime + span).Year - 1;

                decimal salaryInDay = emp.BasicSalary / 30;

                if (yearsOfWork < 3)
                    return Indemnity;
                //first 5 years
                if (yearsOfWork >= 3 && yearsOfWork < 5)
                {
                    //0.5× (أجرة 15 يومًا عن كل سنة من سنوات الخدمة) إذا كان يتقاضى الراتب شهريًا.

                    Indemnity = (emp.BasicSalary / 4) * yearsOfWork;
                }
                else if (yearsOfWork >= 5 && yearsOfWork < 10)
                {
                    //2÷3) × (أجرة 15 يومًا×5) + أجرة شهر كامل عن كل سنة بعد أول 5 سنوات من الخدمة) إذا كان يتقاضى الراتب شهريًا.

                    Indemnity = (2/3) * (emp.BasicSalary/2) * 5 ;
                    yearsOfWork = yearsOfWork - 5;

                    Indemnity += emp.BasicSalary * yearsOfWork;
                }

                //compare Indemnity with salary of year and half
                decimal yearSalary = emp.BasicSalary * 12;
                if (Indemnity > (yearSalary + (yearSalary / 2)))
                    Indemnity = (yearSalary + (yearSalary / 2));

            }
            return Indemnity;
        }
        

        public void SaveDismissal(ResignationModel resignation)
        {
            using(var entity = new HRSystemEntities())
            {
                Resignation res = new Resignation()
                {
                    ApproveDate = resignation.ApproveDate,
                    EmployeeID = resignation.EmployeeID,
                    ApprovalID = resignation.ApprovalID,
                    Dues = resignation.Dues,
                    Reward = resignation.Reward,
                    VacationsAccount = resignation.VacationsAccount,
                    Type = resignation.Type,
                    CreatDate  = DateTime.Now,
                    UpdateDate = DateTime.Now,
                    Reason=resignation.Reason,
                    CreateUserID=resignation.CreateUserID,
                    UpdateUserID= resignation.UpdateUserID,
                    IsActive=true,
                    IsApproved=resignation.IsApproved,                  
                };

                entity.Resignation.Add(res);
                entity.SaveChanges();

                //unactivate employee
                var emp = entity.employees.Find(resignation.EmployeeID);
                emp.IsActive = false;
                entity.SaveChanges();
            }
        }

        public void SaveResignation(ResignationModel resignation)
        {
            using(var entity = new HRSystemEntities())
            {
                Resignation res = new Resignation()
                {
                    ApproveDate = resignation.ApproveDate,
                    EmployeeID = resignation.EmployeeID,
                    ApprovalID = resignation.ApprovalID,
                    Dues = resignation.Dues,
                    Reward = resignation.Reward,
                    VacationsAccount = resignation.VacationsAccount,
                    Type = resignation.Type,
                    CreatDate  = DateTime.Now,
                    UpdateDate = DateTime.Now,
                    Reason=resignation.Reason,
                    CreateUserID=resignation.CreateUserID,
                    UpdateUserID= resignation.UpdateUserID,
                    IsActive=true,
                    IsApproved=resignation.IsApproved,                  
                };

                entity.Resignation.Add(res);
                entity.SaveChanges();
            }
        }
          public void ApproveResignation(ResignationModel resignation)
        {
            using(var entity = new HRSystemEntities())
            {
                var res = entity.Resignation.Where(x => x.EmployeeID == resignation.EmployeeID
                                            && x.IsActive == true
                                            && x.IsApproved == null
                                            && x.Type == "resignation").FirstOrDefault();

                res.ApproveDate = resignation.ApproveDate;
                res.ApprovalID = resignation.ApprovalID;
                res.Dues = resignation.Dues;
                res.Reward = resignation.Reward;
                res.VacationsAccount = resignation.VacationsAccount;
                res.UpdateDate = DateTime.Now;
                res.UpdateUserID = resignation.UpdateUserID;
                res.IsApproved = true;                  

                entity.SaveChanges();

                //unactivate employee
                var emp = entity.employees.Find(resignation.EmployeeID);
                emp.IsActive = false;
                entity.SaveChanges();
            }
        }
         public void RejectResignation(ResignationModel resignation)
        {
            using(var entity = new HRSystemEntities())
            {
                var res = entity.Resignation.Where(x => x.EmployeeID == resignation.EmployeeID
                                            && x.IsActive == true
                                            && x.IsApproved == null
                                            && x.Type == "resignation").FirstOrDefault();

                res.ApproveDate = resignation.ApproveDate;
                res.ApprovalID = resignation.ApprovalID;

                res.UpdateDate = DateTime.Now;
                res.UpdateUserID = resignation.UpdateUserID;
                res.IsApproved = false;                  

                entity.SaveChanges();

            }
        }

        public int GetResignationCount()
        {
            int count = 0;
            using (var entity = new HRSystemEntities())
            {
                count = entity.Resignation.Where(x => x.Type == "resignation" && x.IsActive == true
                                            && x.IsApproved == null).ToList().Count();
            }
            return count;
        }

        public List<EmployeeModel> GetResignationEmployees()
        {
            using (var entity = new HRSystemEntities())
            {
                var emps = (from r in entity.Resignation
                            join e in entity.employees on r.EmployeeID equals e.EmployeeID
                            where e.IsActive == true && r.IsApproved == null && r.Type == "resignation"
                            select new EmployeeModel() {
                            EmployeeID = e.EmployeeID,
                            NameAr = e.NameAr,
                            NameEn = e.NameEn}).ToList();
                return emps;
            }
        }

        public ResignationModel GetEmpResignation(long empId)
        {
            using (var entity = new HRSystemEntities())
            {
                var resignation = entity.Resignation.Where(x => x.EmployeeID == empId && x.IsActive == true
                                                            && x.IsApproved == null)
                                .Select(x => new ResignationModel() {
                                Reason = x.Reason}).FirstOrDefault();

                return resignation;
            }
        }
        #endregion
    }
}