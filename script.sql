USE [master]
GO
/****** Object:  Database [ShoppingDB]    Script Date: 02-Nov-21 17:17:09 ******/
CREATE DATABASE [ShoppingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL_TRUNG\MSSQL\DATA\ShoppingDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoppingDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL_TRUNG\MSSQL\DATA\ShoppingDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShoppingDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoppingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoppingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoppingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ShoppingDB] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoppingDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoppingDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShoppingDB', N'ON'
GO
ALTER DATABASE [ShoppingDB] SET QUERY_STORE = OFF
GO
USE [ShoppingDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 02-Nov-21 17:17:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[user_mail] [varchar](100) NOT NULL,
	[password] [varchar](64) NOT NULL,
	[account_role] [int] NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[user_address] [nvarchar](255) NULL,
	[user_phone] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 02-Nov-21 17:17:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[user_mail] [varchar](100) NULL,
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_status] [int] NULL,
	[order_date] [date] NOT NULL,
	[order_discount_code] [varchar](8) NULL,
	[order_address] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_detail]    Script Date: 02-Nov-21 17:17:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_detail](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[amount_product] [int] NULL,
	[price_product] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 02-Nov-21 17:17:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](100) NOT NULL,
	[product_des] [nvarchar](255) NULL,
	[product_price] [float] NOT NULL,
	[product_img_source] [varchar](255) NULL,
	[product_type] [varchar](100) NULL,
	[product_brand] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[Orders_detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Orders_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
/****** Object:  StoredProcedure [dbo].[GetProducts]    Script Date: 02-Nov-21 17:17:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetProducts]
@u int,
@v int
as
begin
 SELECT p.product_id ,p.product_name, p.product_des, p.product_price, p.product_img_source, p.product_type, p.product_brand FROM ( 
  SELECT *, ROW_NUMBER() OVER (ORDER BY product_id) as row 
  FROM Products p
 ) p WHERE p.row >= @u and p.row <= @v
end
GO
/****** Object:  StoredProcedure [dbo].[GetProductsType]    Script Date: 02-Nov-21 17:17:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetProductsType]
@u int,
@v int,
@b varchar(50)
as
begin
 SELECT p.product_id ,p.product_name, p.product_des, p.product_price, p.product_img_source, p.product_type, p.product_brand FROM ( 
  SELECT *, ROW_NUMBER() OVER (ORDER BY product_id) as row 
  FROM Products p where p.product_type = @b
 ) p WHERE p.row >= @u and p.row <= @v
end

GO
USE [master]
GO
ALTER DATABASE [ShoppingDB] SET  READ_WRITE 
GO
