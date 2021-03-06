USE [master]
GO
/****** Object:  Database [ToolkitDB]    Script Date: 12/20/2018 2:16:06 PM ******/
CREATE DATABASE [ToolkitDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MusciToolkitDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MusciToolkitDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MusciToolkitDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MusciToolkitDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ToolkitDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToolkitDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToolkitDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToolkitDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToolkitDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ToolkitDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToolkitDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToolkitDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ToolkitDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToolkitDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToolkitDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToolkitDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToolkitDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToolkitDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToolkitDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ToolkitDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToolkitDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ToolkitDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToolkitDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToolkitDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToolkitDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToolkitDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToolkitDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ToolkitDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ToolkitDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ToolkitDB] SET  MULTI_USER 
GO
ALTER DATABASE [ToolkitDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToolkitDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ToolkitDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ToolkitDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ToolkitDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ToolkitDB] SET QUERY_STORE = OFF
GO
USE [ToolkitDB]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 12/20/2018 2:16:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[StreetAddress] [varchar](100) NOT NULL,
	[AptNumber] [varchar](20) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](25) NOT NULL,
	[ZipCode] [varchar](10) NOT NULL,
 CONSTRAINT [PK_AddressCust] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/20/2018 2:16:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[Active] [int] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/20/2018 2:16:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[AddressID] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PhoneNum] [varchar](15) NOT NULL,
	[Active] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/20/2018 2:16:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[HireDate] [date] NOT NULL,
	[RoleID] [int] NOT NULL,
	[PhoneNum] [varchar](50) NOT NULL,
	[AddressID] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Active] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeRole]    Script Date: 12/20/2018 2:16:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeRole](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[EmpRole] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EmployeeRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 12/20/2018 2:16:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[NetPrice] [decimal](18, 2) NOT NULL,
	[SalePrice] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Active] [int] NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 12/20/2018 2:16:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[PurchaseOrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
 CONSTRAINT [PK_PurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrderItems]    Script Date: 12/20/2018 2:16:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderItems](
	[POItemID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Received] [int] NOT NULL,
	[PurchaseOrderID] [int] NOT NULL,
 CONSTRAINT [PK_PurchaseOrderItems] PRIMARY KEY CLUSTERED 
(
	[POItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 12/20/2018 2:16:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[EmployeeID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleItems]    Script Date: 12/20/2018 2:16:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleItems](
	[SaleItemID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Returned] [int] NOT NULL,
	[SaleID] [int] NOT NULL,
 CONSTRAINT [PK_SaleItems] PRIMARY KEY CLUSTERED 
(
	[SaleItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Address]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Address]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmployeeRole] FOREIGN KEY([RoleID])
REFERENCES [dbo].[EmployeeRole] ([RoleID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_EmployeeRole]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Category]
GO
ALTER TABLE [dbo].[PurchaseOrderItems]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderItems_Inventory] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Inventory] ([ProductID])
GO
ALTER TABLE [dbo].[PurchaseOrderItems] CHECK CONSTRAINT [FK_PurchaseOrderItems_Inventory]
GO
ALTER TABLE [dbo].[PurchaseOrderItems]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderItems_PurchaseOrder] FOREIGN KEY([PurchaseOrderID])
REFERENCES [dbo].[PurchaseOrder] ([PurchaseOrderID])
GO
ALTER TABLE [dbo].[PurchaseOrderItems] CHECK CONSTRAINT [FK_PurchaseOrderItems_PurchaseOrder]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Customer]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Employee]
GO
ALTER TABLE [dbo].[SaleItems]  WITH CHECK ADD  CONSTRAINT [FK_SaleItems_Inventory] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Inventory] ([ProductID])
GO
ALTER TABLE [dbo].[SaleItems] CHECK CONSTRAINT [FK_SaleItems_Inventory]
GO
ALTER TABLE [dbo].[SaleItems]  WITH CHECK ADD  CONSTRAINT [FK_SaleItems_Sale] FOREIGN KEY([SaleID])
REFERENCES [dbo].[Sale] ([SaleID])
GO
ALTER TABLE [dbo].[SaleItems] CHECK CONSTRAINT [FK_SaleItems_Sale]
GO
USE [master]
GO
ALTER DATABASE [ToolkitDB] SET  READ_WRITE 
GO
