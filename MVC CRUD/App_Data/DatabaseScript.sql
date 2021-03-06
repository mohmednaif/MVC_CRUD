USE [master]
GO
/****** Object:  Database [MVC_CRUD]    Script Date: 15-08-2019 18:16:33 ******/
CREATE DATABASE [MVC_CRUD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVC_CRUD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MVC_CRUD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MVC_CRUD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MVC_CRUD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MVC_CRUD] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVC_CRUD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVC_CRUD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVC_CRUD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVC_CRUD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVC_CRUD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVC_CRUD] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVC_CRUD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MVC_CRUD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVC_CRUD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVC_CRUD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVC_CRUD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVC_CRUD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVC_CRUD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVC_CRUD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVC_CRUD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVC_CRUD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MVC_CRUD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVC_CRUD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVC_CRUD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVC_CRUD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVC_CRUD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVC_CRUD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MVC_CRUD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVC_CRUD] SET RECOVERY FULL 
GO
ALTER DATABASE [MVC_CRUD] SET  MULTI_USER 
GO
ALTER DATABASE [MVC_CRUD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVC_CRUD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVC_CRUD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVC_CRUD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MVC_CRUD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MVC_CRUD', N'ON'
GO
ALTER DATABASE [MVC_CRUD] SET QUERY_STORE = OFF
GO
USE [MVC_CRUD]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MVC_CRUD]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 15-08-2019 18:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 15-08-2019 18:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[Gender] [tinyint] NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [DepartmentName]) VALUES (1, N'HR')
INSERT [dbo].[Department] ([Id], [DepartmentName]) VALUES (2, N'Finance')
INSERT [dbo].[Department] ([Id], [DepartmentName]) VALUES (3, N'IT')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [DepartmentId], [FirstName], [LastName], [Email], [Phone], [BirthDate], [Gender], [Address]) VALUES (1, 3, N'Mohmed', N'Patel', N'mohmed@email.com', N'1234567891', CAST(N'1993-01-01' AS Date), 0, N'Vadodara')
INSERT [dbo].[Employee] ([Id], [DepartmentId], [FirstName], [LastName], [Email], [Phone], [BirthDate], [Gender], [Address]) VALUES (2, 2, N'Husain', N'Patel', N'husain@email.com', N'1111122222', CAST(N'1995-04-14' AS Date), 0, N'Bharuch')
INSERT [dbo].[Employee] ([Id], [DepartmentId], [FirstName], [LastName], [Email], [Phone], [BirthDate], [Gender], [Address]) VALUES (3, 3, N'Yasin', N'Patel', N'yasin@email.com', N'2233221122', CAST(N'1997-06-04' AS Date), 0, N'Surat')
INSERT [dbo].[Employee] ([Id], [DepartmentId], [FirstName], [LastName], [Email], [Phone], [BirthDate], [Gender], [Address]) VALUES (4, 1, N'Juber', N'Khan', N'juber@email.com', N'123467899', CAST(N'1995-02-01' AS Date), 0, N'Bharuch')
INSERT [dbo].[Employee] ([Id], [DepartmentId], [FirstName], [LastName], [Email], [Phone], [BirthDate], [Gender], [Address]) VALUES (5, 2, N'Tes1', N'LN1', N'ln@email.com', N'2121212121', CAST(N'2017-02-01' AS Date), 1, N'test')
INSERT [dbo].[Employee] ([Id], [DepartmentId], [FirstName], [LastName], [Email], [Phone], [BirthDate], [Gender], [Address]) VALUES (8, 2, N'Testzz', N'lzzz', N'lzlzlz', N'1111111', CAST(N'2019-02-01' AS Date), 0, N'aaaaa')
INSERT [dbo].[Employee] ([Id], [DepartmentId], [FirstName], [LastName], [Email], [Phone], [BirthDate], [Gender], [Address]) VALUES (9, 3, N'Tes11', N'LN11', N'ln@email.com', N'1111', CAST(N'2003-02-01' AS Date), 1, N'testaaz')
INSERT [dbo].[Employee] ([Id], [DepartmentId], [FirstName], [LastName], [Email], [Phone], [BirthDate], [Gender], [Address]) VALUES (17, 1, N'dsadas', N'dasdas', N'hjkh11@email.com', N'123456111', CAST(N'2019-08-13' AS Date), 1, N'aazzz11')
SET IDENTITY_INSERT [dbo].[Employee] OFF
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
USE [master]
GO
ALTER DATABASE [MVC_CRUD] SET  READ_WRITE 
GO
