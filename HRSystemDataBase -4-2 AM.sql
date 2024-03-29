USE [HRSystem]
GO
ALTER TABLE [dbo].[usersPermissions] DROP CONSTRAINT [FK_usersPermissions_employees]
GO
ALTER TABLE [dbo].[usersPermissions] DROP CONSTRAINT [FK_usersPermissions_appObjects]
GO
ALTER TABLE [dbo].[usersMessages] DROP CONSTRAINT [FK_usersMessages_employees]
GO
ALTER TABLE [dbo].[tasks] DROP CONSTRAINT [FK_tasks_employees1]
GO
ALTER TABLE [dbo].[tasks] DROP CONSTRAINT [FK_tasks_employees]
GO
ALTER TABLE [dbo].[rewards] DROP CONSTRAINT [FK_rewards_employees]
GO
ALTER TABLE [dbo].[Resignation] DROP CONSTRAINT [FK_Resignation_employees1]
GO
ALTER TABLE [dbo].[Resignation] DROP CONSTRAINT [FK_Resignation_employees]
GO
ALTER TABLE [dbo].[periods] DROP CONSTRAINT [FK_periods_employees]
GO
ALTER TABLE [dbo].[MessageReply] DROP CONSTRAINT [FK_MessageReply_usersMessages]
GO
ALTER TABLE [dbo].[materialsConsumption] DROP CONSTRAINT [FK_materialsConsumption_employees]
GO
ALTER TABLE [dbo].[managements] DROP CONSTRAINT [FK_managements_branches]
GO
ALTER TABLE [dbo].[Images] DROP CONSTRAINT [FK_Images_events]
GO
ALTER TABLE [dbo].[Images] DROP CONSTRAINT [FK_Images_employees]
GO
ALTER TABLE [dbo].[Images] DROP CONSTRAINT [FK_Images_custodies]
GO
ALTER TABLE [dbo].[Images] DROP CONSTRAINT [FK_Images_charitys]
GO
ALTER TABLE [dbo].[hourlyPermissions] DROP CONSTRAINT [FK_hourlyPermissions_employees]
GO
ALTER TABLE [dbo].[highrManagment] DROP CONSTRAINT [FK_highrManagment_employees]
GO
ALTER TABLE [dbo].[events] DROP CONSTRAINT [FK_events_employees2]
GO
ALTER TABLE [dbo].[events] DROP CONSTRAINT [FK_events_employees1]
GO
ALTER TABLE [dbo].[events] DROP CONSTRAINT [FK_events_employees]
GO
ALTER TABLE [dbo].[evaluations] DROP CONSTRAINT [FK_evaluations_employees1]
GO
ALTER TABLE [dbo].[evaluations] DROP CONSTRAINT [FK_evaluations_employees]
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
ALTER TABLE [dbo].[employees] DROP CONSTRAINT [FK_employees_managements]
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
ALTER TABLE [dbo].[DocumentCategories] DROP CONSTRAINT [FK_DocumentCategories_employees1]
GO
ALTER TABLE [dbo].[DocumentCategories] DROP CONSTRAINT [FK_DocumentCategories_employees]
GO
ALTER TABLE [dbo].[DocumentCategories] DROP CONSTRAINT [FK_DocumentCategories_DocumentCategories]
GO
ALTER TABLE [dbo].[departments] DROP CONSTRAINT [FK_departments_managements]
GO
ALTER TABLE [dbo].[dailyTasks] DROP CONSTRAINT [FK_dailyTasks_tasks]
GO
ALTER TABLE [dbo].[dailyTasks] DROP CONSTRAINT [FK_dailyTasks_employees]
GO
ALTER TABLE [dbo].[custodies] DROP CONSTRAINT [FK_custodies_employees]
GO
ALTER TABLE [dbo].[confirms] DROP CONSTRAINT [FK_confirms_tasks]
GO
ALTER TABLE [dbo].[confirms] DROP CONSTRAINT [FK_confirms_salaryIncreases]
GO
ALTER TABLE [dbo].[confirms] DROP CONSTRAINT [FK_confirms_messagesTemplates]
GO
ALTER TABLE [dbo].[confirms] DROP CONSTRAINT [FK_confirms_jobs]
GO
ALTER TABLE [dbo].[confirms] DROP CONSTRAINT [FK_confirms_hourlyPermissions]
GO
ALTER TABLE [dbo].[confirms] DROP CONSTRAINT [FK_confirms_events]
GO
ALTER TABLE [dbo].[confirms] DROP CONSTRAINT [FK_confirms_employees]
GO
ALTER TABLE [dbo].[confirms] DROP CONSTRAINT [FK_confirms_departments]
GO
ALTER TABLE [dbo].[charitys] DROP CONSTRAINT [FK_charitys_employees]
GO
ALTER TABLE [dbo].[branches] DROP CONSTRAINT [FK_branches_companies]
GO
/****** Object:  Table [dbo].[vacations]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vacations]') AND type in (N'U'))
DROP TABLE [dbo].[vacations]
GO
/****** Object:  Table [dbo].[usersPermissions]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usersPermissions]') AND type in (N'U'))
DROP TABLE [dbo].[usersPermissions]
GO
/****** Object:  Table [dbo].[usersMessages]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usersMessages]') AND type in (N'U'))
DROP TABLE [dbo].[usersMessages]
GO
/****** Object:  Table [dbo].[trainings]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[trainings]') AND type in (N'U'))
DROP TABLE [dbo].[trainings]
GO
/****** Object:  Table [dbo].[tasks]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tasks]') AND type in (N'U'))
DROP TABLE [dbo].[tasks]
GO
/****** Object:  Table [dbo].[statuses]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[statuses]') AND type in (N'U'))
DROP TABLE [dbo].[statuses]
GO
/****** Object:  Table [dbo].[scheduleVacations]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[scheduleVacations]') AND type in (N'U'))
DROP TABLE [dbo].[scheduleVacations]
GO
/****** Object:  Table [dbo].[scheduledJobs]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[scheduledJobs]') AND type in (N'U'))
DROP TABLE [dbo].[scheduledJobs]
GO
/****** Object:  Table [dbo].[salaryIncreases]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[salaryIncreases]') AND type in (N'U'))
DROP TABLE [dbo].[salaryIncreases]
GO
/****** Object:  Table [dbo].[rewards]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rewards]') AND type in (N'U'))
DROP TABLE [dbo].[rewards]
GO
/****** Object:  Table [dbo].[Resignation]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resignation]') AND type in (N'U'))
DROP TABLE [dbo].[Resignation]
GO
/****** Object:  Table [dbo].[periods]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[periods]') AND type in (N'U'))
DROP TABLE [dbo].[periods]
GO
/****** Object:  Table [dbo].[messagesTemplates]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[messagesTemplates]') AND type in (N'U'))
DROP TABLE [dbo].[messagesTemplates]
GO
/****** Object:  Table [dbo].[MessageReply]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MessageReply]') AND type in (N'U'))
DROP TABLE [dbo].[MessageReply]
GO
/****** Object:  Table [dbo].[materialsConsumption]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[materialsConsumption]') AND type in (N'U'))
DROP TABLE [dbo].[materialsConsumption]
GO
/****** Object:  Table [dbo].[managements]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[managements]') AND type in (N'U'))
DROP TABLE [dbo].[managements]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jobs]') AND type in (N'U'))
DROP TABLE [dbo].[jobs]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Images]') AND type in (N'U'))
DROP TABLE [dbo].[Images]
GO
/****** Object:  Table [dbo].[hourlyPermissions]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hourlyPermissions]') AND type in (N'U'))
DROP TABLE [dbo].[hourlyPermissions]
GO
/****** Object:  Table [dbo].[highrManagment]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[highrManagment]') AND type in (N'U'))
DROP TABLE [dbo].[highrManagment]
GO
/****** Object:  Table [dbo].[events]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[events]') AND type in (N'U'))
DROP TABLE [dbo].[events]
GO
/****** Object:  Table [dbo].[evaluations]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[evaluations]') AND type in (N'U'))
DROP TABLE [dbo].[evaluations]
GO
/****** Object:  Table [dbo].[employeesVacations]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[employeesVacations]') AND type in (N'U'))
DROP TABLE [dbo].[employeesVacations]
GO
/****** Object:  Table [dbo].[employeesTrainings]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[employeesTrainings]') AND type in (N'U'))
DROP TABLE [dbo].[employeesTrainings]
GO
/****** Object:  Table [dbo].[employeesTasks]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[employeesTasks]') AND type in (N'U'))
DROP TABLE [dbo].[employeesTasks]
GO
/****** Object:  Table [dbo].[employeesScheduleVacations]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[employeesScheduleVacations]') AND type in (N'U'))
DROP TABLE [dbo].[employeesScheduleVacations]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[employees]') AND type in (N'U'))
DROP TABLE [dbo].[employees]
GO
/****** Object:  Table [dbo].[EemployeesEvents]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EemployeesEvents]') AND type in (N'U'))
DROP TABLE [dbo].[EemployeesEvents]
GO
/****** Object:  Table [dbo].[DocumentCategories]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocumentCategories]') AND type in (N'U'))
DROP TABLE [dbo].[DocumentCategories]
GO
/****** Object:  Table [dbo].[Devices]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Devices]') AND type in (N'U'))
DROP TABLE [dbo].[Devices]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[departments]') AND type in (N'U'))
DROP TABLE [dbo].[departments]
GO
/****** Object:  Table [dbo].[dailyTasks]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dailyTasks]') AND type in (N'U'))
DROP TABLE [dbo].[dailyTasks]
GO
/****** Object:  Table [dbo].[custodies]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[custodies]') AND type in (N'U'))
DROP TABLE [dbo].[custodies]
GO
/****** Object:  Table [dbo].[countriesName]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[countriesName]') AND type in (N'U'))
DROP TABLE [dbo].[countriesName]
GO
/****** Object:  Table [dbo].[confirms]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[confirms]') AND type in (N'U'))
DROP TABLE [dbo].[confirms]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[companies]') AND type in (N'U'))
DROP TABLE [dbo].[companies]
GO
/****** Object:  Table [dbo].[charitys]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[charitys]') AND type in (N'U'))
DROP TABLE [dbo].[charitys]
GO
/****** Object:  Table [dbo].[branches]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[branches]') AND type in (N'U'))
DROP TABLE [dbo].[branches]
GO
/****** Object:  Table [dbo].[appObjects]    Script Date: 2/4/2023 9:37:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[appObjects]') AND type in (N'U'))
DROP TABLE [dbo].[appObjects]
GO
/****** Object:  Table [dbo].[appObjects]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appObjects](
	[AppObjectID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[NameEn] [nvarchar](100) NULL,
	[NameAr] [nvarchar](100) NULL,
 CONSTRAINT [PK_appObjects] PRIMARY KEY CLUSTERED 
(
	[AppObjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[branches]    Script Date: 2/4/2023 9:37:03 PM ******/
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
/****** Object:  Table [dbo].[charitys]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[charitys](
	[CharityID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NULL,
	[Reason] [nvarchar](100) NULL,
	[Amount] [decimal](20, 3) NULL,
	[Details] [ntext] NULL,
	[CharityDate] [datetime2](7) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_charitys] PRIMARY KEY CLUSTERED 
(
	[CharityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 2/4/2023 9:37:03 PM ******/
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
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
	[GeneralDirector] [bigint] NULL,
	[FinancialManager] [bigint] NULL,
	[HRManager] [bigint] NULL,
	[CEO] [bigint] NULL,
	[LegalManager] [bigint] NULL,
	[CompanyListAr] [ntext] NULL,
	[CompanyListEn] [ntext] NULL,
 CONSTRAINT [PK_companies] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[confirms]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[confirms](
	[ConfirmID] [bigint] IDENTITY(1,1) NOT NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
	[TaskID] [bigint] NULL,
	[SalaryIncreaseID] [int] NULL,
	[MessagesTemplateID] [bigint] NULL,
	[HourlyPermissionID] [bigint] NULL,
	[JobID] [int] NULL,
	[DepartmentID] [int] NULL,
	[ConfirmType] [nvarchar](100) NULL,
	[EmployeeID] [bigint] NULL,
	[Role] [nvarchar](50) NULL,
	[EventID] [bigint] NULL,
 CONSTRAINT [PK_confirms] PRIMARY KEY CLUSTERED 
(
	[ConfirmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[countriesName]    Script Date: 2/4/2023 9:37:03 PM ******/
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
/****** Object:  Table [dbo].[custodies]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[custodies](
	[CustodieID] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](100) NULL,
	[Details] [ntext] NULL,
	[Value] [nvarchar](100) NULL,
	[EmployeeID] [bigint] NULL,
	[IsRecovery] [bit] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_custodies] PRIMARY KEY CLUSTERED 
(
	[CustodieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dailyTasks]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dailyTasks](
	[DailyTaskID] [bigint] IDENTITY(1,1) NOT NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
	[EmployeeID] [bigint] NULL,
	[TaskID] [bigint] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_dailyTasks] PRIMARY KEY CLUSTERED 
(
	[DailyTaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 2/4/2023 9:37:03 PM ******/
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
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
	[ManagerID] [bigint] NULL,
	[Mobile] [nvarchar](100) NULL,
	[ManagementID] [bigint] NULL,
 CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devices]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Port] [int] NULL,
	[DeviceNumber] [int] NULL,
	[IsActive] [bit] NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[Notes] [ntext] NULL,
 CONSTRAINT [PK_Devices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentCategories]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentCategories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryCode] [nvarchar](100) NULL,
	[NameAR] [nvarchar](100) NULL,
	[NameEN] [nvarchar](100) NULL,
	[Details] [ntext] NULL,
	[IsActive] [bit] NULL,
	[ParentID] [int] NULL,
	[IsFixed] [bit] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
 CONSTRAINT [PK_DocumentCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EemployeesEvents]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EemployeesEvents](
	[EmployeesEventsID] [bigint] IDENTITY(1,1) NOT NULL,
	[EventID] [bigint] NULL,
	[EmployeeID] [bigint] NOT NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_EemployeesEvents] PRIMARY KEY CLUSTERED 
(
	[EmployeesEventsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[EmployeeID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[DepartmentID] [int] NULL,
	[VacationsBalance] [int] NOT NULL,
	[WarningPeriod] [bit] NULL,
	[NameAr] [nvarchar](100) NULL,
	[NameEn] [nvarchar](100) NULL,
	[DOB] [datetime2](7) NULL,
	[Gender] [nvarchar](100) NULL,
	[MaritalStatus] [nvarchar](100) NULL,
	[Nationality] [int] NULL,
	[Religion] [nvarchar](100) NULL,
	[BloodType] [nvarchar](100) NULL,
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
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
	[BasicSalary] [decimal](20, 3) NOT NULL,
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
	[ManagementID] [bigint] NULL,
	[IDNumber] [nvarchar](100) NULL,
	[WorkPermit] [nvarchar](250) NULL,
	[WorkContract] [nvarchar](250) NULL,
	[IsBarcodeUser] [bit] NULL,
	[Image] [varbinary](max) NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employeesScheduleVacations]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employeesScheduleVacations](
	[EmployeesScheduleVacationsID] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleVacationID] [bigint] NULL,
	[EmployeeID] [bigint] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_employeesScheduleVacations] PRIMARY KEY CLUSTERED 
