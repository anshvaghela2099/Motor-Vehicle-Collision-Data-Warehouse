USE [Final_MVC]
GO
/****** Object:  Table [dbo].[Dim_Contributing_Factor_SCD]    Script Date: 4/7/2024 11:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Contributing_Factor_SCD](
	[SK_ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [int] NOT NULL,
	[Contri_DK] [int] NOT NULL,
	[Description] [varchar](100) NULL,
	[SCD_StartDate] [datetime] NULL,
	[SCD_EndDate] [datetime] NULL,
	[SCD_Version] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DI_CreatedDate] [datetime] NULL,
	[DI_JobID] [varchar](20) NULL,
	[DI_Workflow_Name] [varchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 4/7/2024 11:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[Date_SK] [int] NOT NULL,
	[Date] [datetime] NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[Week] [int] NULL,
	[Quarter] [int] NULL,
	[Season] [varchar](100) NULL,
	[DI_JobID] [varchar](20) NULL,
	[DI_CreatedDate] [datetime] NULL,
	[DI_Workflow_Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Date_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Location]    Script Date: 4/7/2024 11:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Location](
	[Location_SK] [int] NOT NULL,
	[STREET_NAME] [varchar](100) NULL,
	[LATITUDE] [real] NULL,
	[LONGITUDE] [real] NULL,
	[DI_JobID] [varchar](20) NULL,
	[DI_CreatedDate] [datetime] NULL,
	[DI_Workflow_Name] [varchar](70) NULL,
	[SOURCE] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Location_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Source]    Script Date: 4/7/2024 11:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Source](
	[Source_SK] [int] NOT NULL,
	[Source] [varchar](100) NULL,
	[DI_JobID] [varchar](20) NULL,
	[DI_CreatedDate] [datetime] NULL,
	[DI_Workflow_Name] [varchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[Source_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Time]    Script Date: 4/7/2024 11:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Time](
	[Time_SK] [int] NOT NULL,
	[Hour] [int] NULL,
	[DI_JobID] [varchar](20) NULL,
	[DI_CreatedDate] [datetime] NULL,
	[DI_Workflow_Name] [varchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[Time_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Vehicle_Type]    Script Date: 4/7/2024 11:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Vehicle_Type](
	[Vehicle_SK] [int] NOT NULL,
	[crash_id] [int] NULL,
	[units_involved] [varchar](1000) NULL,
	[Source] [varchar](10) NULL,
	[DI_ProcessID] [varchar](20) NULL,
	[DI_CreatedDate] [datetime] NULL,
	[DI_Workflow_Name] [varchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[Vehicle_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

Insert Into Dim_Vehicle_Type values(1862, -1, 'NA', 'CHICAGO', 'kCnjbA', '2024-04-13 18:04:13.767', 'Load_Dim_Vehicle_Type_0.1');
/****** Object:  Table [dbo].[Fct_Accidents]    Script Date: 4/7/2024 11:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fct_Accidents](
	[Accidents_FCT_SK] [int] NOT NULL,
	[Date_SK] [int] NOT NULL,
	[Location_SK] [int] NOT NULL,
	[Source_SK] [int] NOT NULL,
	[Time_SK] [int] NOT NULL,
	[Crash_ID] [int] NULL,
	[IS_PEDESTRIAN] [varchar](2) NULL,
	[Pedestrian_Injured] [int] NULL,
	[Pedestrian_Killed] [int] NULL,
	[Total_Injured] [int] NULL,
	[Total_Killed] [int] NULL,
	[Motorist_Injured] [int] NULL,
	[Motorist_Killed] [int] NULL,
	[DI_JobId] [varchar](20) NULL,
	[DI_CreateDate] [datetime] NULL,
	[DI_Workflow_Name] [varchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[Accidents_FCT_SK] ASC,
	[Date_SK] ASC,
	[Location_SK] ASC,
	[Source_SK] ASC,
	[Time_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fct_Contribution]    Script Date: 4/7/2024 11:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fct_Contribution](
	[Contribution_FCT_SK] [int] NOT NULL,
	[Accidents_FCT_SK] [int] NOT NULL,
	[Contri_SK] [int] NOT NULL,
	[Contri_DK] [int] NOT NULL,
	[DI_JobId] [varchar](20) NULL,
	[DI_CreateDate] [datetime] NULL,
	[DI_Workflow_Name] [varchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[Contribution_FCT_SK] ASC,
	[Accidents_FCT_SK] ASC,
	[Contri_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fct_Vehicle]    Script Date: 4/7/2024 11:01:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fct_Vehicle](
	[Vehicle_FCT_SK] [int] NOT NULL,
	[Accidents_FCT_SK] [int] NOT NULL,
	[Vehicle_SK] [int] NOT NULL,
	[Vehicle_Count] [int] NULL,
	[DI_ProcessID] [varchar](20) NULL,
	[DI_CreatedDate] [datetime] NULL,
	[DI_Workflow_Name] [varchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[Vehicle_FCT_SK] ASC,
	[Accidents_FCT_SK] ASC,
	[Vehicle_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

