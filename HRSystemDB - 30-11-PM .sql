USE [HRSystem]
GO
ALTER TABLE [dbo].[rewards] DROP CONSTRAINT [FK_rewards_employees]
GO
ALTER TABLE [dbo].[periods] DROP CONSTRAINT [FK_periods_employees]
GO
ALTER TABLE [dbo].[messages] DROP CONSTRAINT [FK_messages_employees]
GO
ALTER TABLE [dbo].[materialsConsumption] DROP CONSTRAINT [FK_materialsConsumption_employees]
GO
ALTER TABLE [dbo].[managements] DROP CONSTRAINT [FK_managements_branches]
GO
ALTER TABLE [dbo].[Images] DROP CONSTRAINT [FK_Images_employees]
GO
ALTER TABLE [dbo].[hourlyPermissions] DROP CONSTRAINT [FK_hourlyPermissions_employees]
GO
ALTER TABLE [dbo].[employeesVacations] DROP CONSTRAINT [FK_employeesVacations_vacations]
GO
ALTER TABLE [dbo].[employeesVacations] DROP CONSTRAINT [FK_employeesVacations_employees]
GO
ALTER TABLE [dbo].[employeesTrainings] DROP CONSTRAINT [FK_employeesTrainings_trainings1]
GO
ALTER TABLE [dbo].[employeesTrainings] DROP CONSTRAINT [FK_employeesTrainings_employees1]
GO
ALTER TABLE [dbo].[employeesTasks] DROP CONSTRAINT [FK_employeesTasks_tasks]
GO
ALTER TABLE [dbo].[employeesTasks] DROP CONSTRAINT [FK_employeesTasks_employees]
GO
ALTER TABLE [dbo].[employeesScheduleVacations] DROP CONSTRAINT [FK_employeesScheduleVacations_scheduleVacations]
GO
ALTER TABLE [dbo].[employeesScheduleVacations] DROP CONSTRAINT [FK_employeesScheduleVacations_employees]
GO
ALTER TABLE [dbo].[employees] DROP CONSTRAINT [FK_employees_jobs]
GO
ALTER TABLE [dbo].[employees] DROP CONSTRAINT [FK_employees_departments]
GO
ALTER TABLE [dbo].[employees] DROP CONSTRAINT [FK_employees_countriesName]
GO
ALTER TABLE [dbo].[EemployeesEvents] DROP CONSTRAINT [FK_EemployeesEvents_events]
GO
ALTER TABLE [dbo].[EemployeesEvents] DROP CONSTRAINT [FK_EemployeesEvents_employees]
GO
ALTER TABLE [dbo].[departments] DROP CONSTRAINT [FK_departments_managements]
GO
ALTER TABLE [dbo].[custodies] DROP CONSTRAINT [FK_custodies_employees]
GO
ALTER TABLE [dbo].[confirms] DROP CONSTRAINT [FK_confirms_tasks]
GO
ALTER TABLE [dbo].[confirms] DROP CONSTRAINT [FK_confirms_salaryIncrease]
GO
ALTER TABLE [dbo].[confirms] DROP CONSTRAINT [FK_confirms_messagesTemplates]
GO
ALTER TABLE [dbo].[confirms] DROP CONSTRAINT [FK_confirms_jobs]
GO
ALTER TABLE [dbo].[confirms] DROP CONSTRAINT [FK_confirms_hourlyPermissions]
GO
ALTER TABLE [dbo].[confirms] DROP CONSTRAINT [FK_confirms_employees]
GO
ALTER TABLE [dbo].[confirms] DROP CONSTRAINT [FK_confirms_departments]
GO
ALTER TABLE [dbo].[branches] DROP CONSTRAINT [FK_branches_companies]
GO
/****** Object:  Table [dbo].[vacations]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vacations]') AND type in (N'U'))
DROP TABLE [dbo].[vacations]
GO
/****** Object:  Table [dbo].[trainings]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[trainings]') AND type in (N'U'))
DROP TABLE [dbo].[trainings]
GO
/****** Object:  Table [dbo].[tasks]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tasks]') AND type in (N'U'))
DROP TABLE [dbo].[tasks]
GO
/****** Object:  Table [dbo].[scheduleVacations]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[scheduleVacations]') AND type in (N'U'))
DROP TABLE [dbo].[scheduleVacations]
GO
/****** Object:  Table [dbo].[salaryIncrease]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[salaryIncrease]') AND type in (N'U'))
DROP TABLE [dbo].[salaryIncrease]
GO
/****** Object:  Table [dbo].[rewards]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rewards]') AND type in (N'U'))
DROP TABLE [dbo].[rewards]
GO
/****** Object:  Table [dbo].[periods]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[periods]') AND type in (N'U'))
DROP TABLE [dbo].[periods]
GO
/****** Object:  Table [dbo].[messagesTemplates]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[messagesTemplates]') AND type in (N'U'))
DROP TABLE [dbo].[messagesTemplates]
GO
/****** Object:  Table [dbo].[messages]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[messages]') AND type in (N'U'))
DROP TABLE [dbo].[messages]
GO
/****** Object:  Table [dbo].[materialsConsumption]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[materialsConsumption]') AND type in (N'U'))
DROP TABLE [dbo].[materialsConsumption]
GO
/****** Object:  Table [dbo].[managements]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[managements]') AND type in (N'U'))
DROP TABLE [dbo].[managements]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jobs]') AND type in (N'U'))
DROP TABLE [dbo].[jobs]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Images]') AND type in (N'U'))
DROP TABLE [dbo].[Images]
GO
/****** Object:  Table [dbo].[hourlyPermissions]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hourlyPermissions]') AND type in (N'U'))
DROP TABLE [dbo].[hourlyPermissions]
GO
/****** Object:  Table [dbo].[events]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[events]') AND type in (N'U'))
DROP TABLE [dbo].[events]
GO
/****** Object:  Table [dbo].[employeesVacations]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[employeesVacations]') AND type in (N'U'))
DROP TABLE [dbo].[employeesVacations]
GO
/****** Object:  Table [dbo].[employeesTrainings]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[employeesTrainings]') AND type in (N'U'))
DROP TABLE [dbo].[employeesTrainings]
GO
/****** Object:  Table [dbo].[employeesTasks]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[employeesTasks]') AND type in (N'U'))
DROP TABLE [dbo].[employeesTasks]
GO
/****** Object:  Table [dbo].[employeesScheduleVacations]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[employeesScheduleVacations]') AND type in (N'U'))
DROP TABLE [dbo].[employeesScheduleVacations]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[employees]') AND type in (N'U'))
DROP TABLE [dbo].[employees]
GO
/****** Object:  Table [dbo].[EemployeesEvents]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EemployeesEvents]') AND type in (N'U'))
DROP TABLE [dbo].[EemployeesEvents]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[departments]') AND type in (N'U'))
DROP TABLE [dbo].[departments]
GO
/****** Object:  Table [dbo].[custodies]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[custodies]') AND type in (N'U'))
DROP TABLE [dbo].[custodies]
GO
/****** Object:  Table [dbo].[countriesName]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[countriesName]') AND type in (N'U'))
DROP TABLE [dbo].[countriesName]
GO
/****** Object:  Table [dbo].[confirms]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[confirms]') AND type in (N'U'))
DROP TABLE [dbo].[confirms]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[companies]') AND type in (N'U'))
DROP TABLE [dbo].[companies]
GO
/****** Object:  Table [dbo].[branches]    Script Date: 11/30/2022 11:59:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[branches]') AND type in (N'U'))
DROP TABLE [dbo].[branches]
GO
/****** Object:  Table [dbo].[branches]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branches](
	[BranchID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CompanyID] [int] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
	[ManagerID] [int] NULL,
	[Mobile] [nvarchar](100) NULL,
	[Address] [ntext] NULL,
 CONSTRAINT [PK_branches] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[companies](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Address] [ntext] NULL,
	[Email] [nvarchar](100) NULL,
	[Mobile] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[Fax] [nvarchar](100) NULL,
	[Notes] [ntext] NULL,
	[OurCompany] [bit] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
	[GeneralDirector] [int] NULL,
	[FinancialManager] [int] NULL,
	[HRManager] [int] NULL,
	[CEO] [int] NULL,
 CONSTRAINT [PK_companies] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[confirms]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[confirms](
	[ConfirmID] [bigint] IDENTITY(1,1) NOT NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
	[TaskID] [int] NULL,
	[SalaryIncreaseID] [int] NULL,
	[MessagesTemplateID] [int] NULL,
	[HourlyPermissionID] [int] NULL,
	[JobID] [int] NULL,
	[DepartmentID] [int] NULL,
	[ConfirmType] [nvarchar](100) NULL,
	[EmployeeID] [int] NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_confirms] PRIMARY KEY CLUSTERED 
(
	[ConfirmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[countriesName]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countriesName](
	[CountriesNameID] [int] IDENTITY(1,1) NOT NULL,
	[NameEn] [nvarchar](100) NULL,
	[NameAr] [nvarchar](100) NULL,
 CONSTRAINT [PK_CountriesName] PRIMARY KEY CLUSTERED 
(
	[CountriesNameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[custodies]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[custodies](
	[CustodieID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](100) NULL,
	[Details] [ntext] NULL,
	[Value] [nvarchar](100) NULL,
	[EmployeeID] [int] NULL,
	[IsRecovery] [bit] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_custodies] PRIMARY KEY CLUSTERED 
(
	[CustodieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
	[ManagerID] [int] NULL,
	[Mobile] [nvarchar](100) NULL,
	[ManagementID] [int] NULL,
 CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EemployeesEvents]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EemployeesEvents](
	[EmployeesEventsID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NULL,
	[EmployeeID] [int] NOT NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_EemployeesEvents] PRIMARY KEY CLUSTERED 
(
	[EmployeesEventsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[DepartmentID] [int] NULL,
	[VacationsBalance] [int] NULL,
	[WarningPeriod] [bit] NULL,
	[NameAr] [nvarchar](100) NULL,
	[NameEn] [nvarchar](100) NULL,
	[DOB] [datetime2](7) NULL,
	[Gender] [nvarchar](100) NULL,
	[MaritalStatus] [nvarchar](100) NULL,
	[Nationality] [int] NULL,
	[Religion] [nvarchar](100) NULL,
	[BloodType] [nvarchar](100) NULL,
	[Image] [ntext] NULL,
	[IdentityType] [nvarchar](100) NULL,
	[IdentityNumber] [nvarchar](100) NULL,
	[IdentityReleaseDate] [datetime2](7) NULL,
	[IdentityExpiryDate] [datetime2](7) NULL,
	[PassportNumber] [nvarchar](100) NULL,
	[PassportReleaseDate] [datetime2](7) NULL,
	[PassportExpiryDate] [datetime2](7) NULL,
	[PassportCountry] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[Mobile] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [ntext] NULL,
	[NoConviction] [bit] NULL,
	[BankAccount] [nvarchar](100) NULL,
	[BankName] [nvarchar](100) NULL,
	[IBANNumber] [nvarchar](100) NULL,
	[SWIFTCODE] [nvarchar](100) NULL,
	[PaymentType] [nvarchar](100) NULL,
	[EducationCertificate1] [nvarchar](100) NULL,
	[EducationCertificateFromDate1] [datetime2](7) NULL,
	[EducationCertificateToDate1] [datetime2](7) NULL,
	[EducationCertificateSource1] [nvarchar](100) NULL,
	[EducationCertificate2] [nvarchar](100) NULL,
	[EducationCertificateFromDate2] [datetime2](7) NULL,
	[EducationCertificateToDate2] [datetime2](7) NULL,
	[EducationCertificateSource2] [nvarchar](100) NULL,
	[EducationCertificate3] [nvarchar](100) NULL,
	[EducationCertificateFromDate3] [datetime2](7) NULL,
	[EducationCertificateToDate3] [datetime2](7) NULL,
	[EducationCertificateSource3] [nvarchar](100) NULL,
	[WorkExperience1] [ntext] NULL,
	[WorkExperience2] [ntext] NULL,
	[WorkExperience3] [ntext] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
	[BasicSalary] [decimal](20, 3) NULL,
	[TransportationCompensationType] [nvarchar](100) NULL,
	[HousingCompensationType] [nvarchar](100) NULL,
	[HiringDate] [datetime2](7) NULL,
	[Sequence] [nvarchar](100) NULL,
	[UnifiedNumber] [nvarchar](100) NULL,
	[ResidenceDate] [datetime2](7) NULL,
	[JobID] [int] NULL,
	[WorkHours] [int] NULL,
	[JobDescription] [ntext] NULL,
	[Guarantor] [nvarchar](100) NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employeesScheduleVacations]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employeesScheduleVacations](
	[EmployeesScheduleVacationsID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleVacationID] [int] NULL,
	[EmployeeID] [int] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_employeesScheduleVacations] PRIMARY KEY CLUSTERED 
(
	[EmployeesScheduleVacationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employeesTasks]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employeesTasks](
	[EmployeesTasksID] [int] IDENTITY(1,1) NOT NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
	[EmployeeID] [int] NULL,
	[TaskID] [int] NULL,
	[Status] [nvarchar](100) NULL,
	[EmpDone] [bit] NULL,
	[BossDone] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employeesTrainings]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employeesTrainings](
	[EmployeesTrainingsID] [int] IDENTITY(1,1) NOT NULL,
	[TrainingID] [int] NULL,
	[EmployeeID] [int] NOT NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_employeesTrainings] PRIMARY KEY CLUSTERED 
(
	[EmployeesTrainingsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employeesVacations]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employeesVacations](
	[EmployeesVacationsID] [int] IDENTITY(1,1) NOT NULL,
	[VacationID] [int] NULL,
	[EmployeeID] [int] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_employeesVacations] PRIMARY KEY CLUSTERED 
(
	[EmployeesVacationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[events]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[events](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [ntext] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_events] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hourlyPermissions]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hourlyPermissions](
	[HourlyPermissionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [ntext] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
	[employeeID] [int] NULL,
 CONSTRAINT [PK_hourlyPermissions] PRIMARY KEY CLUSTERED 
(
	[HourlyPermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[docName] [ntext] NULL,
	[docnum] [nvarchar](200) NULL,
	[image] [ntext] NULL,
	[EmployeeID] [int] NULL,
	[MessageID] [int] NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobs](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_jobs] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[managements]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[managements](
	[ManagementID] [int] IDENTITY(1,1) NOT NULL,
	[BranchID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
	[ManagerID] [int] NULL,
	[Mobile] [nvarchar](100) NULL,
 CONSTRAINT [PK_managements] PRIMARY KEY CLUSTERED 
(
	[ManagementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materialsConsumption]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materialsConsumption](
	[MaterialsConsumptionID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](100) NULL,
	[Details] [ntext] NULL,
	[EmployeeID] [int] NULL,
	[Value] [nvarchar](100) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_materialsConsumption] PRIMARY KEY CLUSTERED 
(
	[MaterialsConsumptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[messages]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[messages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
	[EmployeeID] [int] NULL,
	[ToEmployeeID] [int] NULL,
 CONSTRAINT [PK_messages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[messagesTemplates]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[messagesTemplates](
	[MessagesTemplateID] [int] IDENTITY(1,1) NOT NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_messagesTemplates] PRIMARY KEY CLUSTERED 
(
	[MessagesTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[periods]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[periods](
	[PeriodID] [int] IDENTITY(1,1) NOT NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
	[EmployeeID] [int] NULL,
	[StartTime] [datetime2](7) NULL,
	[EndTime] [datetime2](7) NULL,
 CONSTRAINT [PK_periods] PRIMARY KEY CLUSTERED 
(
	[PeriodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rewards]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rewards](
	[RewardID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](100) NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [ntext] NULL,
	[Value] [nvarchar](100) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_rewards] PRIMARY KEY CLUSTERED 
(
	[RewardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salaryIncrease]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salaryIncrease](
	[SalaryIncreaseID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[IncreaseType] [nvarchar](100) NULL,
	[IncreaseValue] [decimal](20, 3) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_salaryIncrease] PRIMARY KEY CLUSTERED 
(
	[SalaryIncreaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scheduleVacations]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scheduleVacations](
	[ScheduleVacationID] [int] IDENTITY(1,1) NOT NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_scheduleVacations] PRIMARY KEY CLUSTERED 
(
	[ScheduleVacationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tasks]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tasks](
	[TaskID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [ntext] NULL,
	[RepeatedEvery] [nvarchar](100) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_tasks] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trainings]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trainings](
	[TrainingID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [ntext] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_trainings] PRIMARY KEY CLUSTERED 
(
	[TrainingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vacations]    Script Date: 11/30/2022 11:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vacations](
	[VacationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [int] NULL,
	[UpdateUserID] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_vacations] PRIMARY KEY CLUSTERED 
(
	[VacationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[branches] ON 

INSERT [dbo].[branches] ([BranchID], [Name], [CompanyID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [Address]) VALUES (1, N'branch name', 1, NULL, CAST(N'2022-11-25T04:40:30.0643490' AS DateTime2), CAST(N'2022-11-25T20:32:13.3647715' AS DateTime2), NULL, NULL, 0, 1, N'0999999', N'branch address')
INSERT [dbo].[branches] ([BranchID], [Name], [CompanyID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [Address]) VALUES (2, N'', 1, NULL, CAST(N'2022-11-25T20:35:20.6056261' AS DateTime2), CAST(N'2022-11-25T20:35:47.9455608' AS DateTime2), NULL, NULL, 0, 1, N'', N'')
INSERT [dbo].[branches] ([BranchID], [Name], [CompanyID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [Address]) VALUES (3, N'name 1', 1, NULL, CAST(N'2022-11-25T20:35:44.4131896' AS DateTime2), CAST(N'2022-11-25T20:35:44.4131896' AS DateTime2), NULL, NULL, 1, 1, N'0911111', N'address 1')
INSERT [dbo].[branches] ([BranchID], [Name], [CompanyID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [Address]) VALUES (4, N'ttt', 1, NULL, CAST(N'2022-11-25T20:47:52.6597786' AS DateTime2), CAST(N'2022-11-25T20:47:52.6597786' AS DateTime2), NULL, NULL, 1, 1, N'000000000', N'ttt')
INSERT [dbo].[branches] ([BranchID], [Name], [CompanyID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [Address]) VALUES (5, N'ttt', 1, NULL, CAST(N'2022-11-25T20:48:24.8776342' AS DateTime2), CAST(N'2022-11-25T21:19:23.5475384' AS DateTime2), NULL, NULL, 1, 1, N'555', N'22222')
INSERT [dbo].[branches] ([BranchID], [Name], [CompanyID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [Address]) VALUES (6, N'heloo', 1, NULL, CAST(N'2022-11-25T20:51:38.6365624' AS DateTime2), CAST(N'2022-11-25T21:19:17.6422951' AS DateTime2), NULL, NULL, 0, 1, N'', N'')
INSERT [dbo].[branches] ([BranchID], [Name], [CompanyID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [Address]) VALUES (7, N'ss', 1, NULL, CAST(N'2022-11-25T21:19:35.6293987' AS DateTime2), CAST(N'2022-11-25T21:19:35.6293987' AS DateTime2), NULL, NULL, 1, 1, N'ss', N'sss')
SET IDENTITY_INSERT [dbo].[branches] OFF
GO
SET IDENTITY_INSERT [dbo].[companies] ON 

INSERT [dbo].[companies] ([CompanyID], [Name], [Address], [Email], [Mobile], [Phone], [Fax], [Notes], [OurCompany], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [GeneralDirector], [FinancialManager], [HRManager], [CEO]) VALUES (1, N'Dina Nemah', N'89سوريا - حلب - شارع ', N'dinahnemah@gmail.com', N'0959353886', N'25989544', N'+855511', N'لا يوجد ملاحظات', 1, CAST(N'2022-11-20T22:19:47.8841344' AS DateTime2), CAST(N'2022-11-20T22:49:13.5397466' AS DateTime2), 1, NULL, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[companies] OFF
GO
SET IDENTITY_INSERT [dbo].[countriesName] ON 

INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (1, N'Afghanistan', N'أفغانستان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (2, N'Albania', N'ألبانيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (3, N'Algeria', N'الجزائر')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (4, N'Andorra', N'أندورا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (5, N'Angola', N'أنغولا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (6, N'Antigua and Barbuda', N'أنتيغوا وبربودا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (7, N'Argentina', N'الأرجنتين')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (8, N'Armenia', N'أرمينيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (9, N'Austria', N'النمسا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (10, N'Azerbaijan', N'أذربيجان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (11, N'Bahrain', N'البحرين')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (12, N'Bangladesh', N'بنغلاديش')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (13, N'Barbados', N'بربادوس')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (14, N'Belarus', N'بيلاروسيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (15, N'Belgium', N'بلجيكا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (16, N'Belize', N'بليز')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (17, N'Benin', N'بنين')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (18, N'Bhutan', N'بوتان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (19, N'Bolivia', N'بوليفيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (20, N'Bosnia and Herzegovina', N'البوسنة والهرسك')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (21, N'Botswana', N'بوتسوانا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (22, N'Brazil', N'البرازيل')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (23, N'Brunei', N'بروناي')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (24, N'Bulgaria', N'بلغاريا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (25, N'Burkina Faso', N'بوركينا فاسو')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (26, N'Burundi', N'بوروندي')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (27, N'Cabo Verde', N'كابو فيردي')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (28, N'Cambodia', N'كمبوديا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (29, N'Cameroon', N'الكاميرون')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (30, N'Canada', N'كندا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (31, N'Central African Republic', N'جمهورية افريقيا الوسطى')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (32, N'Chad', N'تشاد')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (33, N'Channel Islands', N'جزر القناة')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (34, N'Chile', N'تشيلي')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (35, N'China', N'الصين')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (36, N'Colombia', N'كولومبيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (37, N'Comoros', N'جزر القمر')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (38, N'Congo', N'الكونغو')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (39, N'Costa Rica', N'كوستا ريكا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (40, N'Côte d''Ivoire', N'كوت ديفوار')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (41, N'Croatia', N'كرواتيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (42, N'Cuba', N'كوبا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (43, N'Cyprus', N'قبرص')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (44, N'Czech Republic', N'الجمهورية التشيكية')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (45, N'Denmark', N'الدنمارك')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (46, N'Djibouti', N'جيبوتي')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (47, N'Dominica', N'دومينيكا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (48, N'Dominican Republic', N'جمهورية الدومينيكان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (49, N'DR Congo', N'جمهورية الكونغو الديمقراطية')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (50, N'Ecuador', N'الاكوادور')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (51, N'Egypt', N'مصر')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (52, N'El Salvador', N'السلفادور')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (53, N'Equatorial Guinea', N'غينيا الإستوائية')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (54, N'Eritrea', N'إريتريا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (55, N'Estonia', N'إستونيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (56, N'Eswatini', N'إيسواتيني')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (57, N'Ethiopia', N'أثيوبيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (58, N'Faeroe Islands', N'جزر فايرو')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (59, N'Finland', N'فنلندا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (60, N'France', N'فرنسا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (61, N'French Guiana', N'غيانا الفرنسية')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (62, N'Gabon', N'الجابون')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (63, N'Gambia', N'غامبيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (64, N'Georgia', N'جورجيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (65, N'Germany', N'ألمانيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (66, N'Ghana', N'غانا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (67, N'Gibraltar', N'جبل طارق')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (68, N'Greece', N'اليونان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (69, N'Grenada', N'غرينادا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (70, N'Guatemala', N'غواتيمالا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (71, N'Guinea', N'غينيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (72, N'Guinea-Bissau', N'غينيا بيساو')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (73, N'Guyana', N'غيانا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (74, N'Haiti', N'هايتي')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (75, N'Holy See', N'الكرسي الرسولي')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (76, N'Honduras', N'هندوراس')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (77, N'Hong Kong', N'هونج كونج')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (78, N'Hungary', N'هنغاريا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (79, N'Iceland', N'أيسلندا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (80, N'India', N'الهند')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (81, N'Indonesia', N'إندونيسيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (82, N'Iran', N'إيران')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (83, N'Iraq', N'العراق')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (84, N'Ireland', N'أيرلندا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (85, N'Isle of Man', N'جزيرة آيل أوف مان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (86, N'Israel', N'إسرائيل')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (87, N'Italy', N'إيطاليا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (88, N'Jamaica', N'جامايكا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (89, N'Japan', N'اليابان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (90, N'Jordan', N'الأردن')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (91, N'Kazakhstan', N'كازاخستان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (92, N'Kenya', N'كينيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (93, N'Kuwait', N'الكويت')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (94, N'Kyrgyzstan', N'قيرغيزستان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (95, N'Laos', N'لاوس')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (96, N'Latvia', N'لاتفيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (97, N'Lebanon', N'لبنان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (98, N'Lesotho', N'ليسوتو')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (99, N'Liberia', N'ليبيريا')
GO
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (100, N'Libya', N'ليبيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (101, N'Liechtenstein', N'ليختنشتاين')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (102, N'Lithuania', N'ليتوانيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (103, N'Luxembourg', N'لوكسمبورغ')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (104, N'Macao', N'ماكاو')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (105, N'Madagascar', N'مدغشقر')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (106, N'Malawi', N'ملاوي')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (107, N'Malaysia', N'ماليزيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (108, N'Maldives', N'جزر المالديف')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (109, N'Mali', N'مالي')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (110, N'Malta', N'مالطا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (111, N'Mauritania', N'موريتانيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (112, N'Mauritius', N'موريشيوس')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (113, N'Mayotte', N'مايوت')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (114, N'Mexico', N'المكسيك')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (115, N'Moldova', N'مولدوفا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (116, N'Monaco', N'موناكو')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (117, N'Mongolia', N'منغوليا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (118, N'Montenegro', N'الجبل الأسود')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (119, N'Morocco', N'المغرب')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (120, N'Mozambique', N'موزمبيق')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (121, N'Myanmar', N'ميانمار')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (122, N'Namibia', N'ناميبيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (123, N'Nepal', N'نيبال')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (124, N'Netherlands', N'هولندا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (125, N'Nicaragua', N'نيكاراغوا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (126, N'Niger', N'النيجر')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (127, N'Nigeria', N'نيجيريا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (128, N'North Korea', N'كوريا الشمالية')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (129, N'North Macedonia', N'مقدونيا الشمالية')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (130, N'Norway', N'النرويج')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (131, N'Oman', N'سلطنة عمان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (132, N'Pakistan', N'باكستان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (133, N'Panama', N'بنما')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (134, N'Paraguay', N'باراغواي')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (135, N'Peru', N'بيرو')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (136, N'Philippines', N'فيلبيني')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (137, N'Poland', N'بولندا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (138, N'Portugal', N'البرتغال')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (139, N'Qatar', N'دولة قطر')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (140, N'Réunion', N'جمع شمل')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (141, N'Romania', N'رومانيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (142, N'Russia', N'روسيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (143, N'Rwanda', N'رواندا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (144, N'Saint Helena', N'سانت هيلانة')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (145, N'Saint Kitts and Nevis', N'سانت كيتس ونيفيس')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (146, N'Saint Lucia', N'القديسة لوسيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (147, N'Saint Vincent and the Grenadines', N'سانت فنسنت وجزر غرينادين')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (148, N'San Marino', N'سان مارينو')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (149, N'Sao Tome & Principe', N'ساو تومي وبرينسيبي')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (150, N'Saudi Arabia', N'المملكة العربية السعودية')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (151, N'Senegal', N'السنغال')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (152, N'Serbia', N'صربيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (153, N'Seychelles', N'سيشيل')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (154, N'Sierra Leone', N'سيرا ليون')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (155, N'Singapore', N'سنغافورة')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (156, N'Slovakia', N'سلوفاكيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (157, N'Slovenia', N'سلوفينيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (158, N'Somalia', N'الصومال')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (159, N'South Africa', N'جنوب أفريقيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (160, N'South Korea', N'كوريا الجنوبية')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (161, N'South Sudan', N'جنوب السودان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (162, N'Spain', N'إسبانيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (163, N'Sri Lanka', N'سيريلانكا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (164, N'State of Palestine', N'دولة فلسطين')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (165, N'Sudan', N'السودان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (166, N'Suriname', N'سورينام')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (167, N'Sweden', N'السويد')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (168, N'Switzerland', N'سويسرا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (169, N'Syria', N'سوريا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (170, N'Taiwan', N'تايوان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (171, N'Tajikistan', N'طاجيكستان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (172, N'Tanzania', N'تنزانيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (173, N'Thailand', N'تايلاند')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (174, N'The Bahamas', N'جزر البهاما')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (175, N'Timor-Leste', N'تيمور ليشتي')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (176, N'Togo', N'توجو')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (177, N'Trinidad and Tobago', N'ترينداد وتوباغو')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (178, N'Tunisia', N'تونس')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (179, N'Turkey', N'ديك رومى')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (180, N'Turkmenistan', N'تركمانستان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (181, N'Uganda', N'أوغندا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (182, N'Ukraine', N'أوكرانيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (183, N'United Arab Emirates', N'الإمارات العربية المتحدة')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (184, N'United Kingdom', N'المملكة المتحدة')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (185, N'United States', N'الولايات المتحدة')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (186, N'Uruguay', N'أوروغواي')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (187, N'Uzbekistan', N'أوزبكستان')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (188, N'Venezuela', N'فنزويلا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (189, N'Vietnam', N'فيتنام')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (190, N'Western Sahara', N'الصحراء الغربية')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (191, N'Yemen', N'اليمن')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (192, N'Zambia', N'زامبيا')
INSERT [dbo].[countriesName] ([CountriesNameID], [NameEn], [NameAr]) VALUES (193, N'Zimbabwe', N'زيمبابوي')
SET IDENTITY_INSERT [dbo].[countriesName] OFF
GO
SET IDENTITY_INSERT [dbo].[departments] ON 

INSERT [dbo].[departments] ([DepartmentID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [ManagementID]) VALUES (1, N'dept1', NULL, NULL, CAST(N'2022-11-25T22:35:10.5338612' AS DateTime2), 1, NULL, 0, 1, N'0959353886', NULL)
INSERT [dbo].[departments] ([DepartmentID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [ManagementID]) VALUES (2, N'fdsgdfg', NULL, CAST(N'2022-11-24T01:16:44.0931654' AS DateTime2), CAST(N'2022-11-24T11:49:10.0690087' AS DateTime2), NULL, 1, 0, 1, N'454645', NULL)
INSERT [dbo].[departments] ([DepartmentID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [ManagementID]) VALUES (3, N'sdsd', NULL, CAST(N'2022-11-24T12:26:58.8624780' AS DateTime2), CAST(N'2022-11-25T22:35:26.7876574' AS DateTime2), NULL, NULL, 0, 1, N'sdsaf', NULL)
INSERT [dbo].[departments] ([DepartmentID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [ManagementID]) VALUES (4, N'dept2', NULL, CAST(N'2022-11-24T12:39:43.0300123' AS DateTime2), CAST(N'2022-11-25T22:35:43.7029214' AS DateTime2), NULL, NULL, 0, 1, N'4546546', NULL)
INSERT [dbo].[departments] ([DepartmentID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [ManagementID]) VALUES (5, N'dfdsf', NULL, CAST(N'2022-11-24T12:41:10.8446074' AS DateTime2), CAST(N'2022-11-25T22:35:47.8736577' AS DateTime2), NULL, NULL, 0, 1, N'454654', NULL)
INSERT [dbo].[departments] ([DepartmentID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [ManagementID]) VALUES (6, N'retert', NULL, CAST(N'2022-11-24T12:41:47.0473805' AS DateTime2), CAST(N'2022-11-25T22:35:52.9251188' AS DateTime2), NULL, NULL, 0, 1, N'4546', NULL)
INSERT [dbo].[departments] ([DepartmentID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [ManagementID]) VALUES (7, N'قسم المحاسبة', NULL, CAST(N'2022-11-24T12:59:08.3135160' AS DateTime2), CAST(N'2022-11-28T00:40:43.2377676' AS DateTime2), NULL, NULL, 1, 1, N'565454', 1)
INSERT [dbo].[departments] ([DepartmentID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [ManagementID]) VALUES (8, N'قسم 2', NULL, CAST(N'2022-11-24T13:07:22.1924895' AS DateTime2), CAST(N'2022-11-28T00:40:48.3066244' AS DateTime2), NULL, NULL, 1, 2, N'333333', 3)
INSERT [dbo].[departments] ([DepartmentID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [ManagementID]) VALUES (9, N'الفنية', NULL, CAST(N'2022-11-24T15:10:19.8659902' AS DateTime2), CAST(N'2022-11-28T00:40:51.5449271' AS DateTime2), NULL, NULL, 1, 1, N'ddd', 3)
INSERT [dbo].[departments] ([DepartmentID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [ManagementID]) VALUES (10, N'', NULL, CAST(N'2022-11-24T17:23:51.4255527' AS DateTime2), CAST(N'2022-11-24T22:34:57.2767565' AS DateTime2), NULL, NULL, 0, 1, N'', NULL)
INSERT [dbo].[departments] ([DepartmentID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [ManagementID]) VALUES (11, N'المستودع', NULL, CAST(N'2022-11-24T17:30:31.3651333' AS DateTime2), CAST(N'2022-11-28T00:40:55.5130756' AS DateTime2), NULL, NULL, 1, 1, N'0598658', 1)
INSERT [dbo].[departments] ([DepartmentID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [ManagementID]) VALUES (12, N'', NULL, CAST(N'2022-11-24T17:43:54.9439140' AS DateTime2), CAST(N'2022-11-24T22:43:58.5955444' AS DateTime2), NULL, 1, 0, 1, N'', NULL)
INSERT [dbo].[departments] ([DepartmentID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [ManagementID]) VALUES (13, N'سسس', NULL, CAST(N'2022-11-25T22:36:20.8292638' AS DateTime2), CAST(N'2022-11-25T22:36:25.7249208' AS DateTime2), NULL, NULL, 0, 2, N'سسسس', NULL)
SET IDENTITY_INSERT [dbo].[departments] OFF
GO
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([EmployeeID], [Username], [Password], [DepartmentID], [VacationsBalance], [WarningPeriod], [NameAr], [NameEn], [DOB], [Gender], [MaritalStatus], [Nationality], [Religion], [BloodType], [Image], [IdentityType], [IdentityNumber], [IdentityReleaseDate], [IdentityExpiryDate], [PassportNumber], [PassportReleaseDate], [PassportExpiryDate], [PassportCountry], [Phone], [Mobile], [Email], [Address], [NoConviction], [BankAccount], [BankName], [IBANNumber], [SWIFTCODE], [PaymentType], [EducationCertificate1], [EducationCertificateFromDate1], [EducationCertificateToDate1], [EducationCertificateSource1], [EducationCertificate2], [EducationCertificateFromDate2], [EducationCertificateToDate2], [EducationCertificateSource2], [EducationCertificate3], [EducationCertificateFromDate3], [EducationCertificateToDate3], [EducationCertificateSource3], [WorkExperience1], [WorkExperience2], [WorkExperience3], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [BasicSalary], [TransportationCompensationType], [HousingCompensationType], [HiringDate], [Sequence], [UnifiedNumber], [ResidenceDate], [JobID], [WorkHours], [JobDescription], [Guarantor]) VALUES (1, N'admin', N'admin', NULL, NULL, NULL, N'dina', N'nemah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-10-11T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employees] ([EmployeeID], [Username], [Password], [DepartmentID], [VacationsBalance], [WarningPeriod], [NameAr], [NameEn], [DOB], [Gender], [MaritalStatus], [Nationality], [Religion], [BloodType], [Image], [IdentityType], [IdentityNumber], [IdentityReleaseDate], [IdentityExpiryDate], [PassportNumber], [PassportReleaseDate], [PassportExpiryDate], [PassportCountry], [Phone], [Mobile], [Email], [Address], [NoConviction], [BankAccount], [BankName], [IBANNumber], [SWIFTCODE], [PaymentType], [EducationCertificate1], [EducationCertificateFromDate1], [EducationCertificateToDate1], [EducationCertificateSource1], [EducationCertificate2], [EducationCertificateFromDate2], [EducationCertificateToDate2], [EducationCertificateSource2], [EducationCertificate3], [EducationCertificateFromDate3], [EducationCertificateToDate3], [EducationCertificateSource3], [WorkExperience1], [WorkExperience2], [WorkExperience3], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [BasicSalary], [TransportationCompensationType], [HousingCompensationType], [HiringDate], [Sequence], [UnifiedNumber], [ResidenceDate], [JobID], [WorkHours], [JobDescription], [Guarantor]) VALUES (2, N'admin1', N'admin', NULL, NULL, NULL, N'admin', N'aminEr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-10-11T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employees] ([EmployeeID], [Username], [Password], [DepartmentID], [VacationsBalance], [WarningPeriod], [NameAr], [NameEn], [DOB], [Gender], [MaritalStatus], [Nationality], [Religion], [BloodType], [Image], [IdentityType], [IdentityNumber], [IdentityReleaseDate], [IdentityExpiryDate], [PassportNumber], [PassportReleaseDate], [PassportExpiryDate], [PassportCountry], [Phone], [Mobile], [Email], [Address], [NoConviction], [BankAccount], [BankName], [IBANNumber], [SWIFTCODE], [PaymentType], [EducationCertificate1], [EducationCertificateFromDate1], [EducationCertificateToDate1], [EducationCertificateSource1], [EducationCertificate2], [EducationCertificateFromDate2], [EducationCertificateToDate2], [EducationCertificateSource2], [EducationCertificate3], [EducationCertificateFromDate3], [EducationCertificateToDate3], [EducationCertificateSource3], [WorkExperience1], [WorkExperience2], [WorkExperience3], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [BasicSalary], [TransportationCompensationType], [HousingCompensationType], [HiringDate], [Sequence], [UnifiedNumber], [ResidenceDate], [JobID], [WorkHours], [JobDescription], [Guarantor]) VALUES (3, NULL, NULL, 7, 20, NULL, N'الحسناوي', N'alhasnawi', CAST(N'1980-11-01T00:00:00.0000000' AS DateTime2), N'female', N'أعزب', 1, NULL, N'O+', NULL, NULL, N'14587596224', NULL, NULL, N'58585858', CAST(N'2000-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2000-11-01T00:00:00.0000000' AS DateTime2), NULL, NULL, N'0256987452', N'dinahnemah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'managment', CAST(N'2000-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2000-11-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'بليبل', N'', N'', NULL, CAST(N'2022-11-29T23:05:42.3152058' AS DateTime2), CAST(N'2022-11-29T23:05:42.3152058' AS DateTime2), NULL, NULL, NULL, CAST(2000.000 AS Decimal(20, 3)), NULL, NULL, NULL, N'111111111111111', N'22222222222222', NULL, 2, 8, N'', N'dina')
SET IDENTITY_INSERT [dbo].[employees] OFF
GO
SET IDENTITY_INSERT [dbo].[jobs] ON 

INSERT [dbo].[jobs] ([JobID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive]) VALUES (1, N'مندوب', NULL, CAST(N'2022-11-26T03:52:51.1228485' AS DateTime2), CAST(N'2022-11-26T03:52:51.1228485' AS DateTime2), 1, 1, 1)
INSERT [dbo].[jobs] ([JobID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive]) VALUES (2, N'كاشير', NULL, CAST(N'2022-11-26T03:53:01.0712657' AS DateTime2), CAST(N'2022-11-26T03:53:14.4767642' AS DateTime2), 1, 1, 1)
INSERT [dbo].[jobs] ([JobID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive]) VALUES (3, N'ييي', NULL, CAST(N'2022-11-26T03:53:17.7212877' AS DateTime2), CAST(N'2022-11-26T03:53:26.4853509' AS DateTime2), 1, 1, 0)
INSERT [dbo].[jobs] ([JobID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive]) VALUES (4, N'ييي', NULL, CAST(N'2022-11-26T03:53:21.2078093' AS DateTime2), CAST(N'2022-11-26T03:53:23.1168615' AS DateTime2), 1, 1, 0)
SET IDENTITY_INSERT [dbo].[jobs] OFF
GO
SET IDENTITY_INSERT [dbo].[managements] ON 

INSERT [dbo].[managements] ([ManagementID], [BranchID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile]) VALUES (1, NULL, N'دائرة 2', NULL, CAST(N'2022-11-25T21:09:44.3666496' AS DateTime2), CAST(N'2022-11-25T21:09:58.2590008' AS DateTime2), 1, 1, 1, 1, N'92222')
INSERT [dbo].[managements] ([ManagementID], [BranchID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile]) VALUES (2, NULL, N'', NULL, CAST(N'2022-11-25T21:37:52.3940024' AS DateTime2), CAST(N'2022-11-25T21:38:00.4995555' AS DateTime2), NULL, NULL, 0, 1, N'')
INSERT [dbo].[managements] ([ManagementID], [BranchID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile]) VALUES (3, NULL, N'dsdasd', NULL, CAST(N'2022-11-25T21:37:58.2281630' AS DateTime2), CAST(N'2022-11-25T21:38:05.8609605' AS DateTime2), NULL, NULL, 1, 2, N'asdasd')
SET IDENTITY_INSERT [dbo].[managements] OFF
GO
SET IDENTITY_INSERT [dbo].[vacations] ON 

INSERT [dbo].[vacations] ([VacationID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive]) VALUES (1, N'ييييبسي', NULL, CAST(N'2022-11-27T01:30:39.6761828' AS DateTime2), CAST(N'2022-11-27T01:30:50.7276702' AS DateTime2), 1, 1, 0)
INSERT [dbo].[vacations] ([VacationID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive]) VALUES (2, N'سسس', NULL, CAST(N'2022-11-27T01:33:36.0413418' AS DateTime2), CAST(N'2022-11-27T01:33:36.0413418' AS DateTime2), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[vacations] OFF
GO
ALTER TABLE [dbo].[branches]  WITH CHECK ADD  CONSTRAINT [FK_branches_companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[companies] ([CompanyID])
GO
ALTER TABLE [dbo].[branches] CHECK CONSTRAINT [FK_branches_companies]
GO
ALTER TABLE [dbo].[confirms]  WITH CHECK ADD  CONSTRAINT [FK_confirms_departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[confirms] CHECK CONSTRAINT [FK_confirms_departments]
GO
ALTER TABLE [dbo].[confirms]  WITH CHECK ADD  CONSTRAINT [FK_confirms_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[confirms] CHECK CONSTRAINT [FK_confirms_employees]
GO
ALTER TABLE [dbo].[confirms]  WITH CHECK ADD  CONSTRAINT [FK_confirms_hourlyPermissions] FOREIGN KEY([HourlyPermissionID])
REFERENCES [dbo].[hourlyPermissions] ([HourlyPermissionID])
GO
ALTER TABLE [dbo].[confirms] CHECK CONSTRAINT [FK_confirms_hourlyPermissions]
GO
ALTER TABLE [dbo].[confirms]  WITH CHECK ADD  CONSTRAINT [FK_confirms_jobs] FOREIGN KEY([JobID])
REFERENCES [dbo].[jobs] ([JobID])
GO
ALTER TABLE [dbo].[confirms] CHECK CONSTRAINT [FK_confirms_jobs]
GO
ALTER TABLE [dbo].[confirms]  WITH CHECK ADD  CONSTRAINT [FK_confirms_messagesTemplates] FOREIGN KEY([MessagesTemplateID])
REFERENCES [dbo].[messagesTemplates] ([MessagesTemplateID])
GO
ALTER TABLE [dbo].[confirms] CHECK CONSTRAINT [FK_confirms_messagesTemplates]
GO
ALTER TABLE [dbo].[confirms]  WITH CHECK ADD  CONSTRAINT [FK_confirms_salaryIncrease] FOREIGN KEY([SalaryIncreaseID])
REFERENCES [dbo].[salaryIncrease] ([SalaryIncreaseID])
GO
ALTER TABLE [dbo].[confirms] CHECK CONSTRAINT [FK_confirms_salaryIncrease]
GO
ALTER TABLE [dbo].[confirms]  WITH CHECK ADD  CONSTRAINT [FK_confirms_tasks] FOREIGN KEY([TaskID])
REFERENCES [dbo].[tasks] ([TaskID])
GO
ALTER TABLE [dbo].[confirms] CHECK CONSTRAINT [FK_confirms_tasks]
GO
ALTER TABLE [dbo].[custodies]  WITH CHECK ADD  CONSTRAINT [FK_custodies_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[custodies] CHECK CONSTRAINT [FK_custodies_employees]
GO
ALTER TABLE [dbo].[departments]  WITH CHECK ADD  CONSTRAINT [FK_departments_managements] FOREIGN KEY([ManagementID])
REFERENCES [dbo].[managements] ([ManagementID])
GO
ALTER TABLE [dbo].[departments] CHECK CONSTRAINT [FK_departments_managements]
GO
ALTER TABLE [dbo].[EemployeesEvents]  WITH CHECK ADD  CONSTRAINT [FK_EemployeesEvents_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[EemployeesEvents] CHECK CONSTRAINT [FK_EemployeesEvents_employees]
GO
ALTER TABLE [dbo].[EemployeesEvents]  WITH CHECK ADD  CONSTRAINT [FK_EemployeesEvents_events] FOREIGN KEY([EventID])
REFERENCES [dbo].[events] ([EventID])
GO
ALTER TABLE [dbo].[EemployeesEvents] CHECK CONSTRAINT [FK_EemployeesEvents_events]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [FK_employees_countriesName] FOREIGN KEY([Nationality])
REFERENCES [dbo].[countriesName] ([CountriesNameID])
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [FK_employees_countriesName]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [FK_employees_departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [FK_employees_departments]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [FK_employees_jobs] FOREIGN KEY([JobID])
REFERENCES [dbo].[jobs] ([JobID])
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [FK_employees_jobs]
GO
ALTER TABLE [dbo].[employeesScheduleVacations]  WITH CHECK ADD  CONSTRAINT [FK_employeesScheduleVacations_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[employeesScheduleVacations] CHECK CONSTRAINT [FK_employeesScheduleVacations_employees]
GO
ALTER TABLE [dbo].[employeesScheduleVacations]  WITH CHECK ADD  CONSTRAINT [FK_employeesScheduleVacations_scheduleVacations] FOREIGN KEY([ScheduleVacationID])
REFERENCES [dbo].[scheduleVacations] ([ScheduleVacationID])
GO
ALTER TABLE [dbo].[employeesScheduleVacations] CHECK CONSTRAINT [FK_employeesScheduleVacations_scheduleVacations]
GO
ALTER TABLE [dbo].[employeesTasks]  WITH CHECK ADD  CONSTRAINT [FK_employeesTasks_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[employeesTasks] CHECK CONSTRAINT [FK_employeesTasks_employees]
GO
ALTER TABLE [dbo].[employeesTasks]  WITH CHECK ADD  CONSTRAINT [FK_employeesTasks_tasks] FOREIGN KEY([TaskID])
REFERENCES [dbo].[tasks] ([TaskID])
GO
ALTER TABLE [dbo].[employeesTasks] CHECK CONSTRAINT [FK_employeesTasks_tasks]
GO
ALTER TABLE [dbo].[employeesTrainings]  WITH CHECK ADD  CONSTRAINT [FK_employeesTrainings_employees1] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[employeesTrainings] CHECK CONSTRAINT [FK_employeesTrainings_employees1]
GO
ALTER TABLE [dbo].[employeesTrainings]  WITH CHECK ADD  CONSTRAINT [FK_employeesTrainings_trainings1] FOREIGN KEY([TrainingID])
REFERENCES [dbo].[trainings] ([TrainingID])
GO
ALTER TABLE [dbo].[employeesTrainings] CHECK CONSTRAINT [FK_employeesTrainings_trainings1]
GO
ALTER TABLE [dbo].[employeesVacations]  WITH CHECK ADD  CONSTRAINT [FK_employeesVacations_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[employeesVacations] CHECK CONSTRAINT [FK_employeesVacations_employees]
GO
ALTER TABLE [dbo].[employeesVacations]  WITH CHECK ADD  CONSTRAINT [FK_employeesVacations_vacations] FOREIGN KEY([VacationID])
REFERENCES [dbo].[vacations] ([VacationID])
GO
ALTER TABLE [dbo].[employeesVacations] CHECK CONSTRAINT [FK_employeesVacations_vacations]
GO
ALTER TABLE [dbo].[hourlyPermissions]  WITH CHECK ADD  CONSTRAINT [FK_hourlyPermissions_employees] FOREIGN KEY([employeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[hourlyPermissions] CHECK CONSTRAINT [FK_hourlyPermissions_employees]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_employees]
GO
ALTER TABLE [dbo].[managements]  WITH CHECK ADD  CONSTRAINT [FK_managements_branches] FOREIGN KEY([BranchID])
REFERENCES [dbo].[branches] ([BranchID])
GO
ALTER TABLE [dbo].[managements] CHECK CONSTRAINT [FK_managements_branches]
GO
ALTER TABLE [dbo].[materialsConsumption]  WITH CHECK ADD  CONSTRAINT [FK_materialsConsumption_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[materialsConsumption] CHECK CONSTRAINT [FK_materialsConsumption_employees]
GO
ALTER TABLE [dbo].[messages]  WITH CHECK ADD  CONSTRAINT [FK_messages_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[messages] CHECK CONSTRAINT [FK_messages_employees]
GO
ALTER TABLE [dbo].[periods]  WITH CHECK ADD  CONSTRAINT [FK_periods_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[periods] CHECK CONSTRAINT [FK_periods_employees]
GO
ALTER TABLE [dbo].[rewards]  WITH CHECK ADD  CONSTRAINT [FK_rewards_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[rewards] CHECK CONSTRAINT [FK_rewards_employees]
GO