(
	[EmployeesScheduleVacationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employeesTasks]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employeesTasks](
	[EmployeesTaskID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NULL,
	[TaskID] [bigint] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
	[BossDone] [bit] NULL,
 CONSTRAINT [PK_employeesTasks] PRIMARY KEY CLUSTERED 
(
	[EmployeesTaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employeesTrainings]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employeesTrainings](
	[EmployeesTrainingsID] [bigint] IDENTITY(1,1) NOT NULL,
	[TrainingID] [bigint] NULL,
	[EmployeeID] [bigint] NOT NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_employeesTrainings] PRIMARY KEY CLUSTERED 
(
	[EmployeesTrainingsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employeesVacations]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employeesVacations](
	[EmployeesVacationID] [bigint] IDENTITY(1,1) NOT NULL,
	[VacationID] [bigint] NULL,
	[EmployeeID] [bigint] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
	[FromDate] [datetime2](7) NULL,
	[ToDate] [datetime2](7) NULL,
	[Approved] [bit] NULL,
 CONSTRAINT [PK_employeesVacations] PRIMARY KEY CLUSTERED 
(
	[EmployeesVacationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluations]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluations](
	[EvaluationID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NULL,
	[ReviewerID] [bigint] NULL,
	[EvaluationDate] [datetime2](7) NULL,
	[Behavior] [nvarchar](100) NULL,
	[Attendance] [nvarchar](100) NULL,
	[Punctuality] [nvarchar](100) NULL,
	[Productivity] [nvarchar](100) NULL,
	[Creativity] [nvarchar](100) NULL,
	[ClientRelation] [nvarchar](100) NULL,
	[Initiative] [nvarchar](100) NULL,
	[Communication] [nvarchar](100) NULL,
	[Cooperation] [nvarchar](100) NULL,
	[StrategicThinking] [nvarchar](100) NULL,
	[HandleStressful] [nvarchar](100) NULL,
	[ListeningSkills] [nvarchar](100) NULL,
	[MeetingDeadlines] [nvarchar](100) NULL,
	[Performance] [nvarchar](100) NULL,
	[JobKnowledge] [nvarchar](100) NULL,
	[OrganizeIdea] [nvarchar](100) NULL,
	[RespondResourcefully] [nvarchar](100) NULL,
	[ConfrontsProblems] [nvarchar](100) NULL,
	[CustomerNeeds] [nvarchar](100) NULL,
	[OrganizationVision] [nvarchar](100) NULL,
	[StayFocused] [nvarchar](100) NULL,
	[OverAllProgress] [nvarchar](100) NULL,
	[Comment] [ntext] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_evaluations] PRIMARY KEY CLUSTERED 
(
	[EvaluationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[events]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[events](
	[EventID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [ntext] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[EventDate] [datetime2](7) NULL,
	[EmployeeID] [bigint] NULL,
	[BranchManagerID] [bigint] NULL,
	[ManagementManagerID] [bigint] NULL,
	[Approved] [bit] NULL,
 CONSTRAINT [PK_events] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[highrManagment]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[highrManagment](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NULL,
	[Role] [nvarchar](100) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_highrManagment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hourlyPermissions]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hourlyPermissions](
	[HourlyPermissionID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [ntext] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
	[EmployeeID] [bigint] NULL,
	[Date] [datetime2](7) NULL,
 CONSTRAINT [PK_hourlyPermissions] PRIMARY KEY CLUSTERED 
(
	[HourlyPermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 2/4/2023 9:37:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ImageId] [bigint] IDENTITY(1,1) NOT NULL,
	[docName] [ntext] NULL,
	[docnum] [nvarchar](200) NULL,
	[image] [ntext] NULL,
	[EmployeeID] [bigint] NULL,
	[MessageID] [bigint] NULL,
	[EventID] [bigint] NULL,
	[TaskID] [bigint] NULL,
	[CharityID] [bigint] NULL,
	[CustodieID] [bigint] NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 2/4/2023 9:37:03 PM ******/
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
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_jobs] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[managements]    Script Date: 2/4/2023 9:37:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[managements](
	[ManagementID] [bigint] IDENTITY(1,1) NOT NULL,
	[BranchID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
	[ManagerID] [bigint] NULL,
	[Mobile] [nvarchar](100) NULL,
 CONSTRAINT [PK_managements] PRIMARY KEY CLUSTERED 
(
	[ManagementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materialsConsumption]    Script Date: 2/4/2023 9:37:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materialsConsumption](
	[MaterialsConsumptionID] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](100) NULL,
	[Details] [ntext] NULL,
	[EmployeeID] [bigint] NULL,
	[Value] [nvarchar](100) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_materialsConsumption] PRIMARY KEY CLUSTERED 
(
	[MaterialsConsumptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageReply]    Script Date: 2/4/2023 9:37:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageReply](
	[ReplyID] [bigint] IDENTITY(1,1) NOT NULL,
	[UsersMessageID] [bigint] NULL,
	[FromEmployee] [bigint] NULL,
	[ToEmployee] [bigint] NULL,
	[ContentMessage] [ntext] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
	[IsRead] [bit] NULL,
 CONSTRAINT [PK_MessageReply] PRIMARY KEY CLUSTERED 
(
	[ReplyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[messagesTemplates]    Script Date: 2/4/2023 9:37:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[messagesTemplates](
	[MessagesTemplateID] [bigint] IDENTITY(1,1) NOT NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_messagesTemplates] PRIMARY KEY CLUSTERED 
(
	[MessagesTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[periods]    Script Date: 2/4/2023 9:37:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[periods](
	[PeriodID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NULL,
	[Name] [nvarchar](100) NULL,
	[StartTime] [datetime2](7) NULL,
	[EndTime] [datetime2](7) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_periods] PRIMARY KEY CLUSTERED 
(
	[PeriodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resignation]    Script Date: 2/4/2023 9:37:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resignation](
	[ResignationID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NULL,
	[Reason] [ntext] NULL,
	[ApprovalID] [bigint] NULL,
	[Type] [nvarchar](50) NULL,
	[IsApproved] [bit] NULL,
	[ApproveDate] [datetime2](7) NULL,
	[Dues] [decimal](20, 3) NOT NULL,
	[VacationsAccount] [decimal](20, 3) NOT NULL,
	[Reward] [decimal](20, 3) NOT NULL,
	[CreatDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Resignation] PRIMARY KEY CLUSTERED 
(
	[ResignationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rewards]    Script Date: 2/4/2023 9:37:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rewards](
	[RewardID] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](100) NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [ntext] NULL,
	[Value] [nvarchar](100) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
	[EmployeeID] [bigint] NULL,
 CONSTRAINT [PK_rewards] PRIMARY KEY CLUSTERED 
(
	[RewardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salaryIncreases]    Script Date: 2/4/2023 9:37:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salaryIncreases](
	[SalaryIncreaseID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[IncreaseType] [nvarchar](100) NULL,
	[IncreaseValue] [decimal](20, 3) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_salaryIncrease] PRIMARY KEY CLUSTERED 
(
	[SalaryIncreaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scheduledJobs]    Script Date: 2/4/2023 9:37:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scheduledJobs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ScheduleDate] [datetime2](7) NULL,
 CONSTRAINT [PK_scheduledJobs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scheduleVacations]    Script Date: 2/4/2023 9:37:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scheduleVacations](
	[ScheduleVacationID] [bigint] IDENTITY(1,1) NOT NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_scheduleVacations] PRIMARY KEY CLUSTERED 
(
	[ScheduleVacationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statuses]    Script Date: 2/4/2023 9:37:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statuses](
	[StatusID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_statuses] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tasks]    Script Date: 2/4/2023 9:37:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tasks](
	[TaskID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [ntext] NULL,
	[RepeatedEvery] [nvarchar](100) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[Approved] [bit] NULL,
	[BranchManagerID] [bigint] NULL,
	[ManagementManagerID] [bigint] NULL,
	[IsBasic] [bit] NULL,
 CONSTRAINT [PK_tasks] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trainings]    Script Date: 2/4/2023 9:37:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trainings](
	[TrainingID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [ntext] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
 CONSTRAINT [PK_trainings] PRIMARY KEY CLUSTERED 
(
	[TrainingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usersMessages]    Script Date: 2/4/2023 9:37:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usersMessages](
	[UsersMessageID] [bigint] IDENTITY(1,1) NOT NULL,
	[ToEmployeeID] [bigint] NULL,
	[Title] [nvarchar](100) NULL,
	[ContentMessage] [ntext] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
	[IsRead] [bit] NULL,
 CONSTRAINT [PK_usersMessages] PRIMARY KEY CLUSTERED 
(
	[UsersMessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usersPermissions]    Script Date: 2/4/2023 9:37:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usersPermissions](
	[UsersPermissionID] [int] IDENTITY(1,1) NOT NULL,
	[AppObjectID] [int] NULL,
	[EmployeeID] [bigint] NULL,
	[ViewObject] [bit] NULL,
	[EditObject] [bit] NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_usersPermissions] PRIMARY KEY CLUSTERED 
(
	[UsersPermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vacations]    Script Date: 2/4/2023 9:37:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vacations](
	[VacationID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_vacations] PRIMARY KEY CLUSTERED 
(
	[VacationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[appObjects] ON 

INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (1, N'li_employeesInfo    ', N'Employees Information', N'بيانات الموظفين')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (2, N'li_newEmployee ', N'New Employee', N'موظف جديد')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (3, N'li_expiredExports', N'Expired Passports', N'الجوازات المنتهية')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (4, N' li_custodies             ', N'Custody', N'العهدة')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (5, N'li_eventsApprove', N'Events Approval', N'موافقة الفعاليات')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (6, N'li_addTrainings', N'Trainings', N'التدريبات')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (7, N'li_rewardsPenalties', N'Penalties', N'العقوبات')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (8, N'li_staffEvaluation', N'Staff Evaluation', N'تقييم الموظفين')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (9, N'li_charity', N'Charity', N'الأعمال الخيرية')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (10, N'li_hourlyBills', N'Hourly Bills', N'أذونات ساعية')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (11, N'li_scheduleVacation', N'Schedule Vacation', N'جدولة الإجازات')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (12, N'li_vacationReport', N'Vacation Report', N'تقرير الاجازات')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (13, N'li_workShifts', N'Work Shifts', N'فترات الدوام')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (14, N'li_attendanceReport', N'Attendance Report', N'تقرير الحضور')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (15, N'li_companyInfo', N'Company Information', N'بيانات الشركة')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (16, N'li_companyList', N'Company List', N'لائحة الشركة')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (17, N'li_branches', N'Branches', N'الفروع')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (18, N'li_managements', N'Managements', N'إدارات')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (19, N'li_departments', N'Departments', N'الأقسام')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (20, N'li_jobsTitle', N'Jobs', N'المسمى الوظيفي')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (21, N'li_vaccationTypes', N'Vacation Types', N'أنواع الإجازات')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (22, N'li_devices', N'Devices', N'الأجهزة')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (23, N'li_permissions', N'Permissions', N'السماحيات')
INSERT [dbo].[appObjects] ([AppObjectID], [Name], [NameEn], [NameAr]) VALUES (24, N'li_userAccounts', N'Users Information', N'بيانات المستخدمين')
SET IDENTITY_INSERT [dbo].[appObjects] OFF
GO
SET IDENTITY_INSERT [dbo].[branches] ON 

INSERT [dbo].[branches] ([BranchID], [Name], [CompanyID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [Address]) VALUES (1, N'2wss', 1, NULL, CAST(N'2023-02-02T23:52:13.2505712' AS DateTime2), CAST(N'2023-02-02T23:52:13.2510519' AS DateTime2), 1, 1, 1, 1, N'95896544785', N'sss')
SET IDENTITY_INSERT [dbo].[branches] OFF
GO
SET IDENTITY_INSERT [dbo].[charitys] ON 

INSERT [dbo].[charitys] ([CharityID], [EmployeeID], [Reason], [Amount], [Details], [CharityDate], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive]) VALUES (1, 9, N'لا', CAST(23.000 AS Decimal(20, 3)), N'بيس', CAST(N'2023-02-03T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-02-03T21:02:08.2974103' AS DateTime2), CAST(N'2023-02-03T21:02:08.2974103' AS DateTime2), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[charitys] OFF
GO
SET IDENTITY_INSERT [dbo].[companies] ON 

INSERT [dbo].[companies] ([CompanyID], [Name], [Address], [Email], [Mobile], [Phone], [Fax], [Notes], [OurCompany], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [GeneralDirector], [FinancialManager], [HRManager], [CEO], [LegalManager], [CompanyListAr], [CompanyListEn]) VALUES (1, N'qqq', N'', N'qqq', N'qqqq', N'', N'', N'', 1, CAST(N'2023-01-30T22:38:05.4111840' AS DateTime2), CAST(N'2023-01-30T22:38:05.4111840' AS DateTime2), 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[companies] OFF
GO
SET IDENTITY_INSERT [dbo].[confirms] ON 

INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (1, NULL, CAST(N'2023-01-30T22:38:05.6096526' AS DateTime2), CAST(N'2023-01-30T22:38:05.6096526' AS DateTime2), 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 1, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (2, NULL, CAST(N'2023-01-30T22:38:05.6355836' AS DateTime2), CAST(N'2023-01-30T22:38:05.6355836' AS DateTime2), 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 1, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (3, NULL, CAST(N'2023-01-30T22:38:05.6385757' AS DateTime2), CAST(N'2023-01-30T22:38:05.6385757' AS DateTime2), 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 1, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (4, NULL, CAST(N'2023-01-30T22:38:05.6425650' AS DateTime2), CAST(N'2023-01-30T22:38:05.6425650' AS DateTime2), 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 1, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (5, NULL, CAST(N'2023-01-30T22:38:05.6465546' AS DateTime2), CAST(N'2023-01-30T22:38:05.6465546' AS DateTime2), 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 1, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (6, NULL, CAST(N'2023-02-02T23:58:00.6595751' AS DateTime2), CAST(N'2023-02-02T23:58:00.6595751' AS DateTime2), 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 9, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (7, NULL, CAST(N'2023-02-03T23:39:12.0139683' AS DateTime2), CAST(N'2023-02-03T23:39:12.0139683' AS DateTime2), 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 15, N'GeneralDirector', NULL)
SET IDENTITY_INSERT [dbo].[confirms] OFF
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
SET IDENTITY_INSERT [dbo].[custodies] ON 

INSERT [dbo].[custodies] ([CustodieID], [Type], [Details], [Value], [EmployeeID], [IsRecovery], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive]) VALUES (1, N'Physical', N'sdsad', NULL, 1, 0, NULL, CAST(N'2023-02-03T16:38:14.0683945' AS DateTime2), CAST(N'2023-02-03T17:14:20.2603121' AS DateTime2), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[custodies] OFF
GO
SET IDENTITY_INSERT [dbo].[departments] ON 

INSERT [dbo].[departments] ([DepartmentID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile], [ManagementID]) VALUES (1, N'ssxx', NULL, CAST(N'2023-02-02T23:52:44.3048520' AS DateTime2), CAST(N'2023-02-02T23:52:44.3054147' AS DateTime2), 1, 1, 1, 1, N'2333', 1)
SET IDENTITY_INSERT [dbo].[departments] OFF
GO
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([EmployeeID], [Username], [Password], [DepartmentID], [VacationsBalance], [WarningPeriod], [NameAr], [NameEn], [DOB], [Gender], [MaritalStatus], [Nationality], [Religion], [BloodType], [IdentityType], [IdentityNumber], [IdentityReleaseDate], [IdentityExpiryDate], [PassportNumber], [PassportReleaseDate], [PassportExpiryDate], [PassportCountry], [Phone], [Mobile], [Email], [Address], [NoConviction], [BankAccount], [BankName], [IBANNumber], [SWIFTCODE], [PaymentType], [EducationCertificate1], [EducationCertificateFromDate1], [EducationCertificateToDate1], [EducationCertificateSource1], [EducationCertificate2], [EducationCertificateFromDate2], [EducationCertificateToDate2], [EducationCertificateSource2], [EducationCertificate3], [EducationCertificateFromDate3], [EducationCertificateToDate3], [EducationCertificateSource3], [WorkExperience1], [WorkExperience2], [WorkExperience3], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [BasicSalary], [TransportationCompensationType], [HousingCompensationType], [HiringDate], [Sequence], [UnifiedNumber], [ResidenceDate], [JobID], [WorkHours], [JobDescription], [Guarantor], [ManagementID], [IDNumber], [WorkPermit], [WorkContract], [IsBarcodeUser], [Image]) VALUES (1, N'admin', N'1b8baf4f819e5b304e1a176e1c590c84', NULL, 0, NULL, N'المدير', N'Admin', CAST(N'2023-01-31T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(0.000 AS Decimal(20, 3)), NULL, NULL, CAST(N'2023-01-10T18:54:22.1120485' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employees] ([EmployeeID], [Username], [Password], [DepartmentID], [VacationsBalance], [WarningPeriod], [NameAr], [NameEn], [DOB], [Gender], [MaritalStatus], [Nationality], [Religion], [BloodType], [IdentityType], [IdentityNumber], [IdentityReleaseDate], [IdentityExpiryDate], [PassportNumber], [PassportReleaseDate], [PassportExpiryDate], [PassportCountry], [Phone], [Mobile], [Email], [Address], [NoConviction], [BankAccount], [BankName], [IBANNumber], [SWIFTCODE], [PaymentType], [EducationCertificate1], [EducationCertificateFromDate1], [EducationCertificateToDate1], [EducationCertificateSource1], [EducationCertificate2], [EducationCertificateFromDate2], [EducationCertificateToDate2], [EducationCertificateSource2], [EducationCertificate3], [EducationCertificateFromDate3], [EducationCertificateToDate3], [EducationCertificateSource3], [WorkExperience1], [WorkExperience2], [WorkExperience3], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [BasicSalary], [TransportationCompensationType], [HousingCompensationType], [HiringDate], [Sequence], [UnifiedNumber], [ResidenceDate], [JobID], [WorkHours], [JobDescription], [Guarantor], [ManagementID], [IDNumber], [WorkPermit], [WorkContract], [IsBarcodeUser], [Image]) VALUES (7, NULL, NULL, NULL, 19, NULL, N'نجاح', N'najah', CAST(N'1984-01-04T00:00:00.0000000' AS DateTime2), N'male', N'Soltero', 57, NULL, N'O+', NULL, N'414785236985', NULL, NULL, N'', CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), NULL, NULL, N'54546', N'najah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Informatics Engineering', CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), CAST(N'2000-11-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', NULL, CAST(N'2023-01-30T22:42:17.7192090' AS DateTime2), CAST(N'2023-01-30T22:47:55.0750057' AS DateTime2), 1, 1, 0, CAST(1200.000 AS Decimal(20, 3)), NULL, NULL, CAST(N'2017-01-16T00:00:00.0000000' AS DateTime2), N'', N'', NULL, NULL, 8, N'', N'', NULL, N'1478521', NULL, NULL, NULL, 0xFFD8FFE000104A46494600010100000100010000FFDB008400090607080706090807080A0A090B0D160F0D0C0C0D1B14151016201D2222201D1F1F2428342C242631271F1F2D3D2D3135373A3A3A232B3F443F384334393A37010A0A0A0D0C0D1A0F0F1A37251F253737373737373737373737373737373737373737373737373737373737373737373737373737373737373737373737373737FFC000110800AD00AD03012200021101031101FFC4001C0001000105010100000000000000000000000701020305060408FFC4003D100001030302030505050606030000000001000203040511062112314107135161711422328191425262A1B1537282B2C1D134436392A2D2152324FFC4001A010100020301000000000000000000000000010402030506FFC4002711010002010401030305000000000000000001021103122131042232610513E1235271A1D1FFDA000C03010002110311003F009C511101111011110111101111011110111101111011110111101111011110111101111011158E91A399417A2C2653D365697B8F541E845E6C9F129C47C4A0F4A2C01EE0AE6CBE2832A2A020F22AA808888088880888808888088880A84E064A1200C9581EE2E3E482AF938BE1D959CF9F344404444044440444415C91C9656499D9DCD61441EA458A37F43CD6540444404444044440445648EC0418E4764F0AB139EE88088880B92D5DDA2E9ED2921A7AE9E49EB00FF0B4AD0E78FDE2480DF99CF92E82F77282CF68ABB8D5BF821A689CF73B19C786DD77C2F8FAB8D4D64F3DC26123C4F339CE988387389C9DFC77FCD04CD3F6F7171FFF003D85E59FEA540CFE416C2C7DB5525D2E31D3CF6CF638035D24F3C93E4318D049C00373D00F3500709CE31B8E8ABC0E6B788E403B7AA0FB034B5EE3D4364A7BA451F74D9C1708CB81735B93C39C75C60ADB2F9E3B09D48DB4EA37DA2A18EEEAEBC0D63CBB6648D0EE1DBAE738FA2FA1D0111101678DDC43CD605730E1C107A11110111101111016198FBD859979DFBB905A888808888383EDBDEF6F6735E19C9F2C2D77A7780FEA02D3684B5414BA36DB13D8D944F0B677F18E204BC7163E595D1F6B50BEB3455C2898CE232C7C608E60B087803D7857316BA5AFAEA67D0CB29A082DE594F0B69E47873D818D2D739CD70E846DEAAA7936CC62270BBE25713998CB6174D2B62BA826BAD903E47633231BC0FE7F79B82B2C1A72CD4E22115B29B10B786305990D1CCE33E3D4F5EABC75125D6CBC0D843EEE26243637CA23747C20927888391D3E8AE16EADB944CA99AE93C4D99A1ED86091CD6B0119C7134B4BBD76553D58F770BDE8CFB79721AF28A3B76BBD2F72A76E1D2D4C638072CC72308C0FE20A7E3B12A12BDD356D66A0B332A5B1CCCB65CA331D4EE0C9EE778E6B864FDC60CF9A9A617BA486391E30E734123C174342DE98ACF6E67915C5A6D8E17A222DCAE204441E88CE5815CB143C88595011110111101798F33EABD2BCCEE650511110509002A0703B9470CA06A0F15EE8D970B554C04E098DDC2EF0385C0589D3DC6D34572A4AB6453CD4EC6D4B248FBC617B460EC08208208E7B8525860C61D8217CE9AB6BAF9D9F5EEE164A1AAE0A399CEA8A5718DAE2D6BCE7627911C8FA67AAD1ADA5BFA58D0D6FB7C5BA49D034455665AEAD825A96B0B5AC6811B6369C13EE924E4F892790E4B1D3C152C616DB6E34CEA604F0B6583BD31FE10E6BDBB0E9919C7551EDB2D5A2AE16382E777AC9E6AB95ED65439F3BB8C4AE38C168E9E7F9AF0EA2B850E8BBBB23D1F709039CD3ED51710962CF4E7D7D392AB1A3999889FEB85B9D7C46E98E3F9E5285BE9E37EABA0B6BE532BBBA9AB6A5EEC02E396B5BB0E40FBC3D0290C118DB928BFB1AA1B85C856EADBCC9C73D6910D38C7086C6D3B903C33800791F15268691B655DD3A6D8F951D5D4DF6F864041E48AC0081B615FE8B635088883243CCFA2CCB0C3CC9599011110111101609061EB3AC530EA8312226101179AE170A3B6D399EE1550D3443EDCAF0D1F9AE16F5DAD59E9389968A79AE120C8E320C51E7D48C9FA2CA2B69E877B5D550D0D1CF5752F0C8618CC8F7138C0032A38D67618B5E699A0BA167713CD4D1CF1BB9F745CD0784F88DF07D1709A9B5C5EF5244EA7AC9A3868CB81F66A76F0B4F8711392E3F979291BB25B83AB34A8A790F13A8E67423C9A70E03E852FA53B32CA97DB3CC661F3EDD2C773B5D4982BA8E56386C1C184B5E3C41EAB7FA3342D7DF6AA37D641353D083CDCDC3A5F2683FAF253EDDA8191112C258D6B9C01638E064F82D85BE8994AC073C523BE27FF6F255B76ADA76E31F2B334D2AD63522739EA3FD79282BA9AC75D67D3DC0C67B54133A2C1C0698F83DC03CC38FFB5746A04ED3AEB34DAC9E2195CC340D6322734E0B1DB38907C7247D16C6C7DAC5DE93862BB53C35F10DBBC68EEE5C79FD977D02B71A33158C2A4DB74E653522E52C7DA269CBBB9B08AC34952EC011558E0C9F277C27EB9F25D5821CD0E0416919041E6B09898EC111140CD08F772B22A3460615501111011110151C320AAA20D2EA0BDD069EB7BAB6E7298E20785A1A32E7B8FD903A9D8A896FFDABDD6B78E2B3D3B6DD11D848FC492E3F95A7E45769DAE697ABBF5A21ABA073DF350173FD987291A719C7E218DBE61413B74E4B7E956B3194335655D4D7CE67AEA99EA663FE64D217BBEA792C288B7A0526F62B558379A739C37B9940F1CF183FCA1464BBDEC79FC37BB8479F8E943BE8F1FF006586A7B646DAFF003D5CF739FDADDEF31D86B79868E98F961745A26A6ADD04B14C49A7610185DB969EA0792D66B3635B7285CDC073E11C5E7B9C2DFE98631B66A4E1FB4097799E2395CEAC4FDC7A5F375693F4EA4C57BC210D4F51ED5A96ED378D6CCD1E8D7968FC805AD592AA4EF6AE797F692BDFF5712B1AEA474F347AF25B6B26A6BD58A40EB6DC668E3CEF038F144EFE03B0F960AD4A24C44A530E9AED6296A9F1D36A0A6F6379D854C4EE28B3F881DDBCF9EE3D149D100E39E617CC160B2D5EA0BA436DA08C3E59377388CB636F573BC82FA6ED5442DD6DA5A26CB24A29E16C42490E5CEE118C9F3D956D4AC56784BD6888B50222202222022220A1514F691D9CBAA2496F1A7A11DE9CBAA691A3E33D5CCF3F11D79F3E72BAA104A9ADA6B3981F2560824104381C1046083E08BE83D65D9E5B752F1D4C44515C0EFDFC6DDA43F8DBD7D763E7D1433A8B485EF4EC87FF002144F7419F76AA105F11F523E1FE2C2B55D48B21A25DAF64AEC6A799BF7A8DE3FE4C2B891B8DBAAEC3B2A786EAC19381ECD264F96C7FA29BFB65311CBA9D51377D79947ECDA183F5FD495BDD27520D9DED3CE073BE877FEEB919E53513C933B9C8F2E3E595B7D3551DD8B843D1F4AF78F5683FD0FE4B9749FD47ADF3BC6C7D3F67EDC7E5100E4AAA8DF842B98C7C8F0C898E91EED8318D25C7D00DCAEB3C8AD5B2B0D92E1A82E0DA1B5C1DE4A7773CECC8C7DE71E8175DA57B2DBB5D8C73DE0BED94870781CD1DFB87EEFD9F9F2F053258AC56EB0D10A4B5D33208B39711BB9E7C5C7993B2D57D588E86BB45E92A2D296EEE60FF00DB57260D45491BC87C07834740BA44455E673CCA444450088880888808888088880AD73439A5AE0083CC1EAAE441CA5E7B3BD31777BA59ADC209DDB99695C62713E606C7E60AD35BBB2EA6B45C5F596FB9CE730C9108E66038E218CE461488ADEAB2DD38C26276CE611EBB40D6B7E1AD808F3610BD143A1EAA091CF7D74438A37C678633F69A478F9AEEF01516BD9589E17EFF0054F2AF49A5ADC4FC238B6F63B65840F6FAEADABC632D0E1103F419FA10BB4B369CB358D85B69B7C14D9E6F6B72F3EAE3B9FAADA0E4AAB39B4CF6E7A80615511402222022220222202222022220222202222022220222202222022220222202222022220FFFD9)
INSERT [dbo].[employees] ([EmployeeID], [Username], [Password], [DepartmentID], [VacationsBalance], [WarningPeriod], [NameAr], [NameEn], [DOB], [Gender], [MaritalStatus], [Nationality], [Religion], [BloodType], [IdentityType], [IdentityNumber], [IdentityReleaseDate], [IdentityExpiryDate], [PassportNumber], [PassportReleaseDate], [PassportExpiryDate], [PassportCountry], [Phone], [Mobile], [Email], [Address], [NoConviction], [BankAccount], [BankName], [IBANNumber], [SWIFTCODE], [PaymentType], [EducationCertificate1], [EducationCertificateFromDate1], [EducationCertificateToDate1], [EducationCertificateSource1], [EducationCertificate2], [EducationCertificateFromDate2], [EducationCertificateToDate2], [EducationCertificateSource2], [EducationCertificate3], [EducationCertificateFromDate3], [EducationCertificateToDate3], [EducationCertificateSource3], [WorkExperience1], [WorkExperience2], [WorkExperience3], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [BasicSalary], [TransportationCompensationType], [HousingCompensationType], [HiringDate], [Sequence], [UnifiedNumber], [ResidenceDate], [JobID], [WorkHours], [JobDescription], [Guarantor], [ManagementID], [IDNumber], [WorkPermit], [WorkContract], [IsBarcodeUser], [Image]) VALUES (8, NULL, NULL, NULL, 19, NULL, N'نجاح', N'najah', CAST(N'1984-01-04T00:00:00.0000000' AS DateTime2), N'male', N'Soltero', 57, NULL, N'O+', NULL, N'414785236985', NULL, NULL, N'', CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), NULL, NULL, N'54546', N'najah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Informatics Engineering', CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), CAST(N'2000-11-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', NULL, CAST(N'2023-01-30T22:45:25.2556377' AS DateTime2), CAST(N'2023-01-30T22:47:57.7468186' AS DateTime2), 1, 1, 0, CAST(1200.000 AS Decimal(20, 3)), NULL, NULL, CAST(N'2017-01-16T00:00:00.0000000' AS DateTime2), N'', N'', NULL, NULL, 8, N'', N'', NULL, N'1478521', NULL, NULL, NULL, 0xFFD8FFE000104A46494600010201004800480000FFFE00124C454144544F4F4C53207632302E3000FFDB0084000505050805080C07070C0C0909090C0D0C0C0C0C0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D010508080A070A0C07070C0D0C0A0C0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0DFFC401A20000010501010101010100000000000000000102030405060708090A0B0100030101010101010101010000000000000102030405060708090A0B100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FA1100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFC00011080133014C03012200021101031101FFDA000C03010002110311003F00EEFF00B4EF171B5E1E3D947F5A94EA7767ABC5FA527F665A8E8ABF99A79D36D40E517F335E4FB39FF31E9F3C3B1135FDD37F1C5F981501BDBAEE61C7D455B1A5DB7F757F3341D2ED7FBA07E268F673FE6173C3B14C5EDC27F14233EE3FC69BF6EB9EA1A1FCC7F8D5EFEC8B46FE0538F7348748B51D231F99A3927DC7CF1EC516BCBAEA0C27F102A19350BD1FC5171F4AD06D1EDBA8503E84D30E8B6C7AAFFE3D4F927DC39E1D119E9A95E21C878FF9D5E1AADFE3878B1F8546DA2DB8E028FC58D37FB12D8741FF008F1A1C27DC39E3D8B0359BF4E0345F929FE669E75ABF239317E49FE355BFB0AD88E47FE3C69A742B6ECBFF008F1FF1A8E49F70E7876275D62FC7FCF33F82FF008D4E75ABEF58FF00251FCAA82E896E3F84FE0FFF00D7A79D1613FC3FF8FF00FF005E8E49F71F3C4B5FDAD7A7BC5F903520D5EF97A795FF007CAFF8D669D12104617FF1E34BFD8D10E8A7FEFBA3926BA8F9A05E3AC6A03F863FC001FCAA27D4EF88FBA9CFB03FCEA13A345FDD6FFBEEA16D123F46FF00BEFF00FAF4F9661CD0E887FF00685F464911AF3F41FCAAC47AADF91FEAD3F3A84E8B1ECE03E7D9EA21A328FEF8FF00B69FE145A62E68961F52BFED12FE7489AADFA8C7909F9D20D1C76F307FDB43487471EB2FFDF7FE34AD3E82BC0B6356BF1D608FF1C1A51ADDE8E90463F002AA8D247FD35FFBEC53869407697FEFE628B540BC0B516BB7E849F2A3E6AC1D6AFDFF00E58A0FC2B2FF00B2BBED9B8FFA69FE34F1A61EE261FF0003147BFD07EE1A0357BF1C18A33F8034EFED6BEFF9E31FFDF205669D371DA7FC1C527F651EB99BFEFB14BF783F70D95D6AFE2071147F95576D7B5027FD4A7E559DFD964779BFEFB1511D30F5CCDC7FB628B4C3DC36D35CD40FFCB2418F6A93FB6B512388D3F15AC11A63679330FF00818A9D74BDDFC52F1EAF9FE555CB315E06F41E29BDD2C095E35C670428ACBB875D626370C850924F4C75FF00F554B1E9510E183B7FBC6BA9D3B444C095BC903B2BC983F90FEB5B460F791849ABFBA60C5660761563ECC83D2B7F53B158D43C6B0A8EE2393713F81FE958A50F515D492B1836CC6D5EC83DB3851CE2B8CB5D2B0A335E8D731EF8981F4F5ACA8AC555476A2504C2326B430E3D35462AC8B0406B6D6D23EFFCF152A5B44A79C73EF51ECE25F3331934F8C8ED4FFECD4ADF104431C81F8D3CC317A8FCC53E4893CF21896CB52FD9D7DA9D169F7E5DB36F2638EC31DEAC9B1BC8C65A175FC3FC2B4D08D4AFF670B49E403533974E19181F7069A921FEE9FC8D3D03522FB38A3ECC075C7E233560391FC27F2A7B3E46369FCA8D0352A0B65C7403F0C506D01AB81D57A03F952870C78078F6A3415DA281B403B0FC4547F6503B01F4AD0664FF00687E06937AE3BFE54EC857651FB28A67D9455F665C7714CDC00A2C82ECA46D80A6FD987B568EE522A3765145905D9505A8C738FC8D3C5A2FB5585755EBC54BE6A7AD1CABA05D944D983D302A37B3C7715A5BC76E6A2F31470DDFA54B490EECA06CF7291C5316CC200319AD3DCAA33509947046319A9D3A05D902C6A0E302986DC7A0FD69CD3856E4629A6EE31C6E51FF00021FE3472DC7768916D0119207E74A6D157B03F89A7C77F0631BD063FDA1FE35616647E54861ED4F97B829153ECCB9FBB8FC4D38DA29EC3F3356D5D58E05395D7240A56455FB147EC8ABFC23F5A3ECA3B01FAD686E5EE4714DDCA0F5155CA89BB28FD881EC07E7519B203B7F3AD60EBEA2A2675F51472A0BB288B21D401FAD5DB7D25AE5B6C69B8FE3C574BA4E9F14C44D70C028E8B91CFAE7F4AEC227B684610A2E3D08A5A2D02ECE42D7C2F2C1F31442DEE7A7E60D5D6D26EBFB911FFBE7FAAD754B7111E8EBFF007D0FF1A533463F897F3153A740E66724747B961829181ED81FC80AC4BED0AE203BB6707D32C3F1C74FEB5E92268CF465FCC529913B95FCC55215CF1AB8859108E33E83AD642DB363EE9FCEBD4BC476D0883CD8C286DC01C63BD7058DB81EDFE35423396C5BAE07E79A9D2CC8EC3F3ABAA37703BD6AC764554172067A0A2C87E8630B66EC07E75696CA5C709FA1AEA6D60B78146E0A5BD4915ACB7B1A8C065007BAD47324572B6742001D282290123B53B34EE8CF5226811FEF2A9FA8150B5943FDD51F855BCD1498EE65B592272157F2A40215E1D147D462B57151B46AFC11FA5459F42AFD1957ECB6EFCEC43F8531F4DB57FBD1AFF2A496C73FEACB2FD091558DB321C33C8A7D77103F514B55B859327FEC6B33FF002CD693FB16CFFE79AD0B6AFDA593F139A77D926C8DB33FBE4034F9BB09AB0CFEC4B3FF009E6B4BFD8B663FE592D486DA6FF9ECDFF7C8A69B795473337E4053E66161BFD8F67FF3C9697FB22CC7FCB25A6189FB4CDFA5529606048F3E424F618A5CC5729A1FD9B689D2341514905944A498D381E9D6B19B10E583B71C3127D7FCF35CEEB5ACC5A42B4D34C3CB5E7E6F5C71B47563EC29FBCF44164B734B55B8B743E5C712825738C1CFE439AE3B50F13695A6F170CAD200374518CB0FAF65FF0081633DBA1AF27D63C6B79AE4AF1D9968A36E19C1C123B12C395079F947E3DAB1A0812DF93F3B77CF0327DBD4FAE79AED8506F596C62E76D11DF5CF8D2598B0B1B78E28F3F2B4DB98FD762B2A7E7B87D3BE449ACDE4A773CEC1BB88C247F96C51C7A7CC48F6AE42F7578AD7876CB7F717B63D715CB4FACDDEA0DE55B862A4F0A80927F115DD1A505A58C9B7D5D8F40BCF1047193E74AD211D9DDE46FF00C79C85FF0080819EFD0573179E302322DE351FED30E47D39A658780F57D4BE7741103DDC9CD75D69F0959803732F3E80569CA96CAC65CE96973CA6E7C437F3BE7CD618F4181FA56C69FE2FBEB52373EF51FDE193F81ED5EAE3E155AA8C066CFD2B36EFE1648AA7C99067B02297B3EA1CDD87E8FE3EDC42B3B213D9F0CA7F3C15FC3AFE15E8DA7F8820B923CE3E5823871964FCBB57CFDA9782F52D2B3218CBA8EEA09E9F4154B4ED6EE74D6DA7239E55BFFAFD2B195152E9666CA6D6A7D831D8AC90896164977E00D84107F2CE0FA8AD45F0FCAC3F87E9E95F3EF86BC64F0B092D64D8FF00C51B9CA30F403D7E9EB5EFBE1EF14C1AC010AB0B7BAC7FAA6FBADFEE67927D40E4715C1569CA9EDB1BA927EA3DBC3F30E814FE3562C3400926FB803E5E80743EB9FD2B7F74C871F2FB673DBE9FAD3585CB723CBFFC7AB91B6688992DE28F80A05482188F555FC40355556E872421FA122A45FB481F753FEFA353AEE0EC4DF668872557F2FF000A72DBC47A2AFE555C9B9EE8A7FE05FE3499B91FF2CD47E3544973ECD1FF00757F2A61B384FF0002FE5FFD7A81A6B951C463F3A8FCEBBFF9E63FEFA155715995B5AB046B3711A852369E063A1FFEB9AE15F4F5DE33C0048E7FCFBD7A219A510BB4C8780780739AE36EE46277046C673E94EE348510416EA30067E879A6A2C64FDD0CC7F1FCB34EB781AE3E66040F426B7ED2D02738FCE9366963363B19246188C01EA4015A6BA2F1D547FC047F8D6A2273C55D0BC54849D893345507BDF27FD629507B8E47E9D2A45BC8DBB9FCAA8CB95A2E5151ACA87A11F98A7822810EA2928AA10B4C740E3069F453B5F40322791ACCE4AB32FF00B2338FAD3E3BFDE33B2403B7CA7FA0ABD320914A9AA5090BF2FA562D72B355EF2BBE806F07F764FF00BE1BFC2AACFA8282142BF27BA918ABB2CA90A976380064D72B35D35C92E3E55C9F6C7D6845686AC97AA38279CF41D6B2B51D4D6D23323E234E858FE7CFB0EFF5A825952D10C929C051927FFAFDABE67F1CF8D65F10DCB59DAB18AD509C953D71D4923A0ADA9D3E7629CF9763A5F137C4B690BC3A7B1F2D4E5A66FBBB8F1F20FC3F95797497975AFCBE64F233479E4B1383F45EDFFEAAC5893EDEE1465618F8F4C9FEA4D74A19634C0C2A28E7B63DEBD685350DB7386526CBB114897647850B9C9EC31EF5837BABB48DF67B2C966C8DC0658F4CEDC7EBE955A5B99F54956CAC94B162303D7FDA247F08FC8D7B4784BC19068A8259809AE1B05998700F3C2FA633F8D6E64DF2EDB9C5683F0E27BFC4FA9131A1C1F2C72C473CB1EC7DABD8F4BF0FD9694816DE30B8C73804FE24D4B79AA5B69AB99580F41DCFB015CFC9E21BABB3FE8A8B0C67F8DFEF7D42F6A529C61A0D539543BB50A9E83E95219517A903F115E7A1659FFD7CF2484F5019907FE3A467F1FC3BD48BA6DBF75CFF00BCCC7FF663FD2B2F6E96891A7D5DADCF425913D47E62A51B4D79E7F64DAB74520FB3B8FCBD694699E51CC32CD11FF7B70FC9813F911EFDAABDBF90BD876677ED023F51C7A1191F8D717AEF80F4FD6158EC11487387418E4FB52C5A86A56679D97483DB63FF00E8441CFD074EF5BB63AE4376446E0C52FF0071860FE19C6EFC3A7E35B46A46464E9CA3B1F35EBBE15BFF000CC9BC82F103F2C8B9FD71C0FF00F5D69787FC52D13AC570C53072920382ADDB27D3D6BE92BBB486F63314A8B22B7041AF9CFC67E0A7D1646BAB4CB5B92491FDCE9FE3FA52947AF4084ADA3DCFA7BC1DE325D540B3BD2AB7200D8DC6241CF43DCF4E9D735DF345B7EE718AF863C2BAEC88C2DA472194EE89F38607B0FA57D73E0BF130D72DFCA9C8175080AE3FBC0670C3D7BEE23A719EB5E5D5A496A8EC8C8EBD640386C03E94FDE0543716F1CB86650C57A55616313F3B47E191FC8D79ED59D8D77D4BFBC7A8A5DE05671D3A2ECA47D09A5FB0C29D411FF0223F95302F3380327A533CD0403D2B35ED6163850C48F466C7E348D671E30D903D9C9A45248BD330F25CFB1AE11D8DC4E117854033F8FF00FAABA3D40C5676323AB100107939FC39AE0B4F964BA66763F296E00E38AA40B4D0ECA39228BE5C8FA0233F956825DC6061558E3F0AC0823008E3A56CC68A06477A19A234E3B92C3EE1FC4D581337F77F5AAD1AF02AC05A42690AEA1D483C8354A34F20EDEAA7A1F4F5CD4FF69871FEB13FEFA1FE34D6292A950EBCF70454EA0B42C18D48E8315461B35472C85867FDAF4FAD4AAE201B770603DC669D1CA8C72AC31F514FD05D196423AF46CFD6A452E3A807E9484FA114F56C534D99B14B841CF1F5E29CAC1864722918023079AAC9084E5491FCAAB9AC4D8B24815826206461B9D493C6091FFEBAD09252BF78631D0D636A17BF662B29525402723A64638FD6B397BCD1B423CAAE656BF790D846B1C8F23348785DD9C81D49F41D39EF5C8C9E289B810461147049F98F3DF8E9D0673EA29355B893589BCE44212318047181EFDAB12FAE534FB692EE7C88E15271EADFC23F13DBBE2B78C4993B6C705F103C53711AFD8C4ECD2483F7B8E02AB7F00C7F11C0CF703EB5E392B3605BA7FAC9CE643E83FBA0FA01DFB9356AF6EDB51BB92E2539E4B364F193F747B62A2D3D0BB1B86E49C851ED5E9D34A2B438DB6F7366DA210A2C69D3193EC7B9ACDBEBD6B8616B6DF364E001CEF6FC3AD2DFDD7D9D7CB43F3B0E4FA0AEBFE1FF0087BED0C750B85F947099EDEADF8F1835D0887A1DA7833C309A44227940FB4380598FF0F5C28CF4EA6B6F56F10880FD9ED3E7971C9ECBF53DB3CE33E959DAD6B6623F64B63893A1F445F53FED1EC0F279C5625AC0107A924924F53EE7EBE9DAB0A956DEEC4D6952E6F7A5B13C685E4F3A6632487D7A0FA0AD88CF1FE7F9567A47B715A318C579F76EF73D3B24AC8B91B7AD5D0F8E9541455A534D32596D5CD59592A8838A943E2AEE64D17378A8A6821B805645047A8E0E7D7239C8A88498A6F9D8A2FD85CA4D6FA9CDA51C5C133DB74DD8F9D3D33FEC8F5EDDEBA1B9861D4E028D8923917B72083D318AE4DA60DC71F8F4AAD61A87F64CDE5B92D6D2138C9FB8E7A7D17F4AEBA757A48E5A94AFAADCF17F13E832F86AFCECE2376DD1B0E9D7A67A679E95E83E1AF10CB66F0EA36E70F1FCACBD980C6F047A91D2BAEF1BE88BAD69EE63199231E621C739032547AE719005787F866FB05AD9BAB72B9E3E604E47E3FD2BA26948C2127B3E87DDDA66A30EAD6A97701CC72A83EE0F75FA83504972F672795B0C80F2082063F3EBF8578BFC35F137D86E8E9539C43727742CC7857EEBCF1CF181ED5ED9783E78DFD1883F8E3FC2BC4A89459DB1EC44FA833748DBF1DBFA73555AFCAF023727DB1FD2B4C855C0C540DB54F18AC2EBA1B597428FDADB962AE07FBA78FD2A8DCEA696A864943803A707AD5CBDBB4B4432498C00703D4D79B6A7A83DEB65F851D074C7D455A57149DB433F53D6E5BFB93092CB195CEDE80F3C5751A3C184CE31935E78D2C91DC1923C12140391D3935BF6D7B733CAB1348554F1F28C76FF00EB56BB684F99E8F142DBBA631D73C56AC6A060640FC4579DDB42CE1599DDBAE724F5CE3B7D2B520863E72092983C9F53EE6A1A2933BE5207191F98AB20FB8AE492CA224E00183FD3EB56D6CA1719E9FE7EB5162ED729EF463F28FC3153ACD1F4E323B0EA3EB5F2DFFC2D1D64C5E579B8C0C6768CD635A78CB50B39CDCA4D2AC8793939538F507EB4F958B991F5BC8EAC32BEBE86910C47E65018679EF822BE6BB9F8A1ABDEC5E5B384078255704FF8564697E30BED225F36195DB71CB2B9DC1BF0EDD4D1661CC8FB062685D41DA3F97F2357E26438DBC8F6AF95EFBE2BEA5771985365BE782D1A9DDCFA1E82AAE87F132F747F92666B88F39CB9CB7BFE7FD2A1260DAB1F5E36D51C7F3AA8159C601201F435F35EAFF18E7BD87CAB45F20E7EF77FF3EB5B1A4FC6809108AF632F228C6E5E031E00CD369ADC949743DCEE310292C4ED0A4924F41EB5E63AAEBEB7EFE4C04F931756FEF13DFE9C7EB590DF100EA36B3A4A7CB94B955503F831C0CF7CE6B16C61CA6FE7E6E7AFF4AA847A8E4ECAC5E9DDD8E0332E4F407B639AF30F1CEB124312D887254FCEE3DBF841FCBF5AE8F52BF9A349A1B628ED190ED9E0AA679C9EC315E33AD5DB6A978C7A79AE381D940E9FF8E9FCEBB6946FA9CF3D158CD66658D53F8A6C31F5E73818FA56B8616D0EE1D00C0F73599137DA2E4B0FBAA32BEC3A0FE47F3A65FCFE636C4E887681D89F5AEDD1688C0B5A469F2EBB78B0AE4EE6C93E82BDE2F2E1344B55B4B500C98DAA07001180589F419FD4572DE11D31742B2FB6CE3124C063FBC14E7951D496E800EA3711F74D4571AD88E432AC6679DB8C0C948C0CE1411C1F527D78ED4A5351D16E5420E4EFD0D4B4D3D9797259C9CB31EE4FF4F4AD55B664EA38AF37BED4B5BB8CB64C6ADC84418FC327D2B206ADAA5A7265953FDEF985703B1E86A96C7B404DB53282B5E43078E2EA2F9660B263F88707F1AE9F4FF18DA5C90B213131F5E87F1ED8A9B0D33BC46AB00D63417692E190865F5539ABC9267A5219783015207154F38C669CADC9A64D8B85B15039F4A40C2987DA802177DB546E4F9A853D7BFA55C9178AA0FF002D17B6A8AB5F43A6F0E6A26EEDDADA6E6487E539EA7A8DDF423807A1C5784F896D0F87F597118C47B84898FEEB7515E9BA6DC9B3BE8DFA2CB946FAFF000FF5AE73E2ADA147B7BB51EB1B7BFDD23FAD7A9097344F2670F673F2640D78D0AA5DC04878D964423D179238F5CFE86BEAAD335A4D734CB6BB439336DCE08C8651F37E3EA3AD7C6BA45C89AD9549FBB9539F4AF55F851AFB912697212441279B181C9C1C86E3AFA5715787BAA4BA1D103E8AFB3646773E71D88ACFBB2B6B1B4ACEFC74E475A9A4BD0880ED7E075DA781F95707AB6AC2EDF60C88D4F03D7D7F2C579B14CEA7A105E4F25D9DCECDB474158D2C679E48AB66750319AA52CC8475C7FF00AEBAF6D0E7D773290FEF64C9CFCC3FAD68C3279522C83F8086FF00EB7EB59264CBC8540203D6BDBDCDB28FDE432311D4AB54A34E87596C2390FEEDBB938CFAE2B412DE642C40C861FCAB964BCB253C473A7E04E3F215720D6AD637DAB24EA48E8518E7E9C526523B5B5908E0820F1C568181CF2A700D71F6BAFDBBB06F32461EBE593FC8559935DB62D913483DBCB6FF000ACCB47C55BE9564C8C5424D038AD8E52E2B9C522B9C8AAF1BE3AD4C84669016BCDA5DC18E0D42A2A50B9200EA4E3F3A431CAA090318ADAB7D2F7B237FB4BFA915693C3AC14389A3FA1C839F4FAD6DD840EB3450B60E6441C1CF707814A498E2D23A183492971260646EE7F215D50568D42818007A8A9E38D7CD7EDF373FAD4D28098C7F9FFEB5528D90DBB9E6FE2F9C69F692305D925C623CF7DA7A9FA74E6BC3918EE7907551807DCF1FC81AF46F88DA86FBA5B553916E9CFBBB72DF960579926E68C2F42E49FCB807F535DB4D72A3096AD12DBCBE444D20EB2310BF41C56DF84B463ABDE03267C983F7923638E3A2E7A649EDE80D7392824AC49CEDC28FF7B3807E849AF62B2B51E1BD396DD3FE3EA7E5FD771E83D70A09CFA12335B735B504AFA1AB7538BC90A9E22B738C2F42C076F6518FC49AC99A5541B6355E3D3F9D4850C3108C1E8393EFEA7F5CFE1592F216248658A25FBF2B70C7AE42678C1C7E3C62BCE93727A1E824A28B3206FE3609FEF1DBFCF15957369E67DD9233EDB81FEB54E5F1469968018636B86653B8B750411D73C7D055EB5F19697764473C662CE796552A3A7A1C8A9E46C7CE96872977601490EBB4F622B1A4B49A13953B87A639AF46D4ADE19104D684321E70189047B67A7E15CDEC0795E87A7B7B668D63A0594867876EE78EE1554B01FC439E95ED36D39602BCCB4A8C2B8C019F5AF49B38BE503D854DF5356925A1AC1B22A279C2703F2A9366C15CBEA775E4AB11D40355B6C648DBFB6A8382715652E430AF9DAE759B932315771F31A41AF5E2F491CFE34D27BB07A688FA44386EE2AACC9DC578659F8BAFEDFABEE1E8E2BB1D3FC721F0B7318C7764E08FC0F5FC29D8573A3BE730AF9A3AC4C1C7E07FFAF56FE2220BCD185C0E4A1471F90CFE8D9FA546B35BEA9116B760EA4723B8C9C73497E4DE786995F968E22A7EA876FF0021FA575517D0E3AEB48BF33C9B42B8D85E3F6DC3F0FF001CD763E05D54693E234C9C24A761F4C363FAD79CE9136C9973C6E1B7F0FF0022AE3CE6DF505954E0821B8EBD7FFAD5BCD73268C93E5773ED5F10EAE563FB3C3C3375F6E9C1F4AE0ECFCF72C270AA33C10724D436D70D770C7701F26545639F718FE94ECC8BFC58AF339796E8E86EE4FB994950381EB54DD97073DBFC6A611BB0CEECD52B98A4C1C1146C229EE546901E3E6273F856B68B7C8CDECEA54F4FC0D726FE7CD2328C0C1FCEAD22CAA30140207507159A76B9BF63D1D26F3980897798E36C818CE4E3A8F5E295A494C714A6328C920272BD97820F1EFCD7979BDB9D2A269E262B2863824E41071D699A8F8A752BE87C89251B4F2401B73C0EF51CC16B1ED9238D3EE37C401825008E0100F5201E9DEB4C4EB27CC02F3FEC8AF99B4EF1A6A9E1D3B22659A1EBE5CC0B7D307B7539FC2AC4FF001535691CB2450203FC2236207E55495C5CC91E5AD0303E948D1951CD6FC9004193C53B58D2069A625DE246963591940C15DDD8FBD6C636BEA8E7556AC2AD0B167A54CB1E0E29900BC5488C5581F71FCEA4F2718F5AE82DB436004D73F2A7040E849CF14AC05132BEF386382DEB5A9A14CEFA9DBA649DD2807E9CD66884BBF1C00C7F2C9AD6F0CDAB0D56D99BB49FE35564B611EDAB12972C7AB313FAD4771188F2EC4855193E8001939F4ED56E24639620704E3F335C678D3563676A6053B649CF04768C7DE3F4391834D2BB1EC7CFFE23BC3757334BC966763F867007E559AC042A0FA0007F9FC692E8F9B228F5209FA03DFDFD6ABDDCC19881F747007BF63F9D776D6466B7B9D678334AFB75D1BB97061B405C83D19FA2AFE1D48ED815E86B135F4E6E9F94076C43D87F11FA9FD3155B43D33EC36115AA8DB24C04B29EE377453E9C67835D5C712A0006001DAB9EA4FEC9D308DB5394D4165552635DCD838FAFAD7936B2D78F28FB613B41E80E063F0AF79BB5246178FC2B86D56CCBFF00AD8D997D40DC07E5D3F1AC2F6D4DAD73CCA68E268FF778032377AE2A99B770DFBBFB87A64738FF00EB5760FA65B364A36D3E9D7F4A7A69C36E004FF781653F8803F9D546C66E2FA185A65DCF659624B443008EA39CD6EA10E7CC4FB8DF9035A6BA144D1794B22A6EEB95FEB469FE1E9AC1CEE649226E98EDEFFAD268D63A68CB7A4464C82BD46C20381DEB91D274F28F9038E3AFE35E8F6508503159A4549D8AD7316C4E98AF2CF11DD6D2517AF3FD2BD7EF572A6BC475804DC3B1E809A24B549043B9CB0B6321C851F955F874A0DF7B0BF5E29448338DDB077AB31EB3616246EC3B0EBC6EFD29A8B7A14DDB73460D0971B942B8EFDEADFF00645BB70CBB7F4AAF078AB4BB93B0A985BB381B79FE58F5CD6835D2A80F95789BA4A3AFBEEC71819183EF49A71145A96856834F9B4793ED3624BA8FBD19E4301C91F5FF001AEAE2749F4DBB8E3E148760BE85806207E248FC0D64C573B1829E474CFAD6C5B2AAA4F1A701E2271F81ADA8BD4CAB46D1FBBF33C02CDF6C8BEC7F91357AE9C1BD00FB56503B243ECDFF00B31AB8EFBAE99BFBA07EA2BB175385A3E8BD14CD71A15BDC46CAAD182B82324ED63C7B718FCC54B6FA919B2195B774C67A91D702B3FC33338F0DAB28CE1DF39EDD31496FBC4292B80ACE3771D793FF00EAAE6B6A0DDAC68A6ACE59A30B80833D6AEA5DACF1890719FE95CF59C444D36EEC831F893FE15A96083CA0180239EBF5AE7969A1B4575204203B1F7AB919C8354FECD1877217193D8D5A8ADD76F71F8D62BA9BB32B5A1FE8FC77615CF38DBD78E08FC78AE9F56880B75F7718AE76F062B07B94CE3EF2EB7C98FEE8C5551262A09A40256CFA9A70957D47E75D5D0E63D134AB379273B6249D2342CEAE704AE46427AB77C0E78AED7C53A2DB5DDB4121590001638D63099191CEE279E38E99C739ED59FA15B496DA9DB8F28B976F957A6F078C02783CFF002AED3C7363259456B1F906DC34AC589756DC7E5381B49C000FEBED4E51D53293E54D773E7C92C4C3298CE7087682DC138FD3F2A8DED4A1000CE78C576B1DAC97329DA8BB3270CDFCF35D8586956F6A03322C8FEBCE3BF4C536ED6212B9C1695A127124A4EE1FC3B4803EA4D4BAC5D32DC240A7E45C678C76AEBACAFE18F779D96CBB6D5018E00F603A572FAD496F7173E6C4C318E99C118FAD0B57707A686346A7A8E7AFF3ADDF0CA97D462CF182C7F4AC6B4C310323233C6456E7866545D415890A1039C920751FFEBAD1F4211EBD6C432E09C027F4CFF2AF0CF1AEA3F6D9E671F7633E4A7A7C99DC47D491F957AFEA9A8C5A7E9F24F1B2B32A6D4C1072EC303A1E8324FE15F3BEB92E23500FF11C93DC607CDF8B16E7E95BD3427A238AB89447973D4F4A9BC3B68353D42289FEE06DEFE9B57920D5398798B8EF5D1F82A2F25A798FDEC2C6BF576E7F200D5C9F2AB970573DA2CB126641C063C7B28E00AD10B9AA36A024600F4FEA47F4CD5D46F4AE0BDD9DFCB645816E18546D60A7AA822AD46D571306A919BD3639C9B42824FBD121FF0080D551E19B4539F2573F4FFEBD767802A338A7B0B539B5D26188612355FC3151B59A2F402B7E4C0AA0F8CD0166476B02A1E95D25B26D02B32DD7774ADC8D428AD10A4FA14AF38535E57AED8338658C88CB93CB0E3FCF35EA57ADDAB026B759786EF52F72968B43E7EB8D22E607CCA7CC5FEF2B657F003A7E3542FE05DC0A02011E9E95EC5A9E825B260F95BB03D0D7077760617FDF2B44DEB8F978FAFF004A36D01C5C8F3D78CAE467E82B6B47D4E5D31C4521FF004797E571C9E3DB3DC7B55CBBB23336F529F5002E7EB8AAC9A2CD72C149E01C8C532229C763D02C9FCC52A1B7F96D956073B91B907DF1820D755A7BEE9194F784FF00235C5E8D633589F2A4E8B900FA8EDF957576076DCE3A030B7E80FF008D4D3D2565E7F91A556DC75FEB53C2E51899D47F7DBF99AB4CBB5DCF73B7F90AA77076DCB8F476FE75A4E99DA4FF00CB471F90FF0022BBD1C07BEF865827869508FBD2487F2DBFFD7FC8D3CCA0C2817A1418FCFB55BD00243E1FB60C3E66DED8F505C8AAB2B01840000BC0F600FF00F5EB15D4896E89B4D88859E46FBC703F2078FD6AC5A332274C81F854FA62FF00A348E79DD237E98FF1A9D500418EE6B965B9D2B64670F3199B08464FAD5D80F96B82AD9F53F8D588D07987EB579A2016B14B7346CC0D52206DA238EAE3FAD7297B1ED3F9D7A1DFC01D208F8E5873F9D727ABD9981C83C75FEB59C96A82E7895D9CCCFECC6AAEE229D364CAFF00EF1FE751138AEC4B446373EB1F0765EFA085803B5D65898F50A1F6B73E84F4FC6BD03E2322C896808DDFBD7C0F5F94572DA24620BCB52BB72A624185DBF2972C48F5073D7D8D753E3E93F796718EBBA57F7E020FEB509A7B0CF3C4B474886C08370F9411D3D79A905BDCAA9CA47C29381C7BE7F2FE75AE42850060054C8FAE3FFAF4DB87011C8008000EBFECF6ACFB8CE2A0996181A48942994B8000C9E3AFB9EE78AC8B689751C59B85591C33452FDD6DD83853DB6BF4C9E32001C9AE834F893CB5770C7CB1230C1C00483FAD73F7522C12C6D1EE0F122119F5DC0E062AD09946C6DA397167728A8653B5252B86461907711DB23049E9C7AD3343B155BD7B6922572BB94EE1C29F520E0F239FA1F7152EAB289AE0BFCC983C000E7772C4FE2715B7A34CB777CD228E5A1DCC7FDAF901FC700E6B421189E2E86CAC1E18AD6358E464DF215240E7851B727046D279F515E61AE49D147651F5EF9CD745AF5FFDBF5395D4FC81CA2FA6D5E063EBCD729AF1C4981D8575415910CE6E33BB77B5759E14F9A7F2874670C7E833CFD39AE320621C8F515DAF83533784FA256753666D4D6A8F5F0FB4003B5491CD8354257DA6A3597D2BCDBD99EA72E87410CF8ABC938CD7371CD5656E7677AD1488713A137216A07BC503A8AE7E4BCF435972DD3B1C722ADBEC4F2A3A46BB329DA2ACF91F2E49AE66C2F922626438DB8EBF8D5B6F125BFDC0CB9F4DC33F966A93496A2945F43A9B50100AD846E2BCF21D6806C1E2B5135953C06C7E355CCBA132A6F736AEDC1CFB5670604D46B76B39DA0839A271E5F238C54B2946DA173CA120C1ACF9F4D47520A861DF23F95685B4A1C66AEE0639A68C9E9A1E7973E17B476DCAA633EC78FCAABC7E1E480E57AFAFAFD6BD024894F6ACE92300F150F42D5CC416AA830C0645542A22B856E80ABAFE6B9FE95AF28AC6BE9042ACFF00DC8E46FC971FD6AA9BF797CFF226A7C2FF00AEA781CDF3CEEE3F89C9FF00C788AD7C6F99507FCB35FC8919FE607E62B222E5831E06727E9D7FC2B7F4685AF6E5700932BA8031CF27A7E42BBFCCE167D3F6BA3AA6956D1A1F9A3863CAF7C950C78FA920D72F7108CB3640E7041EDCE4FF002AED615962C21FBA802FE0145643E8125DC8F82446416CFE04F5AE54F564B4334D8C0B153FDF2E7F5AB36F6BBF009C62A6B584456D1A1E309FD6AE4098031E958F536DB428ADAB2C87071CD5E681F1F78548A32EDF5A9D9700FD2819997698100C93CF23A763FE359B7F244F198A5566183CE46471EBFE7A56D6A0363423EA7F9573DA8636B11D95BF91A8EA26792C1A76857825692E5EDA45CE032E771C9E9F4FD735C64B0DAAB10B38201C02508CD6FC96B05C304F9833127E4058E73DC0AE86C2E34FD362FB3B8DCCA4EE2F1E1B3DC7233C574E96333D86D7521693ADCA6D95A36CEDDD82A17B053D7AF18F4AE87C5BAEAEAB25ABDB92088999B23EE97DBC0FFBE6B9D59FCFB16BD91ED888D30A8AA1B79FE251839CE31EE7F0AAFA584BAB8882A2C71B018DBDC1F5F6CE71F8D734249AB234F42C3CAB11F9E57522307B819CF3DBB67F0CD36E67411CA7CFFBAD81961D36E48E71C9CF1EBCD7A1CBA18958F2BB36E08DBDB8E2B2B5CF0FDBAD8CC703210B1ED960303F9D4296B62ECF73CD34F7768588609FBB7DA1980DD9FBB807A9EBD3D4564EA136E9988C10AA8BC107918CE31F5AED74BF0D4BA8D9AC9190181C2E5B6F000EDB4E7F4A497C0D76C0B7C8CC39E367B7A019CFBD6F74AC4B4CF38B99249256720E379EDD8015368D786CA3BCB96E3CBB63B7D989C0FE75D5DDF816FE47321407D00C638FA1EF5CB78A346BDD16C2479552259CAC6428C1C03BB9FCAB44D3D08E568F2B59FF007A327F8B927D7BFEA69BAD9CC87E959E5F1273EB9FD6B4356E5FFE023F9576AEC65D19C921DB2F3C57A07821737329F44FEB5E7B3828D9F7AF47F02106E271FEC023F3AE7A9B33A696E8F42B838EB54FCCC74AB573FE7F3AA0057947ADD0B0B21F5C5235CE38154E4623814C8B96E6AD106947BA4356DA10067BD430B01C0E2AF0208C1AB5E464DEA71DA9C6EA495E01EB5C6CDA72BB799C86CF5C9AF50BBB60E0E6B96BCB5D9F76934D1AA652B7BA64882649653D694EA2E872C718ED9AA0C8CBD38A12CA49FB1A945DF41F1789AE229FE48CEDCF5CD7A1DA6AEDA8404630D81F857091E852390071EF5DE69B622D21F2FF008BB9AD9113692D37352CEE8A1DA7B56E25D715C7BFEE9AB462B8E3AD34ED7466D5F53A033E6AA48F9AA26E31511B8CD4B90B94590D717E2ABCFB259CAC3AB2141FF02C57572499FA5794F8C6EFCF716C878DD96F6C74FEB57495DDCCEABB46C71700CA91DF1FE7F957A97C37D3BED7AAC0A7EEA1DE78F415E6D690E3AFF9EB5EF3F09A386DEE26B998EDD910453CE3731CF6F40BFAD76C9F22679F1573DC6EA2DC8368E79E839A55223B6E87210E7F223FAD3DF52B790604A879FEF0E3F3AA97532985D91D4E4600041C9C1E0735C77DD9A58CBD46016E56351802343F98CD32DC607E15ABE204DBE4CBFC2F047FA0E7F9D6444EB8C743DAA17729E964471E0C8C54FF001735A322E14FD2B2ACC92C47FB55B129EC3D31F9E298CA1A8A7EF22F643FD2B9DBF85991C2752AD8E3AF1DABBEBBD1E44950CA5788C6067FBD8CE7F21505D5AC56CDB0A92DB0F4F71FFD7A57443DCF9CECF49B8816395109690B15C75F94E4F1D7FC9AD1B68752112B88E06F332D9603272C47F4AF578B4A8603185DC3CB57238CFDE0726A847A6DB5BC51C6CEF954F43DD98FF5AB7348C92654BAF096B1A72AAC4D855CB36C4122F23A15EBF90FAF6AD0D02C2FADE58D8A99BC9200C294037127A11EDD3B62BB0B8B7BE9983F9D371C01C522ADFDBAE4BC9819EAAA464F43D548FD6B28A4B637B5B6349F5C9A36292C0CADEBC906B3758D51A5B2950800BA10003CF6E31D6AA2DDDFCAE0975C29E731B1CFFE3DFCABA78751E3122DAB67FBC922631EFF00375FC285A16F538FD26EBC8B54876BF39E9803B7738FD2A496F3602A0B211D873FCABAA7D68826348AD801DC48C3F2CA91FCAAADDDDDB4A9B4C291CA7A3868DC7FE839155746766712F7EF9E24718F7C579D7C43D464961861776605C9C1F6C73FAD7B5C30412E1A6588E3AE1BB75C9E001D3DFF000AF04F89D790CD7CB0C29E58862F9874E589FE801FA107BD6F069BB221A6B73C85C9CE4FBFF3AD6BE60EA8DEA82B20FF008D5E94EE863FF76BB12337B18174B9FC2BB4F004BFE94CBFDE88FE84572170B915A9E10BBFB26A3164E0312873C70C0FF502B1AAAE9A35A7BA3DA2E39AAC071565F9F6F6FCAA1C62BC9DAE8F556C40B16E355A6630E702B463214D4AF0EF3C7FF5AB4488EA60DB6B1103B598023D6B61758B551CC883F215C6EBDE193237DA2D8946EE01FF003EF5CD4563730E4499C0FC4D5EC68A09EAF63D3E5D6ED0F01B3F4ACE92F20B83B4375F5E2B825CF39C8C74CF15642CD128623141AA8456CF53B75D315981EA3D7B56EC164AA3181C5799A6AF3A2E1188AB507892E2039DDBB1DA8D04E9BE87A9C702AF6A94E074AE474FF154373859BF76DEBD8D740F768CB953B87A8AB56399C5AD0A979EB54A2B8ED49733871C1F5AC4494A123359B2D6D63A6171EF4DF3EB1BED156524C826B2BD8BE527BCBC16D0B4ADC0507F3AF1CB8B86BC95A66FE226BAFF00165EF96AB688704F2FF4E303F9D7168BB8E057A3463A1E6D796B6342D50B607AD7D3BF0D74CFB3E96672A73712337DDCFCABC2F6F5DD5F3858C3F301EBC57DADE18D21ACB4EB78637DA1635C80719246E3FA9A759DB43382201023705338F541FD715516DE2FB546A88A36F270A3F0E33CF7AEC8DADCA72AD9C7BFFF005AAB496D72DC90370EE08CD719AD8E4FC446E0E61972441B4C6DB4052AD92CA31D7181F4AC2864128F90127D00CF63C0AF5CB8479D151A34600007775ACB8B499216CC6AA9C9E0631CD4A95B429C7A9E6DA5EE90ED0087C9E0F51C9EA2B5E76F2485246ECAFF00315D91D1D836E031F29CECC024FBFF00F5AA84FA25CC8B8014F20E0F5E0F1CD170E52AEB5318F54312B1DAD047F2FBE3B5656A1B84994CFDD3EE3A0C735B3A968D26A33F9F2078E40A172082381C75AC793C39331044CE8366DC153C9F5CAE7F5F5A84C9713183CC8ABFDE1136ECE78F4C63F1CD37734891B4921525070338EA7DAB61FC33740663B903E5C60EE1CFBE4743CD433689A9823CA9222B81D5BA1EE2AEE47233AE0B29EB29FC0530DA2B1CBB3363D4D33CC34A2435B58572DA284E140C7D29E767755FCAA9893D69DE652B05C9488FFBABF88A61B7B66FBD1AD3778A50DE98A4D243B8C1676B9C05DBBB838F4EFF00A66BE4FF001A5CC577A8DCCC83867207D13E51FCABEA0D6F511A658CD72703646707A609E07F3AF8E7529CBB127A9249FA939AEBA31576CC6A4BA18329C74E3AD5807F729F4354666EB5761E605F627FA5757533E866CC3AD5086636D3A4A3828C0FE46AFDC305ACA9F9E4567257D0B8BB6A7D0B6F702E635997A48A1BF31CD2B35723E0FD405C59F964FCD01DA73E87A1FA75AE98B5792D59B3D68BBA44C8D835A28C31594879AD053C714D031F300C2B9D9E0504935D0671D6B3EE501E455970938FA185F63867E18007DBFAD473E96D2A9D871F5A966529CAF150ADFCB1F04714268EF5CB2DF429DBE972C03E60187B5666A562E5CB44842E06463BFB574A97E1BAF14AD289860D3D3A09C22B5B9E7770AF6EBB806CFD0F6AB7A66A1A849F2471B95CF5C9C7E35DEC5A6C4E72E323D2B4D604846235541EC2838A6ECF4673F079C3025EBED5349160E455F2157DEA9CB203C0ACD911BEE4078E2B423611A166E02824E78E07F915440CB566F88B501676DE483F3CBC7B85EFC7A1E2A22B9A49152972A6CE2B51BA6BCB879893F39E01EC053ADD3154A152FC9FAD6BC295EC455924790DDDB3AAF0DDA7DAEF608B19DF222E3D727FFAD5F6A2D9C48020523680A307D00E95F21F81EDDE6D4E008429462E091C7CA0D7D4B617D77346A374393D48524F53D7D2B92ABD6C6B1363ECC17EEB48BFF02E2A4F2E55E1656FA100D67A5DDEC2C56548645EC72548FF001FE957A1BE6542CCABB80E14679FC4FA57397B0EC5C8FBA51BF020FE9FD6A4F32E53EF203FF02FF1AE70F8A0A1C18587273C83FCEA5FF84A213C3A3AFD17FC28B137EC6F0B994758CFE183FCE8378475127FDF3FE15883C4F6ABF7838FAA9FF0AD3B2D6ACEE72565418C71C679CF5CD160BB2637F17F16E53EE0D385F42DC6F5FC714F97C8B8E0BA3FE38FE5555F40B39865D46474F99BFC8A341EA5BF3633CE41A3747ED58A9A459DA9CED43F573C7E19AA8DA4A3312240A09E809C53E542D451C52E47D28C52102B43317228CD26DA5C52D804CD28A423D38FFF00567F9026BC93C51E3391D8DA69CDB235243C8392CDED8E807383DF3ED5A461CFA206D2D59A1F1375116F651DA03833B92C33FC31807047B922BE6EB9727AFF009CF35D1EAD7924A4798CCE40EAC73D7F9572B3B64D7A318722399BE67A19331EB576DDB101FF0078FF004AA329ED566DCE6375F439FCE8EA333E726A8B1AD0B85C566B715948B4743E17D44D8DD8463F24BF29CF4CF38AF5659C30FAFF003FF38AF040E5082BC303906BD2F46D585DC2A09F9D38619E7EB8F7C570558DB53D0A52D3959DF4041AD38941E2B9AB3B9C11EF5D143203D2B046E4CD09ED546589BA5741100C2A416CB9ABB129D8E1A6B663DAB35EDCA9AF4C3651B75154E6D2637E40C51CBD8BE63CE84241E956E287D6BA4974BD9D2AB0B529D4516683999144BB0524AF8153B46547154661B473412F5284B2E7A7155D47AD248E334D695635DCDC01D4FA562F57A16B4DC9249D2DD1A47C054193DBF0FC6BCCEFAF1B529DA539C1E83D055DD67566BF7F261E215E323F88F727F2E3F1AA1147B2BBE8D3E55CCCE2AD514BDD4598902800568C42AA27B55D8B8FF3EC6BAF6390F65F84F61F69BD9653FF002CA038E3F89D940FD037EBE95F408B254E9C609C71D31C7F407E86BC87E1147E4C1753639678E307D94313FF00A157B379E09EFCF3F8FF00915C135766EB4434DBA91CF5FA7F8520B7C0C038CD48B2E3AD384A0D6561DCCD6D1A02777209F7A4FEC68B1C356B798A68DCB4F50304E851E0E1CE7B55B834C112ED211FEAA2B4BE534EF968028369AA0E4469FE7F1A9DAD62E07963A76247F23568AFBD4663F435361EC731A868B24AFBA00C831DA4354174BBF418DCFC7FB47FC2BB6D8CBD0D37CB93DFF2A77B0AD728669334DCFA51CE33C003A93C01F5AD081D40F6AE1F58F1A4362C63B402775EAC4FCA0FB11C1F7F4E3D6B958BE215D0983CCB1B479E5141523E84F15B2A526AE43925A1E8BE25D44E97A7CB32F0EC3CB4FF0079B8C8FA0CFE15F3A48724927DCFF8FE35E89E31F12DAEAF670FD949C8766742082380173EA396E6BC9E7B93F7471D7F2C0FF135D9460E0B5329C93D11977926E627B5624ADD6B42E1B359527535D0CCCA5275A5B56C315F514AE2A056F2D81AC5E85A2C4EB9CD643F15BAC33595711E2A64BA948CF356EC6F5AC65122F4CFCC3D45532314D3E95CAD5F4354F9753D5ACAFD6551221F94F239FCC7E15D2D9DF8C0CD78A69DA8358BE324A13C8F4FA576F6D7BE600CA78EDCD724A36D8F46335248F58B4BC18CE6B622BA56AF29B7D48A77ADA8756E3AD426D1A5933D104E0538481AB898B561DCFEB5713565F5FD6AAE4F29D24801AA12851543FB4D0F7AA173A9A05383FAD3B8B95A2C5C3A815CEDCDCF3806AA5D6A9BFE553D6B02F3514B55DCE79F4CF27F0A9D5E887A4756694D70B1E5988007539AE2F53D59AF4F95092B183C91DEA85E6A125F9E32A9D87AFD69B1C5B062B7A74BAC8E6A952FA449228C28AB238A887152035DDA2D11C459438ABB0F503D48159A8726B5AD972C07A73FA1A047D35F0D6DFC9D243F796476FE4057A16E22B9BF095AFD8F49B68B183E5063FF0002CD7458AE196E6C3F79A50F4991E94023D2A463C498A5F3715112BE98A4C8ED401389A9DE71154F07B54807AD0172D89F1479FE955801EB410050172FADCE3B53BED8DED5999C74A67998EC7F2A5A05CC6BBF1169D6437493A0E0FDD3BB818C8F972013918CF5E71D0D7996BDE2E3AB12B09296E3850382DEEC14E4FE35E7ADAB79BF2372BF403F95624375E54AD1678CE573E87B7E15EAC68463AB672BA9D8EA669CB1CB11EC0703FCFAD5067F4A884B9A09CD75D96C8C1B77217B86154659158F3C718AB921159D291DA8B019B7031D2B3DF935A4E335419769E78A868A4552B5426E2B548E2B2AE462B1923545E8DB728A82E138A8AC9F72EDF4ABB22E45243EA73EE3155CF15A3709B4D67B0C573C958D10DE6ADDB5EC96A78395F4FF000AA7484E2B9DABE868A5CBB1DADAEA51CE38386EE09AD15B92BD0D79B862A72323DC55C8B529E218CEE1EF5972763A5553D096F5854835023BD70ABACBFF0010A986B20FF0D2E4657B43B43AAB8E05529AF89E5DB68AE464D55DF8518AABBE497EF3138ED54A0C9955B688DEB9D631948793EB593F3CADBA4249A2340B53D74C60A3B6E72CA6E5E838281D38A941A8A9E2B548CC929CA298A2AC2AD316C4D1AE2BA3D1AD8DDDC450AF2659110639FBCC2B0E25AF4DF86F60B75ABC2CC32B0079BFEF85C0FF00C798512D15C69EA7D2D0C4B022C4BC040147D14003FAD4829BFE7F2E3FA52F4AF3FCCD077D292933814B9A0028C514671400628C6280697340C42314DA79A4A006D14EE075A38A623E3A86320E6A9EA3114C4ABC1535791F14E963132953DC1AFA0679E436B71E6286ABEAF5CE59B9858C2DFC278FA1CD6F28F4A10DF41CF59F28E6B48A8AAF2C391C531190C3155DD37FE157644DA6A0C6DED53D4A28118E3D2B32E86056E491E79159370B9158C9168C9B5936498F5ADB2722B9D73E5B647AD6E4326E507D6B9E2FA1AB2BCC9B85644ABB6BA071C5634E9834A6BA8D19F4A3938A42306A6B74DE73E95CD62C0A6298462ADB2D43B69D84438A02E2A611D4CB1534808E38EAC85C74A72A6DA9556B451B12340A940A50B8A502AD2100152AAD228C5480555AC02AAD5845C5462A75A62B966215ED1F0A611F6B965FEE4047FDF4C3FC2BC6E21F9D7BEFC2CB703ED2DD8044FE66B3A9A2B1513D873C91E868340E7F1E7F53462BCF350C5252F4A0D00251463346DA00294527347DDE4F02818A698D22C632C70299B893F27E79E949F670799096F6ED40C4133C9C46BC7F79B8C7D3D6956DCB72EC777B5580B8181C0146DA00F8C0139ABA9D2B2F7E2AF40F915F44B43CD333518CDB4AB30E8DC1FD31FD6B42DE6C8156AEADC5CC253B9E9F5AE7AD2468C946EAA71F88A97A3345B1D286CD4C3159C8FC55B8DAA91990DCC39E4567B26DADE0030C1ACFB8876D4B40658E0D50BB840191D0D6895C5458DDF29E86A1EC688E32E5369AB3652E46DF4AB37F6DB09F4EC6B22093CA9315C7F0B365B1D1919ACC9D2B4D1B72D43347915B3574239D75ABD650FC848EE6A0B84DB9AD8B58B644A3D466B0512AE5478B155CC55AEE9C556298A7CA1729ECC548062A654E694A81472D82E3314F031463D29C0534842D2814EC628C55885C629F9C5251408914D5A8C5541C55B8A8034A05E7E82BE8BF85F088EC2599BFE5ACBFFA0AFF00F5EBE758FE54FAF1FAD7D0FF000E2FE37B53A78F9648CB38FF006B38CE3E9FD6B1AA9D8D627A7E3D29769151639E3B1C7F2FF1A76EC570963FA75A5E29A1C528607A5318B8CF4A4242F5A80CA01DA3E63EDDBEB408D98E5CF1D80A4038C99FB8327B1EC2956119DCE7737A761528007418A08A43148F4FCA9BB68E94734009B71453871D696803E1F95B6D59B792A9DC8DAD8F4A7DB9AFA13CE37A09318AC8D42DBC993CD5FBAE7F223FC73C7D2A6472B570E2E2331B77E9EC7B5263D8CB8E6ED572396B0A66685F637057FCE6A7867ED537B683B753A58A4AB05448BEF58B1C95A11C95688D8A13C654D5361835D0CB189871D6B12442A483D45263467DD43E7A103A8E95C6CC8637E9820D7758C735CF6AF6BB0F98BD0D73D48F53683B683ACE4DEA2AF32E462B9FB297CB6DB5D0A9EF4A3A8D98B71182E13D4D6D84D802FA0154963F327CFF0076B488CD34B726E56615015AB6C2A2DB458A2A6DA5D99A9F6D1B6A6C320098A5DB52914014EC21BB6971526314845310CC518C53B15205A0060156E25E6A30B56631B79F4A06585E6409D96BAFD1351304D98D99483F2ED386C8C700F400F7CF5AE2AD9F1BA43EF5774EB9C303D89FEB4593D186DB1F4E787FC6105F8F2AE4B23023796E801C852FEA8C46038F9548C13C8AEE360381C138E7DB3DBE98E9EB5F37D96ACA2DDE0BA7996029E533445331AEFCE4AB236F43FC5F3295C0DB9C9C769A36B17DA322EF97EDFA5B9F966425BCB078018754EDC1C6315C5529DB6358CBA1EAD2958C818CB67A7F8D46D6CD21F998853FC207F5A9AD5D248D648889158021BD73EFDEA6F7AE4775A1A15E3B6587EE74FCCFE35364D3B38A66EC503169D9A5C8A6668016940A653F3400CC30E98A4FC2A4FA518A00F89B5350B29C557B7AB3AA7FAD355ADEBE84F391645588CE0D561D6ACA75A101435B50A118704F53F95655B9FE75ADAE7DD4FF003E95916FFD4D633DD151D99A9031AD38C9ACBB7AD38EAD099A11922A1BF50143639F5A963A66A1F7056841906A86A280C0D91D2AF1AA77FF00EA1AB296C6B138D8F8607EB5D1C24ECAE713EF0FC6BA287EE57343A9A489AD0659CFBD5A6EB55ACFEF3FD6ACB75ADFA104469294D2548C65145148068A4C52D1400B8A314B452431A453C530D3C55089853E43B63623DA9829D2FF00AA6FC3FAD2EA50D3C4271E8292C09047E1FCE95BFD49FA0A6D8F51F87F3A101DC58B12CCA7A30208F5E956BC217B35A6AC96D139586590ABC7C1561C7055B23B9AA761FEB0FE3FCA9DE18FF90DC3FF005D4FF4A52D847BE68BFE8BABCF611656D95432C79CAAB36EC919C919C0E840AED87407BF4FCAB89D33FE460B8FFAE69FC9ABB65FBA3F1AF325F11D0B610D028340AC91A3129296928105145148032474A941A86A61401FFFD9)
INSERT [dbo].[employees] ([EmployeeID], [Username], [Password], [DepartmentID], [VacationsBalance], [WarningPeriod], [NameAr], [NameEn], [DOB], [Gender], [MaritalStatus], [Nationality], [Religion], [BloodType], [IdentityType], [IdentityNumber], [IdentityReleaseDate], [IdentityExpiryDate], [PassportNumber], [PassportReleaseDate], [PassportExpiryDate], [PassportCountry], [Phone], [Mobile], [Email], [Address], [NoConviction], [BankAccount], [BankName], [IBANNumber], [SWIFTCODE], [PaymentType], [EducationCertificate1], [EducationCertificateFromDate1], [EducationCertificateToDate1], [EducationCertificateSource1], [EducationCertificate2], [EducationCertificateFromDate2], [EducationCertificateToDate2], [EducationCertificateSource2], [EducationCertificate3], [EducationCertificateFromDate3], [EducationCertificateToDate3], [EducationCertificateSource3], [WorkExperience1], [WorkExperience2], [WorkExperience3], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [BasicSalary], [TransportationCompensationType], [HousingCompensationType], [HiringDate], [Sequence], [UnifiedNumber], [ResidenceDate], [JobID], [WorkHours], [JobDescription], [Guarantor], [ManagementID], [IDNumber], [WorkPermit], [WorkContract], [IsBarcodeUser], [Image]) VALUES (9, NULL, NULL, NULL, 150, NULL, N'نجاح', N'najah', CAST(N'1984-01-18T00:00:00.0000000' AS DateTime2), N'male', N'Single', 57, NULL, N'', NULL, N'414785236985', NULL, NULL, N'', CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), NULL, NULL, N'54546', N'najah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Informatics Engineering', CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), CAST(N'2000-11-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', NULL, CAST(N'2023-01-30T22:45:47.8823338' AS DateTime2), CAST(N'2023-02-03T15:36:36.6384147' AS DateTime2), 1, 1, 1, CAST(1200.000 AS Decimal(20, 3)), NULL, NULL, NULL, N'', N'', NULL, NULL, 8, N'', N'', NULL, N'1478521', NULL, NULL, NULL, 0xFFD8FFE000104A46494600010100000100010000FFDB008400090607080706090807080A0A090B0D160F0D0C0C0D1B14151016201D2222201D1F1F2428342C242631271F1F2D3D2D3135373A3A3A232B3F443F384334393A37010A0A0A0D0C0D1A0F0F1A37251F253737373737373737373737373737373737373737373737373737373737373737373737373737373737373737373737373737FFC00011080082007703012200021101031101FFC4001C0001000203010101000000000000000000000607030408050102FFC400431000010303000606070408050500000000010002030405110612213141510713226171911532425281A1D11455629408338292A2C1E1F084B1C2C3F11623345372FFC4001A010100030101010000000000000000000000010204050306FFC4002D1100020201030203060700000000000000000102031104122113143141B105226171C1F0425152628191A1FFDA000C03010002110311003F00BC5111004444011695DEEB4567A27D65C676C30337B8F13C80E27B9545A47D2FD6CB2BE2B244CA484640964687CA7BF1EAB7C0E509C17522E697F485A48F76B3AF35B9EE2D03C80C2F5ECFD29E91533DBD6D4B2B63E2CA88403F07371F3CA0C17FA2AC874C36E6D231D35AEA84F8EDB048DD407B9DBFE494BD3359A49756AA82AE16FBED735E07CC20C166A2F2EC5A436ABFD375F69AC8E768F59A0E1CCF169DA17A88404444011110044440161ACA9868A966AAAA9047042C3248F76E6B40C92B32ADBA72BCBA8346A1B7C2EC495F2EABF0707AB6ED3F3D54055BA77A5F55A537674A4BA3A38C96D3C39F51BDFDE78A8BB5A5C70DFE8BE2FB9562E65D68A3F5407BFDE3BBC96582591C5F23DE7518370E256AB5A5CE0D68C92BD482944B05563261A580BE4206D73DDD98DA3BCBC8D9C8146F04A59356A677B6521A46AE01C119584BA393D6688DDEF3777C42DDBEDBA5B5D73E8E7FD6421AD7F896877F3C7C179A89E5643583D1B35DABAC3728EB2DF33A19E33BC6D0E1C88E20F25D35A277E87492C905C601AA5E35658F39EADE378FA7710B9549C80396E56EF4097322AAE16C73B63E213B5BC8B48693E4F6F928655973222282A111100444401517FA404EE7690DAE0C9D58E90BC0FF00E9E47FA55E8A89FD20A173748ED3280E265A42C6803392D7EEF1ED8425158676E02FD01C00CAC93D25552102B2967A67BFB4D6CF139848E63216DDBECF72AF6B5D474733DAF3AAD7061ED1EEFAAB6560BE0C1102C2190B4BE7908680D19C13B80E65599A15A27570C34D25DA0FB3C514BF68EA1C417CD37B2E7F00D68DCDE7B4E372D0D13D18B8582EF4B555F6F82A249086B475D830677B9BB355C71C3208C1C6559A3FBC2C3A8BFCA26CD3D1E722BEE942C2E998DBDD3B35BAB8FAAAB68DFA80E5AFF81273DC472557B9BAA77823810AEE86BF482EDAC68ED515251925BD655F6DCFFD90401E654074A3422AE8335343139EC7125D0323C6AF1EC00E7647E1CE766C046EBD13DAB648A5F0DCF74486AB17A09713A633379514BE5ACCFE8ABB0C7BF5B518E76A8CBB55A4EA8E655A3FA3E52F5B7BBB5763B31D3362047E3767FDB0B59919792222A95088880222200A2FA656AA7ABA8B7D7CAD066A43236338CE35C0C9F1D9F352855F74B7A5A747692829A9A38E5A9A9975DCC7F089BEB78124800F8AA591728348F4AA4A3626CF12F766A2BD40D8678229648E66F50F9B2430923586C20E0E3042C97BB75F0E8C4D516FA7FB23600E73A1A52C88318CDA71CF773E1B961D1DD20A0D228AA20A08E682584324709403AAECF64820EDDAD5ED35948C826A796696862A825D3D3B9C3A87B8EF2DD6040CEFECE0EDDA32564A27D37B666ED5C3AAB756FE845B42AAAED5BD7D357974D4A1C2292405A5D0BC9C35C1C361191BF811C7849DB515753434D2490B591D5756C710F21CD0E2013F1C9DDB4647C33D3B29A0A17D059D81B1C9B24958DC0C73D6F68F2C671C70B6E5A76BA8846C708C0C18C8DBAA41CB4E3B880A2F956E598A234F1B543163E7EFFB235A6F577D75B1D25969278EDF1BF50CF1EA83D9C8381C1A08C671C178BA390E905D6CC2A682E388E49843236B30F6B7233ACD3B0E46366DDBB3729C55CD4B596DF46DD408A1D99648486123710EDC79F3E616A328E90B228688BE56C273138E043092305E0001AE7E3383B48E602F7EB55D3C63933746F76E73C7CFFCC19345ED305B681B2B25965A9AE027A9A99482F95E5A390180380522D14B1D1DA5F71A8A38DB19AE9C4B235A30010D0367C727C49517BEE9459746A0A7A7AF7CA25EAB5E08628DCE2E6838033B86EE24290681DF5D7AA4AC6CAC63248260E66A6E7C32344913FE2D763C4154A14DC9C9F81E97B8A8A8A250888B598C222200888801DCB9E7A55AC370BD5756B8E5BF693454C0F08A003AC23C657FF0AE8479D5693C865734698B8BE8AC476FFDEB67DB0E7DE9A791EEFF0031E4A5128D7E8EAEACB6E9435933C361AC675049DC1D9CB4F9ECFDA5774672CEF1B0AE65A8D8D930786F567F47DD20C552C86D77C9432AB6322A971C365E41C783BBF8F8AC7AAA5B7BE26FD2DC97B922C696A69D85CC966635C06D05D83B561757D333B26A3541FC1FD12B2090CB1D651B5A6A22696E1C011234ED2D39E1B02C4DBEC8C3A8347E91B2FBCDA676FF000C7F3592318BF1674545B5C2CFF291B31565338C71C5287976C686F76FF2D9E6B6769EF5AD07DA2798D5D711D739BAAD601811337E001FDEE55D748DD20B29D9359EC336B541CB2A2AA33B23E6D61F7BBC6EF1DD30ADCE5889E16D91AD6591DE90EED1DDB4BEA5D0383A0A5636958E0721DAB92E3FBCE70F82B4FA1F93ADA5B7D43460CD6C753C9FE1E7735BFC322A0E9C6D000D985D05D06D39FF00A49952FC63AD9991F86BE5DF3C792EAA585847224F3CB2C8444428111100444407C232083C573C69F5BDF4715AE295A1A68BAFB5C807B218FD787F7A37B5CBA214734D344E934A2D5534EF222AA7B0755381EABDB92C2798049F839DCD09472C5433D6046F185E6F71F8A92DF2D95B6AB8CB4374A7753D547EBB4EE77E269E20F35E1D440ED6D668CE4ED038956F224B37A27D23B8CB0D5D1D64CEA88299B19883CF69A0EB646B6FE037AB245CE98B724B81E5850BE8A74627B659EA6A6E94E639AB9CC2D89FB1CC8DA0E09E44971F92964B69FF00D328F07FD572AF70763C1D5A372AD6486F4A97FAC82C51C74323E9DB3CC237961C39CDD571233C3E0A9C8DBACF68E1C55CDD2468ED75668E3DF4F175B2534825D466D25B820E071D872AA3A4A738D63ED792D9A6C6CE0C5AA4FA9C9B5061A1CF3B03464AEA1E8E2D4FB36855AA92667573753D6CAC3BDAE792F20F86B63E0AA2E8BF4166BF564371B8539659E070782F1FF94E1B9A07160E2771DDCF1D04B433330888A08088880222200BE15F5417A4AD377E8D322A0B731AFB8D4B0BC3DFB5B03376B11C4939C0DDB0E791B462E4F08ACA4A2B2CDAE9165D1416C0CD298A298E098236FEBF3CD846D1E3BB9A85E84D8346C37D296B6CD5126B76455B9AE7D31F7700019EFC67BD5735955515B55255564EF9E794E5F248724ACF68BA55DA2AC54D14A58FF69A76B5E3910B45DA172AF117C99A8F68A85B992F74BC9145AC7A6F6DB831ACAC77D8EA371121EC38F73BEAA482A607375DB3C65BCC3C2E0594CEB789AC1F4955D5DB1CC1E4CBE0A2978B66885A2E02F177B5B667977EA58486B9DCFABCEA93E3B16C5EF4BEDD6C639B1C8279F832339FF8558DDEE95576AA35154EC9F6580EC685BB43A4B672DCF88FA983DA1ADAAB8ED5CCBD0E8EB05E6D77AA16D45A2A23961680D2D66C319F75CDDED3DCBD45CB16DB8D6DA6B1B5D6DAA7D354B373D9C47270DC477157A746FA6E34B68E68EA616C171A40DEBD8CF51E0E70F6F76C3B3877ADF750EBE5781CDA350ACF993344459CD0111100444407C2B9AB4FEF22E9A6D779FACD68A39BECF1FE111F64E3F6838FC574A90B44D96D64926DB46493924D3B76FC97AD362AE59C1E56D7D48ED396C4D19F6DBE6BEEBB3DF6F9AEA3F42DABEECA2FCBB7E89E85B57DD945F976FD16AEF3E064EC7E272EEBB7DE6F9AFA240D1812003902BA87D0B6AFBB28BF2ECFA27A12D3F76517E5D9F451DE2FD24AD135F88E5CD760F69BE6BE19A31ED8F35D49E85B57DD945F9767D13D0B6AFBB28BF2ECFA29EF17E43B1FDC72B49335C3008F1CA94F45175F46E9ED0375808EB58FA57EDE6359BFC4D68F8AE80F42DABEEDA2FCBB7E8BEB2CF6C8DED9196EA46BDA72D7081A083CC6C549EA54E38C1E95E9B63CA66F0DC888B19AC22220088880222200888802222008888022220088880222203FFFD9)
INSERT [dbo].[employees] ([EmployeeID], [Username], [Password], [DepartmentID], [VacationsBalance], [WarningPeriod], [NameAr], [NameEn], [DOB], [Gender], [MaritalStatus], [Nationality], [Religion], [BloodType], [IdentityType], [IdentityNumber], [IdentityReleaseDate], [IdentityExpiryDate], [PassportNumber], [PassportReleaseDate], [PassportExpiryDate], [PassportCountry], [Phone], [Mobile], [Email], [Address], [NoConviction], [BankAccount], [BankName], [IBANNumber], [SWIFTCODE], [PaymentType], [EducationCertificate1], [EducationCertificateFromDate1], [EducationCertificateToDate1], [EducationCertificateSource1], [EducationCertificate2], [EducationCertificateFromDate2], [EducationCertificateToDate2], [EducationCertificateSource2], [EducationCertificate3], [EducationCertificateFromDate3], [EducationCertificateToDate3], [EducationCertificateSource3], [WorkExperience1], [WorkExperience2], [WorkExperience3], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [BasicSalary], [TransportationCompensationType], [HousingCompensationType], [HiringDate], [Sequence], [UnifiedNumber], [ResidenceDate], [JobID], [WorkHours], [JobDescription], [Guarantor], [ManagementID], [IDNumber], [WorkPermit], [WorkContract], [IsBarcodeUser], [Image]) VALUES (10, NULL, NULL, NULL, 0, NULL, N'دينا', N'dina', CAST(N'2023-02-09T00:00:00.0000000' AS DateTime2), N'female', N'Single', 169, NULL, N'O+', NULL, N'147852369852', NULL, NULL, N'', CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), NULL, NULL, N'95896544785', N'يبيب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'ششش', CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), CAST(N'2000-11-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', NULL, CAST(N'2023-02-02T23:40:41.8816488' AS DateTime2), CAST(N'2023-02-02T23:40:41.8817138' AS DateTime2), 1, 1, 1, CAST(1500.250 AS Decimal(20, 3)), NULL, NULL, CAST(N'2023-02-03T00:00:00.0000000' AS DateTime2), N'', N'', NULL, NULL, NULL, N'', N'', NULL, N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[employees] ([EmployeeID], [Username], [Password], [DepartmentID], [VacationsBalance], [WarningPeriod], [NameAr], [NameEn], [DOB], [Gender], [MaritalStatus], [Nationality], [Religion], [BloodType], [IdentityType], [IdentityNumber], [IdentityReleaseDate], [IdentityExpiryDate], [PassportNumber], [PassportReleaseDate], [PassportExpiryDate], [PassportCountry], [Phone], [Mobile], [Email], [Address], [NoConviction], [BankAccount], [BankName], [IBANNumber], [SWIFTCODE], [PaymentType], [EducationCertificate1], [EducationCertificateFromDate1], [EducationCertificateToDate1], [EducationCertificateSource1], [EducationCertificate2], [EducationCertificateFromDate2], [EducationCertificateToDate2], [EducationCertificateSource2], [EducationCertificate3], [EducationCertificateFromDate3], [EducationCertificateToDate3], [EducationCertificateSource3], [WorkExperience1], [WorkExperience2], [WorkExperience3], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [BasicSalary], [TransportationCompensationType], [HousingCompensationType], [HiringDate], [Sequence], [UnifiedNumber], [ResidenceDate], [JobID], [WorkHours], [JobDescription], [Guarantor], [ManagementID], [IDNumber], [WorkPermit], [WorkContract], [IsBarcodeUser], [Image]) VALUES (15, N'', N'c4fe8ffb8808fed7269bf488a4debc4', NULL, 21, NULL, N'شادي سليم', N'SHady Sleem', CAST(N'2000-02-01T00:00:00.0000000' AS DateTime2), N'male', N'Single', 51, NULL, N'', NULL, N'123456789123', NULL, NULL, N'	A1214698', CAST(N'2020-01-08T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-08T00:00:00.0000000' AS DateTime2), NULL, NULL, N'1234567892', N'majed.ayoob@teml.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'بكالوريوس خدمة اجتماعية', CAST(N'2017-09-03T00:00:00.0000000' AS DateTime2), CAST(N'2020-06-10T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'خبرة 3 سنوات في الاستقبال', N'', N'', NULL, CAST(N'2023-02-01T00:17:43.9536130' AS DateTime2), CAST(N'2023-02-03T23:42:25.6837482' AS DateTime2), 1, 1, 1, CAST(300.000 AS Decimal(20, 3)), NULL, NULL, CAST(N'2021-02-03T00:00:00.0000000' AS DateTime2), N'1234', N'1234', NULL, 1, 8, N'القيام بمهام السكرتارية', N'	الشركة', 1, N'122', NULL, NULL, 1, 0xFFD8FFE000104A46494600010100000100010000FFDB008400090607080706090807080A0A090B0D160F0D0C0C0D1B14151016201D2222201D1F1F2428342C242631271F1F2D3D2D3135373A3A3A232B3F443F384334393A37010A0A0A0D0C0D1A0F0F1A37251F253737373737373737373737373737373737373737373737373737373737373737373737373737373737373737373737373737FFC000110800AD00AD03012200021101031101FFC4001C0001000105010100000000000000000000000701020305060408FFC4003D100001030302030505050606030000000001000203040511062112314107135161711422328191425262A1B1537282B2C1D134436392A2D2152324FFC4001A010100020301000000000000000000000000010402030506FFC4002711010002010401030305000000000000000001021103122131042232610513E1235271A1D1FFDA000C03010002110311003F009C511101111011110111101111011110111101111011110111101111011110111101111011158E91A399417A2C2653D365697B8F541E845E6C9F129C47C4A0F4A2C01EE0AE6CBE2832A2A020F22AA808888088880888808888088880A84E064A1200C9581EE2E3E482AF938BE1D959CF9F344404444044440444415C91C9656499D9DCD61441EA458A37F43CD6540444404444044440445648EC0418E4764F0AB139EE88088880B92D5DDA2E9ED2921A7AE9E49EB00FF0B4AD0E78FDE2480DF99CF92E82F77282CF68ABB8D5BF821A689CF73B19C786DD77C2F8FAB8D4D64F3DC26123C4F339CE988387389C9DFC77FCD04CD3F6F7171FFF003D85E59FEA540CFE416C2C7DB5525D2E31D3CF6CF638035D24F3C93E4318D049C00373D00F3500709CE31B8E8ABC0E6B788E403B7AA0FB034B5EE3D4364A7BA451F74D9C1708CB81735B93C39C75C60ADB2F9E3B09D48DB4EA37DA2A18EEEAEBC0D63CBB6648D0EE1DBAE738FA2FA1D0111101678DDC43CD605730E1C107A11110111101111016198FBD859979DFBB905A888808888383EDBDEF6F6735E19C9F2C2D77A7780FEA02D3684B5414BA36DB13D8D944F0B677F18E204BC7163E595D1F6B50BEB3455C2898CE232C7C608E60B087803D7857316BA5AFAEA67D0CB29A082DE594F0B69E47873D818D2D739CD70E846DEAAA7936CC62270BBE25713998CB6174D2B62BA826BAD903E47633231BC0FE7F79B82B2C1A72CD4E22115B29B10B786305990D1CCE33E3D4F5EABC75125D6CBC0D843EEE26243637CA23747C20927888391D3E8AE16EADB944CA99AE93C4D99A1ED86091CD6B0119C7134B4BBD76553D58F770BDE8CFB79721AF28A3B76BBD2F72A76E1D2D4C638072CC72308C0FE20A7E3B12A12BDD356D66A0B332A5B1CCCB65CA331D4EE0C9EE778E6B864FDC60CF9A9A617BA486391E30E734123C174342DE98ACF6E67915C5A6D8E17A222DCAE204441E88CE5815CB143C88595011110111101798F33EABD2BCCEE650511110509002A0703B9470CA06A0F15EE8D970B554C04E098DDC2EF0385C0589D3DC6D34572A4AB6453CD4EC6D4B248FBC617B460EC08208208E7B8525860C61D8217CE9AB6BAF9D9F5EEE164A1AAE0A399CEA8A5718DAE2D6BCE7627911C8FA67AAD1ADA5BFA58D0D6FB7C5BA49D034455665AEAD825A96B0B5AC6811B6369C13EE924E4F892790E4B1D3C152C616DB6E34CEA604F0B6583BD31FE10E6BDBB0E9919C7551EDB2D5A2AE16382E777AC9E6AB95ED65439F3BB8C4AE38C168E9E7F9AF0EA2B850E8BBBB23D1F709039CD3ED51710962CF4E7D7D392AB1A3999889FEB85B9D7C46E98E3F9E5285BE9E37EABA0B6BE532BBBA9AB6A5EEC02E396B5BB0E40FBC3D0290C118DB928BFB1AA1B85C856EADBCC9C73D6910D38C7086C6D3B903C33800791F15268691B655DD3A6D8F951D5D4DF6F864041E48AC0081B615FE8B635088883243CCFA2CCB0C3CC9599011110111101609061EB3AC530EA8312226101179AE170A3B6D399EE1550D3443EDCAF0D1F9AE16F5DAD59E9389968A79AE120C8E320C51E7D48C9FA2CA2B69E877B5D550D0D1CF5752F0C8618CC8F7138C0032A38D67618B5E699A0BA167713CD4D1CF1BB9F745CD0784F88DF07D1709A9B5C5EF5244EA7AC9A3868CB81F66A76F0B4F8711392E3F979291BB25B83AB34A8A790F13A8E67423C9A70E03E852FA53B32CA97DB3CC661F3EDD2C773B5D4982BA8E56386C1C184B5E3C41EAB7FA3342D7DF6AA37D641353D083CDCDC3A5F2683FAF253EDDA8191112C258D6B9C01638E064F82D85BE8994AC073C523BE27FF6F255B76ADA76E31F2B334D2AD63522739EA3FD79282BA9AC75D67D3DC0C67B54133A2C1C0698F83DC03CC38FFB5746A04ED3AEB34DAC9E2195CC340D6322734E0B1DB38907C7247D16C6C7DAC5DE93862BB53C35F10DBBC68EEE5C79FD977D02B71A33158C2A4DB74E653522E52C7DA269CBBB9B08AC34952EC011558E0C9F277C27EB9F25D5821CD0E0416919041E6B09898EC111140CD08F772B22A3460615501111011110151C320AAA20D2EA0BDD069EB7BAB6E7298E20785A1A32E7B8FD903A9D8A896FFDABDD6B78E2B3D3B6DD11D848FC492E3F95A7E45769DAE697ABBF5A21ABA073DF350173FD987291A719C7E218DBE61413B74E4B7E956B3194335655D4D7CE67AEA99EA663FE64D217BBEA792C288B7A0526F62B558379A739C37B9940F1CF183FCA1464BBDEC79FC37BB8479F8E943BE8F1FF006586A7B646DAFF003D5CF739FDADDEF31D86B79868E98F961745A26A6ADD04B14C49A7610185DB969EA0792D66B3635B7285CDC073E11C5E7B9C2DFE98631B66A4E1FB4097799E2395CEAC4FDC7A5F375693F4EA4C57BC210D4F51ED5A96ED378D6CCD1E8D7968FC805AD592AA4EF6AE797F692BDFF5712B1AEA474F347AF25B6B26A6BD58A40EB6DC668E3CEF038F144EFE03B0F960AD4A24C44A530E9AED6296A9F1D36A0A6F6379D854C4EE28B3F881DDBCF9EE3D149D100E39E617CC160B2D5EA0BA436DA08C3E59377388CB636F573BC82FA6ED5442DD6DA5A26CB24A29E16C42490E5CEE118C9F3D956D4AC56784BD6888B50222202222022220A1514F691D9CBAA2496F1A7A11DE9CBAA691A3E33D5CCF3F11D79F3E72BAA104A9ADA6B3981F2560824104381C1046083E08BE83D65D9E5B752F1D4C44515C0EFDFC6DDA43F8DBD7D763E7D1433A8B485EF4EC87FF002144F7419F76AA105F11F523E1FE2C2B55D48B21A25DAF64AEC6A799BF7A8DE3FE4C2B891B8DBAAEC3B2A786EAC19381ECD264F96C7FA29BFB65311CBA9D51377D79947ECDA183F5FD495BDD27520D9DED3CE073BE877FEEB919E53513C933B9C8F2E3E595B7D3551DD8B843D1F4AF78F5683FD0FE4B9749FD47ADF3BC6C7D3F67EDC7E5100E4AAA8DF842B98C7C8F0C898E91EED8318D25C7D00DCAEB3C8AD5B2B0D92E1A82E0DA1B5C1DE4A7773CECC8C7DE71E8175DA57B2DBB5D8C73DE0BED94870781CD1DFB87EEFD9F9F2F053258AC56EB0D10A4B5D33208B39711BB9E7C5C7993B2D57D588E86BB45E92A2D296EEE60FF00DB57260D45491BC87C07834740BA44455E673CCA444450088880888808888088880AD73439A5AE0083CC1EAAE441CA5E7B3BD31777BA59ADC209DDB99695C62713E606C7E60AD35BBB2EA6B45C5F596FB9CE730C9108E66038E218CE461488ADEAB2DD38C26276CE611EBB40D6B7E1AD808F3610BD143A1EAA091CF7D74438A37C678633F69A478F9AEEF01516BD9589E17EFF0054F2AF49A5ADC4FC238B6F63B65840F6FAEADABC632D0E1103F419FA10BB4B369CB358D85B69B7C14D9E6F6B72F3EAE3B9FAADA0E4AAB39B4CF6E7A80615511402222022220222202222022220222202222022220222202222022220222202222022220FFFD9)
SET IDENTITY_INSERT [dbo].[employees] OFF
GO
SET IDENTITY_INSERT [dbo].[employeesTrainings] ON 

INSERT [dbo].[employeesTrainings] ([EmployeesTrainingsID], [TrainingID], [EmployeeID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive]) VALUES (1, 1, 1, NULL, CAST(N'2023-02-03T22:43:13.9222664' AS DateTime2), CAST(N'2023-02-03T22:43:13.9232645' AS DateTime2), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[employeesTrainings] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([ImageId], [docName], [docnum], [image], [EmployeeID], [MessageID], [EventID], [TaskID], [CharityID], [CustodieID]) VALUES (3, N'', N'8f14e45fceea167a5a36dedd4bea2543-cer1', NULL, 7, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Images] ([ImageId], [docName], [docnum], [image], [EmployeeID], [MessageID], [EventID], [TaskID], [CharityID], [CustodieID]) VALUES (4, N'', N'c9f0f895fb98ab9159f51fd0297e236d-cer1', NULL, 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Images] ([ImageId], [docName], [docnum], [image], [EmployeeID], [MessageID], [EventID], [TaskID], [CharityID], [CustodieID]) VALUES (10, N'chozen', N'd3d9446802a44259755d38e6d163e820-cer1.txt', NULL, 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Images] ([ImageId], [docName], [docnum], [image], [EmployeeID], [MessageID], [EventID], [TaskID], [CharityID], [CustodieID]) VALUES (32, N'', N'45c48cce2e2d7fbdea1afc51c7c6ad26-cer1', NULL, 9, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[jobs] ON 

INSERT [dbo].[jobs] ([JobID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive]) VALUES (1, N'سكرتيرة', NULL, CAST(N'2023-02-03T23:41:09.4743283' AS DateTime2), CAST(N'2023-02-03T23:41:09.4743283' AS DateTime2), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[jobs] OFF
GO
SET IDENTITY_INSERT [dbo].[managements] ON 

INSERT [dbo].[managements] ([ManagementID], [BranchID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [ManagerID], [Mobile]) VALUES (1, 1, N'ed', NULL, CAST(N'2023-02-02T23:52:26.0118159' AS DateTime2), CAST(N'2023-02-02T23:52:26.0118159' AS DateTime2), 1, 1, 1, 1, N'95896544785')
SET IDENTITY_INSERT [dbo].[managements] OFF
GO
SET IDENTITY_INSERT [dbo].[Resignation] ON 

INSERT [dbo].[Resignation] ([ResignationID], [EmployeeID], [Reason], [ApprovalID], [Type], [IsApproved], [ApproveDate], [Dues], [VacationsAccount], [Reward], [CreatDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive]) VALUES (1, 9, N'', 1, N'dismissal', 1, CAST(N'2023-02-03T15:43:30.8546291' AS DateTime2), CAST(0.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(N'2023-02-03T15:43:30.8565738' AS DateTime2), CAST(N'2023-02-03T15:43:30.8565738' AS DateTime2), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Resignation] OFF
GO
SET IDENTITY_INSERT [dbo].[scheduledJobs] ON 

INSERT [dbo].[scheduledJobs] ([ID], [Name], [ScheduleDate]) VALUES (1, N'DialyTasks', CAST(N'2023-02-03T00:10:16.9384357' AS DateTime2))
SET IDENTITY_INSERT [dbo].[scheduledJobs] OFF
GO
SET IDENTITY_INSERT [dbo].[trainings] ON 

INSERT [dbo].[trainings] ([TrainingID], [Name], [Description], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [StartDate], [EndDate]) VALUES (1, N'شس', N'يشسي', NULL, CAST(N'2023-02-03T22:43:13.8325073' AS DateTime2), CAST(N'2023-02-03T22:43:13.8335043' AS DateTime2), 1, 1, 1, CAST(N'2023-03-07T00:00:00.0000000' AS DateTime2), CAST(N'2023-03-17T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[trainings] OFF
GO
ALTER TABLE [dbo].[branches]  WITH CHECK ADD  CONSTRAINT [FK_branches_companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[companies] ([CompanyID])
GO
ALTER TABLE [dbo].[branches] CHECK CONSTRAINT [FK_branches_companies]
GO
ALTER TABLE [dbo].[charitys]  WITH CHECK ADD  CONSTRAINT [FK_charitys_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[charitys] CHECK CONSTRAINT [FK_charitys_employees]
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
ALTER TABLE [dbo].[confirms]  WITH CHECK ADD  CONSTRAINT [FK_confirms_events] FOREIGN KEY([EventID])
REFERENCES [dbo].[events] ([EventID])
GO
ALTER TABLE [dbo].[confirms] CHECK CONSTRAINT [FK_confirms_events]
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
ALTER TABLE [dbo].[confirms]  WITH CHECK ADD  CONSTRAINT [FK_confirms_salaryIncreases] FOREIGN KEY([SalaryIncreaseID])
REFERENCES [dbo].[salaryIncreases] ([SalaryIncreaseID])
GO
ALTER TABLE [dbo].[confirms] CHECK CONSTRAINT [FK_confirms_salaryIncreases]
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
ALTER TABLE [dbo].[dailyTasks]  WITH CHECK ADD  CONSTRAINT [FK_dailyTasks_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[dailyTasks] CHECK CONSTRAINT [FK_dailyTasks_employees]
GO
ALTER TABLE [dbo].[dailyTasks]  WITH CHECK ADD  CONSTRAINT [FK_dailyTasks_tasks] FOREIGN KEY([TaskID])
REFERENCES [dbo].[tasks] ([TaskID])
GO
ALTER TABLE [dbo].[dailyTasks] CHECK CONSTRAINT [FK_dailyTasks_tasks]
GO
ALTER TABLE [dbo].[departments]  WITH CHECK ADD  CONSTRAINT [FK_departments_managements] FOREIGN KEY([ManagementID])
REFERENCES [dbo].[managements] ([ManagementID])
GO
ALTER TABLE [dbo].[departments] CHECK CONSTRAINT [FK_departments_managements]
GO
ALTER TABLE [dbo].[DocumentCategories]  WITH CHECK ADD  CONSTRAINT [FK_DocumentCategories_DocumentCategories] FOREIGN KEY([ParentID])
REFERENCES [dbo].[DocumentCategories] ([CategoryID])
GO
ALTER TABLE [dbo].[DocumentCategories] CHECK CONSTRAINT [FK_DocumentCategories_DocumentCategories]
GO
ALTER TABLE [dbo].[DocumentCategories]  WITH CHECK ADD  CONSTRAINT [FK_DocumentCategories_employees] FOREIGN KEY([CreateUserID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[DocumentCategories] CHECK CONSTRAINT [FK_DocumentCategories_employees]
GO
ALTER TABLE [dbo].[DocumentCategories]  WITH CHECK ADD  CONSTRAINT [FK_DocumentCategories_employees1] FOREIGN KEY([UpdateUserID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[DocumentCategories] CHECK CONSTRAINT [FK_DocumentCategories_employees1]
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
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [FK_employees_managements] FOREIGN KEY([ManagementID])
REFERENCES [dbo].[managements] ([ManagementID])
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [FK_employees_managements]
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
ALTER TABLE [dbo].[evaluations]  WITH CHECK ADD  CONSTRAINT [FK_evaluations_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[evaluations] CHECK CONSTRAINT [FK_evaluations_employees]
GO
ALTER TABLE [dbo].[evaluations]  WITH CHECK ADD  CONSTRAINT [FK_evaluations_employees1] FOREIGN KEY([ReviewerID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[evaluations] CHECK CONSTRAINT [FK_evaluations_employees1]
GO
ALTER TABLE [dbo].[events]  WITH CHECK ADD  CONSTRAINT [FK_events_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[events] CHECK CONSTRAINT [FK_events_employees]
GO
ALTER TABLE [dbo].[events]  WITH CHECK ADD  CONSTRAINT [FK_events_employees1] FOREIGN KEY([BranchManagerID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[events] CHECK CONSTRAINT [FK_events_employees1]
GO
ALTER TABLE [dbo].[events]  WITH CHECK ADD  CONSTRAINT [FK_events_employees2] FOREIGN KEY([ManagementManagerID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[events] CHECK CONSTRAINT [FK_events_employees2]
GO
ALTER TABLE [dbo].[highrManagment]  WITH CHECK ADD  CONSTRAINT [FK_highrManagment_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[highrManagment] CHECK CONSTRAINT [FK_highrManagment_employees]
GO
ALTER TABLE [dbo].[hourlyPermissions]  WITH CHECK ADD  CONSTRAINT [FK_hourlyPermissions_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[hourlyPermissions] CHECK CONSTRAINT [FK_hourlyPermissions_employees]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_charitys] FOREIGN KEY([CharityID])
REFERENCES [dbo].[charitys] ([CharityID])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_charitys]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_custodies] FOREIGN KEY([CustodieID])
REFERENCES [dbo].[custodies] ([CustodieID])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_custodies]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_employees]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_events] FOREIGN KEY([EventID])
REFERENCES [dbo].[events] ([EventID])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_events]
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
ALTER TABLE [dbo].[MessageReply]  WITH CHECK ADD  CONSTRAINT [FK_MessageReply_usersMessages] FOREIGN KEY([UsersMessageID])
REFERENCES [dbo].[usersMessages] ([UsersMessageID])
GO
ALTER TABLE [dbo].[MessageReply] CHECK CONSTRAINT [FK_MessageReply_usersMessages]
GO
ALTER TABLE [dbo].[periods]  WITH CHECK ADD  CONSTRAINT [FK_periods_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[periods] CHECK CONSTRAINT [FK_periods_employees]
GO
ALTER TABLE [dbo].[Resignation]  WITH CHECK ADD  CONSTRAINT [FK_Resignation_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Resignation] CHECK CONSTRAINT [FK_Resignation_employees]
GO
ALTER TABLE [dbo].[Resignation]  WITH CHECK ADD  CONSTRAINT [FK_Resignation_employees1] FOREIGN KEY([ApprovalID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Resignation] CHECK CONSTRAINT [FK_Resignation_employees1]
GO
ALTER TABLE [dbo].[rewards]  WITH CHECK ADD  CONSTRAINT [FK_rewards_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[rewards] CHECK CONSTRAINT [FK_rewards_employees]
GO
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_tasks_employees] FOREIGN KEY([BranchManagerID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_tasks_employees]
GO
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [FK_tasks_employees1] FOREIGN KEY([ManagementManagerID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [FK_tasks_employees1]
GO
ALTER TABLE [dbo].[usersMessages]  WITH CHECK ADD  CONSTRAINT [FK_usersMessages_employees] FOREIGN KEY([ToEmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[usersMessages] CHECK CONSTRAINT [FK_usersMessages_employees]
GO
ALTER TABLE [dbo].[usersPermissions]  WITH CHECK ADD  CONSTRAINT [FK_usersPermissions_appObjects] FOREIGN KEY([AppObjectID])
REFERENCES [dbo].[appObjects] ([AppObjectID])
GO
ALTER TABLE [dbo].[usersPermissions] CHECK CONSTRAINT [FK_usersPermissions_appObjects]
GO
ALTER TABLE [dbo].[usersPermissions]  WITH CHECK ADD  CONSTRAINT [FK_usersPermissions_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[usersPermissions] CHECK CONSTRAINT [FK_usersPermissions_employees]
GO
