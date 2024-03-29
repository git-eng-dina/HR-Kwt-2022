USE [HRSystem]
GO
/****** Object:  Table [dbo].[appObjects]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[branches]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[charitys]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[companies]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[confirms]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[countriesName]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[custodies]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[dailyTasks]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[departments]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[Devices]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[DocumentCategories]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[EemployeesEvents]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[employees]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[employeesScheduleVacations]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[employeesTasks]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[employeesTrainings]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[employeesVacations]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[evaluations]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[events]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[highrManagment]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[hourlyPermissions]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[Images]    Script Date: 2/1/2023 9:03:18 PM ******/
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
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[managements]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[materialsConsumption]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[MessageReply]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[messagesTemplates]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[periods]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[Resignation]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[rewards]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[salaryIncreases]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[scheduledJobs]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[scheduleVacations]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[statuses]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[tasks]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[trainings]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[usersMessages]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[usersPermissions]    Script Date: 2/1/2023 9:03:18 PM ******/
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
/****** Object:  Table [dbo].[vacations]    Script Date: 2/1/2023 9:03:18 PM ******/
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
