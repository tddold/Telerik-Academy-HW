USE [master]
GO
/****** Object:  Database [02.03.UniversitySystem]    Script Date: 3/11/2015 3:21:08 PM ******/
CREATE DATABASE [02.03.UniversitySystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'02.03.UniversitySystem', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.ANTOAN\MSSQL\DATA\02.03.UniversitySystem.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'02.03.UniversitySystem_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.ANTOAN\MSSQL\DATA\02.03.UniversitySystem_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [02.03.UniversitySystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [02.03.UniversitySystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [02.03.UniversitySystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [02.03.UniversitySystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [02.03.UniversitySystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [02.03.UniversitySystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [02.03.UniversitySystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [02.03.UniversitySystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [02.03.UniversitySystem] SET  MULTI_USER 
GO
ALTER DATABASE [02.03.UniversitySystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [02.03.UniversitySystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [02.03.UniversitySystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [02.03.UniversitySystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [02.03.UniversitySystem]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 3/11/2015 3:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DepartmentID] [int] NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 3/11/2015 3:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FacultyID] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 3/11/2015 3:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[FacultyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UniversityID] [int] NOT NULL,
 CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED 
(
	[FacultyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professors]    Script Date: 3/11/2015 3:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors](
	[ProfessorID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CourseID] [int] NOT NULL,
	[DepratmentID] [int] NULL,
 CONSTRAINT [PK_Professors] PRIMARY KEY CLUSTERED 
(
	[ProfessorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professors_Titles]    Script Date: 3/11/2015 3:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors_Titles](
	[ProfessorID] [int] NOT NULL,
	[TitleID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Professors_Titles] PRIMARY KEY CLUSTERED 
(
	[ProfessorID] ASC,
	[TitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Title]    Script Date: 3/11/2015 3:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Title](
	[TitleID] [int] IDENTITY(1,1) NOT NULL,
	[TitleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Title] PRIMARY KEY CLUSTERED 
(
	[TitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[University]    Script Date: 3/11/2015 3:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[University](
	[UniversityID] [int] IDENTITY(1,1) NOT NULL,
	[UniversityName] [nvarchar](50) NULL,
 CONSTRAINT [PK_University] PRIMARY KEY CLUSTERED 
(
	[UniversityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Department]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Faculties] FOREIGN KEY([FacultyID])
REFERENCES [dbo].[Faculties] ([FacultyID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Faculties]
GO
ALTER TABLE [dbo].[Faculties]  WITH CHECK ADD  CONSTRAINT [FK_Faculties_University] FOREIGN KEY([UniversityID])
REFERENCES [dbo].[University] ([UniversityID])
GO
ALTER TABLE [dbo].[Faculties] CHECK CONSTRAINT [FK_Faculties_University]
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Department] FOREIGN KEY([DepratmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Department]
GO
ALTER TABLE [dbo].[Professors_Titles]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Titles_Professors] FOREIGN KEY([ProfessorID])
REFERENCES [dbo].[Professors] ([ProfessorID])
GO
ALTER TABLE [dbo].[Professors_Titles] CHECK CONSTRAINT [FK_Professors_Titles_Professors]
GO
ALTER TABLE [dbo].[Professors_Titles]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Titles_Title] FOREIGN KEY([TitleID])
REFERENCES [dbo].[Title] ([TitleID])
GO
ALTER TABLE [dbo].[Professors_Titles] CHECK CONSTRAINT [FK_Professors_Titles_Title]
GO
USE [master]
GO
ALTER DATABASE [02.03.UniversitySystem] SET  READ_WRITE 
GO
