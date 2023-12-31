USE [master]
GO
/****** Object:  Database [WebApiProjectCore]    Script Date: 22.11.2023 18:23:46 ******/
CREATE DATABASE [WebApiProjectCore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebApiProjectCore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.FURKANKILIC\MSSQL\DATA\WebApiProjectCore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebApiProjectCore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.FURKANKILIC\MSSQL\DATA\WebApiProjectCore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WebApiProjectCore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebApiProjectCore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebApiProjectCore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebApiProjectCore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebApiProjectCore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebApiProjectCore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebApiProjectCore] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [WebApiProjectCore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET RECOVERY FULL 
GO
ALTER DATABASE [WebApiProjectCore] SET  MULTI_USER 
GO
ALTER DATABASE [WebApiProjectCore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebApiProjectCore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebApiProjectCore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebApiProjectCore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebApiProjectCore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebApiProjectCore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebApiProjectCore', N'ON'
GO
ALTER DATABASE [WebApiProjectCore] SET QUERY_STORE = ON
GO
ALTER DATABASE [WebApiProjectCore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WebApiProjectCore]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 22.11.2023 18:23:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coursess]    Script Date: 22.11.2023 18:23:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coursess](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](max) NULL,
	[DepartmentID] [int] NOT NULL,
	[InstructorName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Coursess] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departmentss]    Script Date: 22.11.2023 18:23:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departmentss](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](max) NULL,
	[UniversityID] [int] NOT NULL,
 CONSTRAINT [PK_Departmentss] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Studentss]    Script Date: 22.11.2023 18:23:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studentss](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[DepartmentID] [int] NOT NULL,
	[EnrollmentYear] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Studentss] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Universitiess]    Script Date: 22.11.2023 18:23:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Universitiess](
	[UniversityID] [int] IDENTITY(1,1) NOT NULL,
	[UniversityName] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
 CONSTRAINT [PK_Universitiess] PRIMARY KEY CLUSTERED 
(
	[UniversityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231019172315_init', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[Coursess] ON 

INSERT [dbo].[Coursess] ([CourseID], [CourseName], [DepartmentID], [InstructorName]) VALUES (1, N'Veritabanı Yönetimi', 1, N'Prof. Ayşe Yılmaz')
INSERT [dbo].[Coursess] ([CourseID], [CourseName], [DepartmentID], [InstructorName]) VALUES (2, N'Mikroişlemciler', 2, N'Doç. Dr. Ali Kaya')
INSERT [dbo].[Coursess] ([CourseID], [CourseName], [DepartmentID], [InstructorName]) VALUES (3, N'Elektrik Devreleri', 3, N'Prof. Mehmet Aydın')
INSERT [dbo].[Coursess] ([CourseID], [CourseName], [DepartmentID], [InstructorName]) VALUES (4, N'Pazarlama Stratejileri', 4, N'Dr. Ayşe Demir')
INSERT [dbo].[Coursess] ([CourseID], [CourseName], [DepartmentID], [InstructorName]) VALUES (5, N'Kimya Laboratuvarı', 5, N'Doç. Dr. Mustafa Kara')
INSERT [dbo].[Coursess] ([CourseID], [CourseName], [DepartmentID], [InstructorName]) VALUES (6, N'deneme', 1, N'deneme')
SET IDENTITY_INSERT [dbo].[Coursess] OFF
GO
SET IDENTITY_INSERT [dbo].[Departmentss] ON 

INSERT [dbo].[Departmentss] ([DepartmentID], [DepartmentName], [UniversityID]) VALUES (1, N'Bilgisayar Mühendisliği', 1)
INSERT [dbo].[Departmentss] ([DepartmentID], [DepartmentName], [UniversityID]) VALUES (2, N'İnşaat Mühendisliği', 1)
INSERT [dbo].[Departmentss] ([DepartmentID], [DepartmentName], [UniversityID]) VALUES (3, N'Elektrik-Elektronik Mühendisliği', 2)
INSERT [dbo].[Departmentss] ([DepartmentID], [DepartmentName], [UniversityID]) VALUES (4, N'İşletme Fakültesi', 5)
INSERT [dbo].[Departmentss] ([DepartmentID], [DepartmentName], [UniversityID]) VALUES (5, N'Kimya Bölümü', 4)
INSERT [dbo].[Departmentss] ([DepartmentID], [DepartmentName], [UniversityID]) VALUES (6, N'deneme', 2)
SET IDENTITY_INSERT [dbo].[Departmentss] OFF
GO
SET IDENTITY_INSERT [dbo].[Studentss] ON 

INSERT [dbo].[Studentss] ([StudentID], [FirstName], [LastName], [DepartmentID], [EnrollmentYear]) VALUES (1, N'Ahmet', N'Yılmaz', 1, CAST(N'2020-09-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Studentss] ([StudentID], [FirstName], [LastName], [DepartmentID], [EnrollmentYear]) VALUES (2, N'Elif', N'Kaya', 2, CAST(N'2019-08-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Studentss] ([StudentID], [FirstName], [LastName], [DepartmentID], [EnrollmentYear]) VALUES (3, N'Mehmet', N'Aydın', 3, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Studentss] ([StudentID], [FirstName], [LastName], [DepartmentID], [EnrollmentYear]) VALUES (4, N'Ayşe', N'Demir', 4, CAST(N'2020-09-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Studentss] ([StudentID], [FirstName], [LastName], [DepartmentID], [EnrollmentYear]) VALUES (5, N'Mustafa', N'Kara', 5, CAST(N'2018-09-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Studentss] ([StudentID], [FirstName], [LastName], [DepartmentID], [EnrollmentYear]) VALUES (6, N'deneeme', N'deneeme', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Studentss] OFF
GO
SET IDENTITY_INSERT [dbo].[Universitiess] ON 

INSERT [dbo].[Universitiess] ([UniversityID], [UniversityName], [Location]) VALUES (1, N'Boğaziçi Üniversitesi', N'İstanbul')
INSERT [dbo].[Universitiess] ([UniversityID], [UniversityName], [Location]) VALUES (2, N'ODTÜ (Orta Doğu Teknik Üniversitesi)', N'Ankara')
INSERT [dbo].[Universitiess] ([UniversityID], [UniversityName], [Location]) VALUES (3, N'İstanbul Teknik Üniversitesi', N'İstanbul')
INSERT [dbo].[Universitiess] ([UniversityID], [UniversityName], [Location]) VALUES (4, N'Hacettepe Üniversitesi', N'Ankara')
INSERT [dbo].[Universitiess] ([UniversityID], [UniversityName], [Location]) VALUES (5, N'Ege Üniversitesi1', N'İzmir')
INSERT [dbo].[Universitiess] ([UniversityID], [UniversityName], [Location]) VALUES (13, N'123', N'2')
SET IDENTITY_INSERT [dbo].[Universitiess] OFF
GO
/****** Object:  Index [IX_Coursess_DepartmentID]    Script Date: 22.11.2023 18:23:46 ******/
CREATE NONCLUSTERED INDEX [IX_Coursess_DepartmentID] ON [dbo].[Coursess]
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Departmentss_UniversityID]    Script Date: 22.11.2023 18:23:46 ******/
CREATE NONCLUSTERED INDEX [IX_Departmentss_UniversityID] ON [dbo].[Departmentss]
(
	[UniversityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Studentss_DepartmentID]    Script Date: 22.11.2023 18:23:46 ******/
CREATE NONCLUSTERED INDEX [IX_Studentss_DepartmentID] ON [dbo].[Studentss]
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Coursess]  WITH CHECK ADD  CONSTRAINT [FK_Coursess_Departmentss_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departmentss] ([DepartmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Coursess] CHECK CONSTRAINT [FK_Coursess_Departmentss_DepartmentID]
GO
ALTER TABLE [dbo].[Departmentss]  WITH CHECK ADD  CONSTRAINT [FK_Departmentss_Universitiess_UniversityID] FOREIGN KEY([UniversityID])
REFERENCES [dbo].[Universitiess] ([UniversityID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Departmentss] CHECK CONSTRAINT [FK_Departmentss_Universitiess_UniversityID]
GO
ALTER TABLE [dbo].[Studentss]  WITH CHECK ADD  CONSTRAINT [FK_Studentss_Departmentss_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departmentss] ([DepartmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Studentss] CHECK CONSTRAINT [FK_Studentss_Departmentss_DepartmentID]
GO
USE [master]
GO
ALTER DATABASE [WebApiProjectCore] SET  READ_WRITE 
GO
