USE [master]
GO
/****** Object:  Database [02.05.MultilingualDictionary]    Script Date: 3/11/2015 3:18:24 PM ******/
CREATE DATABASE [02.05.MultilingualDictionary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'02.05.MultilingualDictionary', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.ANTOAN\MSSQL\DATA\02.05.MultilingualDictionary.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'02.05.MultilingualDictionary_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.ANTOAN\MSSQL\DATA\02.05.MultilingualDictionary_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [02.05.MultilingualDictionary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET ARITHABORT OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET  DISABLE_BROKER 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET  MULTI_USER 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [02.05.MultilingualDictionary]
GO
/****** Object:  Table [dbo].[Antonyms]    Script Date: 3/11/2015 3:18:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Antonyms](
	[HypernimID] [int] NOT NULL,
	[HyponimID] [int] NOT NULL,
 CONSTRAINT [PK_Antonyms] PRIMARY KEY CLUSTERED 
(
	[HypernimID] ASC,
	[HyponimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Explanation]    Script Date: 3/11/2015 3:18:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Explanation](
	[ExplanationID] [int] IDENTITY(1,1) NOT NULL,
	[explanations] [ntext] NOT NULL,
	[LanguageID] [int] NOT NULL,
 CONSTRAINT [PK_Explanation] PRIMARY KEY CLUSTERED 
(
	[ExplanationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Language]    Script Date: 3/11/2015 3:18:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](10) NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Synonyms]    Script Date: 3/11/2015 3:18:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Synonyms](
	[wordID] [int] NOT NULL,
	[synonymID] [int] NOT NULL,
 CONSTRAINT [PK_Synonyms] PRIMARY KEY CLUSTERED 
(
	[wordID] ASC,
	[synonymID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Translation]    Script Date: 3/11/2015 3:18:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translation](
	[wordID] [int] IDENTITY(1,1) NOT NULL,
	[translationID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
 CONSTRAINT [PK_Translation] PRIMARY KEY CLUSTERED 
(
	[wordID] ASC,
	[translationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeOfSpeech]    Script Date: 3/11/2015 3:18:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfSpeech](
	[TypeID] [int] NOT NULL,
	[Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TypeOfSpeech] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words]    Script Date: 3/11/2015 3:18:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words](
	[wordID] [int] NOT NULL,
	[Word] [nvarchar](50) NOT NULL,
	[LanguageID] [int] NOT NULL,
	[ExplanationID] [int] NULL,
	[TypeOfSpeechID] [int] NULL,
 CONSTRAINT [PK_Words] PRIMARY KEY CLUSTERED 
(
	[wordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Antonyms]  WITH CHECK ADD  CONSTRAINT [FK_Antonyms_Words] FOREIGN KEY([HypernimID])
REFERENCES [dbo].[Words] ([wordID])
GO
ALTER TABLE [dbo].[Antonyms] CHECK CONSTRAINT [FK_Antonyms_Words]
GO
ALTER TABLE [dbo].[Antonyms]  WITH CHECK ADD  CONSTRAINT [FK_Antonyms_Words1] FOREIGN KEY([HyponimID])
REFERENCES [dbo].[Words] ([wordID])
GO
ALTER TABLE [dbo].[Antonyms] CHECK CONSTRAINT [FK_Antonyms_Words1]
GO
ALTER TABLE [dbo].[Explanation]  WITH CHECK ADD  CONSTRAINT [FK_Explanation_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Language] ([LanguageID])
GO
ALTER TABLE [dbo].[Explanation] CHECK CONSTRAINT [FK_Explanation_Language]
GO
ALTER TABLE [dbo].[Synonyms]  WITH CHECK ADD  CONSTRAINT [FK_Synonyms_Words] FOREIGN KEY([wordID])
REFERENCES [dbo].[Words] ([wordID])
GO
ALTER TABLE [dbo].[Synonyms] CHECK CONSTRAINT [FK_Synonyms_Words]
GO
ALTER TABLE [dbo].[Synonyms]  WITH CHECK ADD  CONSTRAINT [FK_Synonyms_Words1] FOREIGN KEY([synonymID])
REFERENCES [dbo].[Words] ([wordID])
GO
ALTER TABLE [dbo].[Synonyms] CHECK CONSTRAINT [FK_Synonyms_Words1]
GO
ALTER TABLE [dbo].[Translation]  WITH CHECK ADD  CONSTRAINT [FK_Translation_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Language] ([LanguageID])
GO
ALTER TABLE [dbo].[Translation] CHECK CONSTRAINT [FK_Translation_Language]
GO
ALTER TABLE [dbo].[Translation]  WITH CHECK ADD  CONSTRAINT [FK_Translation_Words] FOREIGN KEY([wordID])
REFERENCES [dbo].[Words] ([wordID])
GO
ALTER TABLE [dbo].[Translation] CHECK CONSTRAINT [FK_Translation_Words]
GO
ALTER TABLE [dbo].[Translation]  WITH CHECK ADD  CONSTRAINT [FK_Translation_Words1] FOREIGN KEY([translationID])
REFERENCES [dbo].[Words] ([wordID])
GO
ALTER TABLE [dbo].[Translation] CHECK CONSTRAINT [FK_Translation_Words1]
GO
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_Explanation] FOREIGN KEY([ExplanationID])
REFERENCES [dbo].[Explanation] ([ExplanationID])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_Explanation]
GO
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Language] ([LanguageID])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_Language]
GO
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_TypeOfSpeech] FOREIGN KEY([TypeOfSpeechID])
REFERENCES [dbo].[TypeOfSpeech] ([TypeID])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_TypeOfSpeech]
GO
USE [master]
GO
ALTER DATABASE [02.05.MultilingualDictionary] SET  READ_WRITE 
GO
