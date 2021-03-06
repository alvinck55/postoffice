USE [master]
GO
/****** Object:  Database [POSTOFFICE2]    Script Date: 4/30/2018 3:15:58 PM ******/
CREATE DATABASE [POSTOFFICE2]
GO
ALTER DATABASE [POSTOFFICE2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [POSTOFFICE2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [POSTOFFICE2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [POSTOFFICE2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [POSTOFFICE2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [POSTOFFICE2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [POSTOFFICE2] SET ARITHABORT OFF 
GO
ALTER DATABASE [POSTOFFICE2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [POSTOFFICE2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [POSTOFFICE2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [POSTOFFICE2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [POSTOFFICE2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [POSTOFFICE2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [POSTOFFICE2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [POSTOFFICE2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [POSTOFFICE2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [POSTOFFICE2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [POSTOFFICE2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [POSTOFFICE2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [POSTOFFICE2] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [POSTOFFICE2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [POSTOFFICE2] SET  MULTI_USER 
GO
ALTER DATABASE [POSTOFFICE2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [POSTOFFICE2] SET ENCRYPTION ON
GO
ALTER DATABASE [POSTOFFICE2] SET QUERY_STORE = OFF
GO
USE [POSTOFFICE2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_ONLINE = OFF TargetReplic;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_RESUMABLE = OFF TargetReplic;
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ISOLATE_SECURITY_POLICY_CARDINALITY = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_PROCEDURE_EXECUTION_STATISTICS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_QUERY_EXECUTION_STATISTICS = OFF;
GO
USE [POSTOFFICE2]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_diagramobjects]    Script Date: 4/30/2018 3:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	
GO
/****** Object:  Table [dbo].[ACCOUNT]    Script Date: 4/30/2018 3:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNT](
	[userID] [nchar](10) NULL,
	[password] [nchar](10) NULL,
	[email] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ADDRESS]    Script Date: 4/30/2018 3:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADDRESS](
	[Address_ID] [int] IDENTITY(1,1) NOT NULL,
	[Facility_ID] [int] NULL,
	[Street] [nvarchar](50) NOT NULL,
	[City] [nvarchar](30) NOT NULL,
	[State] [nchar](2) NOT NULL,
	[Zip] [decimal](5, 0) NOT NULL,
	[aptn] [int] NULL,
	[Postal_code] [decimal](4, 0) NULL,
	[Last_updated] [datetime] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 4/30/2018 3:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Address_ID] [int] NULL,
	[Fname] [nvarchar](15) NOT NULL,
	[Minit] [nvarchar](15) NULL,
	[Lname] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone1] [nvarchar](20) NOT NULL,
	[Phone2] [nvarchar](20) NULL,
	[Last_updated] [datetime] NULL,
	[Password] [nchar](25) NULL,
 CONSTRAINT [PK__CUSTOMER__8CB286B9151B8EBB] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER_ADDRESS]    Script Date: 4/30/2018 3:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER_ADDRESS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NULL,
	[Address_ID] [int] NULL,
 CONSTRAINT [PK_CUSTOMER_ADDRESS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLOYEES]    Script Date: 4/30/2018 3:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLOYEES](
	[Employee_ID] [int] NOT NULL,
	[Fname] [nvarchar](15) NOT NULL,
	[Minit] [char](1) NULL,
	[Lname] [nvarchar](15) NOT NULL,
	[DOB] [date] NOT NULL,
	[Facility_ID] [int] NOT NULL,
	[Last_updated] [datetime] NULL,
	[password] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_EMPLOYEES] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACILITY]    Script Date: 4/30/2018 3:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACILITY](
	[Facility_ID] [int] IDENTITY(1,1) NOT NULL,
	[Phone_No] [nvarchar](20) NOT NULL,
	[Last_updated] [datetime] NULL,
	[Address_ID] [int] NULL,
 CONSTRAINT [PK_FACILITY] PRIMARY KEY CLUSTERED 
(
	[Facility_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PACKAGE]    Script Date: 4/30/2018 3:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PACKAGE](
	[Package_ID] [int] IDENTITY(1,1) NOT NULL,
	[Tracking_no] [int] NULL,
	[Sender_ID] [int] NULL,
	[Receiver_Address_ID] [int] NULL,
	[Sender_Address_ID] [int] NULL,
	[Cost] [decimal](4, 2) NULL,
	[Types] [nchar](2) NOT NULL,
	[Weight] [decimal](4, 2) NOT NULL,
	[Priority] [nchar](2) NOT NULL,
	[Last_updated] [datetime] NULL,
	[Receiver_Fname] [nvarchar](50) NULL,
	[Receiver_Lname] [nvarchar](50) NULL,
 CONSTRAINT [PK_PACKAGE_1] PRIMARY KEY CLUSTERED 
(
	[Package_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRIORITY]    Script Date: 4/30/2018 3:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRIORITY](
	[Priority_ID] [nchar](2) NOT NULL,
	[Priority] [varchar](50) NOT NULL,
	[Last_updated] [datetime] NULL,
 CONSTRAINT [PK_PRIORITY] PRIMARY KEY CLUSTERED 
(
	[Priority_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SHIPPING_HISTORY]    Script Date: 4/30/2018 3:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHIPPING_HISTORY](
	[Shipping_history_ID] [int] IDENTITY(1,1) NOT NULL,
	[Tracking_no] [int] NOT NULL,
	[Facility_ID] [int] NOT NULL,
	[Status] [nchar](1) NULL,
	[Last_updated] [datetime] NULL,
 CONSTRAINT [PK_SHIPPING_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Shipping_history_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STATE]    Script Date: 4/30/2018 3:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STATE](
	[State_ID] [nchar](2) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Last_updated] [datetime] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[State_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STATUS]    Script Date: 4/30/2018 3:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STATUS](
	[Status_ID] [nchar](1) NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[Last_updated] [datetime] NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 4/30/2018 3:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRACKING]    Script Date: 4/30/2018 3:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRACKING](
	[Tracking_no] [int] IDENTITY(1,1) NOT NULL,
	[Sender_ID] [int] NULL,
	[Facility_ID] [int] NULL,
	[Failed_to_deliver] [bit] NOT NULL,
	[Status] [nchar](1) NOT NULL,
	[Delivered_Date] [datetime] NULL,
	[Delivery_Date] [datetime] NOT NULL,
	[Package_ID] [int] NOT NULL,
	[Last_updated] [datetime] NULL,
	[Destination_Address_ID] [int] NULL,
 CONSTRAINT [PK_TRACKING] PRIMARY KEY CLUSTERED 
(
	[Tracking_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TYPE]    Script Date: 4/30/2018 3:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TYPE](
	[Type_ID] [nchar](2) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Last_updated] [datetime] NULL,
 CONSTRAINT [PK_TYPE] PRIMARY KEY CLUSTERED 
(
	[Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ADDRESS] ON 

INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (1, 1, N'13454 Farmers St', N'Houston', N'TX', CAST(77095 AS Decimal(5, 0)), 123, NULL, CAST(N'2018-04-25T15:50:33.217' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (3, 1, N'34522 Customer St.', N'Houston', N'AL', CAST(77095 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T15:50:37.013' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (4, 1, N'53231 Sender St.', N'Houston', N'TX', CAST(77095 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T15:50:41.373' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (5, 1, N'12435 Something St.', N'Houston', N'TX', CAST(77095 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T15:50:44.840' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (14, 1, N'12321 Hello', N'Hi there', N'TX', CAST(77095 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T15:50:55.450' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (20, 1, N'1234 Test Street', N'Houston', N'TX', CAST(77095 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-22T03:13:31.297' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (21, 1, N'2341 Test Street', N'Houston', N'TX', CAST(77095 AS Decimal(5, 0)), 1234, CAST(7643 AS Decimal(4, 0)), CAST(N'2018-04-22T03:14:26.420' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (22, 1, N'4567 Test Street', N'Washington', N'VA', CAST(77092 AS Decimal(5, 0)), NULL, CAST(2341 AS Decimal(4, 0)), CAST(N'2018-04-22T03:19:53.563' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (23, 1, N'4029 Test Street', N'Alabama', N'WA', CAST(77012 AS Decimal(5, 0)), NULL, CAST(2341 AS Decimal(4, 0)), CAST(N'2018-04-22T03:22:05.470' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (24, 1, N'1023 Test St', N'Dallas', N'TX', CAST(66223 AS Decimal(5, 0)), NULL, CAST(1234 AS Decimal(4, 0)), CAST(N'2018-04-22T03:22:05.563' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (31, 1, N'3461 Testing St', N'City2', N'TX', CAST(77095 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-24T04:22:17.463' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (32, 1, N'0352 Test Street', N'Houston', N'TX', CAST(77092 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-22T06:01:43.703' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (33, 1, N'1235 Testing Street', N'Houston', N'TX', CAST(77092 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-22T06:01:43.797' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (35, 1, N'3059 Testing Ave', N'Dallas', N'TX', CAST(77092 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-22T19:16:25.900' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (36, 1, N'0000 Test Street', N'Houston', N'TX', CAST(77093 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-22T19:16:25.963' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (40, 1, N'0987 Calhoun Rd', N'Washington', N'AK', CAST(77023 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-22T22:09:22.653' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (41, 1, N'1235 Get Rd', N'Rockets', N'AR', CAST(12342 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-22T22:09:22.717' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (60, 1, N'0232 Work St', N'Houston', N'DE', CAST(12302 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-23T06:39:08.300' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (62, 1, N'0233 Work St', N'Houston', N'DE', CAST(12302 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-23T06:42:00.663' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (64, 1, N'5483 Create Rd', N'Houston', N'AK', CAST(12345 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-23T06:47:47.527' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (67, 1, N'6445 Farmers Market', N'ThisCity', N'AK', CAST(12350 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-23T06:55:39.717' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (68, 1, N'1203 Road', N'MyCity', N'MA', CAST(77095 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-23T06:55:39.780' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (71, 1, N'1117 jorge street', N'rosenberg', N'TX', CAST(77471 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-23T21:16:58.697' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (72, 1, N'1117 jorge street', N'rosenberg', N'TX', CAST(77471 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-23T21:17:23.573' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (73, 1, N'1117 jorge street', N'rosenberg', N'TX', CAST(77471 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-23T21:17:38.073' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (74, 1, N'1117 jorge street', N'rosenberg', N'TX', CAST(77471 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-23T21:18:04.340' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (75, 1, N'498234 Work', N'Houston', N'AK', CAST(77095 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-23T21:19:46.730' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (76, 1, N'12031 Work', N'Houston', N'AK', CAST(77095 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-23T21:19:46.887' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (77, 1, N'1111 jorge street', N'rosenberg', N'TX', CAST(77469 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-23T21:22:45.387' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (78, 1, N'4912 test lane', N'new york', N'NE', CAST(12321 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-23T21:22:45.400' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (80, 1, N'123 Street', N'Sping', N'TX', CAST(12345 AS Decimal(5, 0)), 30, NULL, CAST(N'2018-04-23T22:43:17.153' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (81, NULL, N'7232 Database St', N'Houston', N'TX', CAST(77092 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-24T04:30:57.437' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (82, 1, N'1020 Street', N'Houston', N'AK', CAST(77092 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-24T20:47:05.253' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (83, 1, N'1020 Streets', N'Houston', N'AK', CAST(11111 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-24T21:05:57.680' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (84, 1, N'1020 Streetsss', N'Houston', N'AK', CAST(11111 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-24T21:06:05.040' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (85, 1, N'11111 work street', N'ALabama', N'AK', CAST(12345 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-24T21:09:03.917' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (86, 1, N'301230 Street', N'Houston', N'AK', CAST(12333 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T20:13:02.107' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (87, 1, N'05498 Post Office', N'Dallas', N'AK', CAST(77098 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-24T23:06:43.333' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (88, 1, N'0902 Calhoun Rd', N'Montrose', N'TX', CAST(11234 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-24T23:09:47.147' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (89, 1, N'23452 Road', N'Houston', N'AK', CAST(11111 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-24T23:10:40.160' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (90, 1, N'34509 Road', N'Houston', N'AK', CAST(77092 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-24T23:12:01.770' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (91, 1, N'134209 Test', N'Houston', N'AK', CAST(77091 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-24T23:15:59.863' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (92, 1, N'543209 Address', N'Asdf', N'AL', CAST(77092 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-24T23:18:01.770' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (93, 1, N'321409 Does it Work', N'fsfe', N'AK', CAST(70332 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-24T23:20:59.677' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (94, 1, N'4321908 Work please', N'Road', N'AK', CAST(77023 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-24T23:20:59.820' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (95, 1, N'1209 Work', N'Alaska', N'AK', CAST(11135 AS Decimal(5, 0)), 123, NULL, CAST(N'2018-04-24T23:27:49.960' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (97, 1, N'4406 sunflower creek lane', N'richmond', N'TX', CAST(77469 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T04:47:48.283' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (98, 1, N'5731 Carta Valley Lane', N'richmond', N'TX', CAST(77469 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T04:47:48.423' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (100, 1, N'23490 Street', N'New York', N'NY', CAST(12345 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T16:50:21.323' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (101, 1, N'123091 Street', N'New York', N'NY', CAST(12345 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T16:55:33.983' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (102, 1, N'9786 Worker Street', N'New York', N'NY', CAST(12345 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T16:58:07.903' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (103, 1, N'87543 Place', N'New York', N'NY', CAST(12345 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T17:04:50.530' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (104, 1, N'124309 Billy', N'New York', N'NY', CAST(77092 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T17:17:25.173' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (105, NULL, N'23303 tree hill', N'san antonio', N'TX', CAST(78261 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-25T20:35:02.233' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (106, NULL, N'23303 tree hill', N'san antonio', N'TX', CAST(78261 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-25T20:41:37.117' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (107, NULL, N'230230 Test', N'Houston', N'TN', CAST(77012 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-25T20:47:15.657' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (108, NULL, N'1298 Email', N'Houston', N'TN', CAST(77091 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-25T20:51:58.100' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (109, NULL, N'7912 Street', N'City', N'AK', CAST(77091 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-25T20:55:36.007' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (110, NULL, N'1233 Ridge Rd', N'London', N'TN', CAST(12345 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-25T21:00:02.143' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (111, NULL, N'23303 water way', N'san antonio', N'TX', CAST(78261 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-25T21:01:44.420' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (112, 1, N'1234 moody mood', N'houston', N'TX', CAST(78200 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T21:02:58.087' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (113, NULL, N'5731 Carta Valley Lane', N'richmond', N'TX', CAST(77469 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-25T21:31:34.643' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (115, 1, N'5731 Carta Valley Lane', N'richmond', N'TX', CAST(77469 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T21:34:47.630' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (116, 1, N'5731 Carta Valley Lane', N'richmond', N'TX', CAST(77469 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T21:34:59.910' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (117, NULL, N'1234 baker street', N'houston', N'TX', CAST(77469 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-25T21:35:35.707' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (118, NULL, N'4406 sunflower creek lane', N'richmond', N'TX', CAST(77469 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-25T21:36:53.490' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (119, 1, N'5731 carta valley lane', N'houston', N'TX', CAST(77469 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T21:37:33.523' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (120, NULL, N'5731 carta valley lane', N'richmond', N'TX', CAST(77469 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-25T21:46:51.287' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (121, 1, N'9011 Calhoun Road', N'Houston', N'TX', CAST(77095 AS Decimal(5, 0)), 901, NULL, CAST(N'2018-04-25T21:49:07.573' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (122, 1, N'6521 Calhoun Road', N'Dallas', N'TX', CAST(77023 AS Decimal(5, 0)), 902, NULL, CAST(N'2018-04-25T21:49:07.607' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (123, 1, N'5731 Carta Valley road', N'richmond', N'TX', CAST(77469 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T22:56:42.433' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (124, NULL, N'1234 Test Street', N'Richmond', N'TX', CAST(77471 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-25T23:10:52.330' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (125, 1, N'9876 Lab Lane', N'nashville', N'TN', CAST(64322 AS Decimal(5, 0)), 123, NULL, CAST(N'2018-04-25T23:11:56.013' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (126, 1, N'7653 richter lane', N'galveston', N'TN', CAST(86574 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T23:17:00.150' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (127, 1, N'3838 bonnie avenue', N'richmond', N'TX', CAST(77469 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-25T23:19:13.143' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (128, NULL, N'5731 carta valley lane', N'houston', N'TX', CAST(77469 AS Decimal(5, 0)), 123, NULL, CAST(N'2018-04-30T02:20:05.637' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (129, NULL, N'1010 Addie Street', N'Houston', N'TX', CAST(77095 AS Decimal(5, 0)), 1290, NULL, CAST(N'2018-04-26T03:36:05.527' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (130, 1, N'1011 Addie Street', N'Houston', N'TX', CAST(77095 AS Decimal(5, 0)), 1291, NULL, CAST(N'2018-04-26T03:37:13.777' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (131, 1, N'23452 Road', N'Hosuton', N'AK', CAST(11111 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-29T19:13:15.303' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (132, NULL, N'1954 Address', N'Houston', N'TX', CAST(77023 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-29T19:17:05.020' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (133, 1, N'05312 Address Rd', N'Houston', N'TN', CAST(77095 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-29T19:18:32.900' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (134, NULL, N'398023 Tester', N'Test', N'AK', CAST(77823 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-29T19:31:41.310' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (135, NULL, N'4406 sunflower creek lane', N'richmond', N'TX', CAST(77469 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-30T00:25:37.383' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (136, NULL, N'4406 sunflower creek lane', N'richmond', N'TX', CAST(77469 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-30T00:35:05.163' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (137, NULL, N'5731 Carta Valley Lane', N'richmond', N'TX', CAST(77469 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-30T01:45:31.257' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (138, 1, N'7586 reading road', N'houston', N'TX', CAST(77589 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-30T01:46:10.320' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (140, 1, N'5731 Carta Valley Lane', N'richmond', N'TX', CAST(77469 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-30T02:52:38.547' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (141, 1, N'5731 Carta Valley Lane', N'richmond', N'TX', CAST(77469 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-30T02:52:45.937' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (142, 1, N'2746 test lane', N'test city', N'AK', CAST(57483 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-30T02:53:27.050' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (144, NULL, N'1234 elm street', N'anchorage', N'AK', CAST(22222 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-30T05:38:44.870' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (145, 1, N'1234 hot avenue', N'anchorage', N'AK', CAST(12345 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-30T05:40:45.250' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (147, 1, N'1234 Some avenue', N'anchorage', N'AK', CAST(12345 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-30T06:07:18.263' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (148, 1, N'1234 This avenue', N'anchorage', N'AK', CAST(12345 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-30T06:31:15.957' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (149, 1, N'0423 Work Road', N'Houston', N'TN', CAST(77823 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-30T06:32:21.130' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (150, 1, N'45023 Circle', N'Lamar', N'TN', CAST(78323 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-30T06:34:57.240' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (151, NULL, N'321091 Joe Street', N'City4', N'GA', CAST(78423 AS Decimal(5, 0)), 1234, NULL, CAST(N'2018-04-30T16:40:05.190' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (152, 1, N'1483 Some Street', N'Dallas', N'TN', CAST(77092 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-30T16:47:38.973' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (153, NULL, N'0 drive', N'Houston', N'TX', CAST(12345 AS Decimal(5, 0)), 0, NULL, CAST(N'2018-04-30T17:49:19.367' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (154, 1, N'd drive', N'San Antonio', N'TX', CAST(12345 AS Decimal(5, 0)), 1, NULL, CAST(N'2018-04-30T17:53:10.570' AS DateTime))
GO
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (155, 1, N'261 e drive', N'Woodlands ', N'TX', CAST(12345 AS Decimal(5, 0)), 60, NULL, CAST(N'2018-04-30T19:18:00.257' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (156, NULL, N'11 f drive', N'Spring Branch', N'TX', CAST(12345 AS Decimal(5, 0)), 70, NULL, CAST(N'2018-04-30T19:20:19.273' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (157, 1, N'1 g drive', N'Dallas', N'TX', CAST(12345 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-30T19:21:09.600' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (158, 1, N'0 gre drive', N'Houston', N'TX', CAST(12345 AS Decimal(5, 0)), 4, NULL, CAST(N'2018-04-30T19:52:56.653' AS DateTime))
INSERT [dbo].[ADDRESS] ([Address_ID], [Facility_ID], [Street], [City], [State], [Zip], [aptn], [Postal_code], [Last_updated]) VALUES (159, 1, N'123 h drive', N'Houston', N'TX', CAST(12345 AS Decimal(5, 0)), NULL, NULL, CAST(N'2018-04-30T19:53:40.433' AS DateTime))
SET IDENTITY_INSERT [dbo].[ADDRESS] OFF
SET IDENTITY_INSERT [dbo].[CUSTOMER] ON 

INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (1, 1, N'Alvin', NULL, N'Keyser', N'alvin@keyser.com', N'2814537956', NULL, CAST(N'2018-04-20T20:52:53.720' AS DateTime), NULL)
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (2, 3, N'LeBron', NULL, N'James', N'lebron@james.com', N'2814355132', NULL, CAST(N'2018-04-20T20:52:55.890' AS DateTime), NULL)
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (4, 128, N'chris', N'tuan', N'lai', N'flurfle@gmail.com', N'1112223333', N'2223334444', CAST(N'2018-04-25T23:32:02.770' AS DateTime), N'123456                   ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (5, NULL, N'jones', N'tuan', N'lai', N'kwq@sdfsa.com', N'2223334444', N'5556667777', CAST(N'2018-04-20T18:40:35.787' AS DateTime), N'5678                     ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (6, NULL, N'chris', N'tuan', N'dsfagsagsa', N'flurfle2@gmail.com', N'1112223333', N'2223334444', CAST(N'2018-04-20T18:46:03.093' AS DateTime), N'123456                   ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (7, NULL, N'tu', N'sfs', N'', N'test@test.com', N'1112223333', N'2223334444', CAST(N'2018-04-20T18:50:36.823' AS DateTime), N'123456                   ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (8, NULL, N'sd', N'yu', N'sd', N'rt@rt.com', N'2452452453', N'', CAST(N'2018-04-20T19:18:48.200' AS DateTime), N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (9, 86, N'Alvin', N'Cinco', N'Keyser', N'alvinck55@gmail.com', N'8328762368', N'', CAST(N'2018-04-25T19:42:48.077' AS DateTime), N'password1                ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (10, NULL, N'tom', N'bob', N'jones', N'this@isatestemail.com', N'2816577638', N'', CAST(N'2018-04-20T20:58:29.563' AS DateTime), N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (11, NULL, N'asda', N'asf', N'fsa', N'fsakffasfaf', N'12312412', N'123213', CAST(N'2018-04-20T21:01:07.890' AS DateTime), N'1234                     ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (12, NULL, N'asd', N'fasf', N'fd', N'aksjfla', N'12341241', N'12415', CAST(N'2018-04-20T21:03:16.170' AS DateTime), N'345                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (13, NULL, N'yu', N'y', N'uyu', N'oiuewriuq', N'2381238', N'763432', CAST(N'2018-04-20T21:04:52.000' AS DateTime), N'456                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (14, NULL, N'hi', N'hello', N'greetings', N'testemail', N'123', N'321', CAST(N'2018-04-20T21:07:50.750' AS DateTime), N'777                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (15, NULL, N'hjlkj', N'kjljlk', N'jlj', N'ljkljlkj', N'213', N'23', CAST(N'2018-04-20T21:09:44.670' AS DateTime), N'678                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (16, NULL, N'disa', N'sajdf', N'sakjdh', N'fsaf@essaf.com', N'1112223333', N'2223334444', CAST(N'2018-04-20T22:41:52.323' AS DateTime), N'5555                     ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (17, NULL, N'home', N'slice', N'rizzle', N'test@email.com', N'122', N'44', CAST(N'2018-04-20T22:44:54.933' AS DateTime), N'456                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (18, NULL, N'jim', N'bob', N'joe', N'you@you.com', N'you', N'333', CAST(N'2018-04-20T22:46:31.450' AS DateTime), N'444                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (19, NULL, N'ju', N'ji', N'ko', N'ju@ju.com', N'4445', N'6655', CAST(N'2018-04-20T22:49:11.153' AS DateTime), N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (20, NULL, N'ko', N'ko', N'ko', N'ko@ko.com', N'445', N'445', CAST(N'2018-04-20T22:54:16.323' AS DateTime), N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (21, NULL, N'holy', N'moly', N'guacamole', N'you@you.co', N'777', N'777', CAST(N'2018-04-20T23:00:39.370' AS DateTime), N'888                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (22, NULL, N'nothing', N'works', N'sql', N'sql@sql.com', N'143', N'214', CAST(N'2018-04-20T23:01:47.370' AS DateTime), N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (23, NULL, N'sd', N'klk', N'lkkl', N'hu@hu.com', N'55', N'55', CAST(N'2018-04-20T23:04:21.527' AS DateTime), N'234                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (24, NULL, N'this', N'will', N'finally', N'work@work.com', N'67', N'678', CAST(N'2018-04-20T23:07:30.980' AS DateTime), N'678                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (25, NULL, N'retard', N'dumb', N'stupid', N'dumb@stupid.com', N'444', N'555', CAST(N'2018-04-20T23:09:21.997' AS DateTime), N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (26, NULL, N'op', N'op', N'op', N'gangam@style.com', N'789', N'789', CAST(N'2018-04-20T23:26:39.263' AS DateTime), N'567                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (27, NULL, N'yui', N'uyiu', N'yuy', N'iuyi@uyi', N'777', N'888', CAST(N'2018-04-20T23:31:15.263' AS DateTime), N'231                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (28, NULL, N'hello', N'this', N'test', N'will@fail.com', N'1112223333', N'2223334444', CAST(N'2018-04-20T23:58:44.653' AS DateTime), N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (30, NULL, N'ro', N'the', N'boat', N'flurfle3@gmail.com', N'123', N'456', CAST(N'2018-04-21T00:03:20.903' AS DateTime), N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (31, NULL, N'chik', N'fil', N'a', N'hello@bye.com', N'12345678', N'12345678', CAST(N'2018-04-21T00:10:20.763' AS DateTime), N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (32, 1, N'tim', N'tom', N'tam', N'tim@tom.com', N'456', N'654', CAST(N'2018-04-24T04:20:51.930' AS DateTime), N'654                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (33, 1, N'Dean', N'C', N'Keyser', N'd5k@yahoo.com', N'2313241023', N'2341234521', CAST(N'2018-04-24T04:20:53.480' AS DateTime), N'password1                ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (34, 1, N'harold', N'g', N'garcia', N'harold@harold.com', N'234', N'234', CAST(N'2018-04-24T04:20:55.103' AS DateTime), N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (35, NULL, N'tu', N'vu', N'do', N'flavor@town.com', N'tricked', N'', CAST(N'2018-04-22T04:04:50.320' AS DateTime), N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (36, 1, N'test', N'the', N'account', N'test@acocunt.com', N'8325126426', N'8325672842', CAST(N'2018-04-24T04:20:56.450' AS DateTime), N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (37, 1, N'creating', N'a', N'test', N'account', N'2222222222', N'2222222222', CAST(N'2018-04-24T04:20:58.603' AS DateTime), N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (38, NULL, N'zxcxzc', N'sad', N'asda', N'dasd', N'8325126426', N'', CAST(N'2018-04-22T04:27:58.073' AS DateTime), N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (40, 1, N'mark', N'something', N'mondor', N'mark@mondor.com', N'8322223333', N'', CAST(N'2018-04-24T04:21:00.370' AS DateTime), N'345                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (41, 1, N'asdf', N'jlk', N'semicolon', N'adsf@jkl.com', N'1111111111', N'2222222222', CAST(N'2018-04-24T04:21:01.870' AS DateTime), N'1                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (42, 1, N'asdf', N'sas', N'as', N'a@a.a', N'1111111111', N'', CAST(N'2018-04-24T04:21:03.340' AS DateTime), N'1                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (44, 1, N'Alice', N'Tiffany', N'Lodge', N'example@example.com', N'1234567890', N'', CAST(N'2018-04-24T04:21:05.667' AS DateTime), N'1                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (45, NULL, N'sadas', N'asdasd', N'asdasd', N'asdas@asds.com', N'1231231233', N'', CAST(N'2018-04-24T04:24:30.887' AS DateTime), N'1                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (46, 81, N'Test', N'M', N'Account', N'account@account.com', N'2312312311', N'', CAST(N'2018-04-24T04:30:57.453' AS DateTime), N'1                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (47, 105, N'josh', N'tyler', N'alarcon', N'joshalarcon@gmail.com', N'2103678888', N'', CAST(N'2018-04-25T20:35:02.233' AS DateTime), N'1                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (48, 106, N'josh', N'tyler', N'alarcon', N'josh@gmail.com', N'2103333333', N'', CAST(N'2018-04-25T20:41:37.147' AS DateTime), N'1                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (49, 107, N'alsad', N'asdlald', N'asldals', N'test@gmail.com', N'2817562345', N'', NULL, N'1                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (50, 108, N'asdlk', N'asdlk', N'asdlkaslk', N'email@email.com', N'2910530232', N'', NULL, N'1                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (51, 109, N'John', N'C', N'Smith', N'john@smith.com', N'2816502341', N'', NULL, N'1                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (52, 110, N'Alvin', N'C', N'Keyser', N'keyser@alvin.com', N'2815342333', N'', NULL, N'1                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (53, 111, N'joshua', N't', N'alacorn', N'jta@gmail.com', N'2108888888', N'', NULL, N'1                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (54, 117, N'this', N'is', N'test', N'flurfle4@gmail.com', N'1112223333', N'', CAST(N'2018-04-25T21:35:35.723' AS DateTime), N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (55, 118, N'chris', N'tuan', N'lai', N'flurfle5@gmail.com', N'8325126426', N'', NULL, N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (56, 120, N'christopher', N'tuan', N'lai', N'flurfle6@gmail.com', N'1234567890', N'', NULL, N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (57, 124, N'this', N'is', N'test', N'test2@test.com', N'1234567890', N'', NULL, N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (58, 129, N'Parth', N'M', N'Shah', N'parth@shah.com', N'2813452341', N'', NULL, N'1                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (59, 132, N'Alvin', N'C', N'Keyser', N'alvin@yahoo.com', N'1111111111', N'', NULL, N'1                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (60, 134, N'Test', N'M', N'Customer', N'customer@test.com', N'1111111111', N'', NULL, N'1                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (61, 135, N'test', N'test', N'test', N'retard@retard.com', N'1234567890', N'', NULL, N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (62, NULL, N'test', N'testr', N'test', N'flurfle7@gmail.com', N'1234567890', N'', NULL, N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (63, NULL, N'test', N'test', N'test', N'test6@test.com', N'1234567890', N'', NULL, N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (64, 136, N'test', N'test', N'test', N'test46@test.com', N'1234567890', N'', NULL, N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (65, 137, N'tim', N'bob', N'jones', N'flurfle9@gmail.com', N'1234567890', N'', NULL, N'123                      ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (66, 144, N'jake', N'from', N'state farm', N'farmers@gmail.com', N'2105555555', N'', NULL, N'1                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (67, 151, N'Joe', N'C', N'Joe', N'joe@gmail.com', N'1111111111', N'', NULL, N'1                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (68, 153, N'c', N'c', N'c', N'c@c.com', N'1234567890', N'', NULL, N'c                        ')
INSERT [dbo].[CUSTOMER] ([Customer_ID], [Address_ID], [Fname], [Minit], [Lname], [Email], [Phone1], [Phone2], [Last_updated], [Password]) VALUES (69, 156, N'f', N'f', N'f', N'f@f.com', N'1234567890', N'', NULL, N'f                        ')
SET IDENTITY_INSERT [dbo].[CUSTOMER] OFF
SET IDENTITY_INSERT [dbo].[CUSTOMER_ADDRESS] ON 

INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (4, 9, 86)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (7, 9, 89)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (8, 9, 93)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (15, 9, 97)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (16, 9, 86)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (17, 9, 86)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (26, 49, NULL)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (27, 49, 107)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (28, 50, NULL)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (29, 50, 108)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (30, 51, NULL)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (31, 51, 109)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (32, 52, 110)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (33, 53, 111)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (38, 54, 97)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (39, 54, 117)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (40, 54, 117)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (41, 55, 118)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (42, 56, 120)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (43, 56, 121)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (44, 57, 124)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (45, 57, 126)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (48, 58, 129)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (49, 9, 131)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (50, 59, 132)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (51, 59, 133)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (52, 60, 134)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (53, 61, 135)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (54, 64, 136)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (55, 65, 137)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (56, 65, 138)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (57, 4, 142)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (58, 66, 144)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (59, 67, 151)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (61, 68, 155)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (62, 69, 156)
INSERT [dbo].[CUSTOMER_ADDRESS] ([ID], [Customer_ID], [Address_ID]) VALUES (63, 68, 158)
SET IDENTITY_INSERT [dbo].[CUSTOMER_ADDRESS] OFF
INSERT [dbo].[EMPLOYEES] ([Employee_ID], [Fname], [Minit], [Lname], [DOB], [Facility_ID], [Last_updated], [password]) VALUES (1, N'chris', N't', N'lai', CAST(N'1994-12-27' AS Date), 1, CAST(N'2018-04-23T05:27:27.400' AS DateTime), N'123')
INSERT [dbo].[EMPLOYEES] ([Employee_ID], [Fname], [Minit], [Lname], [DOB], [Facility_ID], [Last_updated], [password]) VALUES (123, N'test', N'm', N'lai', CAST(N'1994-07-05' AS Date), 3, CAST(N'2018-04-23T05:50:11.923' AS DateTime), N'123')
INSERT [dbo].[EMPLOYEES] ([Employee_ID], [Fname], [Minit], [Lname], [DOB], [Facility_ID], [Last_updated], [password]) VALUES (1234, N'Test', N'M', N'Admin', CAST(N'1994-02-12' AS Date), 2, CAST(N'2018-04-23T22:39:40.933' AS DateTime), N'111')
INSERT [dbo].[EMPLOYEES] ([Employee_ID], [Fname], [Minit], [Lname], [DOB], [Facility_ID], [Last_updated], [password]) VALUES (12345, N'Bob', N'M', N'Driver', CAST(N'1950-01-01' AS Date), 2, CAST(N'2018-04-23T23:02:50.610' AS DateTime), N'12345')
INSERT [dbo].[EMPLOYEES] ([Employee_ID], [Fname], [Minit], [Lname], [DOB], [Facility_ID], [Last_updated], [password]) VALUES (123456, N'Chris', N'B', N'Chair', CAST(N'1951-01-01' AS Date), 6, CAST(N'2018-04-25T22:50:07.243' AS DateTime), N'123456')
INSERT [dbo].[EMPLOYEES] ([Employee_ID], [Fname], [Minit], [Lname], [DOB], [Facility_ID], [Last_updated], [password]) VALUES (1234567, N'Anne', N'P', N'Logan', CAST(N'1952-01-01' AS Date), 7, CAST(N'2018-04-25T22:50:59.803' AS DateTime), N'1234567')
INSERT [dbo].[EMPLOYEES] ([Employee_ID], [Fname], [Minit], [Lname], [DOB], [Facility_ID], [Last_updated], [password]) VALUES (12345678, N'Mary', N'E', N'Water', CAST(N'1953-01-01' AS Date), 8, CAST(N'2018-04-25T22:51:38.757' AS DateTime), N'12345678')
INSERT [dbo].[EMPLOYEES] ([Employee_ID], [Fname], [Minit], [Lname], [DOB], [Facility_ID], [Last_updated], [password]) VALUES (123456789, N'Bill', N'M', N'Outlet', CAST(N'1954-01-01' AS Date), 9, CAST(N'2018-04-25T22:52:40.800' AS DateTime), N'123456789')
SET IDENTITY_INSERT [dbo].[FACILITY] ON 

INSERT [dbo].[FACILITY] ([Facility_ID], [Phone_No], [Last_updated], [Address_ID]) VALUES (1, N'2816823053', CAST(N'2018-04-20T20:16:59.970' AS DateTime), 1)
INSERT [dbo].[FACILITY] ([Facility_ID], [Phone_No], [Last_updated], [Address_ID]) VALUES (2, N'3242344234', CAST(N'2018-04-24T04:22:00.213' AS DateTime), 1)
INSERT [dbo].[FACILITY] ([Facility_ID], [Phone_No], [Last_updated], [Address_ID]) VALUES (3, N'1234567890', CAST(N'2018-04-23T22:41:58.213' AS DateTime), 24)
INSERT [dbo].[FACILITY] ([Facility_ID], [Phone_No], [Last_updated], [Address_ID]) VALUES (6, N'1111111111', CAST(N'2018-04-25T22:41:47.337' AS DateTime), 3)
INSERT [dbo].[FACILITY] ([Facility_ID], [Phone_No], [Last_updated], [Address_ID]) VALUES (7, N'0000000000', CAST(N'2018-04-25T22:45:34.093' AS DateTime), 5)
INSERT [dbo].[FACILITY] ([Facility_ID], [Phone_No], [Last_updated], [Address_ID]) VALUES (8, N'9876543210', CAST(N'2018-04-25T22:46:16.000' AS DateTime), 14)
INSERT [dbo].[FACILITY] ([Facility_ID], [Phone_No], [Last_updated], [Address_ID]) VALUES (9, N'5555555555', CAST(N'2018-04-25T22:48:19.310' AS DateTime), 23)
SET IDENTITY_INSERT [dbo].[FACILITY] OFF
SET IDENTITY_INSERT [dbo].[PACKAGE] ON 

INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (5, 6, 9, 1, 41, CAST(15.00 AS Decimal(4, 2)), N'EE', CAST(40.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-26T21:50:07.390' AS DateTime), N'Some', N'Name')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (12, 9, 1, 1, 1, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(1.19 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-24T04:54:45.097' AS DateTime), N'This', N'Guy')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (13, 10, 9, 1, 32, CAST(5.00 AS Decimal(4, 2)), N'LE', CAST(1.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-25T03:05:36.210' AS DateTime), N'Person', N'name')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (14, 11, 9, 1, 35, CAST(5.00 AS Decimal(4, 2)), N'LE', CAST(1.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-25T03:05:37.833' AS DateTime), N'Noah', N'Park')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (15, 12, 9, 1, 40, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(1.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-25T03:05:39.320' AS DateTime), N'Liam', N'Neeson')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (16, 13, 9, 1, 60, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(1.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-25T03:05:40.757' AS DateTime), N'Mason', N'Smith')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (17, 14, 9, 1, 60, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(1.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-25T03:05:42.147' AS DateTime), N'Jacob', N'Parker')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (18, 15, 9, 1, 62, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(1.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-25T03:05:45.443' AS DateTime), N'Michael', N'Divine')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (19, 16, 9, 1, 62, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(1.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-25T03:05:43.710' AS DateTime), N'Ethan', N'Park')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (20, 17, 9, 1, 64, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(0.01 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-24T04:16:55.510' AS DateTime), N'Benjamin', N'Parker')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (21, 18, 9, 1, 41, CAST(15.00 AS Decimal(4, 2)), N'LE', CAST(23.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-24T04:54:53.130' AS DateTime), N'Joseph', N'Name')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (22, 19, 9, 1, 41, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(0.01 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-24T04:16:58.337' AS DateTime), N'Oliver', N'Ed')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (23, 20, 9, 1, 41, CAST(15.00 AS Decimal(4, 2)), N'LE', CAST(23.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-24T04:54:55.470' AS DateTime), N'Henry', N'Owen')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (24, 21, 9, 1, 41, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(0.01 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-24T04:17:01.070' AS DateTime), N'Logan', N'Paul')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (25, 22, 9, 1, 67, CAST(5.00 AS Decimal(4, 2)), N'LE', CAST(2.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-24T04:54:57.660' AS DateTime), N'Dylan', N'Watt')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (26, 23, 4, 1, 75, CAST(15.00 AS Decimal(4, 2)), N'LE', CAST(23.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-24T04:54:59.940' AS DateTime), N'James', N'Harden')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (27, 24, 4, 1, 75, CAST(15.00 AS Decimal(4, 2)), N'LE', CAST(23.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-24T04:55:02.567' AS DateTime), N'Clint', N'Capela')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (28, 25, 4, 1, 75, CAST(15.00 AS Decimal(4, 2)), N'LE', CAST(12.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-24T04:55:04.690' AS DateTime), N'PJ', N'Tucker')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (29, 26, 4, 1, 75, CAST(15.00 AS Decimal(4, 2)), N'LE', CAST(12.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-24T04:55:06.783' AS DateTime), N'Luc', N'MbahaMoute')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (30, 27, 4, 1, 75, CAST(15.00 AS Decimal(4, 2)), N'LE', CAST(12.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-24T04:55:08.737' AS DateTime), N'Trevor', N'Ariza')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (31, 28, 4, 1, 77, CAST(15.00 AS Decimal(4, 2)), N'LE', CAST(12.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-24T04:55:10.817' AS DateTime), N'Gerald', N'Green')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (32, 29, 44, 1, 80, CAST(1.00 AS Decimal(4, 2)), N'LE', CAST(2.00 AS Decimal(4, 2)), N'RG', CAST(N'2018-04-24T04:55:14.800' AS DateTime), N'Eric', N'Gordon')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (33, 30, 9, 94, 93, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(0.01 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-24T23:20:59.913' AS DateTime), N'Nene', N'Hillario')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (35, 37, 9, 103, 86, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(0.01 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-25T17:04:51.157' AS DateTime), N'Chris', N'Paul III')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (36, 38, 9, 104, 89, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(0.01 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-25T17:17:25.613' AS DateTime), N'Billy', N'Jean')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (37, 39, 53, 112, 111, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(0.01 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-25T21:02:58.197' AS DateTime), N'alfoo', N'name')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (38, 40, 55, 119, 118, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(0.01 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-25T21:37:33.990' AS DateTime), N'reciever', N'test')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (39, 41, 55, 119, 118, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(5.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-26T03:39:09.873' AS DateTime), N'reciever', N'test')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (40, 42, 56, 122, 121, CAST(1.00 AS Decimal(4, 2)), N'EE', CAST(0.01 AS Decimal(4, 2)), N'RG', CAST(N'2018-04-25T21:49:07.620' AS DateTime), N'Sender', N'Name')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (41, 43, 4, 123, 97, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(0.01 AS Decimal(4, 2)), N'RG', CAST(N'2018-04-25T23:14:35.040' AS DateTime), N'test', N'reciever')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (42, 44, 57, 125, 124, CAST(2.00 AS Decimal(4, 2)), N'EE', CAST(99.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-25T23:27:48.307' AS DateTime), N'reciever', N'reciever')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (43, 45, 57, 127, 126, CAST(3.00 AS Decimal(4, 2)), N'EE', CAST(0.01 AS Decimal(4, 2)), N'PE', CAST(N'2018-04-25T23:19:13.160' AS DateTime), N'hu', N'ha')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (44, 46, 58, 130, 129, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(0.01 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-26T03:37:13.793' AS DateTime), N'Alvin', N'Keyser')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (55, 57, 66, 145, 144, NULL, N'EE', CAST(0.01 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-30T05:57:37.393' AS DateTime), N'Ashley', N'Bad')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (58, 60, 66, 147, 144, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(0.01 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-30T06:10:59.310' AS DateTime), N'Ashley', N'Moore')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (59, 61, 66, 148, 144, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(0.01 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-30T06:31:16.350' AS DateTime), N'Ashley', N'Moor')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (60, 62, 66, 149, 144, CAST(7.00 AS Decimal(4, 2)), N'EE', CAST(6.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-30T06:32:21.380' AS DateTime), N'Ashley', N'Moor')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (61, 63, 66, 150, 144, CAST(7.00 AS Decimal(4, 2)), N'EE', CAST(8.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-30T06:34:57.973' AS DateTime), N'Ashley', N'Moorrr')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (62, 64, 67, 151, 151, CAST(15.00 AS Decimal(4, 2)), N'EE', CAST(23.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-30T16:47:39.070' AS DateTime), N'Person', N'Name')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (63, 65, 68, 154, 153, CAST(2.00 AS Decimal(4, 2)), N'EE', CAST(6.00 AS Decimal(4, 2)), N'RG', CAST(N'2018-04-30T17:53:10.633' AS DateTime), N'd', N'd')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (64, 66, 69, 157, 156, CAST(1.00 AS Decimal(4, 2)), N'EE', CAST(3.00 AS Decimal(4, 2)), N'RG', CAST(N'2018-04-30T19:21:09.680' AS DateTime), N'g', N'g')
INSERT [dbo].[PACKAGE] ([Package_ID], [Tracking_no], [Sender_ID], [Receiver_Address_ID], [Sender_Address_ID], [Cost], [Types], [Weight], [Priority], [Last_updated], [Receiver_Fname], [Receiver_Lname]) VALUES (65, 67, 68, 159, 158, CAST(5.00 AS Decimal(4, 2)), N'EE', CAST(1.00 AS Decimal(4, 2)), N'FC', CAST(N'2018-04-30T19:53:40.497' AS DateTime), N'h', N'h')
SET IDENTITY_INSERT [dbo].[PACKAGE] OFF
INSERT [dbo].[PRIORITY] ([Priority_ID], [Priority], [Last_updated]) VALUES (N'FC', N'First Class Mail', CAST(N'2018-03-21T13:52:42.713' AS DateTime))
INSERT [dbo].[PRIORITY] ([Priority_ID], [Priority], [Last_updated]) VALUES (N'PE', N'Priority Mail Express', CAST(N'2018-03-21T13:52:33.080' AS DateTime))
INSERT [dbo].[PRIORITY] ([Priority_ID], [Priority], [Last_updated]) VALUES (N'PM', N'Priority Mail', CAST(N'2018-03-21T13:52:36.537' AS DateTime))
INSERT [dbo].[PRIORITY] ([Priority_ID], [Priority], [Last_updated]) VALUES (N'RG', N'Retail Ground', CAST(N'2018-03-21T13:52:47.670' AS DateTime))
SET IDENTITY_INSERT [dbo].[SHIPPING_HISTORY] ON 

INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (3, 6, 2, NULL, CAST(N'2018-04-20T13:56:43.820' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (4, 6, 1, NULL, CAST(N'2018-04-20T16:41:20.210' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (5, 6, 2, NULL, CAST(N'2018-04-20T14:08:53.027' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (6, 6, 3, N'P', CAST(N'2018-04-21T21:19:17.013' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (7, 6, 3, N'P', CAST(N'2018-04-21T21:19:17.013' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (8, 6, 3, N'T', CAST(N'2018-04-21T21:21:00.513' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (9, 6, 3, N'T', CAST(N'2018-04-21T21:21:00.513' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (10, 6, 3, N'P', CAST(N'2018-04-21T21:36:57.640' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (16, 9, 1, N'O', CAST(N'2018-04-22T05:08:08.083' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (17, 9, 1, N'T', CAST(N'2018-04-22T05:08:34.257' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (18, 9, 1, N'D', CAST(N'2018-04-22T23:22:23.410' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (19, 9, 3, N'T', CAST(N'2018-04-23T06:25:27.810' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (20, 28, 3, N'T', CAST(N'2018-04-23T21:23:50.603' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (21, 29, 3, N'P', CAST(N'2018-04-23T22:53:01.437' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (22, 29, 3, N'T', CAST(N'2018-04-23T22:56:24.170' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (23, 29, 2, N'P', CAST(N'2018-04-23T22:59:13.733' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (24, 29, 2, N'T', CAST(N'2018-04-23T23:03:40.377' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (25, 29, 2, N'D', CAST(N'2018-04-23T23:04:20.173' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (26, 9, 3, N'T', CAST(N'2018-04-24T04:17:36.587' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (30, 10, 1, N'O', CAST(N'2018-04-24T04:18:56.900' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (31, 11, 1, N'O', CAST(N'2018-04-24T04:19:00.603' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (32, 12, 1, N'O', CAST(N'2018-04-24T04:19:05.290' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (33, 13, 1, N'O', CAST(N'2018-04-24T04:19:10.337' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (34, 14, 1, N'O', CAST(N'2018-04-24T04:19:13.383' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (35, 15, 1, N'O', CAST(N'2018-04-24T04:19:16.260' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (36, 16, 1, N'O', CAST(N'2018-04-24T04:19:19.150' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (37, 17, 1, N'O', CAST(N'2018-04-24T04:19:22.823' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (38, 18, 1, N'O', CAST(N'2018-04-24T04:19:26.087' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (39, 19, 1, N'O', CAST(N'2018-04-24T04:19:28.853' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (40, 20, 1, N'O', CAST(N'2018-04-24T04:19:31.383' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (41, 21, 1, N'O', CAST(N'2018-04-24T04:19:34.277' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (42, 22, 1, N'O', CAST(N'2018-04-24T04:19:36.760' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (43, 23, 1, N'O', CAST(N'2018-04-24T04:19:39.260' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (44, 24, 1, N'O', CAST(N'2018-04-24T04:19:41.557' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (45, 25, 1, N'O', CAST(N'2018-04-24T04:19:43.917' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (46, 26, 1, N'O', CAST(N'2018-04-24T04:19:46.353' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (47, 27, 1, N'O', CAST(N'2018-04-24T04:19:48.587' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (48, 28, 1, N'T', CAST(N'2018-04-24T04:19:51.337' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (49, 29, 1, N'D', CAST(N'2018-04-24T04:19:55.760' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (56, 37, 3, N'P', CAST(N'2018-04-25T17:06:17.733' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (57, 39, 3, N'P', CAST(N'2018-04-25T21:04:39.987' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (58, 39, 3, N'T', CAST(N'2018-04-25T21:04:44.453' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (59, 39, 1, N'P', CAST(N'2018-04-25T21:05:21.797' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (60, 39, 1, N'T', CAST(N'2018-04-25T21:05:29.497' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (61, 40, 3, N'F', CAST(N'2018-04-25T21:42:33.240' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (62, 43, 3, N'T', CAST(N'2018-04-25T23:13:58.730' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (63, 44, 3, N'P', CAST(N'2018-04-25T23:15:41.990' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (64, 45, 3, N'P', CAST(N'2018-04-25T23:20:06.470' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (65, 45, 2, N'T', CAST(N'2018-04-25T23:24:01.730' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (66, 41, 3, N'P', CAST(N'2018-04-26T03:38:35.607' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (67, 41, 3, N'T', CAST(N'2018-04-26T03:38:45.857' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (68, 41, 1, N'P', CAST(N'2018-04-26T03:39:37.907' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (69, 41, 1, N'D', CAST(N'2018-04-26T03:39:44.093' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (70, 9, 3, N'D', CAST(N'2018-04-26T21:54:19.547' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (71, 9, 3, N'P', CAST(N'2018-04-30T00:56:49.180' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (75, 10, 1, N'O', CAST(N'2018-04-30T02:43:18.093' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (76, 10, 1, N'O', CAST(N'2018-04-30T02:45:45.170' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (77, 10, 1, N'O', CAST(N'2018-04-30T02:46:10.967' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (102, 60, 3, N'D', CAST(N'2018-04-30T06:23:59.690' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (103, 64, 3, N'C', CAST(N'2018-04-30T16:52:54.757' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (104, 65, 3, N'P', CAST(N'2018-04-30T18:14:20.780' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (105, 65, 3, N'T', CAST(N'2018-04-30T18:17:12.490' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (106, 65, 2, N'P', CAST(N'2018-04-30T18:19:27.770' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (107, 65, 2, N'T', CAST(N'2018-04-30T18:19:50.567' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (108, 65, 2, N'D', CAST(N'2018-04-30T18:19:58.567' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (109, 66, 3, N'P', CAST(N'2018-04-30T19:21:50.257' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (110, 66, 3, N'T', CAST(N'2018-04-30T19:22:22.867' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (111, 66, 2, N'P', CAST(N'2018-04-30T19:22:47.290' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (112, 66, 2, N'T', CAST(N'2018-04-30T19:22:54.837' AS DateTime))
INSERT [dbo].[SHIPPING_HISTORY] ([Shipping_history_ID], [Tracking_no], [Facility_ID], [Status], [Last_updated]) VALUES (113, 66, 2, N'D', CAST(N'2018-04-30T19:23:00.430' AS DateTime))
SET IDENTITY_INSERT [dbo].[SHIPPING_HISTORY] OFF
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'AK', N'Alaska', CAST(N'2018-03-21T13:46:49.520' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'AL', N'Alabama', CAST(N'2018-03-21T13:46:37.857' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'AR', N'Arkansas', CAST(N'2018-03-21T13:47:08.123' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'AZ', N'Arizona', CAST(N'2018-03-21T13:46:58.790' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'CA', N'California', CAST(N'2018-03-21T13:47:12.517' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'CO', N'Colorado', CAST(N'2018-03-21T13:47:15.770' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'CT', N'Connecticut', CAST(N'2018-03-21T13:47:21.960' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'DE', N'Delaware', CAST(N'2018-03-21T13:47:59.000' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'FL', N'Florida', CAST(N'2018-03-21T13:48:05.907' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'GA', N'Georgia', CAST(N'2018-03-21T13:48:10.650' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'HI', N'Hawaii', CAST(N'2018-03-21T13:48:14.640' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'IA', N'Iowa', CAST(N'2018-03-21T13:48:26.180' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'ID', N'Idaho', CAST(N'2018-03-21T13:48:17.840' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'IL', N'Illinois', CAST(N'2018-03-21T13:48:21.163' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'IN', N'Indiana', CAST(N'2018-03-21T13:48:24.097' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'KS', N'Kansas', CAST(N'2018-03-21T13:48:28.197' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'KY', N'Kentucky', CAST(N'2018-03-21T13:48:31.163' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'LA', N'Louisiana', CAST(N'2018-03-21T13:48:37.943' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'MA', N'Massachussetts', CAST(N'2018-03-21T13:48:47.097' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'MD', N'Maryland', CAST(N'2018-03-21T13:48:42.840' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'ME', N'Maine', CAST(N'2018-03-21T13:48:40.227' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'MI', N'Michigan', CAST(N'2018-03-21T13:48:50.083' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'MN', N'Minnesota', CAST(N'2018-03-21T13:48:52.820' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'MO', N'Missouri', CAST(N'2018-03-21T13:49:00.383' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'MS', N'Mississippi', CAST(N'2018-03-21T13:48:56.890' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'MT', N'Montana', CAST(N'2018-03-21T13:49:02.570' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'NC', N'North Carolina', CAST(N'2018-03-21T13:50:13.547' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'ND', N'North Dakota', CAST(N'2018-03-21T13:50:42.807' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'NE', N'Nebraska', CAST(N'2018-03-21T13:49:05.427' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'NH', N'New Hampshire', CAST(N'2018-03-21T13:49:10.100' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'NJ', N'New Jersey', CAST(N'2018-03-21T13:49:12.427' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'NM', N'New Mexico', CAST(N'2018-03-21T13:49:17.620' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'NV', N'Nevada', CAST(N'2018-03-21T13:49:07.463' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'NY', N'New York', CAST(N'2018-03-21T13:50:05.820' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'OH', N'Ohio', CAST(N'2018-03-21T13:50:38.967' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'OK', N'Oklahoma', CAST(N'2018-03-21T13:50:50.247' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'OR', N'Oregon', CAST(N'2018-03-21T13:50:54.267' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'PA', N'Pennsylvania', CAST(N'2018-03-21T13:50:57.860' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'RI', N'Rhode Island', CAST(N'2018-03-21T13:51:02.190' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'SC', N'South Carolina', CAST(N'2018-03-21T13:51:07.477' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'SD', N'South Dakota', CAST(N'2018-03-21T13:51:10.320' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'TN', N'Tennessee', CAST(N'2018-03-21T13:51:14.600' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'TX', N'Texas', CAST(N'2018-03-21T13:51:17.650' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'UT', N'Utah', CAST(N'2018-03-21T13:51:23.083' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'VA', N'Virginia', CAST(N'2018-03-21T13:51:29.190' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'VT', N'Vermont', CAST(N'2018-03-21T13:51:26.513' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'WA', N'Washington', CAST(N'2018-03-21T13:51:39.760' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'WI', N'Wisconsin', CAST(N'2018-03-21T13:51:56.313' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'WV', N'West Virginia', CAST(N'2018-03-21T13:51:51.220' AS DateTime))
INSERT [dbo].[STATE] ([State_ID], [State], [Last_updated]) VALUES (N'WY', N'Wyoming', CAST(N'2018-03-21T13:51:59.270' AS DateTime))
INSERT [dbo].[STATUS] ([Status_ID], [Status], [Last_updated]) VALUES (N'C', N'Cancelled', CAST(N'2018-04-29T17:06:03.620' AS DateTime))
INSERT [dbo].[STATUS] ([Status_ID], [Status], [Last_updated]) VALUES (N'D', N'Delivered', CAST(N'2018-04-22T22:56:06.857' AS DateTime))
INSERT [dbo].[STATUS] ([Status_ID], [Status], [Last_updated]) VALUES (N'F', N'Failed', CAST(N'2018-04-25T15:27:16.900' AS DateTime))
INSERT [dbo].[STATUS] ([Status_ID], [Status], [Last_updated]) VALUES (N'O', N'Order Received', CAST(N'2018-04-21T22:37:45.653' AS DateTime))
INSERT [dbo].[STATUS] ([Status_ID], [Status], [Last_updated]) VALUES (N'P', N'In Possession', CAST(N'2018-03-21T13:54:16.797' AS DateTime))
INSERT [dbo].[STATUS] ([Status_ID], [Status], [Last_updated]) VALUES (N'R', N'Returned', CAST(N'2018-04-20T18:15:55.227' AS DateTime))
INSERT [dbo].[STATUS] ([Status_ID], [Status], [Last_updated]) VALUES (N'T', N'In Transit', CAST(N'2018-04-20T00:34:07.210' AS DateTime))
SET IDENTITY_INSERT [dbo].[sysdiagrams] ON 

INSERT [dbo].[sysdiagrams] ([name], [principal_id], [diagram_id], [version], [definition]) VALUES (N'Diagram_0', 1, 1, 1, 0xD0CF11E0A1B11AE1000000000000000000000000000000003E000300FEFF0900060000000000000000000000010000000100000000000000001000002200000001000000FEFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF24000000030000000400000005000000060000000700000008000000090000000A000000FEFFFFFF0C0000000D0000000E0000000F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B0000001C0000001D0000001E0000001F0000002000000021000000FEFFFFFFFEFFFFFF37000000FEFFFFFF260000002700000028000000290000002A0000002B0000002C0000002D0000002E0000002F00000030000000310000003200000033000000340000003500000036000000FEFFFFFF38000000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52006F006F007400200045006E00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500FFFFFFFFFFFFFFFF020000000000000000000000000000000000000000000000000000000000000050828287A8DCD3012300000000060000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000201FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000200000046100000000000006F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040002010100000004000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000B000000842C000000000000010043006F006D0070004F0062006A0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000005F00000000000000000434000A1E500C05000080340000000F00FFFF3200000034000000007D00002398000076610000C22C01007AFE0000CFB4FFFF4AFEFFFFDE805B10F195D011B0A000AA00BDCB5C000008003000000000020000030000003C006B0000000900000000000000D9E6B0E91C81D011AD5100A0C90F5739F43B7F847F61C74385352986E1D552F8A0327DB2D86295428D98273C25A2DA2D00002800430000000000000053444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C00002800430000000000000051444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C30000000500F000000B0010000003800A50900000700008001000000A0020000008000000D000080536368477269640000000000565E000041444452455353202864626F2909000000003800A50900000700008004000000A2020000008000000E0000805363684772696400D020000006630000435553544F4D4552202864626F29000000008000A50900000700008005000000620000000180000055000080436F6E74726F6C005C150000396A000052656C6174696F6E736869702027464B5F435553544F4D45525F41444452455353202864626F2927206265747765656E202741444452455353202864626F292720616E642027435553544F4D4552202864626F292700000000002800B50100000700008006000000310000005900000002800000436F6E74726F6C00531E0000BF6A000000004000A50900000700008007000000B202000000800000160000805363684772696400A41F0000B2890000435553544F4D45525F41444452455353202864626F29000000009000A50900000700008008000000520000000180000067000080436F6E74726F6C005B2A0000C47D000052656C6174696F6E736869702027464B5F435553544F4D45525F414444524553535F435553544F4D4552202864626F2927206265747765656E2027435553544F4D4552202864626F292720616E642027435553544F4D45525F41444452455353202864626F29273F00002800B50100000700008009000000310000006B00000002800000436F6E74726F6C00501600006A84000000009000A5090000070000800A000000620000000180000065000080436F6E74726F6C005C150000FB6B000052656C6174696F6E736869702027464B5F435553544F4D45525F414444524553535F41444452455353202864626F2927206265747765656E202741444452455353202864626F292720616E642027435553544F4D45525F41444452455353202864626F2927A1D52300002800B5010000070000800B000000310000006900000002800000436F6E74726F6C0051080000517C000000003800A5090000070000800C000000A4020000008000000F0000805363684772696400DC50000000000000454D504C4F59454553202864626F290000003800A5090000070000800D000000A2020000008000000E0000805363684772696400DC500000FC210000464143494C495459202864626F29000000008400A5090000070000800E000000520000000180000059000080436F6E74726F6C00675A0000C415000052656C6174696F6E736869702027464B5F454D504C4F594545535F464143494C495459202864626F2927206265747765656E2027464143494C495459202864626F292720616E642027454D504C4F59454553202864626F292700000000002800B5010000070000800F000000310000005D00000002800000436F6E74726F6C00AD5C0000921C000000008000A50900000700008010000000620000000180000055000080436F6E74726F6C005C150000F326000052656C6174696F6E736869702027464B5F464143494C4954595F41444452455353202864626F2927206265747765656E202741444452455353202864626F292720616E642027464143494C495459202864626F292700000000002800B50100000700008011000000310000005900000002800000436F6E74726F6C00E84300006726000000008000A50900000700008012000000620000000180000055000080436F6E74726F6C005C1500009928000052656C6174696F6E736869702027464B5F414444524553535F466163696C697479202864626F2927206265747765656E2027464143494C495459202864626F292720616E64202741444452455353202864626F292700000000002800B50100000700008013000000310000005900000002800000436F6E74726F6C0088160000FB68000000003800A50900000700008014000000A0020000008000000D0000805363684772696400DA610000609F00005041434B414745202864626F290A000000007C00A50900000700008015000000620000000180000053000080436F6E74726F6C005C150000BD6D000052656C6174696F6E736869702027464B5F5041434B4147455F41444452455353202864626F2927206265747765656E202741444452455353202864626F292720616E6420275041434B414745202864626F29270000002800B50100000700008016000000310000005700000002800000436F6E74726F6C00820E0000E1AF000000007C00A50900000700008017000000620000000180000054000080436F6E74726F6C005C1500007F6F000052656C6174696F6E736869702027464B5F5041434B4147455F4144445245535331202864626F2927206265747765656E202741444452455353202864626F292720616E6420275041434B414745202864626F292700002800B50100000700008018000000310000005900000002800000436F6E74726F6C00D60D0000A3B1000000003800A50900000700008019000000A2020000008000000E0000805363684772696400DA61000052CB00005052494F52495459202864626F29000000004000A5090000070000801A000000B202000000800000160000805363684772696400A0410000066300005348495050494E475F484953544F5259202864626F29000000003400A5090000070000801B0000009C020000008000000B000080536368477269640000000000AA8200005354415445202864626F290000003400A5090000070000801C0000009E020000008000000C000080536368477269640016710000F8430000535441545553202864626F2900003800A5090000070000801D000000A2020000008000000E0000805363684772696400DC500000023A0000545241434B494E47202864626F29000000007C00A5090000070000801E000000520000000180000053000080436F6E74726F6C00386600003D48000052656C6174696F6E736869702027464B5F545241434B494E475F535441545553202864626F2927206265747765656E2027535441545553202864626F292720616E642027545241434B494E47202864626F29270000002800B5010000070000801F000000310000005700000002800000436F6E74726F6C0006660000CD47000000008000A50900000700008020000000520000000180000057000080436F6E74726F6C00675A0000D82D000052656C6174696F6E736869702027464B5F545241434B494E475F464143494C495459202864626F2927206265747765656E2027464143494C495459202864626F292720616E642027545241434B494E47202864626F29270000002800B50100000700008021000000310000005B00000002800000436F6E74726F6C00AD5C00002235000000008000A50900000700008022000000620000000180000057000080436F6E74726F6C005B2A00003757000052656C6174696F6E736869702027464B5F545241434B494E475F435553544F4D4552202864626F2927206265747765656E2027435553544F4D4552202864626F292720616E642027545241434B494E47202864626F29270000002800B50100000700008023000000310000005B00000002800000436F6E74726F6C000D4500000861000000009000A50900000700008024000000620000000180000067000080436F6E74726F6C00474B00003B57000052656C6174696F6E736869702027464B5F5348495050494E475F484953544F52595F545241434B494E47202864626F2927206265747765656E2027545241434B494E47202864626F292720616E6420275348495050494E475F484953544F5259202864626F29273F00002800B50100000700008025000000310000006B00000002800000436F6E74726F6C00CD3F0000065F000000008000A50900000700008026000000620000000180000055000080436F6E74726F6C005C1500005948000052656C6174696F6E736869702027464B5F545241434B494E475F41444452455353202864626F2927206265747765656E202741444452455353202864626F292720616E642027545241434B494E47202864626F292700000000002800B50100000700008027000000310000005900000002800000436F6E74726F6C009A220000834A000000008000A50900000700008028000000620000000180000055000080436F6E74726F6C00FD5A00003B57000052656C6174696F6E736869702027464B5F5041434B4147455F545241434B494E47202864626F2927206265747765656E2027545241434B494E47202864626F292720616E6420275041434B414745202864626F292700000000002800B50100000700008029000000310000005900000002800000436F6E74726F6C0026620000065F000000008000A5090000070000802A000000620000000180000055000080436F6E74726F6C00DB5C00003757000052656C6174696F6E736869702027464B5F545241434B494E475F5041434B414745202864626F2927206265747765656E20275041434B414745202864626F292720616E642027545241434B494E47202864626F292700000000002800B5010000070000802B000000310000005900000002800000436F6E74726F6C00425F0000BD92000000003400A5090000070000802C0000009A020000008000000A00008053636847726964001482000082AA000054595045202864626F29626F00007800A5090000070000802F00000052000000018000004D000080436F6E74726F6C0036770000C7AE000052656C6174696F6E736869702027464B5F5041434B4147455F54595045202864626F2927206265747765656E202754595045202864626F292720616E6420275041434B414745202864626F292700070500002800B50100000700008030000000310000005100000002800000436F6E74726F6C00F077000057AE000000008000A50900000700008031000000520000000180000055000080436F6E74726F6C00656B000010BF000052656C6174696F6E736869702027464B5F5041434B4147455F5052494F52495459202864626F2927206265747765656E20275052494F52495459202864626F292720616E6420275041434B414745202864626F292729270000002800B50100000700008032000000310000005900000002800000436F6E74726F6C00AB6D000068C5000000007800A5090000070000803300000052000000018000004F000080436F6E74726F6C008B0900009576000052656C6174696F6E736869702027464B5F414444524553535F5354415445202864626F2927206265747765656E20275354415445202864626F292720616E64202741444452455353202864626F29270500002800B50100000700008034000000310000005300000002800000436F6E74726F6C00D10B0000517D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000214334120800000088160000FA1A0000785634120700000014010000410044004400520045005300530020002800640062006F00290000008382023F0000803F0000803FD7D6563FDCDB5B3FEAE9693F0000803F726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000222900007D1E0000000000002D0100000B0000000C000000070000001C0100000609000062070000A40100000D02000077010000EC0400001B030000E00100001B030000ED030000B2020000000000000100000088160000FA1A000000000000090000000900000002000000020000001C010000AA0A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000800000041004400440052004500530053000000214334120800000088160000751D000078563412070000001401000043005500530054004F004D004500520020002800640062006F00290000002E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000022290000C3200000000000002D0100000C0000000C000000070000001C0100000609000062070000A40100000D02000077010000EC0400001B030000E00100001B030000ED030000B2020000000000000100000088160000751D0000000000000A0000000A00000002000000020000001C010000AA0A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000900000043005500530054004F004D0045005200000004000B0088160000D06B0000A41D0000D06B0000A41D0000AC710000D0200000AC7100000000000002000000F0F0F00000000000000000000000000000000000010000000600000000000000531E0000BF6A0000140E00005801000032000000010000020000140E000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61130046004B005F0043005500530054004F004D00450052005F00410044004400520045005300530021433412080000007F180000180C000078563412070000001401000043005500530054004F004D00450052005F00410044004400520045005300530020002800640062006F0029000000546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000A40100000D02000077010000EC0400001B030000E00100001B030000ED030000B202000000000000010000007F180000180C000000000000030000000300000002000000020000001C010000D60B0000000000000100000039130000060A000000000000030000000300000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000001100000043005500530054004F004D00450052005F004100440044005200450053005300000002000B00F22B00007B800000F22B0000B28900000000000002000000F0F0F00000000000000000000000000000000000010000000900000000000000501600006A840000F31400005801000032000000010000020000F314000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611C0046004B005F0043005500530054004F004D00450052005F0041004400440052004500530053005F0043005500530054004F004D004500520004000B0088160000926D0000F01C0000926D0000F01C00008E8F0000A41F00008E8F00000000000002000000F0F0F00000000000000000000000000000000000010000000B0000000000000051080000517C0000F01300005801000030000000010000020000F013000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611B0046004B005F0043005500530054004F004D00450052005F0041004400440052004500530053005F0041004400440052004500530053002143341208000000881600007F18000078563412070000001401000045004D0050004C004F00590045004500530020002800640062006F0029000000616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000022290000371C0000000000002D0100000A0000000C000000070000001C0100000609000062070000A40100000D02000077010000EC0400001B030000E00100001B030000ED030000B20200000000000001000000881600007F18000000000000080000000800000002000000020000001C010000AA0A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000A00000045004D0050004C004F0059004500450053000000214334120800000088160000930E000078563412070000001401000046004100430049004C0049005400590020002800640062006F0029000000530054004F00520059005D00270029002900200041004E0044002000280043004F004C005F004E0041004D00450028006D0061006A006F0072005F00690064002C0020006D0069006E006F0072005F0069006400290020003D0020004E0027004C006100730074005F007500700064006100740065006400270029002900200000000805C70AC80AF90BFA0BFB0B8E15F01A70080080204FFA1DB3000000B7000000000000002800530045004C0045004300540020006E0061006D0065002C002000760061006C007500650020004600000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000A40100000D02000077010000EC0400001B030000E00100001B030000ED030000B2020000000000000100000088160000930E000000000000040000000400000002000000020000001C010000AA0A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000900000046004100430049004C00490054005900000002000B00FE5B0000FC210000FE5B00007F1800000000000002000000F0F0F00000000000000000000000000000000000010000000F00000000000000AD5C0000921C0000320E00005801000032000000010000020000320E000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61150046004B005F0045004D0050004C004F0059004500450053005F0046004100430049004C0049005400590004000B00881600008A6600003C1C00008A6600003C1C00006E280000DC5000006E2800000000000002000000F0F0F00000000000000000000000000000000000010000001100000000000000E843000067260000F40C00005801000064000000010000020000F40C000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61130046004B005F0046004100430049004C004900540059005F00410044004400520045005300530004000B00DC500000302A0000F01C0000302A0000F01C00004C680000881600004C6800000000000002000000F0F0F0000000000000000000000000000000000001000000130000000000000088160000FB6800009A0B000058010000640000000100000200009A0B000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61130046004B005F0041004400440052004500530053005F0046006100630069006C006900740079002143341208000000881600006B2200007856341207000000140100005000410043004B0041004700450020002800640062006F00290000004E104F105010511032083308B30C54105510370896093908581059103C083D083E085C105D1041084208DC0B60106110621063106410651066106710681069104E08E80BC01073105208530854085508010B020B030B5908121002095C085D081A0FCD0F8D0F8E0F8F0F900F071065086608670868086908B20FB30FB40FB50F3D10B70FF10FC710FF0B73085A0F5B0F550F7708A50E79087A087B087C087D08BF10F2100009FC10FD1083088408F50B000EF70B0F111011F00D8B08CF0A240E0F1013111411000C6016CE19030E0080FFFF000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000009230000000000002D0100000D0000000C000000070000001C0100000609000062070000A40100000D02000077010000EC0400001B030000E00100001B030000ED030000B20200000000000001000000881600006B220000000000000C0000000C00000002000000020000001C010000AA0A00000000000001000000391300004D0C000000000000040000000400000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000080000005000410043004B00410047004500000004000B0088160000546F00003C1C0000546F00003C1C000032AF0000DA61000032AF00000000000002000000F0F0F00000000000000000000000000000000000010000001600000000000000820E0000E1AF0000110D00005801000032000000010000020000110D000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61120046004B005F005000410043004B004100470045005F00410044004400520045005300530004000B008816000016710000881B000016710000881B0000F4B00000DA610000F4B000000000000002000000F0F0F00000000000000000000000000000000000010000001800000000000000D60D0000A3B10000BE0D00005801000032000000010000020000BE0D000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61130046004B005F005000410043004B004100470045005F0041004400440052004500530053003100214334120800000088160000180C00007856341207000000140100005000520049004F00520049005400590020002800640062006F00290000002E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000A40100000D02000077010000EC0400001B030000E00100001B030000ED030000B2020000000000000100000088160000180C000000000000030000000300000002000000020000001C010000AC0800000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000090000005000520049004F00520049005400590000002143341208000000D81600000E1100007856341207000000140100005300480049005000500049004E0047005F0048004900530054004F005200590020002800640062006F00290000001803CA07CC092A091E0B1D031E03D00AD10AA70BFE030000000000000000000000000000000000000000000000000000E00600000000A80B000000000000D915271A00070080204FFA1DB1000000B7000000000000002800530045004C0045004300540020006E0061006D0065002C002000760061006C00750065002000460052004F004D0020007300790073002E0065007800740065006E006400650064005F00700072006F00700065007200740069006500730020005700480045005200000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000A40100000D02000077010000EC0400001B030000E00100001B030000ED030000B20200000000000001000000D81600000E11000000000000050000000500000002000000020000001C010000E60A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000110000005300480049005000500049004E0047005F0048004900530054004F00520059000000214334120800000088160000180C00007856341207000000140100005300540041005400450020002800640062006F00290000005365727665722E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000A40100000D02000077010000EC0400001B030000E00100001B030000ED030000B2020000000000000100000088160000180C000000000000030000000300000002000000020000001C010000AA0A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000006000000530054004100540045000000214334120800000088160000180C000078563412070000001401000053005400410054005500530020002800640062006F0029000000727665722E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000A40100000D02000077010000EC0400001B030000E00100001B030000ED030000B2020000000000000100000088160000180C000000000000030000000300000002000000020000001C010000AA0A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000070000005300540041005400550053000000214334120800000088160000F01F000078563412070000001401000054005200410043004B0049004E00470020002800640062006F00290000002E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000009230000000000002D0100000D0000000C000000070000001C0100000609000062070000A40100000D02000077010000EC0400001B030000E00100001B030000ED030000B2020000000000000100000088160000F01F0000000000000B0000000B00000002000000020000001C010000AA0A0000000000000100000039130000D910000000000000060000000600000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000900000054005200410043004B0049004E004700000002000B0016710000D449000064670000D44900000000000002000000F0F0F00000000000000000000000000000000000010000001F0000000000000006660000CD470000BB0C00005801000037000000010000020000BB0C000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61120046004B005F0054005200410043004B0049004E0047005F0053005400410054005500530002000B00FE5B00008F300000FE5B0000023A00000000000002000000F0F0F00000000000000000000000000000000000010000002100000000000000AD5C000022350000840D00005801000038000000010000020000840D000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61140046004B005F0054005200410043004B0049004E0047005F0046004100430049004C0049005400590004000B00F22B000006630000F22B000059600000105900005960000010590000F25900000000000002000000F0F0F000000000000000000000000000000000000100000023000000000000000D45000008610000A50E00005801000032000000010000020000A50E000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61140046004B005F0054005200410043004B0049004E0047005F0043005500530054004F004D004500520004000B00D25A0000F2590000D25A00000D610000C24C00000D610000C24C0000066300000000000002000000F0F0F00000000000000000000000000000000000010000002500000000000000CD3F0000065F000060130000580100003D0000000100000200006013000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611C0046004B005F005300480049005000500049004E0047005F0048004900530054004F00520059005F0054005200410043004B0049004E00470004000B00881600000E6A0000A41D00000E6A0000A41D0000D4490000DC500000D44900000000000002000000F0F0F000000000000000000000000000000000000100000027000000000000009A220000834A0000A10D00005801000032000000010000020000A10D000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61130046004B005F0054005200410043004B0049004E0047005F00410044004400520045005300530004000B00945C0000F2590000945C00000D610000D06B00000D610000D06B0000609F00000000000002000000F0F0F0000000000000000000000000000000000001000000290000000000000026620000065F0000A10D0000580100000E000000010000020000A10D000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61130046004B005F005000410043004B004100470045005F0054005200410043004B0049004E00470004000B00926D0000609F0000926D000059600000565E000059600000565E0000F25900000000000002000000F0F0F00000000000000000000000000000000000010000002B00000000000000425F0000BD920000A10D0000580100000E000000010000020000A10D000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61130046004B005F0054005200410043004B0049004E0047005F005000410043004B00410047004500214334120800000088160000180C0000785634120700000014010000540059005000450020002800640062006F0029000000716C5365727665722E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000A40100000D02000077010000EC0400001B030000E00100001B030000ED030000B2020000000000000100000088160000180C000000000000030000000300000002000000020000001C010000AA0A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005200000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000050000005400590050004500000002000B00148200005EB00000627800005EB000000000000002000000F0F0F00000000000000000000000000000000000010000003000000000000000F077000057AE0000960A00005801000032000000010000020000960A000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D610F0046004B005F005000410043004B004100470045005F00540059005000450002000B00FC6C000052CB0000FC6C0000CBC100000000000002000000F0F0F00000000000000000000000000000000000010000003200000000000000AB6D000068C500004A0D000058010000380000000100000200004A0D000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61130046004B005F005000410043004B004100470045005F005000520049004F00520049005400590002000B00220B0000AA820000220B0000507900000000000002000000F0F0F00000000000000000000000000000000000010000003400000000000000D10B0000517D0000600B00005801000032000000010000020000600B000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61100046004B005F0041004400440052004500530053005F0053005400410054004500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000FEFFFFFFFEFFFFFF0400000005000000060000000700000008000000090000000A0000000B0000000C0000000D0000000E0000000F00000010000000110000001200000013000000140000001500000016000000FEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0100FEFF030A0000FFFFFFFF00000000000000000000000000000000170000004D6963726F736F66742044445320466F726D20322E300010000000456D626564646564204F626A6563740000000000F439B271000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B0000004E61BC00000000000000000000000000000000000000000000000000000000000000000000000000000000000000DBE6B0E91C81D011AD5100A0C90F573900000200E0776B87A8DCD301020200001048450000000000000000000000000000000000500200004400610074006100200053006F0075007200630065003D0070006F00730074006F00660066006900630065002D0064006200640062007300650072007600650072002E00640061007400610062006100730065002E00770069006E0064006F00770073002E006E00650074003B0049006E0069007400690061006C00200043006100740061006C006F0067003D0050004F00530054004F004600460049004300450032003B005000650072007300690073007400200053006500630075007200690074007900200049006E0066006F003D0054007200750065003B0055007300650072002000490044003D007400650061006D003600670072006F00750070003B004D0075006C000300440064007300530074007200650061006D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160002000300000006000000FFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000250000008E2300000000000053006300680065006D00610020005500440056002000440065006600610075006C0074000000000000000000000000000000000000000000000000000000000026000200FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000020000001600000000000000440053005200450046002D0053004300480045004D0041002D0043004F004E00540045004E0054005300000000000000000000000000000000000000000000002C0002010500000007000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000003000000E00400000000000053006300680065006D00610020005500440056002000440065006600610075006C007400200050006F007300740020005600360000000000000000000000000036000200FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000001700000012000000000000000C000000CFB4FFFF4AFEFFFF0100260000007300630068005F006C006100620065006C0073005F00760069007300690062006C0065000000010000000B0000001E000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000010000000100000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700330030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000040000000400000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700330030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000050000000500000000000000380000000169637201000000640062006F00000046004B005F0043005500530054004F004D00450052005F00410044004400520045005300530000000000000000000000C4020000000006000000060000000500000008000000016EE731386EE7310000000000000000AD070000000000070000000700000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0033003000330030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000000800000008000000000000004A0000000100350001000000640062006F00000046004B005F0043005500530054004F004D00450052005F0041004400440052004500530053005F0043005500530054004F004D004500520000000000000000000000C40200000000090000000900000008000000080000000171E7317871E7310000000000000000AD0700000000000A0000000A000000000000004800000001454F5701000000640062006F00000046004B005F0043005500530054004F004D00450052005F0041004400440052004500530053005F00410044004400520045005300530000000000000000000000C402000000000B0000000B0000000A000000080000000169E731F869E7310000000000000000AD0700000000000C0000000C00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700330030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000000D0000000D00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700330030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000000E0000000E000000000000003C000000014FFA1D01000000640062006F00000046004B005F0045004D0050004C004F0059004500450053005F0046004100430049004C0049005400590000000000000000000000C402000000000F0000000F0000000E000000080000000169E7313869E7310000000000000000AD070000000000100000001000000000000000380000000169637201000000640062006F00000046004B005F0046004100430049004C004900540059005F00410044004400520045005300530000000000000000000000C40200000000110000001100000010000000080000000164E7317864E7310000000000000000AD070000000000120000001200000000000000380000000169637201000000640062006F00000046004B005F0041004400440052004500530053005F0046006100630069006C0069007400790000000000000000000000C40200000000130000001300000012000000080000000163E7317863E7310000000000000000AD070000000000140000001400000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700330030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000150000001500000000000000360000000169637201000000640062006F00000046004B005F005000410043004B004100470045005F00410044004400520045005300530000000000000000000000C40200000000160000001600000015000000080000000169E731B869E7310000000000000000AD070000000000170000001700000000000000380000000169637201000000640062006F00000046004B005F005000410043004B004100470045005F004100440044005200450053005300310000000000000000000000C40200000000180000001800000017000000080000000168E731F868E7310000000000000000AD070000000000190000001900000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001A0000001A00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001B0000001B00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700330030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001C0000001C00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700330030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001D0000001D00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700330030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001E0000001E00000000000000360000000169637201000000640062006F00000046004B005F0054005200410043004B0049004E0047005F0053005400410054005500530000000000000000000000C402000000001F0000001F0000001E000000080000000166E731B866E7310000000000000000AD0700000000002000000020000000000000003A000000014FFA1D01000000640062006F00000046004B005F0054005200410043004B0049004E0047005F0046004100430049004C0049005400590000000000000000000000C40200000000210000002100000020000000080000000167E731F867E7310000000000000000AD0700000000002200000022000000000000003A0000000169637201000000640062006F00000046004B005F0054005200410043004B0049004E0047005F0043005500530054004F004D004500520000000000000000000000C40200000000230000002300000022000000080000000163E731B863E7310000000000000000AD0700000000002400000024000000000000004A0000000100350001000000640062006F00000046004B005F005300480049005000500049004E0047005F0048004900530054004F00520059005F0054005200410043004B0049004E00470000000000000000000000C40200000000250000002500000024000000080000000167E731B867E7310000000000000000AD070000000000260000002600000000000000380000000169637201000000640062006F00000046004B005F0054005200410043004B0049004E0047005F00410044004400520045005300530000000000000000000000C40200000000270000002700000026000000080000000167E7317867E7310000000000000000AD070000000000280000002800000000000000380000000169637201000000640062006F00000046004B005F005000410043004B004100470045005F0054005200410043004B0049004E00470000000000000000000000C40200000000290000002900000028000000080000000165E7313865E7310000000000000000AD0700000000002A0000002A00000000000000380000000169637201000000640062006F00000046004B005F0054005200410043004B0049004E0047005F005000410043004B0041004700450000000000000000000000C402000000002B0000002B0000002A000000080000000166E7317866E7310000000000000000AD0700000000002C0000002C00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700330030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000002F0000002F00000000000000300000000177070501000000640062006F00000046004B005F005000410043004B004100470045005F00540059005000450000000000000000000000C4020000000030000000300000002F000000080000000168E7317868E7310000000000000000AD07000000000031000000310000000000000038000000016E756D01000000640062006F00000046004B005F005000410043004B004100470045005F005000520049004F00520049005400590000000000000000000000C40200000000320000003200000031000000080000000166E7313866E7310000000000000000AD070000000000330000003300000000000000320000000169637201000000640062006F00000046004B005F0041004400440052004500530053005F005300540041005400450000000000000000000000C40200000000340000003400000033000000080000000167E7313867E7310000000000000000AD0700000000005A000000050000000100000004000000770000007A0000000A00000001000000070000007D0000006400000010000000010000000D000000650000005E000000150000000100000014000000830000007E000000170000000100000014000000890000008400000026000000010000001D000000710000007E000000080000000400000007000000250000002800000022000000040000001D000000240000001B0000000E0000000D0000000C0000002400000025000000120000000D00000001000000640000006B000000200000000D0000001D00000025000000240000002A000000140000001D000000260000002D0000003100000019000000140000002400000025000000330000001B0000000100000024000000250000001E0000001C0000001D0000005C0000007F000000240000001D0000001A0000002100000024000000280000001D0000001400000027000000200000002F0000002C000000140000005C000000830000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007400690070006C00650041006300740069007600650052006500730075006C00740053006500740073003D00460061006C00730065003B0043006F006E006E006500630074002000540069006D0065006F00750074003D00330030003B0045006E00630072007900700074003D0054007200750065003B0054007200750073007400530065007200760065007200430065007200740069006600690063006100740065003D00460061006C00730065003B005000610063006B00650074002000530069007A0065003D0034003000390036003B004100700070006C00690063006100740069006F006E0020004E0061006D0065003D0022004D006900630072006F0073006F00660074002000530051004C00200053006500720076006500720020004D0061006E006100670065006D0065006E0074002000530074007500640069006F002200000000800500140000004400690061006700720061006D005F0030000000000226000A0000005400590050004500000008000000640062006F000000000226001200000054005200410043004B0049004E004700000008000000640062006F000000000226000E000000530054004100540055005300000008000000640062006F000000000226000C00000053005400410054004500000008000000640062006F00000000022600220000005300480049005000500049004E0047005F0048004900530054004F0052005900000008000000640062006F00000000022600120000005000520049004F005200490054005900000008000000640062006F00000000022600100000005000410043004B00410047004500000008000000640062006F000000000226001200000046004100430049004C00490054005900000008000000640062006F000000000226001400000045004D0050004C004F005900450045005300000008000000640062006F000000000226002200000043005500530054004F004D00450052005F004100440044005200450053005300000008000000640062006F000000000226001200000043005500530054004F004D0045005200000008000000640062006F00000000022400100000004100440044005200450053005300000008000000640062006F00000001000000D68509B3BB6BF2459AB8371664F0327008004E0000007B00310036003300340043004400440037002D0030003800380038002D0034003200450033002D0039004600410032002D004200360044003300320035003600330042003900310044007D0000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062885214)
SET IDENTITY_INSERT [dbo].[sysdiagrams] OFF
SET IDENTITY_INSERT [dbo].[TRACKING] ON 

INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (6, 1, 3, 0, N'P', NULL, CAST(N'2018-05-02T17:04:24.683' AS DateTime), 5, CAST(N'2018-04-21T21:36:57.670' AS DateTime), NULL)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (9, 1, 3, 0, N'P', NULL, CAST(N'2018-05-02T17:00:50.743' AS DateTime), 12, CAST(N'2018-04-30T00:56:49.180' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (10, 9, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:00:57.853' AS DateTime), 13, CAST(N'2018-04-30T02:46:10.967' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (11, 9, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:01:14.150' AS DateTime), 14, CAST(N'2018-04-24T04:19:00.603' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (12, 9, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:01:33.523' AS DateTime), 15, CAST(N'2018-04-24T04:19:05.290' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (13, 9, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:01:45.070' AS DateTime), 16, CAST(N'2018-04-24T04:19:10.337' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (14, 9, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:01:51.463' AS DateTime), 17, CAST(N'2018-04-24T04:19:13.383' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (15, 9, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:01:57.963' AS DateTime), 18, CAST(N'2018-04-24T04:19:16.260' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (16, 9, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:02:15.447' AS DateTime), 19, CAST(N'2018-04-24T04:19:19.150' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (17, 9, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:02:22.400' AS DateTime), 20, CAST(N'2018-04-24T04:19:22.823' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (18, 9, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:02:31.430' AS DateTime), 21, CAST(N'2018-04-24T04:19:26.087' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (19, 9, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:02:36.790' AS DateTime), 22, CAST(N'2018-04-24T04:19:28.853' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (20, 9, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:02:43.243' AS DateTime), 23, CAST(N'2018-04-24T04:19:31.383' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (21, 9, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:02:48.010' AS DateTime), 24, CAST(N'2018-04-24T04:19:34.277' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (22, 9, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:02:53.337' AS DateTime), 25, CAST(N'2018-04-24T04:19:36.760' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (23, 4, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:02:57.070' AS DateTime), 26, CAST(N'2018-04-24T04:19:39.260' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (24, 4, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:03:01.273' AS DateTime), 27, CAST(N'2018-04-24T04:19:41.557' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (25, 4, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:03:07.180' AS DateTime), 28, CAST(N'2018-04-24T04:19:43.917' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (26, 4, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:03:12.680' AS DateTime), 29, CAST(N'2018-04-24T04:19:46.353' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (27, 4, 1, 0, N'O', NULL, CAST(N'2018-05-02T17:03:21.480' AS DateTime), 30, CAST(N'2018-04-24T04:19:48.587' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (28, 4, 1, 0, N'T', NULL, CAST(N'2018-05-02T17:03:28.447' AS DateTime), 31, CAST(N'2018-04-24T04:19:51.337' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (29, 44, 1, 0, N'D', NULL, CAST(N'2018-05-07T17:03:32.383' AS DateTime), 32, CAST(N'2018-04-24T04:19:55.760' AS DateTime), 1)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (30, 9, NULL, 0, N'O', NULL, CAST(N'2018-05-02T17:03:38.510' AS DateTime), 33, CAST(N'2018-04-24T23:20:59.913' AS DateTime), 94)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (37, 9, 3, 0, N'P', NULL, CAST(N'2018-05-02T17:03:47.213' AS DateTime), 35, CAST(N'2018-04-25T17:06:17.733' AS DateTime), 103)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (38, 9, NULL, 0, N'O', NULL, CAST(N'2018-04-27T17:17:25.533' AS DateTime), 36, CAST(N'2018-04-25T17:17:25.253' AS DateTime), 104)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (39, 53, 1, 0, N'T', NULL, CAST(N'2018-05-02T17:03:57.683' AS DateTime), 37, CAST(N'2018-04-25T21:05:29.497' AS DateTime), 112)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (40, 55, 3, 0, N'F', NULL, CAST(N'2018-04-27T21:37:33.837' AS DateTime), 38, CAST(N'2018-04-25T21:42:33.253' AS DateTime), 119)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (41, 55, 1, 0, N'D', NULL, CAST(N'2018-04-27T21:37:49.900' AS DateTime), 39, CAST(N'2018-04-26T03:39:44.093' AS DateTime), 119)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (42, 56, NULL, 0, N'O', NULL, CAST(N'2018-05-02T21:49:07.620' AS DateTime), 40, CAST(N'2018-04-25T21:49:07.620' AS DateTime), 122)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (43, 4, 3, 0, N'T', NULL, CAST(N'2018-04-27T22:56:42.777' AS DateTime), 41, CAST(N'2018-04-25T23:13:58.730' AS DateTime), 123)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (44, 57, 3, 0, N'P', NULL, CAST(N'2018-04-30T23:11:56.030' AS DateTime), 42, CAST(N'2018-04-25T23:15:41.990' AS DateTime), 125)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (45, 57, 2, 0, N'T', NULL, CAST(N'2018-04-28T23:19:13.160' AS DateTime), 43, CAST(N'2018-04-25T23:24:01.730' AS DateTime), 127)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (46, 58, NULL, 0, N'O', NULL, CAST(N'2018-04-28T03:37:13.793' AS DateTime), 44, CAST(N'2018-04-26T03:37:13.793' AS DateTime), 130)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (57, 66, NULL, 0, N'O', NULL, CAST(N'2018-04-30T05:57:37.393' AS DateTime), 55, CAST(N'2018-04-30T05:57:37.393' AS DateTime), 145)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (60, 66, 3, 0, N'D', CAST(N'2018-04-30T06:23:59.690' AS DateTime), CAST(N'2018-05-02T06:10:59.310' AS DateTime), 58, CAST(N'2018-04-30T06:23:59.690' AS DateTime), 147)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (61, 66, NULL, 0, N'O', NULL, CAST(N'2018-05-02T06:31:16.350' AS DateTime), 59, CAST(N'2018-04-30T06:31:16.223' AS DateTime), 148)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (62, 66, NULL, 0, N'O', NULL, CAST(N'2018-05-02T06:32:21.380' AS DateTime), 60, CAST(N'2018-04-30T06:32:21.300' AS DateTime), 149)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (63, 66, NULL, 0, N'O', NULL, CAST(N'2018-05-02T06:34:57.893' AS DateTime), 61, CAST(N'2018-04-30T06:34:57.567' AS DateTime), 150)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (64, 67, 3, 0, N'C', NULL, CAST(N'2018-05-02T16:47:39.100' AS DateTime), 62, CAST(N'2018-04-30T16:52:54.757' AS DateTime), 152)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (65, 68, 2, 0, N'D', CAST(N'2018-04-30T18:19:58.567' AS DateTime), CAST(N'2018-05-07T18:38:46.403' AS DateTime), 63, CAST(N'2018-04-30T18:19:58.567' AS DateTime), 154)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (66, 69, 2, 0, N'D', CAST(N'2018-04-30T19:23:00.430' AS DateTime), CAST(N'2018-05-07T19:21:09.693' AS DateTime), 64, CAST(N'2018-04-30T19:23:00.430' AS DateTime), 157)
INSERT [dbo].[TRACKING] ([Tracking_no], [Sender_ID], [Facility_ID], [Failed_to_deliver], [Status], [Delivered_Date], [Delivery_Date], [Package_ID], [Last_updated], [Destination_Address_ID]) VALUES (67, 68, NULL, 0, N'O', NULL, CAST(N'2018-05-02T19:53:40.513' AS DateTime), 65, CAST(N'2018-04-30T19:53:40.513' AS DateTime), 159)
SET IDENTITY_INSERT [dbo].[TRACKING] OFF
INSERT [dbo].[TYPE] ([Type_ID], [Type], [Last_updated]) VALUES (N'EE', N'Parcel', CAST(N'2018-03-21T13:55:11.263' AS DateTime))
INSERT [dbo].[TYPE] ([Type_ID], [Type], [Last_updated]) VALUES (N'LE', N'Letter', CAST(N'2018-04-24T04:54:03.033' AS DateTime))
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_principal_name]    Script Date: 4/30/2018 3:16:02 PM ******/
ALTER TABLE [dbo].[sysdiagrams] ADD  CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADDRESS]  WITH CHECK ADD  CONSTRAINT [FK_ADDRESS_Facility] FOREIGN KEY([Facility_ID])
REFERENCES [dbo].[FACILITY] ([Facility_ID])
GO
ALTER TABLE [dbo].[ADDRESS] CHECK CONSTRAINT [FK_ADDRESS_Facility]
GO
ALTER TABLE [dbo].[ADDRESS]  WITH CHECK ADD  CONSTRAINT [FK_ADDRESS_STATE] FOREIGN KEY([State])
REFERENCES [dbo].[STATE] ([State_ID])
GO
ALTER TABLE [dbo].[ADDRESS] CHECK CONSTRAINT [FK_ADDRESS_STATE]
GO
ALTER TABLE [dbo].[CUSTOMER]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMER_ADDRESS] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[ADDRESS] ([Address_ID])
GO
ALTER TABLE [dbo].[CUSTOMER] CHECK CONSTRAINT [FK_CUSTOMER_ADDRESS]
GO
ALTER TABLE [dbo].[CUSTOMER_ADDRESS]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMER_ADDRESS_ADDRESS] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[ADDRESS] ([Address_ID])
GO
ALTER TABLE [dbo].[CUSTOMER_ADDRESS] CHECK CONSTRAINT [FK_CUSTOMER_ADDRESS_ADDRESS]
GO
ALTER TABLE [dbo].[CUSTOMER_ADDRESS]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMER_ADDRESS_CUSTOMER] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[CUSTOMER] ([Customer_ID])
GO
ALTER TABLE [dbo].[CUSTOMER_ADDRESS] CHECK CONSTRAINT [FK_CUSTOMER_ADDRESS_CUSTOMER]
GO
ALTER TABLE [dbo].[EMPLOYEES]  WITH CHECK ADD  CONSTRAINT [FK_EMPLOYEES_FACILITY] FOREIGN KEY([Facility_ID])
REFERENCES [dbo].[FACILITY] ([Facility_ID])
GO
ALTER TABLE [dbo].[EMPLOYEES] CHECK CONSTRAINT [FK_EMPLOYEES_FACILITY]
GO
ALTER TABLE [dbo].[FACILITY]  WITH CHECK ADD  CONSTRAINT [FK_FACILITY_ADDRESS] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[ADDRESS] ([Address_ID])
GO
ALTER TABLE [dbo].[FACILITY] CHECK CONSTRAINT [FK_FACILITY_ADDRESS]
GO
ALTER TABLE [dbo].[PACKAGE]  WITH CHECK ADD  CONSTRAINT [FK_PACKAGE_ADDRESS] FOREIGN KEY([Sender_Address_ID])
REFERENCES [dbo].[ADDRESS] ([Address_ID])
GO
ALTER TABLE [dbo].[PACKAGE] CHECK CONSTRAINT [FK_PACKAGE_ADDRESS]
GO
ALTER TABLE [dbo].[PACKAGE]  WITH CHECK ADD  CONSTRAINT [FK_PACKAGE_ADDRESS1] FOREIGN KEY([Receiver_Address_ID])
REFERENCES [dbo].[ADDRESS] ([Address_ID])
GO
ALTER TABLE [dbo].[PACKAGE] CHECK CONSTRAINT [FK_PACKAGE_ADDRESS1]
GO
ALTER TABLE [dbo].[PACKAGE]  WITH CHECK ADD  CONSTRAINT [FK_PACKAGE_PRIORITY] FOREIGN KEY([Priority])
REFERENCES [dbo].[PRIORITY] ([Priority_ID])
GO
ALTER TABLE [dbo].[PACKAGE] CHECK CONSTRAINT [FK_PACKAGE_PRIORITY]
GO
ALTER TABLE [dbo].[PACKAGE]  WITH CHECK ADD  CONSTRAINT [FK_PACKAGE_TRACKING] FOREIGN KEY([Tracking_no])
REFERENCES [dbo].[TRACKING] ([Tracking_no])
GO
ALTER TABLE [dbo].[PACKAGE] CHECK CONSTRAINT [FK_PACKAGE_TRACKING]
GO
ALTER TABLE [dbo].[PACKAGE]  WITH CHECK ADD  CONSTRAINT [FK_PACKAGE_TYPE] FOREIGN KEY([Types])
REFERENCES [dbo].[TYPE] ([Type_ID])
GO
ALTER TABLE [dbo].[PACKAGE] CHECK CONSTRAINT [FK_PACKAGE_TYPE]
GO
ALTER TABLE [dbo].[SHIPPING_HISTORY]  WITH CHECK ADD  CONSTRAINT [FK_SHIPPING_HISTORY_TRACKING] FOREIGN KEY([Tracking_no])
REFERENCES [dbo].[TRACKING] ([Tracking_no])
GO
ALTER TABLE [dbo].[SHIPPING_HISTORY] CHECK CONSTRAINT [FK_SHIPPING_HISTORY_TRACKING]
GO
ALTER TABLE [dbo].[TRACKING]  WITH CHECK ADD  CONSTRAINT [FK_TRACKING_ADDRESS] FOREIGN KEY([Destination_Address_ID])
REFERENCES [dbo].[ADDRESS] ([Address_ID])
GO
ALTER TABLE [dbo].[TRACKING] CHECK CONSTRAINT [FK_TRACKING_ADDRESS]
GO
ALTER TABLE [dbo].[TRACKING]  WITH CHECK ADD  CONSTRAINT [FK_TRACKING_CUSTOMER] FOREIGN KEY([Sender_ID])
REFERENCES [dbo].[CUSTOMER] ([Customer_ID])
GO
ALTER TABLE [dbo].[TRACKING] CHECK CONSTRAINT [FK_TRACKING_CUSTOMER]
GO
ALTER TABLE [dbo].[TRACKING]  WITH CHECK ADD  CONSTRAINT [FK_TRACKING_FACILITY] FOREIGN KEY([Facility_ID])
REFERENCES [dbo].[FACILITY] ([Facility_ID])
GO
ALTER TABLE [dbo].[TRACKING] CHECK CONSTRAINT [FK_TRACKING_FACILITY]
GO
ALTER TABLE [dbo].[TRACKING]  WITH CHECK ADD  CONSTRAINT [FK_TRACKING_PACKAGE] FOREIGN KEY([Package_ID])
REFERENCES [dbo].[PACKAGE] ([Package_ID])
GO
ALTER TABLE [dbo].[TRACKING] CHECK CONSTRAINT [FK_TRACKING_PACKAGE]
GO
ALTER TABLE [dbo].[TRACKING]  WITH CHECK ADD  CONSTRAINT [FK_TRACKING_STATUS] FOREIGN KEY([Status])
REFERENCES [dbo].[STATUS] ([Status_ID])
GO
ALTER TABLE [dbo].[TRACKING] CHECK CONSTRAINT [FK_TRACKING_STATUS]
GO
ALTER TABLE [dbo].[EMPLOYEES]  WITH CHECK ADD  CONSTRAINT [CK__EMPLOYEES__DOB__6E01572D] CHECK  ((datediff(year,[DOB],getdate())>=(18)))
GO
ALTER TABLE [dbo].[EMPLOYEES] CHECK CONSTRAINT [CK__EMPLOYEES__DOB__6E01572D]
GO
ALTER TABLE [dbo].[TRACKING]  WITH CHECK ADD  CONSTRAINT [CK__TRACKING__Delive__3B75D760] CHECK  (([Delivery_Date]>=getdate()))
GO
ALTER TABLE [dbo].[TRACKING] CHECK CONSTRAINT [CK__TRACKING__Delive__3B75D760]
GO
/****** Object:  StoredProcedure [dbo].[grabFacilityID]    Script Date: 4/30/2018 3:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[grabFacilityID]
@Employee_user nvarchar(100),
@Facility_ID int OUTPUT

AS
	SET NOCOUNT ON;
	SELECT @Facility_ID = FACILITY.Facility_ID 
	FROM FACILITY, EMPLOYEES
	WHERE @Employee_user = EMPLOYEES.email

	RETURN

	
GO
/****** Object:  StoredProcedure [dbo].[newaddress]    Script Date: 4/30/2018 3:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[newaddress]

@street nvarchar(50),
@city nvarchar(30),
@state nchar(2),
@zip decimal(5,0),
@aptn int,
@login nvarchar(50)
AS
	BEGIN
		DECLARE @adID int

		SET @adID = (SELECT ADDRESS.Address_ID FROM ADDRESS WHERE ADDRESS.Street = @street AND ADDRESS.City = @city AND ADDRESS.State = @state AND ADDRESS.Zip = @zip)
		IF @adID IS NULL
		BEGIN
			INSERT INTO ADDRESS (street, city, state, zip, aptn)
			VALUES (@street,@city,@state,@zip,@aptn)
			SET @adID = SCOPE_IDENTITY()
		END

		ALTER TABLE dbo.CUSTOMER DISABLE TRIGGER tr_CUSTOMER_LastUpdatedDatetimeStamp

		UPDATE
			CUSTOMER
		SET
			Address_ID = @adID
		WHERE
			Email = @login

		ALTER TABLE dbo.CUSTOMER ENABLE TRIGGER tr_CUSTOMER_LastUpdatedDatetimeStamp

	END
GO
/****** Object:  StoredProcedure [dbo].[newuser]    Script Date: 4/30/2018 3:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[newuser]
@Fname nvarchar (15),
@Minit nvarchar(15),
@Lname nvarchar(15),
@Email nvarchar(100),
@Phone1 nvarchar(20),
@Phone2 nvarchar(20),
@Password nchar(25)
AS
	IF EXISTS (SELECT * FROM CUSTOMER WHERE email= @email)
	BEGIN
		RAISERROR('your message here',16,1)


	END
	ELSE

	BEGIN

	ALTER TABLE dbo.CUSTOMER DISABLE TRIGGER tr_CUSTOMER_LastUpdatedDatetimeStamp
	ALTER TABLE dbo.CUSTOMER DISABLE TRIGGER tr_CUSTOMER_Address
	
		INSERT INTO CUSTOMER (Fname,Minit,Lname,Email,Phone1,Phone2,Password)
		VALUES (@Fname,@Minit,@Lname,@Email,@Phone1,@Phone2,@Password)

	ALTER TABLE dbo.CUSTOMER ENABLE TRIGGER tr_CUSTOMER_Address
	ALTER TABLE dbo.CUSTOMER ENABLE TRIGGER tr_CUSTOMER_LastUpdatedDatetimeStamp
	
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 4/30/2018 3:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_alterdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 4/30/2018 3:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_creatediagram]
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 4/30/2018 3:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_dropdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 4/30/2018 3:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition]
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 4/30/2018 3:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagrams]
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 4/30/2018 3:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_renamediagram]
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 4/30/2018 3:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_upgraddiagrams]
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	
GO
/****** Object:  StoredProcedure [dbo].[updateaddress]    Script Date: 4/30/2018 3:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updateaddress]
@email nvarchar(100),
@Street nvarchar(50),
@aptn int,
@city nvarchar (30),
@state nchar(2),
@zip decimal(5,0)
AS
BEGIN
	DECLARE @adID int

		SET @adID = (SELECT ADDRESS.Address_ID FROM ADDRESS WHERE ADDRESS.Street = @street AND ADDRESS.City = @city AND ADDRESS.State = @state AND ADDRESS.Zip = @zip)
		IF @adID IS NULL
		BEGIN
			INSERT INTO ADDRESS (street, city, state, zip, aptn)
			VALUES (@street,@city,@state,@zip,@aptn)
			SET @adID = SCOPE_IDENTITY()
		END

		UPDATE
			CUSTOMER
		SET
			Address_ID = @adID
		WHERE
			Email = @email
END
GO
/****** Object:  StoredProcedure [dbo].[UserAddOrEdit]    Script Date: 4/30/2018 3:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UserAddOrEdit]
@Customer_ID int,
@Fname nvarchar(15),
@Minit nvarchar(15),
@Lname nvarchar(15),
@Email nvarchar(100),
@Phone1 nvarchar(20),
@Phone2 nvarchar(20),
@Password nchar(25)
AS
	IF @Customer_ID = 0
	BEGIN
		INSERT INTO CUSTOMER (Customer_ID,Fname,Minit,Lname,Email,Phone1,Phone2,Password)
		VALUES (@Customer_ID,@Fname,@Minit,@Lname,@Email,@Phone1,@Phone2,@Password)
	END
	ELSE
	BEGIN
		UPDATE CUSTOMER
		SET
			@Customer_ID = Customer_ID,
			Fname = @Fname,
			Minit = @Minit,
			Lname= @Lname,
			Email = @Email,
			Phone1 = @Phone1,
			Phone2 = @Phone2,
			Password = @Password
		WHERE Customer_ID = @Customer_ID
	END


GO
/****** Object:  StoredProcedure [dbo].[UserViewByID]    Script Date: 4/30/2018 3:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UserViewByID]
@Customer_ID nvarchar(15)
AS
	SELECT *
	FROM ACCOUNT
	WHERE @Customer_ID = @Customer_ID
GO
/****** Object:  StoredProcedure [dbo].[viewaddress]    Script Date: 4/30/2018 3:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[viewaddress]
@email nvarchar(100)
AS
BEGIN
	declare @adid int
	SET @adid = (SELECT Address_ID FROM CUSTOMER WHERE email = @email)
	SELECT *
	FROM ADDRESS
	WHERE (Address_ID = @adid)
END
GO
EXEC sys.sp_addextendedproperty @name=N'microsoft_database_tools_support', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysdiagrams'
GO
USE [master]
GO
ALTER DATABASE [POSTOFFICE2] SET  READ_WRITE 
GO
