USE [master]
GO
/****** Object:  Database [College519DB]    Script Date: 02.02.2023 22:12:34 ******/
CREATE DATABASE [College519DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Collage519DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Collage519DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Collage519DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Collage519DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [College519DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [College519DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [College519DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [College519DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [College519DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [College519DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [College519DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [College519DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [College519DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [College519DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [College519DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [College519DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [College519DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [College519DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [College519DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [College519DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [College519DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [College519DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [College519DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [College519DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [College519DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [College519DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [College519DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [College519DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [College519DB] SET RECOVERY FULL 
GO
ALTER DATABASE [College519DB] SET  MULTI_USER 
GO
ALTER DATABASE [College519DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [College519DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [College519DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [College519DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [College519DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [College519DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'College519DB', N'ON'
GO
ALTER DATABASE [College519DB] SET QUERY_STORE = OFF
GO
USE [College519DB]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 02.02.2023 22:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](20) NOT NULL,
	[TeacherID] [int] NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 02.02.2023 22:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Surname] [varchar](30) NOT NULL,
	[Patronymic] [varchar](30) NULL,
	[Birthday] [date] NOT NULL,
	[GroupID] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 02.02.2023 22:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Surname] [varchar](30) NOT NULL,
	[Patronymic] [varchar](30) NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([ID], [Title], [TeacherID]) VALUES (1, N'2ИСИП-419', 1)
INSERT [dbo].[Groups] ([ID], [Title], [TeacherID]) VALUES (2, N'4ИСИП-719', 2)
INSERT [dbo].[Groups] ([ID], [Title], [TeacherID]) VALUES (3, N'4ИСИП-619', 3)
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([ID], [Name], [Surname], [Patronymic], [Birthday], [GroupID]) VALUES (1, N'Андрей', N'Мариничев', N'Романович', CAST(N'2003-12-28' AS Date), 1)
INSERT [dbo].[Students] ([ID], [Name], [Surname], [Patronymic], [Birthday], [GroupID]) VALUES (2, N'Алексей', N'Носкин', N'Витальевич', CAST(N'2002-05-12' AS Date), 1)
INSERT [dbo].[Students] ([ID], [Name], [Surname], [Patronymic], [Birthday], [GroupID]) VALUES (6, N'Александр', N'Алешня', N'Александрович', CAST(N'2003-03-11' AS Date), 2)
INSERT [dbo].[Students] ([ID], [Name], [Surname], [Patronymic], [Birthday], [GroupID]) VALUES (7, N'Максим', N'Гордов', N'Олегович', CAST(N'1990-01-30' AS Date), 2)
INSERT [dbo].[Students] ([ID], [Name], [Surname], [Patronymic], [Birthday], [GroupID]) VALUES (8, N'Дэнчик', N'Кузнецов', N'Денисович', CAST(N'2009-05-05' AS Date), 3)
INSERT [dbo].[Students] ([ID], [Name], [Surname], [Patronymic], [Birthday], [GroupID]) VALUES (9, N'Кирилл', N'Кириллов', N'Занделович', CAST(N'2002-04-17' AS Date), 3)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([ID], [Name], [Surname], [Patronymic]) VALUES (1, N'Юлий', N'Кириллов', N'Никитевич')
INSERT [dbo].[Teachers] ([ID], [Name], [Surname], [Patronymic]) VALUES (2, N'Мирон', N'Потапов', N'Богданович')
INSERT [dbo].[Teachers] ([ID], [Name], [Surname], [Patronymic]) VALUES (3, N'Тимур', N'Рыбаков', N'Владиславович')
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Teachers] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([ID])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Teachers]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([ID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Groups]
GO
USE [master]
GO
ALTER DATABASE [College519DB] SET  READ_WRITE 
GO
