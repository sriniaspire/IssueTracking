USE [master]
GO
/****** Object:  Database [IssueDB]    Script Date: 6/6/2024 10:29:29 PM ******/
CREATE DATABASE [IssueDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IssueDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HOME\MSSQL\DATA\IssueDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IssueDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HOME\MSSQL\DATA\IssueDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [IssueDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IssueDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IssueDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IssueDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IssueDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IssueDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IssueDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [IssueDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IssueDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IssueDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IssueDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IssueDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IssueDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IssueDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IssueDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IssueDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IssueDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [IssueDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IssueDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IssueDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IssueDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IssueDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IssueDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [IssueDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IssueDB] SET RECOVERY FULL 
GO
ALTER DATABASE [IssueDB] SET  MULTI_USER 
GO
ALTER DATABASE [IssueDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IssueDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IssueDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IssueDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IssueDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IssueDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'IssueDB', N'ON'
GO
ALTER DATABASE [IssueDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [IssueDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [IssueDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/6/2024 10:29:30 PM ******/
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
/****** Object:  Table [dbo].[Issues]    Script Date: 6/6/2024 10:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Issues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Priority] [int] NOT NULL,
	[IssueType] [int] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Completed] [datetime2](7) NULL,
 CONSTRAINT [PK_Issues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [IssueDB] SET  READ_WRITE 
GO
