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
ALTER TABLE [dbo].[periods] DROP CONSTRAINT [FK_periods_employees]
GO
ALTER TABLE [dbo].[messages] DROP CONSTRAINT [FK_messages_employees]
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
/****** Object:  Table [dbo].[vacations]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vacations]') AND type in (N'U'))
DROP TABLE [dbo].[vacations]
GO
/****** Object:  Table [dbo].[usersPermissions]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usersPermissions]') AND type in (N'U'))
DROP TABLE [dbo].[usersPermissions]
GO
/****** Object:  Table [dbo].[usersMessages]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usersMessages]') AND type in (N'U'))
DROP TABLE [dbo].[usersMessages]
GO
/****** Object:  Table [dbo].[trainings]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[trainings]') AND type in (N'U'))
DROP TABLE [dbo].[trainings]
GO
/****** Object:  Table [dbo].[tasks]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tasks]') AND type in (N'U'))
DROP TABLE [dbo].[tasks]
GO
/****** Object:  Table [dbo].[statuses]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[statuses]') AND type in (N'U'))
DROP TABLE [dbo].[statuses]
GO
/****** Object:  Table [dbo].[scheduleVacations]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[scheduleVacations]') AND type in (N'U'))
DROP TABLE [dbo].[scheduleVacations]
GO
/****** Object:  Table [dbo].[scheduledJobs]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[scheduledJobs]') AND type in (N'U'))
DROP TABLE [dbo].[scheduledJobs]
GO
/****** Object:  Table [dbo].[salaryIncreases]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[salaryIncreases]') AND type in (N'U'))
DROP TABLE [dbo].[salaryIncreases]
GO
/****** Object:  Table [dbo].[rewards]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rewards]') AND type in (N'U'))
DROP TABLE [dbo].[rewards]
GO
/****** Object:  Table [dbo].[periods]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[periods]') AND type in (N'U'))
DROP TABLE [dbo].[periods]
GO
/****** Object:  Table [dbo].[messagesTemplates]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[messagesTemplates]') AND type in (N'U'))
DROP TABLE [dbo].[messagesTemplates]
GO
/****** Object:  Table [dbo].[messages]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[messages]') AND type in (N'U'))
DROP TABLE [dbo].[messages]
GO
/****** Object:  Table [dbo].[MessageReply]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MessageReply]') AND type in (N'U'))
DROP TABLE [dbo].[MessageReply]
GO
/****** Object:  Table [dbo].[materialsConsumption]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[materialsConsumption]') AND type in (N'U'))
DROP TABLE [dbo].[materialsConsumption]
GO
/****** Object:  Table [dbo].[managements]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[managements]') AND type in (N'U'))
DROP TABLE [dbo].[managements]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jobs]') AND type in (N'U'))
DROP TABLE [dbo].[jobs]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Images]') AND type in (N'U'))
DROP TABLE [dbo].[Images]
GO
/****** Object:  Table [dbo].[hourlyPermissions]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hourlyPermissions]') AND type in (N'U'))
DROP TABLE [dbo].[hourlyPermissions]
GO
/****** Object:  Table [dbo].[highrManagment]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[highrManagment]') AND type in (N'U'))
DROP TABLE [dbo].[highrManagment]
GO
/****** Object:  Table [dbo].[EventTags]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventTags]') AND type in (N'U'))
DROP TABLE [dbo].[EventTags]
GO
/****** Object:  Table [dbo].[events]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[events]') AND type in (N'U'))
DROP TABLE [dbo].[events]
GO
/****** Object:  Table [dbo].[evaluations]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[evaluations]') AND type in (N'U'))
DROP TABLE [dbo].[evaluations]
GO
/****** Object:  Table [dbo].[employeesVacations]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[employeesVacations]') AND type in (N'U'))
DROP TABLE [dbo].[employeesVacations]
GO
/****** Object:  Table [dbo].[employeesTrainings]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[employeesTrainings]') AND type in (N'U'))
DROP TABLE [dbo].[employeesTrainings]
GO
/****** Object:  Table [dbo].[employeesTasks]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[employeesTasks]') AND type in (N'U'))
DROP TABLE [dbo].[employeesTasks]
GO
/****** Object:  Table [dbo].[employeesScheduleVacations]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[employeesScheduleVacations]') AND type in (N'U'))
DROP TABLE [dbo].[employeesScheduleVacations]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[employees]') AND type in (N'U'))
DROP TABLE [dbo].[employees]
GO
/****** Object:  Table [dbo].[EemployeesEvents]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EemployeesEvents]') AND type in (N'U'))
DROP TABLE [dbo].[EemployeesEvents]
GO
/****** Object:  Table [dbo].[DocumentCategories]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocumentCategories]') AND type in (N'U'))
DROP TABLE [dbo].[DocumentCategories]
GO
/****** Object:  Table [dbo].[Devices]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Devices]') AND type in (N'U'))
DROP TABLE [dbo].[Devices]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[departments]') AND type in (N'U'))
DROP TABLE [dbo].[departments]
GO
/****** Object:  Table [dbo].[dailyTasks]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dailyTasks]') AND type in (N'U'))
DROP TABLE [dbo].[dailyTasks]
GO
/****** Object:  Table [dbo].[custodies]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[custodies]') AND type in (N'U'))
DROP TABLE [dbo].[custodies]
GO
/****** Object:  Table [dbo].[countriesName]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[countriesName]') AND type in (N'U'))
DROP TABLE [dbo].[countriesName]
GO
/****** Object:  Table [dbo].[confirms]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[confirms]') AND type in (N'U'))
DROP TABLE [dbo].[confirms]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[companies]') AND type in (N'U'))
DROP TABLE [dbo].[companies]
GO
/****** Object:  Table [dbo].[charitys]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[charitys]') AND type in (N'U'))
DROP TABLE [dbo].[charitys]
GO
/****** Object:  Table [dbo].[branches]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[branches]') AND type in (N'U'))
DROP TABLE [dbo].[branches]
GO
/****** Object:  Table [dbo].[appObjects]    Script Date: 1/17/2023 1:17:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[appObjects]') AND type in (N'U'))
DROP TABLE [dbo].[appObjects]
GO
/****** Object:  Table [dbo].[appObjects]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[branches]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[charitys]    Script Date: 1/17/2023 1:17:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[charitys](
	[CharityID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NULL,
	[Reason] [nvarchar](100) NULL,
	[Amount] [decimal](20, 3) NULL,
	[Details] [ntext] NULL,
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
/****** Object:  Table [dbo].[companies]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[confirms]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[countriesName]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[custodies]    Script Date: 1/17/2023 1:17:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[custodies](
	[CustodieID] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[dailyTasks]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[departments]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[Devices]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[DocumentCategories]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[EemployeesEvents]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[employees]    Script Date: 1/17/2023 1:17:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[EmployeeID] [bigint] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[employeesScheduleVacations]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[employeesTasks]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[employeesTrainings]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[employeesVacations]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[evaluations]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[events]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[EventTags]    Script Date: 1/17/2023 1:17:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventTags](
	[ID] [bigint] NULL,
	[EventID] [bigint] NULL,
	[EmployeeID] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[highrManagment]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[hourlyPermissions]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[Images]    Script Date: 1/17/2023 1:17:10 AM ******/
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
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[managements]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[materialsConsumption]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[MessageReply]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[messages]    Script Date: 1/17/2023 1:17:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[messages](
	[MessageID] [bigint] IDENTITY(1,1) NOT NULL,
	[Notes] [ntext] NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CreateUserID] [bigint] NULL,
	[UpdateUserID] [bigint] NULL,
	[IsActive] [bit] NULL,
	[EmployeeID] [bigint] NULL,
	[ToEmployeeID] [bigint] NULL,
 CONSTRAINT [PK_messages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[messagesTemplates]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[periods]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[rewards]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[salaryIncreases]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[scheduledJobs]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[scheduleVacations]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[statuses]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[tasks]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[trainings]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[usersMessages]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[usersPermissions]    Script Date: 1/17/2023 1:17:10 AM ******/
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
/****** Object:  Table [dbo].[vacations]    Script Date: 1/17/2023 1:17:10 AM ******/
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
SET IDENTITY_INSERT [dbo].[companies] ON 

INSERT [dbo].[companies] ([CompanyID], [Name], [Address], [Email], [Mobile], [Phone], [Fax], [Notes], [OurCompany], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [GeneralDirector], [FinancialManager], [HRManager], [CEO], [LegalManager], [CompanyListAr], [CompanyListEn]) VALUES (3, N'dfdsfs', N'', N'dinahnemah@gmail.com', N'0959353886', N'', N'', N'', 1, CAST(N'2023-01-12T21:05:13.3549745' AS DateTime2), CAST(N'2023-01-13T01:17:11.6819872' AS DateTime2), 6, 6, 1, 6, 6, 6, 6, 6, NULL, NULL)
SET IDENTITY_INSERT [dbo].[companies] OFF
GO
SET IDENTITY_INSERT [dbo].[confirms] ON 

INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (35, NULL, CAST(N'2023-01-12T21:05:13.4297755' AS DateTime2), CAST(N'2023-01-12T21:05:13.4297755' AS DateTime2), 6, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (36, NULL, CAST(N'2023-01-12T21:05:13.4499902' AS DateTime2), CAST(N'2023-01-12T21:05:13.4499902' AS DateTime2), 6, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (37, NULL, CAST(N'2023-01-12T21:05:13.4529804' AS DateTime2), CAST(N'2023-01-12T21:05:13.4529804' AS DateTime2), 6, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (38, NULL, CAST(N'2023-01-12T21:05:13.4579672' AS DateTime2), CAST(N'2023-01-12T21:05:13.4579672' AS DateTime2), 6, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (39, NULL, CAST(N'2023-01-12T21:05:13.4629572' AS DateTime2), CAST(N'2023-01-12T21:05:13.4629572' AS DateTime2), 6, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (40, NULL, CAST(N'2023-01-12T23:46:40.7238621' AS DateTime2), CAST(N'2023-01-12T23:46:40.7238621' AS DateTime2), 6, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 7, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (41, NULL, CAST(N'2023-01-13T00:24:07.4586139' AS DateTime2), CAST(N'2023-01-13T00:24:07.4586139' AS DateTime2), 7, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (42, NULL, CAST(N'2023-01-13T00:24:07.4705813' AS DateTime2), CAST(N'2023-01-13T00:24:07.4705813' AS DateTime2), 7, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (43, NULL, CAST(N'2023-01-13T00:24:07.4879708' AS DateTime2), CAST(N'2023-01-13T00:24:07.4879708' AS DateTime2), 7, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (44, NULL, CAST(N'2023-01-13T00:24:07.5046718' AS DateTime2), CAST(N'2023-01-13T00:24:07.5046718' AS DateTime2), 7, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (45, NULL, CAST(N'2023-01-13T00:24:07.5219483' AS DateTime2), CAST(N'2023-01-13T00:24:07.5219483' AS DateTime2), 7, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (46, NULL, CAST(N'2023-01-13T00:24:17.2359014' AS DateTime2), CAST(N'2023-01-13T00:24:17.2359014' AS DateTime2), 7, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 7, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (47, NULL, CAST(N'2023-01-13T00:24:17.2529120' AS DateTime2), CAST(N'2023-01-13T00:24:17.2529120' AS DateTime2), 7, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (48, NULL, CAST(N'2023-01-13T00:24:17.2703960' AS DateTime2), CAST(N'2023-01-13T00:24:17.2703960' AS DateTime2), 7, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (49, NULL, CAST(N'2023-01-13T00:24:17.2885950' AS DateTime2), CAST(N'2023-01-13T00:24:17.2885950' AS DateTime2), 7, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (50, NULL, CAST(N'2023-01-13T00:24:17.3040222' AS DateTime2), CAST(N'2023-01-13T00:24:17.3040222' AS DateTime2), 7, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (51, NULL, CAST(N'2023-01-13T01:17:11.8416410' AS DateTime2), CAST(N'2023-01-13T01:17:11.8426384' AS DateTime2), 6, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (52, NULL, CAST(N'2023-01-13T01:17:11.8954981' AS DateTime2), CAST(N'2023-01-13T01:17:11.8954981' AS DateTime2), 6, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (53, NULL, CAST(N'2023-01-13T01:17:11.9129742' AS DateTime2), CAST(N'2023-01-13T01:17:11.9129742' AS DateTime2), 6, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (54, NULL, CAST(N'2023-01-13T01:17:11.9298618' AS DateTime2), CAST(N'2023-01-13T01:17:11.9298618' AS DateTime2), 6, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
INSERT [dbo].[confirms] ([ConfirmID], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [TaskID], [SalaryIncreaseID], [MessagesTemplateID], [HourlyPermissionID], [JobID], [DepartmentID], [ConfirmType], [EmployeeID], [Role], [EventID]) VALUES (55, NULL, CAST(N'2023-01-13T01:17:11.9478149' AS DateTime2), CAST(N'2023-01-13T01:17:11.9478149' AS DateTime2), 6, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'emp_hiring', 6, N'GeneralDirector', NULL)
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

INSERT [dbo].[custodies] ([CustodieID], [Type], [Details], [Value], [EmployeeID], [IsRecovery], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive]) VALUES (1, N'Cash', N'wee', NULL, 7, 0, NULL, CAST(N'2023-01-13T01:25:51.6211116' AS DateTime2), CAST(N'2023-01-13T01:25:51.6213919' AS DateTime2), 6, 6, 1)
SET IDENTITY_INSERT [dbo].[custodies] OFF
GO
SET IDENTITY_INSERT [dbo].[DocumentCategories] ON 

INSERT [dbo].[DocumentCategories] ([CategoryID], [CategoryCode], [NameAR], [NameEN], [Details], [IsActive], [ParentID], [IsFixed], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID]) VALUES (1, N'Cer', N'Certificates', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[DocumentCategories] ([CategoryID], [CategoryCode], [NameAR], [NameEN], [Details], [IsActive], [ParentID], [IsFixed], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID]) VALUES (2, N'Evt', N'Events', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[DocumentCategories] ([CategoryID], [CategoryCode], [NameAR], [NameEN], [Details], [IsActive], [ParentID], [IsFixed], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID]) VALUES (3, N'Tsk', N'Tasks', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[DocumentCategories] ([CategoryID], [CategoryCode], [NameAR], [NameEN], [Details], [IsActive], [ParentID], [IsFixed], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID]) VALUES (4, NULL, N'Work Permits', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[DocumentCategories] ([CategoryID], [CategoryCode], [NameAR], [NameEN], [Details], [IsActive], [ParentID], [IsFixed], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID]) VALUES (5, NULL, N'Work Contracts', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DocumentCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([EmployeeID], [Username], [Password], [DepartmentID], [VacationsBalance], [WarningPeriod], [NameAr], [NameEn], [DOB], [Gender], [MaritalStatus], [Nationality], [Religion], [BloodType], [IdentityType], [IdentityNumber], [IdentityReleaseDate], [IdentityExpiryDate], [PassportNumber], [PassportReleaseDate], [PassportExpiryDate], [PassportCountry], [Phone], [Mobile], [Email], [Address], [NoConviction], [BankAccount], [BankName], [IBANNumber], [SWIFTCODE], [PaymentType], [EducationCertificate1], [EducationCertificateFromDate1], [EducationCertificateToDate1], [EducationCertificateSource1], [EducationCertificate2], [EducationCertificateFromDate2], [EducationCertificateToDate2], [EducationCertificateSource2], [EducationCertificate3], [EducationCertificateFromDate3], [EducationCertificateToDate3], [EducationCertificateSource3], [WorkExperience1], [WorkExperience2], [WorkExperience3], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [BasicSalary], [TransportationCompensationType], [HousingCompensationType], [HiringDate], [Sequence], [UnifiedNumber], [ResidenceDate], [JobID], [WorkHours], [JobDescription], [Guarantor], [ManagementID], [IDNumber], [WorkPermit], [WorkContract], [IsBarcodeUser], [Image]) VALUES (6, N'admin', N'1b8baf4f819e5b304e1a176e1c590c84', NULL, NULL, NULL, N'المدير', N'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2023-01-10T18:54:22.1120485' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employees] ([EmployeeID], [Username], [Password], [DepartmentID], [VacationsBalance], [WarningPeriod], [NameAr], [NameEn], [DOB], [Gender], [MaritalStatus], [Nationality], [Religion], [BloodType], [IdentityType], [IdentityNumber], [IdentityReleaseDate], [IdentityExpiryDate], [PassportNumber], [PassportReleaseDate], [PassportExpiryDate], [PassportCountry], [Phone], [Mobile], [Email], [Address], [NoConviction], [BankAccount], [BankName], [IBANNumber], [SWIFTCODE], [PaymentType], [EducationCertificate1], [EducationCertificateFromDate1], [EducationCertificateToDate1], [EducationCertificateSource1], [EducationCertificate2], [EducationCertificateFromDate2], [EducationCertificateToDate2], [EducationCertificateSource2], [EducationCertificate3], [EducationCertificateFromDate3], [EducationCertificateToDate3], [EducationCertificateSource3], [WorkExperience1], [WorkExperience2], [WorkExperience3], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [BasicSalary], [TransportationCompensationType], [HousingCompensationType], [HiringDate], [Sequence], [UnifiedNumber], [ResidenceDate], [JobID], [WorkHours], [JobDescription], [Guarantor], [ManagementID], [IDNumber], [WorkPermit], [WorkContract], [IsBarcodeUser], [Image]) VALUES (7, N'dina', N'f6daabab0e7729b167268832ce7f38da', NULL, NULL, NULL, N'دينا نعمة', N'dina', CAST(N'1986-01-01T00:00:00.0000000' AS DateTime2), N'male', N'Soltero', 57, NULL, N'', NULL, N'141414141414', NULL, NULL, N'11111111', CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), NULL, NULL, N'0959353886', N'dinahnemah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Informatics Engineering', CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', NULL, CAST(N'2023-01-12T20:55:17.8706384' AS DateTime2), CAST(N'2023-01-13T00:17:54.3799568' AS DateTime2), 6, 7, 1, CAST(1500.000 AS Decimal(20, 3)), NULL, NULL, CAST(N'2023-01-13T00:24:17.2007366' AS DateTime2), N'', N'', NULL, 1, 8, N'', N'', NULL, N'', NULL, NULL, 0, 0xFFD8FFE000104A46494600010100000100010000FFDB008400090607080706090807080A0A090B0D160F0D0C0C0D1B14151016201D2222201D1F1F2428342C242631271F1F2D3D2D3135373A3A3A232B3F443F384334393A37010A0A0A0D0C0D1A0F0F1A37251F253737373737373737373737373737373737373737373737373737373737373737373737373737373737373737373737373737FFC00011080082007703012200021101031101FFC4001C0001000203010101000000000000000000000607030408050102FFC400431000010303000606070408050500000000010002030405110612213141510713226171911532425281A1D11455629408338292A2C1E1F084B1C2C3F11623345372FFC4001A010100030101010000000000000000000000010204050306FFC4002D1100020201030203060700000000000000000102031104122113143141B105226171C1F0425152628191A1FFDA000C03010002110311003F00BC5111004444011695DEEB4567A27D65C676C30337B8F13C80E27B9545A47D2FD6CB2BE2B244CA484640964687CA7BF1EAB7C0E509C17522E697F485A48F76B3AF35B9EE2D03C80C2F5ECFD29E91533DBD6D4B2B63E2CA88403F07371F3CA0C17FA2AC874C36E6D231D35AEA84F8EDB048DD407B9DBFE494BD3359A49756AA82AE16FBED735E07CC20C166A2F2EC5A436ABFD375F69AC8E768F59A0E1CCF169DA17A88404444011110044440161ACA9868A966AAAA9047042C3248F76E6B40C92B32ADBA72BCBA8346A1B7C2EC495F2EABF0707AB6ED3F3D54055BA77A5F55A537674A4BA3A38C96D3C39F51BDFDE78A8BB5A5C70DFE8BE2FB9562E65D68A3F5407BFDE3BBC96582591C5F23DE7518370E256AB5A5CE0D68C92BD482944B05563261A580BE4206D73DDD98DA3BCBC8D9C8146F04A59356A677B6521A46AE01C119584BA393D6688DDEF3777C42DDBEDBA5B5D73E8E7FD6421AD7F896877F3C7C179A89E5643583D1B35DABAC3728EB2DF33A19E33BC6D0E1C88E20F25D35A277E87492C905C601AA5E35658F39EADE378FA7710B9549C80396E56EF4097322AAE16C73B63E213B5BC8B48693E4F6F928655973222282A111100444401517FA404EE7690DAE0C9D58E90BC0FF00E9E47FA55E8A89FD20A173748ED3280E265A42C6803392D7EEF1ED8425158676E02FD01C00CAC93D25552102B2967A67BFB4D6CF139848E63216DDBECF72AF6B5D474733DAF3AAD7061ED1EEFAAB6560BE0C1102C2190B4BE7908680D19C13B80E65599A15A27570C34D25DA0FB3C514BF68EA1C417CD37B2E7F00D68DCDE7B4E372D0D13D18B8582EF4B555F6F82A249086B475D830677B9BB355C71C3208C1C6559A3FBC2C3A8BFCA26CD3D1E722BEE942C2E998DBDD3B35BAB8FAAAB68DFA80E5AFF81273DC472557B9BAA77823810AEE86BF482EDAC68ED515251925BD655F6DCFFD90401E654074A3422AE8335343139EC7125D0323C6AF1EC00E7647E1CE766C046EBD13DAB648A5F0DCF74486AB17A09713A633379514BE5ACCFE8ABB0C7BF5B518E76A8CBB55A4EA8E655A3FA3E52F5B7BBB5763B31D3362047E3767FDB0B59919792222A95088880222200A2FA656AA7ABA8B7D7CAD066A43236338CE35C0C9F1D9F352855F74B7A5A747692829A9A38E5A9A9975DCC7F089BEB78124800F8AA591728348F4AA4A3626CF12F766A2BD40D8678229648E66F50F9B2430923586C20E0E3042C97BB75F0E8C4D516FA7FB23600E73A1A52C88318CDA71CF773E1B961D1DD20A0D228AA20A08E682584324709403AAECF64820EDDAD5ED35948C826A796696862A825D3D3B9C3A87B8EF2DD6040CEFECE0EDDA32564A27D37B666ED5C3AAB756FE845B42AAAED5BD7D357974D4A1C2292405A5D0BC9C35C1C361191BF811C7849DB515753434D2490B591D5756C710F21CD0E2013F1C9DDB4647C33D3B29A0A17D059D81B1C9B24958DC0C73D6F68F2C671C70B6E5A76BA8846C708C0C18C8DBAA41CB4E3B880A2F956E598A234F1B543163E7EFFB235A6F577D75B1D25969278EDF1BF50CF1EA83D9C8381C1A08C671C178BA390E905D6CC2A682E388E49843236B30F6B7233ACD3B0E46366DDBB3729C55CD4B596DF46DD408A1D99648486123710EDC79F3E616A328E90B228688BE56C273138E043092305E0001AE7E3383B48E602F7EB55D3C63933746F76E73C7CFFCC19345ED305B681B2B25965A9AE027A9A99482F95E5A390180380522D14B1D1DA5F71A8A38DB19AE9C4B235A30010D0367C727C49517BEE9459746A0A7A7AF7CA25EAB5E08628DCE2E6838033B86EE24290681DF5D7AA4AC6CAC63248260E66A6E7C32344913FE2D763C4154A14DC9C9F81E97B8A8A8A250888B598C222200888801DCB9E7A55AC370BD5756B8E5BF693454C0F08A003AC23C657FF0AE8479D5693C865734698B8BE8AC476FFDEB67DB0E7DE9A791EEFF0031E4A5128D7E8EAEACB6E9435933C361AC675049DC1D9CB4F9ECFDA5774672CEF1B0AE65A8D8D930786F567F47DD20C552C86D77C9432AB6322A971C365E41C783BBF8F8AC7AAA5B7BE26FD2DC97B922C696A69D85CC966635C06D05D83B561757D333B26A3541FC1FD12B2090CB1D651B5A6A22696E1C011234ED2D39E1B02C4DBEC8C3A8347E91B2FBCDA676FF000C7F3592318BF1674545B5C2CFF291B31565338C71C5287976C686F76FF2D9E6B6769EF5AD07DA2798D5D711D739BAAD601811337E001FDEE55D748DD20B29D9359EC336B541CB2A2AA33B23E6D61F7BBC6EF1DD30ADCE5889E16D91AD6591DE90EED1DDB4BEA5D0383A0A5636958E0721DAB92E3FBCE70F82B4FA1F93ADA5B7D43460CD6C753C9FE1E7735BFC322A0E9C6D000D985D05D06D39FF00A49952FC63AD9991F86BE5DF3C792EAA585847224F3CB2C8444428111100444407C232083C573C69F5BDF4715AE295A1A68BAFB5C807B218FD787F7A37B5CBA214734D344E934A2D5534EF222AA7B0755381EABDB92C2798049F839DCD09472C5433D6046F185E6F71F8A92DF2D95B6AB8CB4374A7753D547EBB4EE77E269E20F35E1D440ED6D668CE4ED038956F224B37A27D23B8CB0D5D1D64CEA88299B19883CF69A0EB646B6FE037AB245CE98B724B81E5850BE8A74627B659EA6A6E94E639AB9CC2D89FB1CC8DA0E09E44971F92964B69FF00D328F07FD572AF70763C1D5A372AD6486F4A97FAC82C51C74323E9DB3CC237961C39CDD571233C3E0A9C8DBACF68E1C55CDD2468ED75668E3DF4F175B2534825D466D25B820E071D872AA3A4A738D63ED792D9A6C6CE0C5AA4FA9C9B5061A1CF3B03464AEA1E8E2D4FB36855AA92667573753D6CAC3BDAE792F20F86B63E0AA2E8BF4166BF564371B8539659E070782F1FF94E1B9A07160E2771DDCF1D04B433330888A08088880222200BE15F5417A4AD377E8D322A0B731AFB8D4B0BC3DFB5B03376B11C4939C0DDB0E791B462E4F08ACA4A2B2CDAE9165D1416C0CD298A298E098236FEBF3CD846D1E3BB9A85E84D8346C37D296B6CD5126B76455B9AE7D31F7700019EFC67BD5735955515B55255564EF9E794E5F248724ACF68BA55DA2AC54D14A58FF69A76B5E3910B45DA172AF117C99A8F68A85B992F74BC9145AC7A6F6DB831ACAC77D8EA371121EC38F73BEAA482A607375DB3C65BCC3C2E0594CEB789AC1F4955D5DB1CC1E4CBE0A2978B66885A2E02F177B5B667977EA58486B9DCFABCEA93E3B16C5EF4BEDD6C639B1C8279F832339FF8558DDEE95576AA35154EC9F6580EC685BB43A4B672DCF88FA983DA1ADAAB8ED5CCBD0E8EB05E6D77AA16D45A2A23961680D2D66C319F75CDDED3DCBD45CB16DB8D6DA6B1B5D6DAA7D354B373D9C47270DC477157A746FA6E34B68E68EA616C171A40DEBD8CF51E0E70F6F76C3B3877ADF750EBE5781CDA350ACF993344459CD0111100444407C2B9AB4FEF22E9A6D779FACD68A39BECF1FE111F64E3F6838FC574A90B44D96D64926DB46493924D3B76FC97AD362AE59C1E56D7D48ED396C4D19F6DBE6BEEBB3DF6F9AEA3F42DABEECA2FCBB7E89E85B57DD945F976FD16AEF3E064EC7E272EEBB7DE6F9AFA240D1812003902BA87D0B6AFBB28BF2ECFA27A12D3F76517E5D9F451DE2FD24AD135F88E5CD760F69BE6BE19A31ED8F35D49E85B57DD945F9767D13D0B6AFBB28BF2ECFA29EF17E43B1FDC72B49335C3008F1CA94F45175F46E9ED0375808EB58FA57EDE6359BFC4D68F8AE80F42DABEEDA2FCBB7E8BEB2CF6C8DED9196EA46BDA72D7081A083CC6C549EA54E38C1E95E9B63CA66F0DC888B19AC22220088880222200888802222008888022220088880222203FFFD9)
INSERT [dbo].[employees] ([EmployeeID], [Username], [Password], [DepartmentID], [VacationsBalance], [WarningPeriod], [NameAr], [NameEn], [DOB], [Gender], [MaritalStatus], [Nationality], [Religion], [BloodType], [IdentityType], [IdentityNumber], [IdentityReleaseDate], [IdentityExpiryDate], [PassportNumber], [PassportReleaseDate], [PassportExpiryDate], [PassportCountry], [Phone], [Mobile], [Email], [Address], [NoConviction], [BankAccount], [BankName], [IBANNumber], [SWIFTCODE], [PaymentType], [EducationCertificate1], [EducationCertificateFromDate1], [EducationCertificateToDate1], [EducationCertificateSource1], [EducationCertificate2], [EducationCertificateFromDate2], [EducationCertificateToDate2], [EducationCertificateSource2], [EducationCertificate3], [EducationCertificateFromDate3], [EducationCertificateToDate3], [EducationCertificateSource3], [WorkExperience1], [WorkExperience2], [WorkExperience3], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive], [BasicSalary], [TransportationCompensationType], [HousingCompensationType], [HiringDate], [Sequence], [UnifiedNumber], [ResidenceDate], [JobID], [WorkHours], [JobDescription], [Guarantor], [ManagementID], [IDNumber], [WorkPermit], [WorkContract], [IsBarcodeUser], [Image]) VALUES (8, NULL, NULL, NULL, NULL, NULL, N'ttry', N'tytry', CAST(N'1990-01-10T00:00:00.0000000' AS DateTime2), N'male', N'Soltero', 57, NULL, N'O+', NULL, N'141414141414', NULL, NULL, N'', CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), NULL, NULL, N'0959353886', N'dinahnemah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Informatics Engineering', CAST(N'2000-01-11T00:00:00.0000000' AS DateTime2), CAST(N'2000-11-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', N'', NULL, CAST(N'2023-01-12T21:17:58.4382273' AS DateTime2), CAST(N'2023-01-13T00:45:01.1272626' AS DateTime2), 6, 7, 0, CAST(134.000 AS Decimal(20, 3)), NULL, NULL, NULL, N'', N'', NULL, 1, 4, N'', N'', NULL, N'14125411', NULL, NULL, NULL, 0x89504E470D0A1A0A0000000D49484452000001C9000001440802000000C373522000009A8949444154789CEC9D799814D5B9FFDF736AAFDE671F6606187618161141441171019788C6FDC63D1AA3267AD59BDC9F59AE26466F6E124DAE4B4C623489B96AA251A326188D7117A32C822028FBCEEC33BD77ADE7FCFE78A7CB1601693238A0E7F3F0CCD3D3F4545755577FEB3DEF4A7EFAD39F56575733C62CCBD275DDF3BC42A1601806630C04028140502684104551E48A8A8A969696BABA3A49920CC3E09C5B96A5691AA574A0F7502010080E3E7CDF775D574EA7D38661D4D7D707FF11894408219CF301DC39814020384821840080ECFBBE244900E0380E634C9224DFF7655916DA2A100804FB002EFA6555556559C6A72449521445519401DD318140203888418355F67D1F2D56CE39AA2A46B13CCF1BE83D14080482838FBED5BFAAAA94524AA9AAAAE826F03C0F7F1DE83D140804828312C698CC39F77DDFF77D009024098D565996F11981402010948524499EE7C9BEEFEBBA0EC5D816E75C5555C658BFE460E176822D23F85F84104AA9E3386820A7D3E9502894CBE5A2D168F087994C261C0E63EE6D2814B22C4B966542882449AEEB12426459B66D5BD334F46C1886E1BA2E86E602F0E6B1D39302C1E71CDFF7F13B883F83E74510FB5F8731A6288ABC5FDFA334970B1FA0CE12420821C964321E8F03403A9D4649C59FB95CCE300CDFF70DC340259524299FCF9BA6892FD6344DD334004061751C87528A1139DBB6755D2F7D1700C02DECD72315080E46F00B122C5239E7E29BD25FEC5F6D4502733510BB542A158BC5366CD8D0DDDDDDDCDC3C62C40800E8E9E94924128CB16432B976EDDAD1A347534A25492284AC5EBD3A954A5556568E193306D36FD7AD5BD7D6D6A6AAEAA449935067F1FA0887C3A5220E1FBB7A04020100946A68E95746D8ADFDC57EB75B3103014A841500E2F1F82DB7DCB279F3E6CECECE3973E67CF9CB5F06808A8A0AD7751963F7DD77DF92254BE6CC9973EDB5D766329965CB96DD76DB6D914864D4A851E79D77DE8409135A5B5B7FFBDBDFBEF3CE3BCDCDCD13264CB8E8A28B42A1902449B95C4E922474714089A6C347AF248140001F95D1E0BB29E82F3E25BB351056D4BB679E79A6ADADED873FFC61555555369B0D926A154579E18517962C59F2873FFCE1C20B2F9C3D7BF6B061C3EEBDF7DE9B6EBA69C68C19BFFBDDEFEEBDF7DEBBEFBEFBD5575FDDBE7DFB534F3DB563C78E3BEEB863FDFAF5C3860DD334CD34CD52352FBD1B8BF60802C1C7F9B8BC0A91ED2FF66FD380D28579A071AEEBBEFAEAABF3E6CDABA9A9618C45A351D77539E7D96C36994C2E5DBAF4B4D34E8B442213264C78EFBDF756AD5A552814C68C19C3186B6969E9EDED25843CF9E4935FFEF297354D6B6868686B6BC39097A22828ACE849C0C432A9C87E3D4C81E0A063A72F0886B38443A01FF934EC5652040018639EE7D9B6DDDBDBFBBDEF7D2F168B7DE94B5FAAADAD658C85C361DFF7972C5972D34D372593C98A8A8A850B17363434545757575454F8BE1F8944962F5FBE79F3E6AEAEAEE1C3877B9EA7AAAAAEEBEFBEFBEEA1871E8A1E558C770100E79C3186E62AB6A5F9148E54203858B02C2BD056287E4985B6F6239F9EB6E263C698EFFBAFBCF2CA8811230E3FFCF0152B567CF39BDFFCD18F7E545F5F8F4D0E1545711C271E8F6FD8B04196E54C26138BC532998C6118B158CCB6EDEEEEEE214386F4F6F6565757FBBEAF28CAFBEFBFAFAA6A609C62D295E338AEEBBAAEEBFB3EBEE9A770A402C1C102A6D660CA0DAEF9F079E113E82FF6AFB6EE94D2E1791E21445555D334A74D9B3673E6CCF1E3C77FE52B5FB12C0B001445C1DE5C18D1AAADAD8DC7E3BAAEF7F6F6CAB22CCB7232991C3B766C7D7D7D777777381C962409F35E274F9E2C4952369B0D87C3A954CA344D45512CCBEAEDED6D6B6B9324A9A3A3239148ECD72315080E2E7CDFD7342D9148D4D6D6063599C274ED47F6BBB6C2C7BCAE8490112346388E0300914864C78E1D757575A9542A128970CE1B1A1A162F5E3C65CA94542A3574E8D0868686542A85DB618C699A26CB723C1E5FB162C5D0A143F3F97C3A9D9E306182EBBAE170D8711CAC35008070386C1846454585A228EBD7AFC7342F814080E01710BD6A0080C599588F33D0BBF619E1D3D056280941621DC8AC59B3962F5FDED8D8B86AD5AA59B366C9B2EC79DE934F3E79FCF1C79F71C61977DC71C7B1C71EBB6DDBB6EBAEBB4E96E542A1B070E1C2C183073FF6D863871F7E785D5DDD79E79D875E0534481B1B1B6DDB466742381C0EA45C92242C4650142548CC12080400F0F16F04BA5F0764673E937CAAF728D456CEF929A79C72DF7DF73DF0C003F97CFEEAABAF9665B9B3B3F37BDFFBDE71C71D3761C284134F3CF1965B6E39F7DC731B1A1A0A85C2D5575F3D7FFEFC42A1C018BBFEFAEB0160F8F0E16FBCF1C6ADB7DEDAD8D878D8618745229170380C00A1500807D200806DDBD81501EB62455B2F81A094D26CC520670044AA40FF41EEB9E79E534E39A5A9A909850F4BEF1963FDE2D2DEA9CE3578C6719C9E9E9EAEAEAECACACA8A8A0AC771962E5DBA74E9D2EBAEBBAEBDBD3D1A8D7674740C1932048B625DD7DDB469936559A3468DD2342D9FCF63CA486B6BAB24490D0D0DB66D1342028700BA1D3CCF9365D9755D5996D7AD5B3772E4C87FFD700482CF0C98758EE93481B34E086BBF80E776BFD76595BE5FF08CA669F5F5F5D16834140A398E138D467B7B7B4F39E514D7756B6B6B3DCFABAAAAB22C2B1E8FDBB62D49122A633E9FB72C0BB3ACBABABA5094D1250F00AAAA7A9ED77754B28C6E235996314940E4090804A560422BF6EB0874567435EA473E0D6D2DBD19E2A7880903A1508831866DB7264C98307CF87000E8EEEEAEACACC4454A6767677575B5E779994C26128960F9566B6B6B7D7D7D5555156E10D303D04A0500455182865B94524CA7751C475C3102412918A2208460080B1B770CF44E7DA6F894F25B7792579454CC0DC00CFFE1C387633BABCACACA401CABABAB014096E5482482D9AF00505B5B0B00AEEB5A96859E5674AA3A8E8331311459C771705AADA669A15048D8AD02412941DE15145B7AE217535821FDC5A79427B013685D62101F00705582A55381737DA73FD7342DF02A70CE65590E5A5EE165817F8ECEE2A0E5A0EFFBD825568C0417087602BF3E81988AF2C5FE45288E402010F43F425B050281A0FF11DA2A100804FD8FD056814020E87F84B60A040241FF23B455201008FA1FD1F3A61F201E00009701006C82C3637C00D079F010001F1300004F56F77EE336F81FFD6B50810280820D1218010090C127C008C8A266512038301076AB402010F43FC26EED0FFAEE500C00300F9BF49998140080B2E03127F8A88C2231937FF8877DEFC6FADE030040E200E051E20367E2E314080E1884DD2A100804FD8F3074FA0126A1EF930280C268F09863AB1A2201804B00D0B20520E0EEFDC6755F82A2910AA5CD34708394038007C2CF2A101C5808BB55201008FA1F61B7F6032E700050D02AEDB35B0900700900C02100C5403FA2DB65DCD25C0D0040E600007D39088403804B018A390804182D3A77F7F118040241BF22BE8A028140D0FF08BBB51F288DDBF7259CA2AD4AC0B27C599700807A2EA554B65D90E5BC564613628B6574AACB8413204008F83E281267CC07098A76AB06401950D667290B0482014768EBFE4596250060001280442550093046A00C6D95A90C008C3189F60927F37DC61850A1A302C1818BD0D67E0095B2CF195AF294074064A0C080FB2AF7C0F5A0E083E3188932067A1BC401B021EF03A5000A704E815155459BD50702001464C200FC627AAD4020186884B6EE4718071A58A8AEBB6DEDDA5032EF384EAA26B2F71B51A8EBFBBEE110C65858363CCFCB29D2902143A0AA627FECB34020E81784B6F603C5B57A4960B02F5980FBC01596279C435BEBA2A79F3237B74B9214EA4AEDFDC6B7C788EFFB11501CC751B490EFFBC968F8C8238F1C7EDE3C00B0250D007C004A4022E4A3F908028160C010DABA7FA140293A465575C78E1DFAB656D33455AF0C7FABE380EFFB4C965CD7259287241289FDB5C70281A03F10DADA0F7C5C29599FBFD59140EA0BE6AB6AB5A2D4E886A6A839DEBEF71B1F95326DDB8ECB502814A48866DBB6EBB18A820B1E07002A7100F0010811CE5681E0004268EB7EC4075F02093CCF711CD5B639E79224B9AE5BD698624DD23CCF93244992244DD37CDFF73C8F799EC84C16080E6406465B0921D96C361C0E170A05C3304A07A37B9E87E3AF2DCBD275DDB22C4288A6698542A1502854545400806DDBAAAAFABE2FCB72369BD5348D522A4992E338AAAAEE6E707759F8D893151400A025DB23C4F28101000703A0AF3F95C4540028C81C00647000406104004CA21320961CE2B209493723EB50004556985446FFD624147C856FD4333444D55CBBACCAAA6C02F7B9A60080032A00C43C0EC407CA70870502C180336076AB699A00402945438C10C218735DD7F7FD4824E2799EAEEB9C73CEB9AEEBBEEF6B9A66180600643219545BC77138E7E17038D826A5B4A7A7271E8F0FD441090402013230DA9ACFE7376FDEACAAAA2CCBF5F5F5922431C60821289AA954AAA7A7A7AAAA4AD33400701C67FBF6EDAEEB5655551142308CD3DBDB9B4AA52CCB1A3C7830DAB9A8BFFD25ACC516AB3200106C9E4A3800106052DF2000EC65A542D1B0A5E00280041F0E2120C00810021C800378043C0A2E15A17C81E073C0C068EBFFFEEFFF7EF0C107BAAE3736369E7AEAA963C78ED5751D0064594E2693FFF55FFFE5795E2C16BBE5965B64597EFEF9E79F7CF2C970389C4EA7FFF33FFF339148AC5EBDFAF6DB6F2784288A525757F7B5AF7D2D1A8DAAAA8A6E04C6D827EEC027526C0388FDFD14800FC7AA10600040386A2816B762AF160F002856C07E443F190007F029F884B884086D15083EFB0C4C44C4308CB3CF3EFBB6DB6EBBECB2CB468F1E8DC28A9AF8C20B2F30C6BEFBDDEF2693C9254B9670CEEFBCF3CE0B2EB8E0BFFFFBBF4F3EF9E45FFEF297D96C76C9922583070FFEE94F7F7ACD35D7140A858E8E0E420800789E372087231008043B3130DADAD3D393CFE7354DABAAAA324D1373360120994CBEF3CE3B3367CE1C3468506D6DEDBBEFBEBB64C992E6E6E6C30E3B4C92A4638E3966DDBA75B22C3FF3CC3393274F364DB3A1A161D3A64DEFBEFB2EC6C1D021DB4FB0620F96BE470C0803C240E3A0705000640019007BFB1100C2406620335019A8405420AA0FB20F1203897D981EF5E1660502C1679881D1D6783CFEF7BFFFFD873FFCE1D34F3F9DCD666559962489521A8BC5366DDAD4D2D2E2BAAEAEEBEFBFFF7E3E9F070055550DC3D8B469D3F6EDDBD7AF5F9FCBE5264D9AC4398F442284906DDBB60140A150A094F64B9280402010FC8B0C8CBF75EEDCB93367CE4CA5528F3DF6D8B66DDBAEBBEE3A4A69A1502084C4E3F19E9E1E455192C924A5D4755D4AA9A2289665D5D7D75B961544BD18639EE799A6D9D1D1E1FBBE6118983AEABAAEA669AEEBB6B6B67676761A86D1D9D959EE1E52D5028082AD854221D78B3A8E03B22A4992E3E709D8D037031024260180C43900E4158062E04BF634007035A9502844E2A450288CEED89EB63C2EC9202B843B7BBF279EEB124238E79EE769445655D52ED83B76ECC8AE5E0D0069D50080AA3CF389CF28635C242C0BF60ACE392124168B5557572B8AC218C3A4C681DEAFCF0E03732AC78F1F9FCBE542A1505353D375D75DF7F5AF7F1DC591739EC9640CC32084A8AA5A5F5F6F1886A22898399FCD661389C4D0A1434DD3ECEAEA6A6C6CF47D3F9FCFCF9C399310825786EFFB8AA20000A514F53797CBB5B6B6967BD164AD0E4DD3184453A994EDA4196344D10000246FEFB5350B1E63CC6592EBBAF97C5E92244288EBBA659D754208A594521EC4E8B088604B4F0F14B59516B5958BFC56C1DE51BCAE6828140A87C318190600B1F2EB2F06EC36150A8572B91C4AA1A228945200705DB7A6A666E9D2A5871C724832999C397366241259B972E5A64D9B860E1DDAD9D9D9D2D2625956454505BA0E72B99C699A471E792463AC502884C361CEB96559A6692A8A525B5B1B8D46755D374D73F4E8D165ED9E4719007820B776643ABA15DFF79912725D9F6A1210078A7A8A4AAA300E000ACA1A570040F32800E861600C249ACFF7F4D83C2D19955C4EE7F379552EE3F20DB4157FE59CCBB2629AE6F4E9D301204D0C0088BB8C131F84B60AF61ADFF77DDF97240925D5F33CD7756559C66FA2E05F6760B4F5B1C71E3BF1C413DBDBDBFFF297BF4C983021994C261289DB6EBBED1BDFF8C617BFF8C5EF7CE73B279D74D2BA75EB0E3BEC30CE794343C3B66DDB745D7FFDF5D7274D9AA469DAECD9B31F7FFCF1993367BEF7DE7BBEEF0380EBBA914804003CCFC36B851022CB32DE9055B58C3A28C4F66D00E8ECB19E7BEEB935EB739EE77135EABA2E976177DA9AFF88B62A009061055555259AF47DFF18C8269349DC25C74FEFFD9E6001053EC6851B95354DD3F0498E195D9CE30BCB69BA2DF85C83364DA9958A4BBD01DCA5CF1803A3ADB22C5F7FFDF5C96472CE9C39D75C738D699A6BD6AC79FDF5D7AFB9E69A4993265D7BEDB5FFFEEFFFFE831FFCC0300C55556FB8E1867BEFBD77DBB66D3367CEBCEAAAAB14459933674E4747C797BEF4A5B163C79E7DF6D9C3870F07806C366B18063A1600006BBDB082369BCD967B37A610020023011957EB717CCE3927952E717D90383880BD51002850006C4C0DF9BE0A031900341CB8A27A9EA27896EDBA6E879DCA7A5ADACE7A1E37CB947AC618638095C1BEEF830CB22C734A0180A29A524A0827148008A343B05770CE7DDFE79CE3578310823E2BE113E82F06465B67CC98316DDA34C7711A1A1A144521842C5CB8F084134ED0759D1072FAE9A71F71C4110D0D0DD96C5692A49696961FFDE847B95CAEA9A909035CB158ECFCF3CF3FF7DC732DCB6A6C6CC46D864221F466CAB2CC18638CA9AA8AB7E24824526E41814729E34C9629630CDDB81EE7E8FE4759ED9B35000400F06E8F6A5B7C4C00C0755D3C3AC33034D04CD354B2E97D300D505B3182870A0B45BF18D62E00E71C3870CEB948F012EC1594D22008816BA3204A3CB03BF6996160B4B5BABA1A635318A04405BCE4924B5455CD6432A669565555799E87EB7D5996138904E6AE1A86813D594CD3E49C57565602403A9D966519252C7008040E5C7C41B9570C077038A5043CA231C574B963F1B04F7C97C89C78D05701BB0BBB9512190030A1D5933587EA8EAFE98A9E7749CE814CCE23A42F2AB69760CB0594753C51C1D70082F686F895206457FD0E05825D90CFE7F172C2EB0A932041C4B2FA8F01EB8365DB36869E2449F23CEFFCF3CF678CE5F3F9482462DB367A4B63B1583A9D8E46A3006018464F4F0FF6C1C21E5AD8010B33AE344D436B2E97CBA1F18B9708FAE603EF64597BC8180005DBB65D57F13C0F645014C523B00BBB15766DB7628C8E158162A22EB7BBF77E4F505BF101A524F802EC5244C51743B09760B3A452D04B5056034CC11E18306D2D6D06284912DA65E82DC5D013FE6F2412095E964824F0712814E29CE34F5CD7E09F73CED19E0D8A08025740B9766B18C0A07E972B4574DD664CD1431665004C025BE636405F3716063A0070290B00320B0180CA0A00204B0500C843C8B299AA363022316F8BA64475FA163884F332661172408B95E0E104B6C6EE4E6C598729F8DCB2CBDBB010D67E44843E040281A0FF11DA2A100804FD8FD056814020E87F84B60A040241FF23B455201008FA1FA1AD028140D0FF086D15080482FE47B46BDC8F9022F86B69D7158140F0D946D8AD028140D0FF086D15080482FE4768AB402010F43F425B050281A0FF11DA2A100804FD8FD056814020E87FCAD656CC28CA66B33845354833C2192AAEEB0659479FC97E777C577CE28BF1D79D52B20402C16798B2B515D5133B5863577FCBB282492AC1582A91C82910083ECF94ADADC1A8151C7F8D4FE254A860AE5969A77D814020F81C52B6B61A8661591663CC344D1C5DA5EB3A142753514A5DD71593210402C1E79C7D8965699A66DB3600388EE3380E00E472399C06882FC061BCFDB897028140707051B6B6160A05599603B3341C0E03000A6B6F6F2F1407F00100EAAF4020107C0E295B5BD18B8A66A9AAAAB66D3FF1C413B22CAF5BB7EEA1871E5ABB766DE9CB040281E0F349D9DA1A0A8500C0F33CFC75EDDAB5F7DC734F2A95FAD39FFEF4D39FFE74C18205E9741A13060CC3E8E79D150804828384B2B5151336354D03804C2693CBE50CC3B06DFBC9279FBCF1C61BFFF6B7BF05D90281FEEE72238EE360B2676767272124F8951062591666CB72CEB3D92CE7BC5028E07F050F6CDBC63DC1575A9685CFEF6F7B99EC8A3D1C2600E0D9E09C07267F59ECD7C3110804FB897DAC1D40E1D3753D1E8F5B96F5B5AF7DCD719C091326288A120A85B2D92CEC515B5DD7457F42A150A8A9A9B12C4B55D57C3ECF1843B14655CAE7F3A1508852AAAAAAEFFBBEEF6B9A96CD667DDFD7751DA5C7F77DCEB9A2288EE3589625F2130402C181C0BEE4095896E5FBBE65598AA28C1E3DFA820B2EC86432FFF11FFF118D464F39E5142806B830376B97689A86B6AAAEEBF81393BAD09350281454554DA7D31816C3E819E6244892140E87514031154C92A47C3E2FCBB2AAAAAEEB160A857D3D15028140D06FECCBDC01CEB92CCBE974BAB7B7B7A2A2E2CB5FFEF2D4A953ABABAB1DC7993B772E1AB6BDBDBD894462775B482693A15028128900407777777D7D7D2A95324DD375DD482422CB320044A351C7716CDBC65FD17B5B281418639AA6C9B28CA6AB244928A9BAAE472211D1DB5F20101C0894ADADB8D22F140A0F3CF0C0430F3DB463C78E214386388EA3280A63ECD8638FBDE38E3B00209148E4F3F9DD85B3E2F13800747575BDF5D65BC71C730C0054545430C6D0D4DDB061C33BEFBC73F2C92747A35154EAA79F7E1A00EAEBEB274C98100A8538E72B57AE5CB060415D5DDD8409139A9B9B2DCB4A26938944029D15FB7A36040281A07F28DB2720CBB2699A8AA2D4D4D41C7DF4D173E6CCE9E9E99165B9B1B131140A8D1B372E954AA55229285A9ABBC3F7FD1FFCE007DFFDEE77972F5FDED1D1010058D0B57EFDFA9B6EBAE9DD77DFFDAFFFFAAFB6B636DBB6EFB9E79E3FFFF9CFAFBDF6DAAF7EF5AB575E790500962E5DFAA31FFD68EBD6AD6FBCF1C66F7FFB5BDBB6755DD7340D4364FB7826040281A0FFD8977E02E8D39C3D7BF62DB7DCF2A31FFD68E2C489DFFAD6B79E7AEAA9B3CF3EBBA2A222140AC56231D863ED0063ECFDF7DF8FC7E3C3870F8F442235353500A0288A2449EBD6ADABACACFCCE77BED3D3D38332BD70E1C26BAFBDF6E69B6F3EEDB4D35E7AE925C771162C58306CD8B09B6EBAE9E28B2F5EB76EDDF2E5CB01009BC5042D0E0402816000D9971C2C599665591E3C78702291686B6B5BB060C19429530A85C2A44993EEB9E71E5996F3F93C3A4077B711CFF3FEEFFFFE6FDEBC79757575994CA6502860FF97743AFDD7BFFEF5F8E38F0F87C34D4D4D2FBEF8E2BA75EB72B9DCA1871EAAAAEA8C1933DE7AEBAD542AF5CA2BAFCC9B374F92A496961655557B7B7B5155B1E7E1BF743E040281A03F28DBDF8A86612E970B854296658D1831221A8DDE78E38DE79C73CECB2FBF3C68D020D7754DD34CA5528661789E87AFC7B65894524A29E77CF9F2E58AA20C1D3A9410A2699AAAAA1892A294E6F3F961C386799EA7EBFA5B6FBD3569D2248C89611AC0C68D1BB76DDB6618463C1EA794767474288AB278F1E2238F3C1273BF128984E779AAAA524A1963B89D7D4B14755DD77625281AD49C7100286B33E8FCC56406424890E85A9647185FEFFB8C732E498AA6691248AEEB6A40008014DF09FF1110B716C1DE62DB36A514BFA198CB28CBB20857F417656B6BA150300C03034ABAAE67B3D98B2EBAE8C9279FBCE4924B9A9A9AEEBCF34E45517CDF8FC5628542017DA00886FB5DD7B52CEBF9E79FFFE217BF585959D9D3D3A3284A269389C7E38CB17038DCD6D6565151E1BAAE6118A6693A8E535555E5799E2CCB1D1D1D75757500904EA7F10AA8A9A9F17D3F954A61B5582291C8E572BAAE73CE33994C2A95EAE9E9A1946ED8B0219D4E97759892A632C62C63643299B4EDB0AAAA3E9739E78A5AEE09EB07025DF67DDF719CBCE7E572B977172D0480B46A0040559EF9C4679471102E11C15E81098ED168B4BABADA344D51A4DEEF94ADADB22CBBAEAB280A26F65755555D7BEDB573E7CEEDECEC0C8542C71E7B2C0060AD14C6B21863BEEF073DB33DCFCBE572CB962D9B3061427B7BBBEFFB2FBFFCF239E79C138FC7354D638CD5D7D7BFF7DE7B279D74D2FAF5EB8F39E618D7755B5B5B3DCF430B3412898C1831027363BBBBBB2B2B2BC3E1F0F8F1E301A0B3B3B3BABA1A459F10A2288AAAAAD856261C0E6366C2DE93776C59967D45916519CD6DC2F67BD1D72EC1C3E9B34AFB5600E0FB3E1E11550D0088AB425B05E561DBB62449F81D09565403BD539F29F6C52780B1785996B3D9AC6DDBFFFBBFFFFB831FFC006BA25CD7B56DDB308CDDADC1D104531465FEFCF900B078F1E268347AC10517E4723974D1D6D7D76FD9B2C5711CD334070F1E1C0A85DADBDB53A9546D6DADEFFBF5F5F5B66D0F1E3C78D1A245175D74512693696F6F1F33660C00C4E3719421DFF76559360CC3308C4422214912FA1FCA3A4C9F80E7795DBE160A852489524A25828D13DD72CFD8BF48E0442684504A1445D16525140A550C1F0E00696A0040C2619CF85C68ABA01CD04D879538E8AC1BE83DFA4CB12FB50378979365D9B2AC743AFDE8A38F9E7AEAA993274FC65254CFF3F0D3CAE7F3BAAE534AB1CC1F3F4845512291C8238F3C822F38FBECB3AFBCF2CACACACAEEEEEEFBEEBBEF9BDFFCE6F1C71FFF3FFFF33F0D0D0DEBD6AD6B6E6EAEABAB6B6868F8CB5FFE525F5FFFECB3CF1E7FFCF1555555975D76D9B7BFFDED582CB675EBD6EAEAEA51A3465996856F8DD5B48CA17752525515005CD7DD875A584995240718638EE3514A8142607D7F9A14DF9433C638A7841045560CC320540200091DAC924408104A0044C9AF606FC198047E59B00D880805F723656B6BE9023F168BF9BEDFD2D272FFFDF79F79E699C96472D8B06153A74E05807C3E6F9AA6E779F881A139090092246155AB6118B22C9F78E289F5F5F59D9D9D5D5D5D2FBFFCF225975C326BD62C4AE9430F3D74FBEDB70F1A34A850287CFFFBDFBFFDF6DB172E5C3863C68C4B2EB9249BCD0E1932E4C20B2F7CFDF5D7C3E1F0A5975E1A8BC52CCBB26D5BD3B460E48165599452DCDB3D7436D81DAEE70200210A1ADA1F46A5F6E566F42F5134283863CCF398E7798C30CEB9F81208FE156CDB0EFCF825EE26263A72F417654B05632C70B9BAAE9BCD66070F1EDCD6D6F6F39FFFDC308C59B3664D9C3811DDE4966561FC0AC1CF0FEF90D87B4555D5AF7CE52BF878D1A245B7DD765B4D4D8DEBBAD3A64D9B366D1A3A1F0CC3A8ADADBDE38E3B82EE2DE170D8F3BC33CF3CF3CC33CF44D7016E0A3B0FE0D6A038FB0085093DB9651DA6244994508961AC9F41F1265FEEE9FAD7F17D3FD07742184ABCEFFBC01900309458C638E5C01807119110EC15AAAAA2C5B053B7B681DEAFCF0EFB62B7E2E4414C29ADA9A9B9F3CE3B57AE5C8935FE43870E751C073F278CD7E3A78585FFB88520232AE85528CBF249279DF4F1F7521425483040B045962449B8354C1F09B68619B5419343287A9430B656D66152427CE6FBFE87028DEFCBB9CB810300700E00F878BF9A909224F9BECF18C7905AF0649F13167F2F7A64F7F3BE083E5304DFCDE019E113E847CA762062E7AA40B3745D7FE8A187AEBCF2CAE9D3A75F78E1855D5D5DAAAA6632195DD72DCBDA1F7B2C100804073EFB129CC145370030C692C9E4030F3CA069DA75D75D575959F9C0030F000046900624F2231008040702FBE213300C03E59510B266CD9A152B56AC58B14292A4B973E7DE7AEBAD004029B56D5B94F60B0482CF2DFB3E77003E3A9EA4A6A60625357899F08B0B0482CF2D656B2B0A68A09BA3478F9E3871E245175DF4F4D34FDF7EFBED871E7A28B6AF0EE2F5028140F039645F5CA298370A00849068347AE9A597160A85ABAFBE7AFDFAF5575C7145E0311015CA0281E073CB3EF66A711C07EBAF0A85C205175C3069D2A44D9B36D5D4D40C1E3CD8F33C9CCE823958FB63A7050281E000A76C6D350C036BAE52A9D48F7EF4A3E1C3879F70C20923468C183D7A347650C597298A92CBE54CD3ECEF1D1E60C8877DFC30BD744FF980BB9BA1BDBB2DEF6E2BFFC2FE0A048281A16C9F402693314D93739ECBE5FEF18F7FDC74D34DC71F7FFC35D75CF3F4D34FB7B7B733C66CDBEEE9E9618C61DF3F814020F81C52B6B6E270D6F6F6F6418306FDF5AF7FFDEB5FFF7AE28927B6B6B6FEF77FFFF797BEF4A5C71E7B2C140A55545470CE716A964020107C0E295B5B31CBAAAEAE2E954A45A3D1891327DE75D75D4F3DF5D4430F3D94CD66FFF8C73F26934900902409A766090402C1E790B2FDAD9AA66143BF582C96CFE7376CD8F0C1071FBCF4D24BAB56AD721C67C68C19F178DCF77D8C65ED8F3D16080482039FB2B59573EEFB7E3E9FF73CEFAB5FFDEAAA55AB2CCBAAACAC9C3871E255575D850D06B1ED7F693742814020F85CB12FDA8A41AAD6D6D6050B166CDDBA75ECD8B1679D75D645175D54555515BC4C922491DF2A10083EB794ADAD5838E0795E6D6DEDF7BFFFFDC58B172F5BB6ECFFFEEFFF5E7CF1C5E38F3FFEFCF3CF8FC562D8EA5434D91508049F5BF6A53736F6F64F2693975E7AE905175CD0DADABA6EDDBA0F3EF8E0AEBBEE5AB264C9430F3DE4FB3E630CFB67EF8F9DFE4C22EA2C0482CF1265FB437120952CCB151515387E95735E5B5BEBBA2EA5D475DD42A180E3FF84B00A0482CF2DFB92270000C964321289FCE10F7F58BF7EFDD34F3FBD61C386AAAAAA59B3667DF9CB5FC671589EE7452211618B090482CF27FBD84F201E8FAF59B3E6A73FFD697777774B4BCB57BFFAD5638F3DB6B1B1118B5C838923028140F0F9A46C6D5514259BCD02406363E30F7FF8C370383C64C890A6A6A67C3EAFAA2AE79C10820F0A858248711508049F4FCAD656599671A8AA2CCBB366CD92651907BEEABA8E33FBD2E9B424499AA6E1DCC0FDB1D3028140708053762C0B2763E3EC555996318F15470FE0F0C168341A0A852449CAE572FDBFBF0281407030B02FB12C4248369BCDE7F3D96CB6A2A2821012894470D634BE069B1086422161B70A0482CF27656BAB6DDB28A33FFCE10F154539ECB0C3EEB8E38EEBAEBB0EDB08C462B19933676A9AB6E7E4561C4C20CB72A150D0340DF361D1B74029C57A5949925CD7050049926CDB360C030BBD822EA884102CAB455F043648A5941EF861B4F2F650DC9F04828390B2B555D775CC603DF7DC73BFF9CD6F3EF3CC339B366DFAE637BFA9AAAA6DDB679E79E6D4A953B19F4BA150C086841F078BBB2CCB320C034AA66D6382976DDB9452CFF3F05700C866B398DA150A8550492DCB721C27168BF5F6F662C32D42080AB4A8B5150804034ED9DA0AC531DAD3A74FFFED6F7FBB64C9927FFCE31F975C7249555595244968751242B0E7C0EE7C02288258148B4A8A46ABA2289EE731C6344DCBE5729C737C593C1E070059965DD7B52C2B1289043D0CA3D128A5D4711CAC56F07DFFC0B75B0502C1679E7DF109A0B1D9DBDB3B62C4881123460C1F3E3C140AEDD8B1A3AEAE6EECD8B1F97C9E52AAEBBAEBBA18F2DAC5BBCA722E97735D371E8F6B9A96CD6671342CE71C036568A20280E338D855ABB3B3B3BABABA5028A8AA0A00AAAA7A9EB775EBD6E6E66600608C799E875E0861B70A048201675F62596869C6E3F18E8E8E6834BA66CD9A1FFEF087B66DD7D4D4DC7FFFFD63C68C81A265BA3BBB75C3860D2FBFFC723A9DAEAFAF3FE38C33C2E170606F72CEFFF9CF7F2E59B264E6CC99871C7288AAAADBB76F7FE9A597DADADA060F1E7CEEB9E7E2C69F7BEEB98D1B37160A853973E64C9C38515555C618E71C0DD87FED9C080402C1BF4AD93958D96C56D3B442A14008A9A9A9E9ECECBCF3CE3BC78F1F7FD555578D1A35EACF7FFE3300388EE338CE1E9204366EDCD8D3D3D3DBDBFBE8A38F2E5DBA140018638EE3D8B6BD72E5CA3FFEF18F5D5D5D7FF8C31F56AF5E6D59D6134F3CB16CD932CFF35E7CF1C5975E7AC975DDB7DF7EFB89279EC044DA3FFDE94F6D6D6D986FEBBAAE305A0502C18140D9766B381CB62C0B25ACADADADABAB6BF3E6CD4F3FFD746D6DEDDB6FBFFDA31FFD082D4742886DDBB87EFF3893274F3EEEB8E300E0B2CB2EDBB871E3B871E34CD3C489DC3B76EC28140A77DE79E755575DB56EDDBA783CFEE28B2FFEE0073F983871E282050B7EF6B39F1D7EF8E12B56AC18366CD8B7BEF5AD7C3E7FE9A5976EDFBE3D9148689A86750D425E0502C18053B6B662EE2A00B8AE5B5757B771E346C771B01B16E73C93C9A8AA8A19548EE304DA4A08E14500A0A2A20200BABBBB354D0B87C391480457F49EE73DF3CC335FF8C2170821B1586CF3E6CD914824140AA19F01651DE7CBFED77FFD572693894422353535EBD6AD9B38712214E75407A95A9224616703DC785987E9319F730E207DB85960841000CE8103F4A546E1E3DDC5CEF0A8714F82FCDFE024ECED9E781EA59452C218638CE37670CB00C0F1BD39E7C0FB7E0A047B0136590E0A7F38E7185B1639E9FD45D9DA6A9A264AA7E779B22C8F1B376ECA9429175F7CF197BEF4A57FFEF39F871D76582E970B85427BEE83954EA79F78E2892D5BB6545454CC9E3D3B48868D44225BB76E1D3C78703E9F0F87C36FBFFDF6B871E36A6A6A50959A9A9ADE7EFBEDD6D6564CDEC2EDF7F6F6FEF39FFF3CF7DC73F17DD1170C009C736C78A8AAAAA2288EE3947598449139E78CF5CDA79165197C705D57D9B521BE1F290A348762131CD77573B99CEC3800E0A812003087F9C46794096D15EC25F83541FB0300B0E132668B0FF4AE7D46D897992EA5030562B1D895575E79FFFDF77FF7BBDF6D6868F8C31FFE80F17DDFF777972480FF6BDBB66559BEEFBFF5D65B471F7D340074757599A659555565DBB6A2285D5D5DC3870FC7A9B1A8E39B366D8AC7E3AAAAD6D7D75B9695C964D00F8059B4413D02EE9EE338A954AAB5B5D5F3BCEDDBB7F7F6F69675980EF30921057DC48E1D3BF2F9442C16434707805DEE19FB1729357ED162F55C2F9FCF6F7CF75D0048AB060054E5036D15713CC15E61DBB6AEEB8944A2BABA1A931A03A364A077ED3342D9DA8A36239AAE8490542A75FAE9A78F1E3D7AF3E6CD0D0D0D23478E04806C361B0A85F2F93C666B7D9C442271E5955702C0AF7FFDEB5FFCE217E87BADAAAAB22CCBB22CB41343A1504D4D4D2291E8EEEED6753D9FCF0F1A3468D4A8519595959B376F360C035DB4AAAACE9C39130030D9000D6ABC4A545545D9B52C2B91489475985CA29CF38C1C374D9366A8EFFB1E780362B7E2B51E245170CE018824497844926A00404213DA2A280F4C1E8F4422F83D82928AC781DEB5CF08656B2BCA65A09B94524992C68F1F3F66CC18CFF392C9A4AEEB8661E0527A771BE9EAEA5255351A8D8E1D3BF68D37DE4826938CB14422A1AAEAB871E35E7DF555B45867CE9C595F5FDFD6D6D6D6D6565757F7EAABAF3637371342C68D1BF7E28B2F5E71C5155BB66C711CA7B1B1B1A7A7077DB8816B55D7F570381C8FC71545D1346DE8D0A1651DA60F0000BD00D5D5D55AD2E59C33CE28A5009F76A08C734E2995248A137629A58AA287C3E1CA91A300200D1A00447D00E2036520B455B0D76047507CEC791EE6418A14C6FE625FEAB20A8542381CF63C0F4BA40A8582E338A15048D3B4A0612B5610ECCE2DF0B39FFD6CFAF4E9AEEBBEF1C61BE3C78FC75E04E79C73CEAF7EF5AB73CF3DF7DBDFFE762291088542471F7DB4E77953A64CF9DDEF7E377DFAF4C71E7BECECB3CF4E2412575F7DF577BFFBDD4824D2DEDEDEDCDC5C5757178FC7D1691B141DA0C2E20EA45229CFF3CA3A46973300B0B96ADBB6EBFA8AA248B2244992E797B79D7E01A30D41984E51144DD7714F3C490100F018233EA78CEF36AE2610EC0C7E2970018A653B9224099F407F51B6B6A2E984B73BCBB2F2F9FC430F3D74DE79E7298A8273B430A6C439D7757D779FD3D1471FBD61C386D6D6D6E9D3A79F71C619AEEB2E5BB60C27715557579F7FFEF91F7CF0C165975D46298DC5625FFBDAD77EFBDBDFCE9F3FFF8C33CE38FAE8A36559AEAAAA3AE38C3356AD5A555959396FDE3CB458F142C12C5754A260FC8161187B70FEEE1294289901B682C1BE30AEEBCA9FFA4D1DD76BBEEF170D58090098EFCB920C00326628CB94120294EDDBCD52F0F9A4F44B81179810D67E645F6668ABAA8AA5A8F178FCEDB7DFBEF1C61B8F39E698891327628C1E33B40CC3D8437EEBDCB97393C924E73C1A8D4A92944EA753A9D439E79C130A850821A79D76DACC9933E3F13806F79B9A9A6EBAE9A66432895D05D2E9743C1E3FE79C733A3A3A22918861183812119B6F699A86692578A1B8AE8BFDB4CA4E7AA5D4719D82A362504ED3B4822F635FAE4F19F420E37A4D92FA2C0BC77154CE0080E14D80314E1800E39FBACB42709082CBA0607189564890DB27F8D7D947BB5551947C3E2FCBF221871C72F2C927DF7AEBADB366CDF27D7FD2A449B366CDC2EA7E4DD382CF2908C8E047C818330C03AD307CF1D8B1635B5A5A825762A0A6740BB1580C1F07A95DD5D5D550CC5B406B4E96E5E08DD0B82EFD59D661720049925415B02317218453459665203EE9336A090090FE5B83EF6E0FD1838C615C6633C771982CABAADAF76508FE98102064F7B9B602C14708BE35A5DFCD3D092B213E800FC00178B1A053F2730040C0238478540700075400080360FA3900388E23CB32A5141322D1C91BE4682318BF41950FFA9060FD11766EC2CE79E8B8F03C0F97A407B88F785FEC568CC263D268575757369B5DB060C1DFFEF6374AE919679C71C41147E0C8AC3D6F44966554074A69381C360CE3C03C410281A09452F545292040F1DE0EC57BBBEFFB914804DD68D84D1FCD295C53966E0D75361289D8B60D008542C1344D747F6173E720332C089904AE8C6000CA1E96C803C8BE686B2E97932449D775C7717CDFBFF2CA2BBFF8C52F3634342493C9E6E6666CE40A9F942817B4B206004992F0CE26D62302C181096196045422924F240090A034618B00800C3EE75C251C005C970556309624405146716B816F176B6130ED529224EC298A259D41CAADEFFB98E18E86B6EBBABEEF63C225CEEE3B008515F62DF411A46EC8B25C535373FAE9A703406767672C16C3D67F98C6BF37E02B83F101FBB0330281E0D38073800FF3503870027DEA498003E70C180030CE0040D7F56C361B0E8771090F00B22CA31A1637F661D676E027248460A211FAC1D08180410E4551027DC04ECDF8D8711C6C4F7A00A6E5EE4BFFD670380C0078B7D1757DD1A2458F3DF6587575F559679DD5D5D575D8618799A6E9BAAE6DDB980EB5EB372E89511E80E74520107C04EE12A0C0984414420803890370D0008080040428F800A001C67B750040F35396651C048561D8404F03FF00BE003BE1854221FC2BFC2F8C4507A50D8EE3504A5179823ECE1FF7331C20EC8B4F001F602FEA6DDBB6DD77DF7DAB57AF6E6D6D9D3469D2EF7EF7BB3FFCE10F0040080987C37B983B10C4B5826D0A87804070E0521229658C31A00040A5BE882E0152F4C4527C41381CC6861E8661689A863D9E304EF5F1152AE73CA8E1C4176075E54E2F46AB16C78B60AAD281EC4B2C7B19AE280AF618C463DEB163C7FAF5EB6FBEF9E6C6C6C621438674777703403299DCB35B8015C1298401FB7C18028160FF22C9402520D405D90525072407A487931E4E7A41E905D902CD060D8002506C27A4288A6118ADADAD3805EAB5D75EC39E79B8BDC0E58A9D0DF0C9952B57A20EB8AE8B112D0028140A28B58CB1F6F6F6F6F676CBB2B00753303A6F804ECA9E285B5B83948820D93397CB614380B6B6B6DADA5ACC3FD5342D93C9EC6E23E896C613272455203838282E3451153907C701D705D705CF07CF633E03F07DF0FDB56BD7CE9F3F1F35F199679E59B66C595757D74F7FFA53B4A54A378969550080CDF2FFF6B7BF757575A1195BAA98F89AD5AB573FF2C823D75C73CDFDF7DFBF6AD52AD7753DCF731CA7B47BD481C3BEF4C14261455FEAC891235555BDF1C61B5B5B5BEFB9E79E69D3A645A351F4AA04535A77B9117C506AF01F984E937F0552047FDD73DDCB81B9AE1108100F0CCF67B2445D808D5B7A7FF5D8DF154571F52AC618E1B66DDB870D099F77D671002600B4B5B52D5EBC78EEDCB9EFBDF7DE6BAFBD76DA69A7E1E23D954A55545404EBFD7C3E8F73A3755DC7EACA69D3A6D5D6D61242F2F9FC4E73A01DC779F6D9670921B7DD76DBEAD5AB2B2A2A1445F9CD6F7E93C964AEBEFA6ADCA665599AA6799E87867032998C442294D26C361B894430E53697CB05AFC1E4AD4C26138D46B13A29E83A8D59ED58B993CBE562B15869D312F45AEC59D3CBD65634E9F16853A9542291F8C10F7E70EBADB7E6F3F96C363B6FDE3C74B244A351DFF745CAAA40F099A12FBEE401B6A89724299B05CEB9445CCFF37239E230F098470841B9CC6432BFFFFDEFAFBBEEBACACACACECE4EDFF7BBBBBB972C5992CBE5CE3CF34CC330162D5AD4D3D3E379DE91471E198FC74DD3545515EB2DB76EDDFAC61B6F6432994B2FBD34168BA1E47574741C7DF4D1CDCDCD4D4D4D994C269D4E6FDDBA75CD9A35C71F7F7C4B4BCB8B2FBED8D6D69648240E3BEC305555DF7BEFBDA6A6A6E79E7B6EF5EAD537DC70C39B6FBEB978F1E2193366B4B4B4C8B2BC76ED5A00C0CAFBF3CF3F7FD5AA55EFBCF3CEC891230F3DF450CBB2B66DDBF6D8638F4D9A34E9E4934FCE66B3EDEDED6BD7AEFDE0830F66CC98316CD8302C64F8445BB06C9F0086EDD0DAC79BC0B871E32EBCF0C26BAFBDF6924B2E193E7C3800E0E8D6C0872210080E763C000F4BB328B8A0667C33ED19DD2CDEC313495E9926D516980E014A654A654DD33A3B3B7FFCE31F9F78E28913274EC46686854261D5AA5583070FDEB061C3CA952B1F7FFCF1C58B17D7D5D545A3D19B6FBE79E3C68D994CE697BFFC25166AA652A9499326353636FED77FFD572E9743EB72EEDCB9AFBFFEFAFDF7DFBF78F1E29A9A9A743A8D95F7D168F4A1871E6A6B6B6B68689065F9273FF949A15078F8E1877FFBDBDFD6D6D646A3D18B2FBE5892A4430E39E4DE7BEF5DBF7E7DA150B8F7DE7B5F7DF5D5C6C646DBB6BFF6B5AF6DDBB66DF4E8D177DD75577B7BFB238F3CF2EAABAF7EE10B5F48269337DD7453381CFED6B7BEB562C58AAAAAAA68348ABBB73767AC6CBB1513D6C2E170A150C068DDC5175FFCFEFBEFC7E3F15C2E97C964BEF295AF04C96B629D2B107C36A0E0110E3291750A3A0545D60921204738E79CBABEE751E20300651600E09A351289B4B5B5A1A5859903A79F7EBA699A6D6D6D5BB76E7DE08107EEBEFB6E340357AD5AF5873FFCE1DA6BAFEDEEEEB66D1BC58410E238CEB66DDB38E7B8A83FF6D863C78D1BF7C61B6FDC75D75DEBD6ADBBE8A28B6A6B6B2DCB6A6A6A7AE8A187CE3EFBEC542AA5EBFA860D1B0A8582655953A74E1D3F7EFCF0E1C31F7FFCF13163C6C462B1975E7A69D9B26563C78E755DB7A5A565DCB871E170F89FFFFCE79C39731863B5B5B56D6D6D0F3CF0C037BEF18D850B1786C3E1DEDE5E4CCB9D33674E4343031413CBF0C19E53F2F7255DBF502800806118BAAEAF5DBBF68D37DEB8FBEEBB9F79E6991B6EB8E1C9279F84E2202C21AC02C167060A1473B07C1FB02C0AAB8430C3E723B104422449D234ED924B2E79E38D37162F5E8C59AE9EE7E1B4114DD31289842449D889D4B22CD7751B1B1B2B2A2A38E7B1586CD5AA554F3FFDB4AEEB389A24281648A7D3757575679D75D6E1871FFECA2BAF04A9AFBDBDBD85422191480C1D3AB4AEAEEE965B6EA9AAAACAE5725871DBD3D3D3D4D484BD9C7CDF8FC5621848571485318662855DF931C69EC964060D1A3463C68CC993277FE73BDF29140AD96C16B7161C35007C623158D9DA9A4AA5B05B4AA15028140A95959523478E1C3A74682C161B356A54341A058068348AB503E56E5C20101C98C860ABDC92B8AD30509825314FE6BE2AC90A95642AC9545281A900C05DE02E0E401A3E7CF8ECD9B39F7CF2494CCDC4DE2B8661A452A9542A3561C284D75F7F3D93C9B8AEBB64C992912347624BBCCECECEA54B97462291E9D3A7CF9A35CBF33CCC4D0280CECECEDEDEDEDEDEDE68345A555595CD6631D6148D46870F1F1E0A85264D9A346CD8B01123469436A0C9E5725D5D5D9AA64992D4D9D9198FC7B3D92C14539E5455C59C51D334B1DCA9A6A6C6308CEAEAEA51A346C9B26C9AA6699A914804EB71B1C35F2E97DB8B335626B1580C005CD75DBF7EFDFCF9F36559668CDD7DF7DDE3C78F5FBE7CF905175C000058F9BA87FEAD0281E020851008B2FAD16CA4E0171B7B0230060096658542A16C367BCE39E7DC70C30D8B172F9E3C79726565659062649AE6DCB9731F7EF8E1743AEDBAEE8C19338E3BEEB89E9E1E4C93AFADAD5DB870E12DB7DCD2D8D888A501BEEFF7F4F4FCEE77BF43B15BBF7EFDC5175F1C0E87A74C99F2E73FFF79C18205575C71C5830F3EF8D65B6FC562B14183069D7EFAE9555555E818C54928D86874D0A041817D8ABD3A239148381CC6F1A9D8F1E0AB5FFDEA830F3E88E90A871C72C8ECD9B3B1F416EB6B2549C236AA9F580FB62F3958D8ABE689279EB8EDB6DB060D1AB465CB960D1B36F8BE1F0E872B2B2B4F3EF9646C995A6E3BEA83021ECCA9DE8B19DA410B35FCB52425AB9C6C33717F121C00789E2249120700CFAAAF36BE7FC9145CCB0300A5AAA228A669AAE9A41B0A2B8A3265CA149CA2A428CABFFFFBBFA38BE09A6BAEC149A313264CA094565454D4D6D62E5BB6ACAEAE0EE7ECC562B1D6D6D6743A7DDC71C755555561CED331C71CE3388E61188944E2A28B2EC2C8FE39E79C3378F06000183D7AF437BEF18D44223161C2044551D6AC599348245A5A5A7CDFFF8FFFF88F9E9E1E4C95FDEFFFFE6F5CC85F74D145B833975D76D9D8B163D15971F3CD37630FE8CB2FBFBCB6B6F6C4134F4459ABACAC1C3B76AC2CCB37DD7493AAAAE80428EDC8D5CF39588C31D3341DC7993B77EEA449932CCB2284C462B1743ACD181B356A946DDB68393B8E2372B00482CF06C5EEEC92AEEB38EC0EABADA024713B88EDD4D4D498A6898D47860C1982CD0031F31D97D898023F76ECD8FAFAFA48244208E9E9E959B66CD9B061C3344D334D13B30BD03EC3B7966579E4C8918D8D8DB22C63FF6854C9A38E3A0ADD8FE3C78F1F376E1C6A8EE77938C21600AAABABB1C321EE18B68E1D3162045AC48D8D8DD8195692A4112346E0C27FDAB46993264DD2751D7760D8B06168AB0200632CB01AF7BC2EDF97FC566C4C3B79F264740FE3BC6BC330D2E9349E173C546C3850EEF60502C10148D0481B17CE811117ACC670E58EA1AD20CA84A006699A562814B0E31DA6FA4B9284C34418639665B5B6B6E2AA1700B0773EFEB9EFFB58E44A292D1D1D8D255E94524DD330E4157426C1E25A14C1A0B7160004128913FF70AA8824496811EABA1E3C1968976DDB1846C2EC2BBCC1C05E14FB94ADADD8F80BDB2500403E9F7FE18517E6CF9F8FDEEB2953A65C71C515B22C073D6ECBDDBE40203800C111213BF509C1DEAC1876C707A83B9EE71986816A8BE178543A544654284C36C03C8150283468D0A0A953A7A23989061C0E23C0B102F816D8F419ABB95025D1E484E2A03C1C6D800E0A54794C158062D113DE12B01C0B6345E8D6089AC2E06106E03C274C84C072ACA029D727DA8E656B2B21249D4E47A3518CFA757575DD7CF3CD8661343737630D5959FD5B0502C1414160B29506707617534101C2853CFE1AB41F09A43078318AAF244998EB0A00B86C47F544510B3A134A9214894402B1C3D951C1B81714BBE0577C23FC73FC2F745FA010A3211C0CBB85A2E6E263DC674C6E45F3BC5449D172EF679F009E0B289AE2994CA6BBBBFBC1071F3CFEF8E3315B02F7DB300CBCEDECC3F60502C18146E9DCB952072B3E46B10B5E8992874FA2BAA10E623F5614537C8C862126BACAB26C5916DA8698061BB4C743812B15537CAFE0ADB1634B20D9D8EC1505115F1C7486E2C5097B28F768C906562AD643C9B28CF62FFE5A9ACA8AE6F62E3B25EEC4BEF85B4B15D334CDD9B367C7E3F12091188A37A503B3398D4020D80770D067502980DF745C6E07F6694060FAE1AF688705DB095E13BC0097F0C1D059286638EDE4B7454AC54E5194A0F30B14BBA8047F55281402433BE8BF856DB983E18681A91BCC2F088EB174078267F0D8D19BF10967AC8CB35B3C35784F400FF1A851A30E3FFCF02BAFBCF298638E916579DCB871975E7A29FA4A84BF5520F82C81266AE9F8A59D5A96044987B8780DA6B1A2B7144DCB409B02D7278E2EC50A579CB687AB75282A1A8A1D2A78A0D158721A283E04AD648A8D5F313685DE067C1E8A6B6EB464755DC73A2B34A5A1E8450D2C5954527C01BA44305C863566FD9FDF8A7BA9AA2A7614DFB163C7BDF7DE2BCB726B6BABEBBA3535350080F7843D0C5FC42D04031E02FF081E097E78C1ED053FB3E04D2549C2E40F4C5180E2A8323CF50745A34271CB111C74042901B09B1EA150CCE08692AEAC503454030B118AB3A2712341BE010060AF6B7C065F801B2C7D97E0AD03FFE94ED3A176B2A083370A76A3F4C9D2D988C19FEFD40E05FF30783B7CFDDE2CCACBD6564CE8E5C5190C6D6D6DF97CFEFEFBEF6F6969C169D800802DB260F722825E155996B3D96C2814C21DCDE572A6696260B1B7B7379148608C2F93C9609D19FE091E243665C86432E87BC6BB19BA5D44E29740201870CAEE2780DD61311FA0B3B3B3BABABAA5A5050042A1906118A8F1F97C1E0052A9D4EE36128D46F18E110E870921DDDDDD8CB1502884991900904824A068C64722115996F12700789E6759562C16D3342D1289046B046C38B68786DC028140F0A951B6DD8A65B90020CB32963DD4D4D47CFBDBDF360C4392A4934F3EF9C61B6FC454DB582CB687C56F3299C46A0DD3342B2B2B01C0711CDFF743A110F6799124291C0E63F12F365CC0FCB8407F73B99CEFFB58EC011F33DA0502816000295B5BD1EF9BCFE7D131BA74E952CFF338E7D168D4B66D0CB771CE7181BF07AF04DABF0080512F74ADA23E624BB1201099CBE5C2E130EA35662363AA4430A01BFD00E8A3F8ACF6311008040717FB32431B7B5C61C06ADCB871D82A5C51141C3B832FC03683BBDB08FA1342A110D65730C63A3B3B6B6B6B01209D4E9BA699CD66B13F6E28140A87C3EDEDED94D2482482E509D81C16673F1886110A85B0CA16FB2988E186028160C0D917130F277301402A95A2943EFFFCF39B366DC264DA430E3964D2A449AAAA86C3E13DD88F5BB66C79F6D967B3D9ACAAAA37DC704350266C5956241279FEF9E7172D5A347BF6ECA38E3A2A9FCF7777773FFEF8E3BDBDBD23478E3CE18413EAEAEA1CC7993F7FFE7BEFBDD7D0D03072E4C8993367A29B35954AE18E090402C1C052762C0B932418638542A1A2A2229D4E7FED6B5FBBF7DE7B7FFCE31FDF7AEBAD7FFDEB5F2B2A2AC2E1303A0D76B791B56BD7C662B1FAFAFA679F7D76E1C285F97C3E1A8D627DEED6AD5B7FFBDBDF3636363EFCF0C35D5D5DB22CFFFAD7BFB66D7BF8F0E19B376F7EE9A5977A7B7B5B5B5B7FF7BBDF8D1B372E994CFEE31FFF58BF7E3D8EDBFDC46C5E814020F874D817BB55D3B452157BF3CD37B76FDF5E5151F1A73FFDE9A4934E8262C1D91E6A07A64E9D5A515191C96456AF5EBD62C58A49932605C5B24F3EF9E48C1933CE3BEFBC0F3EF8E0E5975F9E3973E6F2E5CBEFBAEBAEC18307BFFDF6DBB7DF7EFBF1C71FFFF0C30F9F7EFAE9A79D761A005C7CF1C5D96C160BD130F12B48898562E7853D78277687EBB98AAC6814A038361CB0DCB89C3484B26668EF2E33D7735D4A2921C018F37D16A4E91D0479BC820398E07AC36F0766F5EF613633F188C381AB9064A053905D5B511435D903BA0E1E030060009AE6498A2CF789434F4F0FE6BC6305812CCBBDBDBD58DE5A5D5D4D29CDE57218C1364D137B50617227762C41EF5F3E9FEFEDED555535168BA144689AB665CB96C183072793C96432198D46714C0B266EE211614CC8344D7C8C3F31251F0070CB504C06C55EFE58E9807F0500D96C1663E9BAAE63510386D0B158366898B087335CB6B60643C3F133183C7830B66DEDEDED9D3E7DFA030F3C3075EA54555571D2F7EE3EA78A8A8A42A1806DBE1CC7C1C261FCAFA54B975E7EF9E55808B16EDDBAA00F793A9D1E3162446767A7AAAAAB56AD9A3D7B36A5B4B3B35392A4B56BD74E9A34C9F77DEC0D8EFB56DADC21140A959B3FC039B71D3BE76B8EE360ED32F622F3FC4F9EE5D0EF70CE51A831B3022F023CA23E89C58EDD41DF6E81E09308462ED1225054D85DFF81CB410600A253E000ADADADB22CD7E63284109A2B504AB38A166F6EC63A20423863ECADB7DE7AF5D557BFF18D6F44A3514DD3962C59F2939FFC64D0A0410070F1C5174F9C38F1C73FFE716B6BABAAAA353535975F7E796363E3A2458BFEF6B7BF7DFBDBDF0EBA58DD77DF7D6FBFFD762412B9EAAAAB468C1881F6D3E0C183FFEFFFFEEF2F7FF94B341A3DFDF4D38F3BEEB81D3B76D4D7D70300632C954A555555A1B0A20EE472B9783C6E18466F6F6F32996C6E6ECEE7F358E4AAAA2A76F3C2703A562E2493496C7EE8FB7EA150D0340D870EA0CE621DC427A6D2EF6348BD341CFFDA6BAF45A3D14422B179F3E6D6D65654C920E2B4BB2D140A05C771B66FDF7ECA29A70000A5B4A7A707D3AD704CB9A669BDBDBD5BB76E4D269394D26834BA6AD5AACD9B376FD9B2A5ADADADB9B999521A8BC54CD35CB264C9BC79F338E79AA6951EADE779B95C0E279A957B80AAA20280EA83699ABACE7CDFCF3B79C698F6A9CF050FCCF0C004C69A3791C72BF857D869C43D16379656F4EF04D37D8510E0A0F5A4366DDCB8FCB1C7186335F90C0014981F0A85E8219366D4544815950408E5D4B2AC458B162D5EBC78EDDAB593274F0680CECE4EC7714E3BEDB41D3B76BCFCF2CB93264D5AB66CD9F9E79FDFD4D4F4CF7FFEF3FEFBEFBFE9A69B366FDE8CA5566884BEFCF2CBCB972FFFFEF7BFDFD5D5B56DDBB6C9932773CE0B85427777F7A38F3EFABDEF7DCFF7FDD6D6564992AEB9E69A5FFDEA57A87D55555500D0DDDD5D595969DB36267A0280E3388944026DDBA0C95650209BC964B0C3563A9DC6995A38B810AB96D0B68562219965599F589A55B6B6A2D14A08C169AF5BB66CF9D9CF7ED6DBDB8B42F9ED6F7F1BF534689BB84BB015CD73CF3D376EDCB8E9D3A7A3C98DD3BE144549A7D3B95C0E0B7B2B2A2A2A2B2B513133994C4D4D4D4343031602777575E13A221C0E07D704DE67B0B2ABBDBDBDBBBBDB34CD0D1B366CD9B2A5ACC3B43C9731E647C76DDCB83197AB0A87C39AA6C9B2ECB89972CFD8BF08BA3538C7C26AF03CCFF2582E977BE5F9E70120AD1A005095673EF119651C444D9A60AFC014F29A9A9AE6E666949B608AD42E5F8FE110C69864188CB16DDBB649920485ACE77936704992220D83008000E1C009A15BB76EB52CEBE4934F7EEBADB70E3DF450CE793C1E1F3E7CF8E4C99367CD9AF5FDEF7F3F97CB0D1A3468E4C89113274EECE8E8F8CB5FFEC218EBE8E80887C3B95C0E77E9FDF7DF1F356A546363E3A851A3D068F33CCF34CD65CB96D5D7D7E3ACC0C30F3F7CCB962D6BD7AE7DEDB5D7C68D1B3779F2E4542AF5F4D34FAF5FBF7EEEDCB93366CC58BF7EFDF6EDDBEBEBEBFFF8C73F1E7AE8A1C71F7FFC6F7FFBDB2D5BB67CFBDBDF0E87C3EBD6AD4B26939CF3279E7862DEBC79AAAA2E59B2E4F2CB2F9765391C0E6FDCB8F1C5175F6C6B6B3BEBACB3468C18F1FEFBEFFBBEBF69D3A6152B567CEB5BDFEAE71E83AEEBBAAE6B9A269A5143870EFDD6B7BE85C26F18C6B061C330B71FA70FECAE9FC08E1D3B9E7DF65942C8F5D75F8FAD0372B99C6DDBBAAED7D4D4AC5BB76EE6CC99D96CF698638EA9AFAFDFBC79736767672291906579D8B0618AA2D4D7D7BFF5D65B679E79662A95CAE57273E6CC01004CAA350C03ADD7DADADA582C96CD664DD3340C63F8F0E1651D26A7D4719D1E1EDFB06143CF3619001CC7B16D5BF984B9B9FD4FD0BD2DA8ADC6C2DF99336702405A3200A0C2668CF85C68AB60AFC15CC920311CFBD895860776C256813057711DC859CDAE3DB2BD3D1289545839DFF733D19065E55DCF021918F804886559CF3DF7DCF4E9D38F3CF2C81B6EB861C78E1D43860CB16D7BE5CA952FBDF4D2B66DDB0E3FFC702CC87CF1C517172E5CF8E69B6F1E7FFCF1BEEF0F193264D1A245817D366FDEBCDFFCE63777DD75575353D331C71CD3D0D080AEDB0913268C1B37EEAEBBEEAAABAB3BEEB8E32291485D5D9DAEEBB5B5B59B376FBEEFBEFB4E3DF5D469D3A6FDE637BFE9E9E9696969F9C94F7EF21FFFF11F279C70C2AF7FFDEB1D3B761C79E491959595DFFCE637EFB8E30E55556FBCF1C6EF7FFFFBFFF66FFFF6A31FFD08A7A95E7FFDF577DD75D77BEFBDF7F0C30F7FE94B5F5255F5873FFCE10D37DCD0D9D979F7DD777FFDEB5F3FE59453D045BB87335CB6B6623F052C9DFAFDEF7F8F6701B3B23CCFDBB469D3C9279F8CB7C43D44ED7FFCE31F2F5AB4E8DA6BAFFDCD6F7E535757376BD62CCBB2BEF18D6FDC77DF7DD75F7FFD45175DE4384E28149A3B77AE699A63C68C79E081071289C45B6FBDF5E52F7FD9308CCB2FBFFC673FFB597B7B7B6F6F6F4B4BCBA851A3A0D85F529224ECDB0800A8B3D8BD2698E5B097704A4D301D0F7CDFCFE71D9C9CC31803F8B49367F18A0F4E26A55453B4482402A609001E3100409718273E086D15EC357845A12B00D7C518A5D89D2DC64175C1516415A04054450FA94658A3925DC8D9DC547DF01828E0D342C6334D63CB960D6FBFFD767373F3EBAFBFAE69DADFFFFEF72BAFBC9231565F5F5F5353B364C9929696169C033D69D2A42953A60C1E3C78FEFCF9471C71C4D6AD5B83295592245556565E75D5558EE33CFEF8E3DFFCE637EFBAEB2E4551C2E1B0AEEBD75F7FFD8E1D3B5E79E595AF7CE52B0F3FFC30A574E2C4899595957FFDEB5FDF7FFFFD71E3C6D9B65D5959D9D1D13172E44859968F39E6180078EAA9A71289C4983163344D7BE08107745D571445D7F58913274622915028346EDCB83163C63CF5D453B95CEED1471FEDE8E858BF7E7D3E9F479B9D523A72E4C8E38F3F1E8A86FF1ECEF0BEC4B2D091EA38CE2F7FF9CBF6F6F6783C8EEDB6D6AE5D7BE595571E75D451A669CAB28C61A55D3263C68C0913267CF0C1071868AAAEAE7EEFBDF7004096E55028F4831FFCE0C5175FFCEE77BF8B55B3D75F7FFD934F3E69DBF617BFF8C5134E3801000E3FFCF0AF7FFDEB0B162C0887C3975E7A69341AC5CC56C330B04516AA3F141B8505BD6DCA384CDBD2344D96B18123288A22933D1DD17E25E82DE479BE24493EF89CF3BE41B324183A8B5908229625D82B3064B2D354AB3DC7677CC6804860DB605938F94A656EA150701DA7AFD960DF606D58BD7AF5D6AD5B172C5890C9646CDB5EB060C1E9A79F1E0E8763B1D8E8D1A3A74D9BF68B5FFC62F6ECD91806AFA8A838E594537EFDEB5F67B3D91123462C5EBC18A3F338EEA5BABA3A9BCD9E72CA298F3EFA288E3D0DDAE30D1A34E8DFFEEDDFEEBEFB6E34A7D096C28AD0A38F3E5A55D56432595353934AA5D0555A28141863A669A2B185F3BBBABABAD0EBC818C302FA6C368B0137D7755B5A5AC68F1FAF69DAECD9B36B6A6AFEFCE73F7B9E97CFE7B1DB613FFB04F06E83EED4FBEFBF1FC71E504ADF7CF3CDFFF99FFF99366D5A1094DFC3CC8373CE3907F502131DF2F9FC8A152BBEFAD5AFA27579E8A1871E7AE8A150CCA3AAACACFCCA57BE127CFCF8E0C8238F3CF2C823832783AE0241BC2FB868D047516EEAABAEE93EF35DBF2FD3C2F33C9FFA922401F148DF046C0200648FD3B0837696C19E14A7B695B12758E0CB39504A25897CB8299C7E813B4029219C50E0E5272C0B3E9F94A62A06EC41581DC70F13CDB13DB5B272DDEAD55B0755A6D3E94448E266A2BB9097657994998064215C1F071B5E7DF5D5DB6FBF7DD2A449BDBDBD8AA25C76D9655BB66CC1D03F7E556DDBB66DDB308C6432595F5FBF72E54A424824120962D73D3D3D914864F9F2E5E3C78F374DB3B5B5D5344D8CF1504A3FF8E0034DD3EAEAEABABABA38E768EAAE5FBFBEB1B171F6ECD9BFFBDDEF344DABA9A9912409F3AE506D82F421DC08967DAAAADAD3D3830BDC743ACD39AFACACECEAEA628CCD9E3DFBC1071FBCF8E28B63B1586F6F2F96FBE324C042A1F089E65AD9DA9ACFE71DC789C7E39AA6E180EF0F3EF8E0FEFBEFFFF39FFF7CF1C5179F71C619983E057B2CED47BDC3280D00E8BA3E7AF4E821438694BB330281E0D3415315EA3159968179CDCDCD389055E7B6A2282997789EA70E9B0CB11800E4727D0DFF755D6F686828140A2D2D2D189DC6B1D8A9540A85CC75DDDB6EBB4D92A451A346CD9D3B77D0A0416BD6AC59BC78F18D37DE984C262FBEF8E2CECECE471F7D1487AC9C77DE7938EFDA719C4D9B363DF3CC33F816A79E7A6A4545C549279D74FFFDF7777575CD9831E3ACB3CEBAF5D65B3DCF1B3F7EFCA9A79E8AD62B068A30EF131354311940D3B4FAFA7A4CBAAAADAD658CE572B9DADA5A4551A64E9DFAEEBBEFFEE4273F711C67CC9831A79E7A6A3C1E6F6A6AC26CFA3DF84F90B2B5154343F8B8ABABEBEF7FFFFB534F3DB574E9D2EF7CE73BE79D771E96F6078DBBF7B01DD4562CF1A2940E1F3E7CCF7DB30402C100A27100427C895225441B87D557C7E55088D93D54D3225C06D705A80045021F24802BAFBCB2A5A505537D24493AF7DC739B9B9B09215847108FC7CF3FFFFCEAEAEA1FFEF0871F7CF001FA0A304FEBE8A38F4605A4940E1B36ECE8A38FAEAFAFD7344DD3B4A953A74271A6D409279C505353D3DBDBCB183BE184137CDFFFF77FFFF7A79E7A6ACA9429F5F5F5575C71C5CB2FBF9CCD66EBEBEB1389445D5DDDA5975E8A39485FFCE217EBEBEB1545A9ACACFCDAD7BE160E871963575F7D752291C866B3175D74517D7DBD6DDB975E7AA9AEEBBAAE5F70C105AFBEFAAAA66943870EADAFAF9724296841F589AB6172CF3DF79C72CA294D4D4D183009CCC9DD850BB12B1500E084D77FFCE31FA3478FBEE69A6B264C9850575787D51738F0600FE12C4208BA54F064C9B2FC89F9B07B0F3AE6F14030656FF5EAD563C68C296B238C109FF95DBEF4FBDF3FB7680353142547430000C496C10600E0320030D001006816005C080180CA1C0090A100007929C418537D2A49D2D4CEC5AEEB1ED3F677420863BBC892DDDD09A79CF9BE5FD08152AAE6B82CCBADB279D6596791F34E058034E80010F338885896607FE211E2BB5C53087139E79CC8360000C90321F85D0016055E8CF5AA0000966505D359A0F84D4FA7D3BAAEBBAE9BCBE52A2B2B51A7305EB263C70E7474E22B038908FE3C994C565555A5D3E94824823554E866B56D3B18909ACD66318A0500F87CE9049A60F855901111BC4BD0F51F3BED41D163597A12D0D38A166150AEF971301BBD6CF75C381CCE6432D96CB6BBBBFBF9E79F8F46A343870E7DF9E5978F39E698C99327DF7DF7DDD96C56EE7369EF298856EA85C4BD44678A40203800A1E0CA92470038214029A746C1911C12B5215C208A4554476216F51805902197CB01008EABC23F0FEA77A2D1288E50ADA9A9C126FAD8570F0070221414675E61210000A4D3E942A120CB321605E04C2D00608CA1B062153E5A54E170186BB772B91C3EDFD9D909C5E087EBBA58E78A299BB893E8E7ACA8A80866B842515839E78CB17C3E8F09158AA2A8AA8A355AFD5F3B90CFE771D7870C1982E5ADB95C6ECD9A353367CEECE8E808A67BBBAE8BD36E77B71D342A83B2DC5237B3402038004173881000021C4055550F1C068C03A74029504A29E1C03904BD95512E0821A89EAEEB160A8520F28C339CB0A21225128BE003A3D2B66D0C7FA10EBAAE9B4EA7138904A610E03683D601185FC2AACE7C3E6FDB36EE06FE0CC25941478E6027711222144BE4D174C5B87A3A9DD6342D903504A7F3F5BFB6E25BE6723949927EF18B5FA0BD6918C6B66DDB2A2A2AE2F138B658C5FCF6DDADF1B192176F4AC12EEE43A6944020F8746090A12033DBA17E082420142400E673895057261C880F2E0080A43060D46358BA89439B0020103E5C9E6282543C1E47AD806225275697063170ACD182E2B06E00C0C53E148D628CF59BA619F439417BD3344D542A0CEB0380E338E86A4087243685092AA1D08C0D8542182B43D5C6857FE0BAC4E226284EFCFEC433B62F3D06F3F97C2814A294C6E371AC80320C63DCB8718944221866BBA7A60F009848A0284A306537A83E12080407200C18A112A5142880076003B03E339002F5C177C1F5C1E7C07971EE343A5B314D13004CD3C46EA238170ACD462C7F47D90D7E050074C86277111CEC84CA8879EB5D5D5DB857A15008BBEE05AD36B07915DABFC1A46EECA485C5A2E882300C033B7205EDFA709A140004395B18760B1AE9E1D454B408797146F51ED8975E2D989C8F6629A6BBA2C9198CC3FDC449ABA5266D70360F0A3ECCCFC7D47DE0007BCC712D67CBFDB1198160BFA0F24AC008AE5C72A17202002AC8EA47948482A605128146280A054A073E834ECF20821DC45DA038191B5505078C062A814F565656E27FE1CF60565EB04D285910632B8320E91E8ADF35B4734B85A874CE76F06430971B9FC70309A670EF01916A2E100804FD8FD056814020E87F84B60A040241FF23B455201008FA1FA1AD028140D0FF086D15080482FE4768AB402010F43FFB388BF0730B2164EFFBB796BBE55DFF87C87B15080E4284DD2A100804FD8FD056814020E87F84B60A040241FF23B455201008FA1FA1AD028140D0FF086D15080482FE676072B082C9D238A40B9FC16936D8D40BBB87E163EC05894DBD823135A5936A7053C10607E488FE7506A4C72027390000300000F8879D1E0971017C0020F82453008095796A1D0A00A0714E7C17B70A00404AFA4F627F61EE0380A796D1679262037C1E6C14E0E3278F94748A3B582F0AC141CC80692B147590178162CF6C6C988D6A0BC599E9C19FE07F799E57AACE81468368842A10080E0006465B4911C6583071A074040D0E620C463B94FE153EC601B6A5CF4089392CE83F3E5C1F506295F5971EE8004088A7C80C8A46AA07320070200040251F0024F00140F6CAD9B22C01F499AC3418E21498AAE212101C000CA4B642B1D9382EF38327196338BF014DD152F10D8CD38F8F2A10C22A10080E1C064C5B4B1F078B7AD775715858E9DA1F4A5C01381532B079838D94BA05F6664C98A0C8CEC1CCE083E1400180E39475B410895BD6A6435C03004E64C23FDC880C0C00789F15EB43D1CAB4CBBB1269B0EBA55E608AFBC93E2C4AEEDB3A11375DC1A7CD80F51308DCA994523442F119F4AE0613B77CDFC7D98AA5A025BB93C72088741DBCE12C8140F09961C0B4D5F33CD7750921381D0C00186328A98C319CCB4D29C5676CDB4693167596108213718317E093BEEF07EA2CD81BD07A4403B0CFB6FB68DCDD070245DB9041A4AC8D1B360000A1C08904001229D93C94BC17A100E0D132D2018B666FC98E0285E2E194FA6105828162C0F2047CDF775D3718B58DCFA8AACA184BA5523D3D3D151515B1584C92A4542A95CD6671FE786565A5A669AEEBE6F3F9AEAE2E4DD3C2E170381C0E263B0AA35520101C080C8CB6663299975E7AE9BEFBEEBBEDB6DB264E9C08C52401CEB96559B7DC724B2E971B376EDC15575C619AE6B265CB7EF18B5FD4D5D5E9BA7EECB1C7CE993327954A7DEF7BDFCBE572A6694E9E3CF9B2CB2E03805C2E170A858259BB41DA2C2DC7200AC8E6B2BAAEA3D70187F4524E6DDB56D4323612388EF1D77D8BB631C624499224C09C8A0F9F2C7743BB8696FC0400209C030003CE0825402C0F3CCFE74C5ABF7E47D6AC2F6BD351D706803CD531D155E51C004CB7ADB9B9BE429700C067C018238A040072A19C4D1BCC2A1474C3B46C4BD174C7731459E7C0D147CC4A0C64E168DD1D8EE3E09725C8710C726F067AD73E230C8CB62E59B224954A398E93CFE7B134008AA1FF37DE78A3BDBDFDE69B6FFE9FFFF99FE5CB971F76D861BFF9CD6FCE3DF7DCB163C7BEF4D24B6BD6AC39E18413162C58C039BFF1C61BBBBABA7EFFFBDFCF9E3DBBBEBE3E140A01002124994C1A862149128E38877DB267C3A13000F81EB8AE6BDB3E00B84513FB53065D1FBE4FA0E89BEECBA9E86B200B000084E0BF72FBC992922EB4C533D497BFE1335FA6B22A832C4B6B56773DFBECB35BED9D1DDF7BA6A8AD21872A00A0F202003484ED73CE39A7A229C27CEEB80E7EB173792746CBB96B1507CDE335E3FB3E957CD77575D58440554B025A422F3E0E2EF5108C550479E503B8579F2506465B5B5A5A1A1A1A5E7CF145C771D0918A0900D96C76F1E2C5A79F7EFAE0C183870D1BB66AD52A55553B3B3BE7CE9D6B9A26E7FC3FFFF33FCF3EFBEC175E78E198638E1933660C00DC7DF7DD9B376F6E6A6A0200DBB655558DC7E3C11B799E4708B12C0BE36665204905AB50700D4AA9AE2BAAAAFA92462975DC4C7F9E88BD002F77C6303B82E2AFAEEB02F301C047B7A2CF38F13967BCCC22664FE20020311F0028930080820B000C7C8F03A1C00108406FDE5ABD698BDB7074591BEF0CA7012027456DAA0140C44F02403EB33EA9EB16019089246B0CC005904CD58132B23BD4824D2905E22B00003CAC6A3E21B2AA7A1C331964803EE72BE1589F52E6A7FF39C0755DFCD2C9B28CAA2AEE40FDCBC0686B4D4D4D4545852CCBAEEBA28D89B698A6694B972E9D376F1EBE6CD9B26523468C68696991653997CBD5D6D6AE5CB9B2ADADADB3B373C68C19C96432128944A3D1152B561C77DC71F97C1E00082128D618FECAE7F3A669EABA5E2894B5E60449531DC7E160A8AAAA69B2EBBAA96C8A731E8E7CDA8132F44113E207C9BFB667E7F379B5500080820A00102A309FF88C320EE5A4E00378920B0012F30080321900283800C088EF52C9711C878524490A87C323468C5896B4CBDAB8C36C00B025DB469F806F034045458565595DC90C632C1AD273B99C0D722412F15C67EFB7CC32694992B822398EE3C93200104D8562DE185ED5729FB662265979A7E5F300AE8154550D32172DCBE29C7F3C2D47B06F0C8CB63A8EE3388E655978CF0400D7757195470849A55286616CDFBEDD300C9448CE792814DAB469532814725D9752EA799E699AF97C9E73BE76ED5A00304DD3755D28E66FE572B9AEAEAEF6F676CEF9860D1B060D1A54D61E165C8773EE47C76DDDBA3593AD0A8542D1689852EA7AD9FE3F1D7BA4E83EEE5BA9E1F28D31B660C1020048AB060054E5036D2D4FFA515B09530040669834EA0100A7CC215496E5B46370CEBB536CE396ED72EDD0B2364E6402008E9400620040C4F10120BD6E65EBBBEF8548BBEFFB7658CF64320EE84E3CBEBDD0B9F75B6E94A38CB11CF339E769E671CE2D4A6459F6295ECF14002446A1A8AD20B4F5636070B8BABABABEBE3E9148689A86AA2A7C02FDC5C0682BA5D4344DC330504FF3F93C7A7FBABABAAAAAAA2449F23CAFA1A101E5B2B5B515FF9710525151515D5D9D4C2671F94F29555575E4C8918EE3A8AAEABAAEA2288C314A693C1E8F44221801ABABAB6B6C6C2C6B0F655D731CA7879B1B376EECDA422549628CF9BEDF7FF3B1F616BCB570B92F430A036BBAAE1F75D451B0DFB4D507AFC078381CB640CDE7F9DA8D5D5BB66C5959284FA17CF000C0E39E473C28368B183E7CF8B871E326869AF2F9BC2171DFF7991C0680C6F0B0BDDFB291727DDF77241AAEAD0589002159D7310C236BA34F4068EB2783E62A9AAE0080F98B50925A2EF81719186DC524FF42A180B12CD33401A0502884C3E1783CBE6CD9B22953A664B3D92143868C183102D35D6DDBCEE572F5F5F5555555F5F5F5EBD7AF1F3E7C783E9FF77D7FF6ECD99224398E13AC6EB051165A7C8AA2789E8791AEBDC707900C4976A05028A4D3BEA6690E25BEEFEBC6A72DAE18CBC2C75819A1C88AAEEBB21902001F34005042A0101F288332B5D5010F0024900140EA2BC6670000D4211EC85496002261C2096DEFECE2A1DAB2365E9DE1006048C405020075360700EFBDE5EBF3A0401B634CF72DDFF78916B36D5BE365386DD65755514AC3D555338E3A0AAA1220C9145C894A2143050086DA0A0041EA2E68BBDF9800A078697DBC945CB0CF0C8CB67A9EE7FB7E2693C966B398E5DADBDBFBC20B2F9C7AEAA9C71E7BECAF7EF5AB33CE3863E5CA95575F7D3586B95E7EF9E5934E3AE9ADB7DE1A3D7A34A574CE9C394F3FFDF451471DB57DFBF6EDDBB75754544892D4DDDD5D5353834D5EA098BA846E5C3466CBDA431FB844255D0545511485EABAEE53DD755D80F2EA3EFB054208A5246818865D6C186710547C32C6090360BC9C88100030CA0080700600B4CFD0C3BE2A4C9655C7733C599701344DDB875847D032A298874000A0A6A666C3860D5D3BDE8946A361E265B35950A300A043198D6096699AAEEB0D23864F993245A395505CC932F8B0294C9FC5DAD787509441EF0C7A9624CCEF039065192F2DE113E82F06465B5F79E5953BEFBC9373FECB5FFEF2CD37DFBCFDF6DB3399CCDD77DF7DD249278D183162CE9C39D75C73CDD5575F5D53536318C665975DF6CC33CF3CF4D04383070FFEC637BEA169DA11471CB179F3E64B2EB9A4B9B9F9EB5FFF7A2C160380CACA4ACC66DD4946712D5FAE2E4884FACCB77D09DB14F8BEEF73BFDC54D9D2F6895092EEBACBAB77777BA8288AEFFB8C613B9BBEC3096E21410E16C134AC327D16BAAF020093F200E049000032330180FAB244D28ADCE7E5B5BD3091AB0929EFF0D36A0C00D246AE22E700405BD804806A5B65863C4D019E4F794AD2D408F755CEB94C761DCBDAE5577D66C1A1766E4B6F580BAB4C5628A52133C15C5029008025B900E0131F00145F06002E8908F8CE04AA5A7A8685B0F62303A3AD53A74EFDC94F7EA2695AA150A8ABAB735DF7FDF7DF9F376F5E381C8E4422A79D76DAB469D3468D1A65180663EC84134E18316204F6C6AEAAAA0280A143879E7FFEF973E6CC314D73C890218661E066453301814070803030DA5A5959595D5D0D45DF683A9D668CCD993307C5B1A6A6A6A6A606007CDF771CC7308CD1A3470300E7DCB66D6C41D0D4D4D4D4D484AD08A19878804BD70139228140202865C0F204B2D96C2814721CC7F7FD70383C6BD62C5555B1EC1523E30020CBB26118E89CC57894EFFBA669E2AF9818802F9324C934CDA0CE75400E4A2010080206AC0F169682E8BA9E4EA7092118C7EF8B8317F3A8F0959C734DD382EC577C52511434604BEB650100236303703C02814050C2C0CC79C54E8098F0188D4631BF0A002CCB2A8D44F9BE5F28146459C6A211004043158AC62926E5A1AF004DE0E00502814030800C8CB6622395743A8D92AAEB3A662C63CF5628496C360C031BB3624A2C968E04635FA1187C5714056D584C9515080482816560B4158DD38A8A8A50288455ADAAAA62C9BF6DDBF800F51400B0C835140A61F21DDAB628ACC130EDA0AAC4B6CBAB7917080482FDC180CDCB0A224EE848459B94731EFC1A04A63013005F1F0C294082D6DAC16B54553D70625965F56F3D70767BBFC23F4AF0CCA75F4C2C10EC5706C66E15080482CF36425B050281A0FF11DA2A100804FD8FD056814020E87F84B60A040241FF23B455201008FA9F01AB79FD3C50568FC1CF09A57969E4C3D68807105E49F34689FB0040C0070020DC291414CD2484309F5249F23DE6BAAE6EECAA1470379FB10B114AC1CFE7544D03708131201C24C9233A00D87D6FCB65700140C341E97D3DCB4B37FEB167F00945984A0710425B0582BDE363A38225994AB206AC8C7215C6815250350D08010EDCB65DEEABAA0A9A9800F8594368AB40F011FA66DB100E009C0000606103930CC930D146B509F82EE06403458E7E7C23BB33C5BB6D08CB604A3200E8A091B0A6721F00244E0000FB10534EF08DB312DD6953C511353BBF45DF78DBCFF17AE8004468AB40B057E472B9502864D940299115A0B44FDE76392E66772A67160777A5732E5047370C3B97932449D2C504C0CF1A425B05828F40FB5CA50C8A12E91105009490E200AC69CB66B3596254799E27E9BAE380BF2BD7EAEE2A98499832062137934EA727D445EA0DAA87E2507C27827FE4177F9508EC5DB8B9A8EFC2703D8010DA2A10EC15B607994CE1C5175F5CBB76AD4DC2854241D26396658522E18FBF7877DA6A49BEE77955B2C318B3A6B59C78E27132F36559741CFE0C22B45520D8090FA06802120A45AB90CAA0458C8214CB91886BD4D9D4D662F5DC710A6C177902BBD35657936CDBB6A56CA1502880CA65605C72C9479CA712E568C086BCDDECE06ECC532EBECD0712E2D31008F60A143A4AA924495C962DCBF23CCF711C95ECC2E3BABBB96D383618FBB761574CEC052F2CD7CF1E425BF7234193597C8CED684BBB0EEEE556F6CFDE1D1C1C38C325290003C8BB1297C31957A546559699A09ABA9FDDFB8DB88EEE7B6AA6905194B8114AD81C74091C07B8C4A028DF8C30200C0062EC63AA4D00007CDF030049513035D8771C00903EDA7E5330E0086D15083E556459A63EF57DDFB66DCE8110D054D83975768F48AA0A8CD98542DFC838A1AA0724425B05828FD2571B850F190050900080E23FCE2867148072205C0200524E749E80A6288AE1999665F17C81E74131C0B66DC3A400E00040D17A05005BDED96E2D66303090C00F491CB80B1CC0F3C1B75CAB7A5799B682814268AB40F0E9512814D029A4AA6A28148A848170D075CDF70A00E0C9007DDA8A19603BAB36FEEE725F239A0452F08C0492AEE82205EB804268AB40F01138C8004088D7F75BB1524B26207350B8AB7057E13E052E13178A555B7B89A248008CF9B6EF798A63C90E00772197934214004C5F02C0E4040AC11B976E1EFDAD8E2B498C03789E87438FA8A280C86E3DC010DA2A107C7AE050381C07C739775DD064005D073707007DE95EA4582E802E818F69ABA469F85091FBBEBF9C33CFF364593425388010DA2A107C04DEE76FC55AFE0FFB60C920C90C64E6C9CC9389433955B90B005C2AA3FB54D6CE514A2B28C8B2421D2BDD910A432F280AD839000026030070094A7A1AECA27D80E782EB824441D78131705D120E29F138DF45118360C010DA2A107C7A689AC639070F7A7B7B972C797FDDBA757ADBFB9CF308F1018032190008972807006025FD625889B64AAAE2791E481447CA47A3D1A38E9E3974D6AC01381EC1EE3908B49510826D32008073DEDEDE5E5757B761C386EEEEEE4C263373E64C45517A7A7A2A2A2A1CC75114853146290DB24A29A5FEC7BAC37D2259809CCF6505F26EC15455DBCE505903005F362C4901006CC28ADF018FC40140E60500B0650A00BDB41E0098A7114A6AF26D0010F70A1EF35C6A32C63CD9DAFB3DA9E292075E25377B3A7B946815632C4F3D57239AE70280244B0060C98AECCBB20BA0ECA68C9D10D77515450100CFF32449C231E6B6E40380040A00287D89401600B8400889FA00960FAA0412E9665EAB0F43CA3A874CB600C063156D860600830B9B0120EEF6F8BE9F5225C6588DA5134224DFE59C7746CA3827E1544855D568C1039F72370B8A92A22146990A140042BE02D067E859B20F00B2D73789DDB22C5DD7F127636C97C9B37DB1790250CC10704102805E1B54152CA65B4C674AC863CC233AA59443197B9E75254AA9EA2809255EDBB9DE6F4F8F4A6F228454596D007D86AA4DA21E9850BCBA329A0F008EEC0080E17100D0D3BEA669BD966F9AE6F64438D3BE8D9C743448364068EFF7C4B66DCEB96118C18581E50C9224CA18FA8783405B2DCB42614DA552B1580C85F58E3BEED8B871634343C392254BAEBDF6DA4422010094524288E338BEEF7B9EA7280A66EF6B9AC63E9E86BD47B824499244001445918AF8BECF18638441515BD1A860C000807106C56F263E83EF8E6FDDF7B78C95BB2778385CE2AAAA5249725DD7F7A965591A631FBE35561830D8DDC64B0B165055F167F1583EDC7FDAB701098F8F3100096459C69B56597B4E0803004658DF4E96F9E77B40D38AEDA47C9F73CE7D1F633F7D27BFCF4DC90180510600944A78C7C59380F7DDDD6A6BDF1A9C01F4858718910040D38002689AA6AAAA2B2BBEEF3B8C947B5C44FAB02F7899075DB2114228A58A42510709218C312816A7EC25BADEE79CC54F9610B20F2688600F1C04DA8ACAE8FBBE61180090CD661F7CF0C1C99327DF79E79D994CE6FAEBAF7FE79D77A64F9F0E00AEEBA2A12ACBB22CCB9452BCDA3CCFC3AFD3DE4301740A790F8897F7F39EC4B9A1982E7765209C7BF0A1DD4A00C0652A00A8900300CE1800C8C40100904200A0C939CEB9AB82EF43563718634DD9322EE2CE08B36DDB02E2EB0655549B7188C70A9A1E9330E9520600098010000ABB3B4CDFF73178024565F13C8F10424101008A0BD2BE400903008951468003A8325000D7CE302F1F9253659D4399E7018010EE1103002452000087BA0C58469319630AD1092194699CF3CA7C195AD3A151CEB91B0E8324C9BAC9F1C6024C070A00B46F6600A6A60200E01D57D33449921CC7918B21A05D9E2EDEA77AB82906C52F89C4C17680B20C77938EE52B8AA280A3280AF7737BBFE71C1C0A54A339C69827739FF0B4660200D00F53535D62306E0240D446AD449F2FE6D23200905589488AC2A955707D99EBC4541D055C959A655CE4AEEBA22863012E9E8DE02211FCEB1C04DA6ADB36DE63F19B2049D29A356BCE3AEB2C5996138904A5F495575E6969698946A328BE8410BC9F3B8E934C262549B26DBBBBBBBBAC3775355792A44C4A89EBBC42771863A0A45C700B4E01880B00B4CFCAA300E0520300149E0100096C0030240D00B8140500995B8CB1ACE431C2DACC300064D432EC0BCF64B66DCBAE040092AC3A04BC50685D26A32453009093F300A079B2E213D52796B2EBF61E78BF29140ABEEF472211CEB96DDB8AA2583ECE2FF10140E65E705C3E10A6689EE739449365D9CAF756264C3FBDA3AC73A8B31C002872C6260600282C0D0039C96584B56B2A00E4351D00385339E76AA88C1837094518634A2CD2DBDB4D6321CFF3723E515595D91C0054DF0300477601A0A03200303DC3B6ED4824E2BAAEE3389148249BCD069AB2133EC12F050300897B00C009050087ABBDBDBDAADF1D53F35EA1A0512D67F7685403B7B0F77B2E334A2955BD2CE73C8797841E06805EA010B85641A64C01801ECD03005BE600E0530F000C9F01800A9C524A4DD3B2AC74342CCBF236DB897674DA9EB3F77BE2799EAEEBE9747AF0E0C150ACC9DE9D2D2FD8070E026DC5D52B1AA1AEEBE25742D775C771502C72B95CE05DEDEDED8DC7E39CF36432D9D5D5B563C70E00D8B1634732992CEB4D333C639AA6CF2A2291C890213500C0D588EBBA7A48DF1B6DB54AB4D5742DCE7963AE86735E6F0D0200D32DC3342828362144F164420810D9B2AC6C24148BC5DE7BEF3D00C8C90AEC9DB6524ABBBBBB7DDFAFA9A9A194160A055DD70B1EC0AEB41524B9C0C0F77D5F360DC3486772D5D5D50DC34794750E515BB37214B535ECA701A0C9AA628CD5163A0821A6CF09219CA98C3195EFAEE9D32EC803B56D3B15D1B66EDD9ACB671DC7C97A60188654F06157DA6AB8BAEBBA1847628C699AB669D3A6FAFAFA5D6E7C77DA2A1B71CFF31289443C1E4FB94A28144AE598A2281A2DE34E692B32A5B4C6CA71CE6BB3ED9CF384DD430851790E3EA6ADBAB76B6D350A14008C482297CBF58475CBB21445E9EAEADABC63EBDEEF8924499AA675747444A35155550DC3408B44D8ADFDC541A0AD9AA6D9B6AD691ACAABE3389224A121168BC5060D1A3475EA5442483E9F374DB3A2A202FF2A1289A8AA1A8D46354DABA8A8686C6C2CEB4D2DAF5BD775A009F5B0F19EAF10025405CE216FF729515F5A379300C02300007DC339480E005C4A01C0A161283AEEC2EE444288E9E501A0D72C634F22D9BCAC69E031E01C4002DFF714C9F3BC8C4201C0A31400348FCA3E280CACDD7C9EB8FADBBE7DBBEBBA43860C5155359FCF1B866133190024CEE0C37C230F00A84C2C9713427C4992659951D99F3E59254659E730E4E5002027872CFA618FE7A8DFC2390FF9794208700A84005338E7C972CE49821AE0793E01CFF35C59751CC72938866128F68787602B2E001414D456D3F77DF4322B8AE2795E369B6D6969099C03A5A0B6D2BE7382371FF447134992468F19110E87F32E8F84945481EB3AE18532C4C8A63EA534EA010018B6CB39A7CC0142D083E1530E0012C3A53FE4751F003C5AF4E103683E07008D49DC754938EE653275A1503A9DCE1B1AE37C925F864F8073EE384E2A954257095E21AEEBAAA23B413F7110682B94F8C51445310C8352FACE3BEF0C1F3E3C954AAD59B366DEBC79A150C8711C28D61462DC33140AE9BA2E49D2B66DDB62B15859EF18A70A00E41C4553142A816D03F74192C034FA3C5F184C45DD2C6AAB0400123101C02534780DEEBAA9688400F804008C727C0232035014703CF03C9054906559A6B265D19001001E5000D038253E5006DA6E3E4FBC2DF5F6F63A8E138D461545515555D33487037CB4FC07D584136612850071016CD70159554839E5470000A07B260070B92F151E7F1ACCE09C139F03217D6788298431432B67F3E902A8AAA4A90020EB86A11BAEE66A9A42FAD6C41E00E88A0B00D800D0841014DDEE9452BC5462B1D86EB4954231465FAAAD84E0902B4A019CA27147096866197BCE994C2968587E4534C201B8049402F50120C8BD426D35505BC987DAAA300E00E002F17DA054565549370CDDC800F581C758192A4F29CDE572A57388D15ED9FB2D08F6CC41702A5DD745173B96F7F9BE7FDE79E73DF4D04343870EEDEAEA8AC7E3A3478F0E22F28AA2A08E04CE59CBB254552DD78B840D38428A04DCA77D8530001C80F8045C002038880E148020DDDC0500E016004804FD621A00F8F853260020110500D472565DB621038022031473C939010885F9876F0F140B2F2910B25BCB054F2063AC74D1570CF5E021231833211417C500A622314073A98C653BEE3B00184C53A802D097E1E5530240886402004327234850E63971A372DFEEEB7DC2A6CB0AF841B27DDF4414002866E1F7251895F67BDC5DB3C7D2B3518C20E148421F0034E20140854600403300F0E6B7D728A8A144020050F1435500C0A212144F910CA031008014A63A944CE49229030055A3A085385088A80E10E86BF252B6A7D4F33CCFF330F08BCFECCE072DD8070E026D45233448AB922469F4E8D1279E78E2F7BEF7BD430E3964EEDCB9E80740D5906519977EF8B798602052F64A4F4EF0CCC0EED2A74C50660A008C31D3343F6F67E0E3C8B28CD98DF8CD0280D2EF8EE05FE420D056287EE48410CFF354551D3E7C78381C3EFFFCF3D3E974454505A682EBBA9ECD6639E7A150085F1C146E472291B2DFB1CF60010826C4F55D726E9F7DDA67B17EB85E2B3597D092A5C403000214007C5001C0A100005A39F61F972528769FC3B7E84B310200001A1835744FAD3AF03C84C3610C0642D1C8F9A895BB8B0D487D3FD9EE5EB027285E5DBECC390060DF265C71FB20C14727A42AE5E456628106EEBC5A6A67D1D27A7C06004A9F65FFA17CA04BB1AEAE6E772242FBFCCEC5DFA0AFFE159FC25C60D297B5861F64590ECA9DF7109367F1E8BDE25B628E6D9463168704C145C84BAC04020060941C3D2F27CF9031A6EB7A4D4D8DA228584710243E97733882DD7210682BDA9EE822C4F46642485D5D1D1405A2ADADADA6A6C634CD70380C25D9AC98628DC9DE037A04030FA6CD472291C08AFFBCD9F27857C6C79224353535A1D47E6EE19C4B9284F718BC3CF0C140EFD7678783405BD15386DF042C609524893166DB76341A0580A14387E22BB1E55A707D04762B949F59C2FBCC520C3AC0873F3F7C8485951F667473A202804FD4BE0D14B39AD0751BB4DF806256CD5E829B73838D16EDB5BEE03E063F28F800EC93BC967DC5ECF8E77DD62BFA883F4CAEC4CD134E4B5D977D313B529E1CDB440500057CCAD012C4AC2629782FB92F5EC401C02EE74A2C717503C1A53D662FF5556761304A826248AAD43EC7FB31F6A3DAE5C6D19F5E5C7FA04718FDADF859A3250BC19B96755AB07C16FA0E1FAB1BD0350F00200105001968DF6EB3BE9CACD29D2B391CF4BEB30F5F538E32E2E1E33748D8AAFB8383E03685195768B1066579580A0D00DDDDDDF97C3EC8B00932B4A018B240C11DC0FD3F10086A6D31D5061F7FAE1C8E18AEC17096E779F0393BFCDD113888D08211E7A41F3908EC5628DE577DDF2F3560014092A4CACA4A7C0D463CD1370F45A335F8C37297C00C64D8F59D47EA8B6E97582B0A97A19889858E51AC1FC51E2884BBF05127A944CA70B8129F0280220114BD721FF10217EF1AFCA3F6CDCE1B21C4F77D5CF7A1BEA0EDDFB7C98F7894FB6C5852ECB507D067BE79B43CEBA6D8C244D270D7183A6A4ADEB06F8F3D0050CBBACB6303C0BE3F67C16EF7A5220081C0095AFC4FBC007CDF5755D5B2AC3D241BF525409558ACA567079F21F8C5C14E3DB48C4BAB78790000C87D6FE4028082962C2E1A18055F02005BA15034CFA1E4D06CF8307F002B1734FE31FBFC93C07B0C8637313D00EB5FF77E0B823D7310D8AD782FC5F46628AA2A1AB0E9741A00B0E60AD3B3F0C5417D74D06665C0F6FEC02070A805BF063F3F0FEC54CA597A217D6E09BA6D40313221FCADFDCB4160B7124282CC2A55555137F14E8BA5F1B1586CA769D550FCFEECB337400682E9079EE7B9AEABEB7AA150304D933109FA7A180200F8CC678CF566B38944420148A7D3D16834D077DB75655996E5BE1CB260CF7DAF6FDFFA0672ECD9232C1128B68629FDB47889179870503E6AE0EC44609B4071755C7C3B2D784DA9518A196FAAAA124A5DD7F53CCF308CBE5250C61CC7515515771B6B6777F9A641F7118E55A41200806515D099E3FB3E27D8FA4F711C87B82458B607F751CBB23E6C79B59B3383DBC5732E73020072493E43D161DE77C2B135DA1E9CAD00502810C33080A04F09573CDCB6ED200F14B3ED09219CCBAEEB4A928FC2547AE195AA79A9AC474BDEB7EFB49498C0C5E7FB9EFBB8F71C0FAD78197C5893D1B70C604C92A442A1EF0CEFE1A3293D1B50BC1844726BFF721068EB8060DB76DFD7B5F88D2A6DC21674B540A338914860552EDACE788DA2D51C6C3028D6C62F40F07DF37DDFB22CC6187E1F3E4EA90BACB43DDD7EFD1A489284BD5D0CC3501405EB44DDBE5B851C74269324C9308CB2F6A4B4DF636025A9AAEABA2E26E1E2B945A7F9EE8435F01D0727A41FA331F84160BB2C499270E18C5D5FA1E8B0C67B95244998BB52AA501FDF9FD2DAA7FD1A35427DD7342DC84A14C9DD0388D0D65DA3699AE3389EE759964529354D5355D5D2CB14FD0FC1320A5B8198A6897A14B8AE309F01BF8A68A262AD216A079AE4685CEC4EA14AADA14F0D4C02C57B095AA98EE3A08CE29E60B33E2C842B6BCB98C08F79727872706BA579726835534A03C36A2782E4E5607FFAF77E8377BBE0D030401AB4D34657359E9CD2C029BEB8343B25F8F5D3D1D6C0858AC1BAD2DD107CFA086DDD35B862228404C1B19DFCFDA892C10239D01DD4082C734031C5156860CB70CE310F77A72FE1EE1890AF079AEAE17098738E7DE94DD384929818A5545555CFF3F6BCF0FC38AEEBE276F034CA1F4ED3FBF0DC06AD4376B79140CEF687F18E2EA0E057DCC340ADF03619F4C02D2D050C3EDF9DF6AA7FCDEA4FDC795996C3E170D0D548B4081828C46D6DD760EB6800F07DDF711CC7713049057FE22C80C027904EA771F1885F3CDBB6B1ED45F0323451D14CC3A525E63C046F814FEE12F25160BF69CAC7CF000064B359C330829DC79B01FA07000057CD656D166F5AD8E4108F9A738E76A2E779B66D0749CA9F280AC189857E3D27781345ADC77EAF28A000807B88CFA059FDF1C32FDD9F40734B3FBEFD073A85F183C3F6ACC26E1D40C4A9FF042449C2AF10EA0BAA099A6FC16A3D1A8DA264A0A985EB5C7C31E71CF5143BCE689A56EAA0F43C0F8DB5B24CBF4F011485A0711400E472396C7913D8E6F81D2EB7E62D48A10BBAEA1042B05D99A669E88D4585DDCB0D0682D55FDA4A8A638170277DDF2F14FABA5F071F1FFA4302B9DCA903CE4ECED67ED9ABBDDC73BC08F1DAFB94DF5DB013425B778DE779BEEFB7B7B777757565B35934D36CDBEEE9E90100D48560041600BCF0C20B500C58E14F74D462F047D775D4944C26B363C78EDEDE5EBCFA3146B4E73945AEEB62A43EC830FB142C206CCB8FF9C2D85F3C128910420A85423A9DC62CE3C05B5A1668FA01802CCBAAAAA652A9F6F6F64C26D3D9D9892F08C41A57B5BBDC886559287FF86BFF3A5B0921D8D234994C663219C3304CD3CCE7F3EDEDED78CBC1F2367C3B5C7FECF42196CA2E2E74D0D2C7AB68FF81A70E7F524A5F7EF9E5FDFD8E823D207C31BBC6308C2D5BB63CF9E4931B376E8CC7E3871C72C8B1C71E1B8BC59E7FFEF919336684C3E1A065012164FBF6ED0F3FFCF0942953E2F138A51403CD9EE7757474A03CA1DAAE5FBFFE8D37DE78F7DD770DC3983061C28C1933060F1E1C949CED6EF9E6380E2E7E914F27ECBB6CD9B22953A6A063F189279E38EEB8E3468D1A2549D2071F7C904AA5C68C19535757A7AA6A60D0ED3D8AA2589685F1EB2D5BB63CF7DC736BD6AC515575C68C192D2D2DCDCDCD50929BB13B6CDBC6F057E013E847301AB965CB96175F7CD1308C934E3A291E8FB7B5B5BDFFFEFB13274E6C6A6A82926C6B561C34898F3F9E4EC78BF54E412BB2FEDDDB9DC089C89452D7751F7BECB151A3460D1A3468BFBEA3607708BB75D7E4F3F95028F4F8E38FCF983163F2E4C9CF3EFBECABAFBE6ADBF6A851A3823400346D24490A85421D1D1DA5B3A9D3E9F4071F7C70CF3DF7545454689A964AA50060F0E0C1BFFFFDEF0F3DF4D069D3A63DF3CC33AFBFFE3AC6BBD0E780B3E172B91C2104DD08BCD89AE8C9279F7CEAA9A7A0E8C5436B0EBFABE8B4755D37F0DEF60B9B376F46EB32994CFEE217BF78FDF5D771CCEDBBEFBEFBEAABAFC6E371FC5FDC13CBB2027F229A6CE8AD0E025FA9540A7F4DA7D3C141018061187FF9CB5FA64E9D3A65CA94C71F7FFCF9E79FC7779765D9B22CDBB6032F046E3078A3279F7C72FEFCF9C964120F19333AFAEBF071AC742291B8EBAEBBEEBDF7DE4C2693CFE753A9D4AF7FFDEB41830695A60704C90C8F3CF2082696E06D03D3D7A018D2C4D77FFBDBDFEEECECCCE7F3780878CB0C8AE50821994C06AF017443E3B28010827F127CBE6823E3278E2F208464B359FC43742EE130794551F2F97CBF9C13C13E20ECD65D639AE6E6CD9B63B1D8B9E79ECB187BF5D55757AF5E3D6FDE3C54C3EDDBB7BFFAEAAB9EE78D1A35AAB2B2B2B2B2B2BEBE7EDDBA75AFBDF69AEFFB679F7D76341A7DF3CD37D7AE5D3B7FFEFCC30E3BACB6B61600BABBBB63B1D849279D545959E938CE82050BCE3AEBAC77DE7967E9D2A5894462E6CC99F5F5F5E170B8ADAD6DC58A15B95CAEA6A6E688238E701C67E1C285AAAA0E1932E4B0C30E4BA7D30B172E6C6D6D3DEEB8E31A1B1BD16599CD661389443F3AD724497AFFFDF78F3CF2C8C58B17D7D4D4AC58B1025D1C5BB76E1D3F7EBCAEEBEBD7AFE79CAF5AB5AAA9A969C28409CB962D7BF3CD37070D1A3479F2E4DADA5ADFF7DF7FFF7D42C8D2A54B8F3AEAA861C3866DD9B265C9922568C5373737D7D7D7CBB24C08A9A9A9993A75EA90214300E0E5975FCE64328CB16DDBB6AD5EBD3A9BCD9E7AEAA98944229FCF5B96B568D122C7714E39E5948D1B37BEFDF6DBE17078FCF8F1F1787CF3E6CD1B366CE8E9E9F9C217BE800918FF2298F8D1D5D53562C4889123473EFDF4D35FFFFAD76DDBC63DC1B3DDDEDEFEF2CB2F1F71C411871E7A687777F7D6AD5B9F7DF6D9E38F3F5E5555AC1F310C63D5AA550B172E1C3A74E8A4499356AD5AB575EBD6D75E7B6DFAF4E9A3468D6A6D6D5DBB766D6767675353D3B469D3B66DDB964AA57CDFDFB061435D5D5D229178EBADB7CE3DF75C5DD7DBDADA3A3B3B4DD37CE18517C68E1D3B6BD6AC175E782193C99C72CA29B878DAB66DDBBBEFBEBB6DDBB6D34E3BADAEAECEB2AC4D9B36CD9F3F7FFAF4E9E5A67008FA17A1ADBB06C3ACA150289D4E2793C9A6A6A6FAFAFA42A1B074E9D2FAFAFABFFCE52FB22C67B3D9FBEEBBEFB2CB2ED3757DC78E1D6FBFFD3600AC5DBBD6308C2953A6B4B7B7E30C44F47FE572B970381C8D463B3A3A304E924824B66FDFFED7BFFE75D0A0419B376F5EBE7CF977BFFB5DCEF9BDF7DE1B0A852CCBEAEAEA0280EAEAEA6C369B4C26376FDEDCD8D8F8DC73CFA552A9C6C6C6643259535383EBE250288449A3FDD537AFA1A1A1A3A38310B26CD9B2B3CE3A6BD5AA55C964120FF3D24B2FCDE5727FFCE31F01C0F7FD582CB67AF5EA471E7964D4A851AB56AD7AE79D776EBCF1C6F6F6F63BEEB8E384134ED8B871634F4FCF75D75DF7C20B2F489294C964162E5C78C92597E0F8324C9040D56E6B6B1B3E7C782814FAC73FFEF1FAEBAFC7E3F19E9E9E0D1B365C77DD759224FDE217BF300CA35028689A3665CA94743A9DCD6651F7DF7EFBEDCD9B37373434BCF7DE7B384ABD5F705DB7B2B272E6CC990F3FFCF017BFF8454CFFC045C6E2C58B9F7FFEF9E6E6E6471F7D74E3C68DA79E7AEAA64D9B4CD3ACABAB9B3C79327696CA66B37FF8C31F060F1EDCD5D5B569D3A66C36BB6AD5AAD1A3471F7AE8A19D9D9DCF3CF30C632C9D4E2F5AB44892A4EAEAEA1FFFF8C7F3E6CD5BB972E5A38F3E7ADC71C72D5CB830954A5D79E5956BD7AEFDE31FFF386DDAB49E9E9E071F7C70FDFAF58AA2BCF6DA6BDDDDDD975F7E79269379E69967229108A5F4F6DB6FBFF6DA6B29A5DFFBDEF7860C19B274E9D2850B170A7FEB00227C02BB8631168944B66CD972EBADB7FEE0073F48A7D373E7CEF53C0FED88B7DE7AEB9C73CEB9EAAAABBABABA9A9A9AAAAAAA4CD39C3469D2E5975F7EC41147BCF7DE7BBAAE1F7BECB143870E3DF6D86313894490B1D4D6D6F6C0030FDC75D75DFFFCE73FCF3FFFFC4D9B363536365E79E595F3E6CDDBB061C3CA952B172F5E9CCFE7BFFAD5AFFEBFFFF7FF264E9C387FFEFCE6E6E6B163C74E9C38F1BCF3CE334D73D3A64DD3A74F3FF7DC731B1B1BD14A02004DD37029DA5F875F5151B17AF56ACFF3D6AF5F3F6BD6AC7038BC71E3C6CECE4EC6586363A36DDBDBB66D5355F5C4134F9C356BD69FFFFCE7C6C6C6CB2FBFFCCC33CF7CF7DD77972C5992CBE57A7A7AA64E9D7AEDB5D74A92D4D6D6F6E69B6F4E9D3AF5ECB3CF4E24129148041D1AAAAAF6F6F63EF2C823575F7DF58E1D3BFEEDDFFE2D93C9AC5CB972E2C489D75E7BED35D75CB361C386C58B17AF5AB5AABBBB7BDEBC79471D75D40B2FBCA069DAB469D39A9A9A2EBCF042C6D8EAD5AB4F38E184B3CE3AEB88238EE89763C7B38A83849B9B9B870D1BF6F7BFFF1D8BEE52A9543299FCEB5FFF7AF2C9275F71C515F3E6CD9B3F7FBE6DDBE3C68DBBFCF2CB0F3DF4D020A92E954AE13573E699678E1933E690430E69696939FFFCF3870C19D2D3D3B363C78E134E38E1FFFDBFFF3772E4485C852493C969D3A65D78E185894462D4A851975C7209CEF1ADAAAA6A6B6B1B3B76EC35D75C6318464747C7E9A79F7EE69967AE5CB9D2F7FDF5EBD76FDCB871F6ECD9C1A958B162455D5DDD8D37DEF8C52F7EB1B9B9F973DEA3766011DABA6B1445E9EDEDADADADBDE0820BCE3EFBEC542AD5DBDBAB699AAEEB914824168BBDF5D65B7FF9CB5F66CF9E6D9A6667672786A742A1507575756F6F6F2C164333A7AEAEAE5028A04F369D4E5755559D76DA69B367CF2E140AB95C6EE3C68D73E6CCE19C373737B7B4B42C5CB870C9922583070F0E87C38AA21C72C821CB972F470FAC699AB95C2E1A8D1E7FFCF18B162DFAE52F7FB962C50A6C1DCF8B93A0FAD127D0D8D8B86DDBB6254B96D4D6D63636361E72C8218B162D5ABE7CF9F4E9D31963A150A8B2B2B2A5A565DAB4695BB76E5DBE7CF9BC79F372B9DCE8D1A30F39E490952B5772CE63B1586D6D6D2C16C3C4A0FAFAFAB56BD7AE5AB5AAAAAA2A9148A02D6F5956341A9D3973E685175E98CFE7376FDE9CCFE7172C5870F8E187E3B488C183076FDDBA75FEFCF923468C183162C4E8D1A3376EDC8883D3239188E779353535C71E7BEC82050B1E7CF0C1575F7DB55F8EDDF77DC3306CDBF67DBFB2B2F2F2CB2F5FB162C5A2458B42A1506D6DED1B6FBCE1FBFEE1871FCE189B366D5A2E976B6B6B334D137309FEF4A73FFDF8C73F7EE4914754553DEEB8E39E78E2895FFDEA573B76EC300C03DDA6A6692E5DBA74E3C68D1B366C78E5955728A5CDCDCD959595B1582C1A8D0E1E3CB8A6A6A6AAAA0A2F1BCBB2B2D96C6565E58409130CC388C56253A74E0D8542C3860DCBE7F3B95CEED9679F0580F6F6F6975E7A69F4E8D14D4D4D4F3EF9E4DCB9730DC3A8A8A8183264C83E041B05FD85D0D65D43080987C3BEEF0F1E3C78D2A449F5F5F50F3EF820A60D6DDCB8110B40E3F1F885175E58555585FDFC93C924C62230EC138BC5344DEBEAEAC2C1B4D96C16B359478D1A75DC71C78D1E3DFACE3BEF4C24122B57AE745D3797CB2D59B2049D956BD6ACC110C49A356B468F1E1D8D4671782D8EA19F3D7BF615575C3178F0E0471E79041D0E18CDC0A98BFD75F886610C1F3EFCD65B6FADAAAA320C63F6ECD92FBFFCF2534F3D85DA8A961D662C3434340C1A3468FEFCF9A15068EDDAB5DBB76F1F3B76AC2449B1582C97CB616E83EFFB7867AAA9A9B9EAAAAB468E1C89E12C49922A2A2A468C18316AD4A8430E39E4C1071FF47D3F1C0E2F5CB810A7F32693C9912347CE9A356BE9D2A59D9D9D5BB76E1D3972243A49E2F138E648CD9831E3FAEBAF1F3972E4638F3DD62FC75E281430C30CFD0043860C39E184135E7DF5D5E6E6E6F5EBD74F9E3C79C3860D1D1D1D8AA22C5BB6ACA1A1A1B6B6169DB0A6699E7DF6D9FFF99FFF79E699678642A179F3E65D7FFDF51D1D1DF3E7CFF73C0F6F0694D2EAEA6A4992860C1972CC31C75C7AE9A5279E7862676727A6F772CE33990C86F2305C86B5C5A8CBB95CAEA3A3033DECE8F71F33668CEFFB4D4D4D279F7CF257BFFAD5BABABA638F3DF6B9E79EF37D1FCFDEFECED513EC01E16FDD35A9542A1A8D62BCA5B6B6F6A4934EBAE5965B3A3A3A72B9DCE4C9933399CCFDF7DFEFFBFE91471E79D45147C5E3714C62C5EE1878F50F1D3A74CB962DBFFFFDEFCF3AEBAC21438604A68D6DDB994CE6C20B2F7CE38D371A1A1A7EFEF39F6FD9B265EDDAB5C71C73CCF4E9D3478C18F1DC73CFDD73CF3D94D2743A7DD5555731C68E3FFEF83BEEB8231A8D9E7CF2C90F3FFC702412E9EEEE9E3469524545459065C93947AF6BBF1CBEA2283535359B376F1E3D7A349E816834EA79DEE0C18383B8B6AAAAF97C5E55D5934E3AE9D1471FFDD9CF7ED6D9D93965CA94430F3DB4ADAD2D97CB55555565B359599631ECFEAB5FFDCA308CA953A71E7AE8A1687F31C672B99CA66955555573E7CE7DEEB9E772B9DCE5975FFEE31FFFB8B5B5D5B2ACE6E6E6A953A77675754522919FFFFCE7B22C9F77DE7900F0852F7CE1E69B6F8E46A3471D75D4934F3EE9FB7E7777F7B871E3FAE5D8C3E1B06DDB75757558F70100471E79E4E38F3FBE62C58AABAFBE3A1C0E1F7AE8A177DD75D7A041835A5B5B4F3BEDB49A9A9A6834FA9BDFFC0697E1B22C9BA6B965CB96071F7C10F3A09B9B9B755D9F3C79F2DD77DF7DCE39E79C70C209CF3FFFFC238F3C120E87755D9F3973666D6D2DBA476A6A6A62B11836EE097245C2E130EA6C6565257EC4419ACA9C39735E79E595DFFDEE7778322FBEF8E29123472E5AB408DDD33D3D3D58A92C1810C83DF7DC73CA29A73435356112653031E5737EC7C30C98A54B974E9E3CD934CDDEDEDEA54B971E7DF4D12B56AC9065F9C1071FBCF9E69BB3D9ECD34F3F8D0AB866CD9AC6C6C6DADADACD9B37E772B9A143876A9AB664C992E5CB979F7EFAE9F82D0280975E7A69CA94291896D9B2654B7D7DFD9A356B56AC5881229248240060FDFAF54B962CB12C6BE2C489871C720876E47AEDB5D70A85C211471CB165CB96458B160D1B366CEEDCB9FBEFF03139170791353535398EB362C50A0018356A54241249A5525D5D5DBAAE57565662F7C5254B96AC59B3A6AAAA6AC68C195555551D1D1D2B57AE9C397326E77CE5CA95E170F857BFFAD50D37DC2049D2DB6FBFFDDC73CFFDFCE73F775DD7B6ED952B578E193326168B757575B5B7B787C3E1EAEAEA75EBD6BDF1C61BD5D5D5279D7412F67358B76EDDA2458B060D1A346BD62C00C864326FBEF9A6E77913264CC866B30B162C482412A79E7AEA9E1A12EE3598C0944AA53A3B3B43A150434383EFFB9B376FDEB265CBF8F1E3ABAAAA7A7A7ADE7CF3CDCECECED1A3471F76D8619837F2E69B6F1E71C41183070FC644A8EEEEEEA54B976EDAB469E8D0A1471C714428145ABD7AF5B265CB468E1C3976EC58CBB25E7AE9A5F6F6F64993268D1B374E96E5F7DE7BAFA5A545D775CCA7360C63E5CA95871F7EF8E6CD9B93C9E48409130060C58A15F1787CC890211D1D1D5D5D5DB158ACA9A969FBF6ED786D60A0CC308C458B16AD59B3A6A9A9299148343434E04525F834E9AB7516DABA4B6CDBC66F4828144259DCB163477D7D3D21E4F9E79FFFCD6F7EF3939FFCC4F3BC279F7CB2AAAAEA924B2E696F6F4737222EC4B0A52C21A4BBBB3B988C00003D3D3D38F11B0030EA0D00EDEDEDB5B5B5A5B503C1889A20371E131843A190E338A954AABABA7ABF963362222D56676162532A950A1E633E2996ABE3E214332EB16629D808FE17007CF0C107B7DD76DB57BFFAD5091326DC77DF7D8AA2FCFFF6CE2E248AB68DE3F7B81FA3B3B9AEAE5FB588452A05992195605214046244756050277D9C0485D15114D151871275D85951514460098A661191698182071EE881919659EBD7AAB33BBBB3E3CEBE07FFE66278B0DEED79A7C7C797EB7710DBB6BB337337F39F6BAEFBBEFED7A54B9770A6C14F4408014306AA2D46440C2F2E7C201A8DD23BC2AADA40ED168ADC9CEA3849CB48138904B688ADDB1778211B8B35A4AAAA666767CFCCCCE0F4D0348DEC5391BA255F5A34D9A576B370C8C5D1C1A3D2BE1BBAAE532D1F361D8D46D1B1D8FCE1209C85D77838501405B29E4AA554550D0402C2BA4F38322C4CE6B0B6FE0AD40E0821D0FF83AAB331C3F0FCF97358400583C1C6C6C6C2C2425A120F511642D0D277B250324D132BCC93C924AE16BBBD2679C120118177E041954C2671E19173A8F8C3A5E2F65507903FFB7EDA9B7F200B4C7F452A109F47AD272A97EEDFBF8F683D3F3FBFA6A6A6B2B232994C62A0708CF6169364651B8BC5B01B1849AA9B58D12306DBFDDF8F9D2A2068D2DFEED58291A10D617FEC75BAD476C83E98581E073584E50DAD3C85D1046E3398F7431D2D6CC6489785554B0D2F1B6C02C51424CA9AA6FD2509C0DABA2A400D38DFBA32B22CA3F611C28AB316A7BEA228274E9CC04399A228E4876D9A2684465802B4B4B4949797272C9F3AA80C96A6632B54B483590EBA9070F951D04440AF85950EFE73878F63C1F50F95441299A269888824490894C8BC0A754AD4AC01C392959575EAD429AC4CF2F97C5844810381A918D9DC208D8B5F8682CBB2BCBCBC8CCF609C314AD168141386C23232FF5D97EE9FB1BCBC0C51C38668FD1CEEB21032F276C05D04313B8E94B40C365AC2724EC05F2185185ECC0AE2D821A6C2925A0AD8496785ED26874A3C2104760687EF72B91445C11D1AA0ED3CDBB5AC16ACAD2B033DCDC9C971593DEC841594793C9E9C9C1CD495ABAA4A3348882660E76C18464E4E0EE22FB861A52D17677BC48A704C08010D42E1262E12EC06623ACC20A3B10ADE77A400E91790890C2E663CD0A4ADC6391456BBAC2EA1F6A896C621168B618998A669D8613C0A900A0B21745DF7F97CB8B548B67E4D7675A31776C369FCA05D629C1211489B6419C852804916E692E52D29AC13C3300C7BC088C7F9BFF44DC057344D23575F0A4BED8F23142F432E296702B04085C650B27CC1B1CF18378FC783FB3DD98C39322CCCEFC26BB07E0AAE16CC14E33542399A9A1742E4E6E6E2B90CD7216216BB3F5E2C161396979510425555BC8F7A79613D66922D21220E7C06F1207E013F82A8040B74FEF4E1C31A9C2C68C9F78072C1244092D505002945C47D58060BC9A074210E5FD33404A1C27ACEC5E330AAE6755D87C1334600594BDC5A303864FC2AAC2E0678FF6F9872AD08A5B929A121AC2E3E88A0B187D828B64EC12C257F9192A61092DC601545C18FD89FF77146E14D1C11594620E6A5E8D5ED7693E935FE77E2F138A52C709AA52CEB1F9C3F8E8C09F337E0B8756510300ACB448E620A4AA7AAAAEAF1787C3E1F3DDBDA3D902828C317E9D19EBA184077107DD0921A4AA44226A89D01360D7DFF07BC9484153441EFC85D5F585155CAD62E10CD6CF042B2AC5D11B9676565A1EB1416E7621E465861260C61F1B3E4E28CCC231D20C27F616B4F42366394A6447097FE6F1D06338772CD9039DC3CA0ADB4C32B265E4919B157B81F20B7232C5B58DC9FF04961C5FE2EABFD0F6D94263F7044B831BB2CD36E7B7A97A26C9A5BA3130623C93981D582B5F557E08A45B0868C1EA20FD3340381006AAB482EB3ACE6DE1065D465E1619F6660A81901CCFC3149450D42702D51AE80E6B296969690881056EAF64FCF51E0415E51148AC4119421018D1DC3B32D12D3C81B0A9BDB37327D8AA25062410811894460C3282C435821C4C2C20226B5512241135C34E1833E0E0875693E1D4B14704B73D97A3B3A72ECD02C3C592793496C9DC24CCA8C236D4AB713BAF9D1FC27ED33CE045996B1DE00C7450B1EECF3FE9454A59C80B0DD9B11BD62FCEDEFD37CA9B0E6F4283FFE0F3CE2302BC2EB041886619CE4C793C76AEF06C330CCFF21ACAD0CC330CEC3DACA300CE33CACAD0CC330CEC3DACA300CE33CACAD0CC330CEC3DACA300CE33CACAD4CA6606DBFB0AAB30CC3A0DA536A9AADAAAA6435CDA68A26FC13AAA7F0754DD350E72AC890CD6A041D8BC5A80135BEABAA2AD6F3A76DFDB719E65F0E6B2B9329D4E40AA59C9224A1BA4C92A4A5A525785FC13A201008A0E8886AFC555595651945C342089FCF879A25AA58310C033548BAAEC3720C3551F8308AAFB009AE6A61D604ACAD4CA6C02884624FBC393737679A26FADF783C1E5DD7E7E7E78510D04D145F0AAB54170A0BF719C8A561188B8B8B7373731D1D1DF040090683F3F3F3B0E5466B1372AB2187BD55397C86F92D585B994C41D9BBDD57251A8DF6F4F41C3B76ECC2850B67CE9C79F1E2053A8CE2791F75F74805C08AC1EFF79391202AE2E19330313171F5EAD5E1E1E1542A353B3BEBF57AD7AD5BA7691A8C6060A4405626AB3A060C93297CA6329902431098A408CB33BBAFAF6F7A7ABAA2A2E2FBF7EF57AE5C79FDFA3592B01E8F677A7A5AD334F8F5699A36353585DF214B117446F17ABDAAAAC6E3F1C9C9C970387CE8D0A1C1C1C1743ABDB0B000135874BD8541149BE6316B05F6C162328562466A9D80BE84A954EAF2E5CBCDCDCDF5F5F59148243B3B5B55D5B6B6B6D1D1D1929292B367CF6A9AF6F0E1C34824120C068F1D3BD6DBDBEBF7FBF7EEDD3B3737F7ECD9B3BABA3A4551109F8E8C8C7CF9F2A5B3B3D3E3F1D4D5D5B5B7B7BF7BF7AEAAAAAAA9A929140A2187B0AA63C03099C2DACA648ADBED462F1638A5C25F118E7F8F1F3FEEEFEFAFADAD0D8542F3F3F3D7AF5F374DB3A1A1A1B7B7B7A3A3636C6CACBFBFFFE8D1A36565652E97EBEDDBB786611C3870209148DCB973C734CDDADADA858585E5E565E46A9796964CD36C6B6B6B6D6D3D7FFE7C51511175CA41F4BACA03C13019C03901E637C0343D66F653566F5721C4F0F0F0AB57AF1A1A1AEAEAEAA6A6A6BABABA8687873B3B3B3F7EFCA8AAEAE6CD9BA7A6A61E3C78108FC7E17E9B979707737132CCCFCECEF6783CF5F5F57EBFBFB1B171E7CE9DE5E5E58AA23C7AF4687272D2E7F361460B9EAAAB3C0A0C93011CB73299420D4EE0FF8D3E80E9743A180CB6B4B4241289EEEEEEE3C78FA397EDC18307ABABAB0B0A0A4A4A4A2A2B2B8B8A8AEEDEBDDBD2D2D2D9D96918C6D4D4546E6EEED8D858341A45E41B8D46D1BD11ED1DDD6EF7F6EDDB6FDDBA75FBF6ED9B376F8642A1C3870FA3D523C7ADCC9A80E3562653A88929969D0A21A2D16832995414A5B4B4B4B9B9797E7EBEABABCBEBF5D6D4D42C2E2EEEDAB56BCB962DA5A5A5838383E5E5E5274F9E2C2828989D9D0D0402030303EDEDED6FDEBCF9FAF56B3299441783E2E2E2F5EBD7E7E4E47475758D8E8E0A214CD3BC76ED5A7E7E7E381CA6A60CDC149A591370DCCAFC0694EEC483792291D8B871E3D0D0502412D9BD7B77201078FFFEFDB973E74E9F3EDDDADA3A3E3E3E3B3B7BE3C68D919191EEEE6E45512A2A2ACACBCBF7EFDFFFE4C9938B172FEEDBB72F180CE6E7E78742A1E2E2E270381C8FC7F3F2F29E3E7D1A0C06B76DDB76EFDEBDDCDCDCD2D2D2EAEA6A2C7745DF2AEE53C2FCFBE19E2E4CA64892148FC7515E8582D4743A3D3434949D9DBD75EB56D33407060642A1505959D9C4C444381C1E1B1B2B2828D8B1638710E2E5CB9792241D3972C4E3F1288AD2D3D3F3EDDBB7A6A6A64F9F3E61826B7C7CBCBCBCBCA4A4E4F3E7CF7D7D7D5555551B366CF8F0E1432C16DBB367CFA64D9BD0C1941A59AFF25830CCCFF951C6CDDACA640E5A01E2DCA0F6B7E8AF679AA6AEEBA8A4F27ABD8661E8BA9E9B9B4BCDA2A9CB9E1022168BC9B28C36AE38D9F031741177BBDD28AB956559D3341420C8B28C2AAF999999C2C2C2D51D0786F905D056CE09309922491284150901E8206AA81054A2802A9148C8B2ECF57ABD5E6F241241CF5A48A7CBE5D2755DD775BFDF2FAC6204C330A85F772A95525535180CA29BA91002CD53B19C16ABBE5858993501CF653199028B002A8EA239254CDF0B210CC3D0340DEB076014909F9F8F785396657CCBEBF54258C3E130DE942409EDB8A1D4050505E9745AD77578629199C0DCDC1C5662F11315B326E0B895C9149AC84214994EA7B1224A9665FC298470BBDDF88CDBEDF6FBFD98D9A76FE105FE2C2E2E1696FD0AD90C5222151F46D08A37A1B98AA270B295591370DCCA300CE33CACAD0CC330CEC3DACA300CE33CACAD0CC330CEC3DACA300CE33CACAD0CC330CEC3DACA300CE33CACAD0CC330CEC3DACA300CE33CACAD0CC330CEC3DACA300CE33CACAD0CC330CEC3DACA300CE33CACAD0CC330CEC3DACA300CE33CFF011AA302FCB8D1AE6D0000000049454E44AE426082)
SET IDENTITY_INSERT [dbo].[employees] OFF
GO
SET IDENTITY_INSERT [dbo].[evaluations] ON 

INSERT [dbo].[evaluations] ([EvaluationID], [EmployeeID], [ReviewerID], [EvaluationDate], [Behavior], [Attendance], [Punctuality], [Productivity], [Creativity], [ClientRelation], [Initiative], [Communication], [Cooperation], [StrategicThinking], [HandleStressful], [ListeningSkills], [MeetingDeadlines], [Performance], [JobKnowledge], [OrganizeIdea], [RespondResourcefully], [ConfrontsProblems], [CustomerNeeds], [OrganizationVision], [StayFocused], [OverAllProgress], [Comment], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive]) VALUES (1, 6, 6, CAST(N'2000-11-01T00:00:00.0000000' AS DateTime2), N'Low', N'Low', N'Low', N'Low', N'Fair', N'Low', N'Excellent', N'Low', N'Low', N'Low', N'Low', N'Low', N'VeryExcellent', N'Low', N'Low', N'Low', N'Fair', N'Low', N'Fair', N'Low', N'Low', N'VeryExcellent', N'', NULL, CAST(N'2023-01-14T23:02:43.4314971' AS DateTime2), CAST(N'2023-01-14T23:02:43.4314971' AS DateTime2), 6, 6, 1)
SET IDENTITY_INSERT [dbo].[evaluations] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([ImageId], [docName], [docnum], [image], [EmployeeID], [MessageID], [EventID], [TaskID]) VALUES (31, N'', N'c9f0f895fb98ab9159f51fd0297e236d-cer1', NULL, 8, NULL, NULL, NULL)
INSERT [dbo].[Images] ([ImageId], [docName], [docnum], [image], [EmployeeID], [MessageID], [EventID], [TaskID]) VALUES (38, N'', N'8f14e45fceea167a5a36dedd4bea2543-cer1', NULL, 7, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[jobs] ON 

INSERT [dbo].[jobs] ([JobID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive]) VALUES (1, N'محاسب', NULL, CAST(N'2022-12-10T19:39:51.3990956' AS DateTime2), CAST(N'2022-12-10T19:40:03.4205138' AS DateTime2), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[jobs] OFF
GO
SET IDENTITY_INSERT [dbo].[scheduledJobs] ON 

INSERT [dbo].[scheduledJobs] ([ID], [Name], [ScheduleDate]) VALUES (1, N'DialyTasks', CAST(N'2023-01-16T22:57:06.6846432' AS DateTime2))
SET IDENTITY_INSERT [dbo].[scheduledJobs] OFF
GO
SET IDENTITY_INSERT [dbo].[vacations] ON 

INSERT [dbo].[vacations] ([VacationID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive]) VALUES (1, N'بلا أجر', NULL, CAST(N'2022-12-10T19:45:13.1669898' AS DateTime2), CAST(N'2022-12-10T19:45:13.1669898' AS DateTime2), 1, 1, 1)
INSERT [dbo].[vacations] ([VacationID], [Name], [Notes], [CreateDate], [UpdateDate], [CreateUserID], [UpdateUserID], [IsActive]) VALUES (2, N'إجازة أمومة', NULL, CAST(N'2022-12-10T19:47:19.4662286' AS DateTime2), CAST(N'2022-12-10T22:10:00.3127262' AS DateTime2), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[vacations] OFF
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
