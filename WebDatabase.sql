USE [master]
GO
/****** Object:  Database [WebDatabase]    Script Date: 7/11/2021 4:33:11 PM ******/
CREATE DATABASE [WebDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebDatabase', FILENAME = N'D:\Software\Database\Microsoft SQL Server\MSSQL12.SQL\MSSQL\DATA\WebDatabase.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebDatabase_log', FILENAME = N'D:\Software\Database\Microsoft SQL Server\MSSQL12.SQL\MSSQL\DATA\WebDatabase_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebDatabase] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [WebDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WebDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WebDatabase]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 7/11/2021 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](2) NOT NULL,
	[name] [nvarchar](40) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 7/11/2021 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderDetailID] [nvarchar](4) NOT NULL,
	[orderID] [nvarchar](4) NULL,
	[productID] [nvarchar](10) NULL,
	[price] [numeric](2, 2) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 7/11/2021 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [nvarchar](4) NOT NULL,
	[userID] [nvarchar](50) NULL,
	[orderDate] [date] NULL,
	[total] [int] NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 7/11/2021 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [nvarchar](10) NOT NULL,
	[name] [nvarchar](40) NOT NULL,
	[price] [decimal](19, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[categoryID] [nvarchar](2) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 7/11/2021 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [char](2) NOT NULL,
	[name] [char](5) NOT NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/11/2021 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](500) NULL,
	[phone] [char](10) NULL,
	[roleID] [char](2) NOT NULL,
	[password] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProducts]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblCategory]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
/****** Object:  StoredProcedure [dbo].[countActive]    Script Date: 7/11/2021 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[countActive]
(
   @id nchar(20),
	@tableName nvarchar(50),
	@Rows int output
)
as
begin
DECLARE @Sql NVARCHAR(max)
SET @Sql = N'SELECT @Rows = COUNT('+@id+') FROM ' + @tableName +' WHERE status = 1'

EXEC sp_executesql @Sql, N'@Rows int output', @Rows OUTPUT;
end
GO
/****** Object:  StoredProcedure [dbo].[countAllRows]    Script Date: 7/11/2021 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[countAllRows]
(
   @id nchar(20),
	@tableName nvarchar(50),
	@Rows int output
)
as
begin
DECLARE @Sql NVARCHAR(max)
SET @Sql = N'SELECT @Rows = COUNT('+@id+') FROM ' + @tableName +''

EXEC sp_executesql @Sql, N'@Rows int output', @Rows OUTPUT;
end
GO
USE [master]
GO
ALTER DATABASE [WebDatabase] SET  READ_WRITE 
GO
