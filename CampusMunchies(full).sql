USE [master]
GO
/****** Object:  Database [CampusMunchies]    Script Date: 05-Nov-23 16:08:15 ******/
CREATE DATABASE [CampusMunchies]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CampusMunchies', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CampusMunchies.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CampusMunchies_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CampusMunchies_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CampusMunchies] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CampusMunchies].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CampusMunchies] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CampusMunchies] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CampusMunchies] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CampusMunchies] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CampusMunchies] SET ARITHABORT OFF 
GO
ALTER DATABASE [CampusMunchies] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CampusMunchies] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CampusMunchies] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CampusMunchies] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CampusMunchies] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CampusMunchies] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CampusMunchies] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CampusMunchies] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CampusMunchies] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CampusMunchies] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CampusMunchies] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CampusMunchies] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CampusMunchies] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CampusMunchies] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CampusMunchies] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CampusMunchies] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CampusMunchies] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CampusMunchies] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CampusMunchies] SET  MULTI_USER 
GO
ALTER DATABASE [CampusMunchies] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CampusMunchies] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CampusMunchies] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CampusMunchies] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CampusMunchies] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CampusMunchies] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CampusMunchies] SET QUERY_STORE = ON
GO
ALTER DATABASE [CampusMunchies] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CampusMunchies]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 05-Nov-23 16:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cus_phone] [varchar](10) NULL,
	[foo_id] [varchar](10) NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 05-Nov-23 16:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cat_id] [varchar](10) NOT NULL,
	[cat_name] [nvarchar](20) NOT NULL,
	[cat_status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 05-Nov-23 16:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[cus_phone] [varchar](10) NOT NULL,
	[cus_name] [nvarchar](50) NOT NULL,
	[cus_password] [varchar](32) NOT NULL,
	[cus_email] [varchar](50) NOT NULL,
	[cus_address] [nvarchar](50) NOT NULL,
	[cus_birthday] [date] NOT NULL,
	[cus_create] [date] NOT NULL,
	[cus_status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cus_phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 05-Nov-23 16:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[emp_phone] [varchar](10) NOT NULL,
	[emp_name] [nvarchar](50) NOT NULL,
	[emp_password] [varchar](32) NOT NULL,
	[emp_email] [varchar](50) NOT NULL,
	[emp_address] [nvarchar](50) NOT NULL,
	[emp_birthday] [date] NOT NULL,
	[emp_create] [date] NOT NULL,
	[emp_status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 05-Nov-23 16:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[foo_id] [varchar](10) NOT NULL,
	[cat_id] [varchar](10) NOT NULL,
	[foo_name] [nvarchar](50) NOT NULL,
	[foo_price] [decimal](10, 2) NOT NULL,
	[foo_sale] [decimal](10, 2) NOT NULL,
	[foo_description] [nvarchar](200) NOT NULL,
	[foo_status] [varchar](10) NOT NULL,
	[foo_img] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[foo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 05-Nov-23 16:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 05-Nov-23 16:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ord_id] [varchar](10) NOT NULL,
	[cus_phone] [varchar](10) NOT NULL,
	[emp_phone] [varchar](10) NULL,
	[ord_date] [date] NOT NULL,
	[ord_type] [varchar](10) NOT NULL,
	[ord_status] [varchar](10) NOT NULL,
	[ord_pay] [varchar](7) NOT NULL,
	[ord_note] [nvarchar](200) NOT NULL,
	[ord_total] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ord_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 05-Nov-23 16:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ord_id] [varchar](10) NULL,
	[foo_id] [varchar](10) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([cat_id], [cat_name], [cat_status]) VALUES (N'CAT001', N'Noodle', N'Available')
INSERT [dbo].[Category] ([cat_id], [cat_name], [cat_status]) VALUES (N'CAT002', N'Chicken', N'Available')
INSERT [dbo].[Category] ([cat_id], [cat_name], [cat_status]) VALUES (N'CAT003', N'Bread', N'Available')
INSERT [dbo].[Category] ([cat_id], [cat_name], [cat_status]) VALUES (N'CAT004', N'Side Dish', N'Available')
INSERT [dbo].[Category] ([cat_id], [cat_name], [cat_status]) VALUES (N'CAT005', N'Drink', N'Available')
INSERT [dbo].[Category] ([cat_id], [cat_name], [cat_status]) VALUES (N'CAT006', N'Rice', N'Available')
INSERT [dbo].[Category] ([cat_id], [cat_name], [cat_status]) VALUES (N'CAT007', N'Combo', N'Available')
GO
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456780', N'Sophia Clark', N'87E897E3B54A405DA144968B2CA19B45', N'cus10@gmail.com', N'777 Cedar St, Parkville', CAST(N'1996-01-03' AS Date), CAST(N'2023-09-25' AS Date), N'Deleted')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456781', N'Ethan Harris', N'5D69DD95AC183C9643780ED7027D128A', N'cus9@gmail.com', N'666 Fir St, Riverside', CAST(N'1994-04-05' AS Date), CAST(N'2023-10-19' AS Date), N'Deleted')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456782', N'Ava Martinez', N'B25EF06BE3B6948C0BC431DA46C2C738', N'cus8@gmail.com', N'555 Redwood St, Lakeside', CAST(N'1987-06-08' AS Date), CAST(N'2023-05-05' AS Date), N'Blocked')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456783', N'James Taylor', N'00CDB7BB942CF6B290CEB97D6ACA64A3', N'cus7@gmail.com', N'444 Birch St, Mountainview', CAST(N'1991-08-18' AS Date), CAST(N'2023-03-01' AS Date), N'Available')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456784', N'Olivia Brown', N'218DD27AEBECCECAE69AD8408D9A36BF', N'cus6@gmail.com', N'333 Cedar St, Hillside', CAST(N'1993-07-12' AS Date), CAST(N'2023-02-19' AS Date), N'Blocked')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456785', N'Daniel Lee', N'DB0EDD04AAAC4506F7EDAB03AC855D56', N'cus5@gmail.com', N'222 Pine St, Forestville', CAST(N'1992-03-25' AS Date), CAST(N'2023-11-04' AS Date), N'Available')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456786', N'Emily Wilson', N'34CC93ECE0BA9E3F6F235D4AF979B16C', N'cus4@gmail.com', N'101 Maple St, Hamletown', CAST(N'1988-11-30' AS Date), CAST(N'2023-01-20' AS Date), N'Available')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456787', N'Michael Davis', N'819B0643D6B89DC9B579FDFC9094F28E', N'cus3@gmail.com', N'789 Oak St, Villageton', CAST(N'1995-02-10' AS Date), CAST(N'2023-10-15' AS Date), N'Available')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456788', N'Sarah Johnson', N'6CB75F652A9B52798EB6CF2201057C73', N'cus2@gmail.com', N'456 Elm St, Townsville', CAST(N'1985-09-20' AS Date), CAST(N'2023-09-11' AS Date), N'Available')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456789', N'John Smith', N'5F4DCC3B5AA765D61D8327DEB882CF99', N'khanhnguyennguyen2003@gmail.com', N'123 Main St, Cityville', CAST(N'1990-05-15' AS Date), CAST(N'2023-10-15' AS Date), N'Blocked')
GO
INSERT [dbo].[Employee] ([emp_phone], [emp_name], [emp_password], [emp_email], [emp_address], [emp_birthday], [emp_create], [emp_status]) VALUES (N'0987654321', N'David Anderson', N'7C6A180B36896A0A8C02787EEAFB0E4C', N'khanhnguyennguyen2003@gmail.com', N'1234 Employee St, Stafftown', CAST(N'1980-04-22' AS Date), CAST(N'2022-09-25' AS Date), N'Available')
INSERT [dbo].[Employee] ([emp_phone], [emp_name], [emp_password], [emp_email], [emp_address], [emp_birthday], [emp_create], [emp_status]) VALUES (N'0987654322', N'Jennifer White', N'6CB75F652A9B52798EB6CF2201057C73', N'emp1@gmail.com', N'5678 Worker St, Laborville', CAST(N'1982-08-15' AS Date), CAST(N'2022-09-25' AS Date), N'Available')
INSERT [dbo].[Employee] ([emp_phone], [emp_name], [emp_password], [emp_email], [emp_address], [emp_birthday], [emp_create], [emp_status]) VALUES (N'0987654323', N'Robert Martin', N'819B0643D6B89DC9B579FDFC9094F28E', N'emp2@gmail.com', N'9876 Staff St, Employeeville', CAST(N'1975-11-10' AS Date), CAST(N'2022-09-25' AS Date), N'Available')
INSERT [dbo].[Employee] ([emp_phone], [emp_name], [emp_password], [emp_email], [emp_address], [emp_birthday], [emp_create], [emp_status]) VALUES (N'0987654324', N'Mary Wilson', N'34CC93ECE0BA9E3F6F235D4AF979B16C', N'emp3@gmail.com', N'5420 Service St, Serviceton', CAST(N'1983-02-28' AS Date), CAST(N'2022-09-25' AS Date), N'Available')
INSERT [dbo].[Employee] ([emp_phone], [emp_name], [emp_password], [emp_email], [emp_address], [emp_birthday], [emp_create], [emp_status]) VALUES (N'0987654325', N'Richard Brown', N'DB0EDD04AAAC4506F7EDAB03AC855D56', N'emp4@gmail.com', N'8765 Crew St, Workville', CAST(N'1978-07-07' AS Date), CAST(N'2022-09-25' AS Date), N'Deleted')
INSERT [dbo].[Employee] ([emp_phone], [emp_name], [emp_password], [emp_email], [emp_address], [emp_birthday], [emp_create], [emp_status]) VALUES (N'0', N'', N'', N'', N'', CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date), N'Deleted')
GO
INSERT [dbo].[Food] ([foo_id], [cat_id], [foo_name], [foo_price], [foo_sale], [foo_description], [foo_status], [foo_img]) VALUES (N'FOOD001', N'CAT004', N'Salad', CAST(0.24 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Fresh and healthy salad with a variety of ingredients', N'Available', N'https://i.ibb.co/4ST0XCZ/Salad.png')
INSERT [dbo].[Food] ([foo_id], [cat_id], [foo_name], [foo_price], [foo_sale], [foo_description], [foo_status], [foo_img]) VALUES (N'FOOD002', N'CAT003', N'Kebab', CAST(1.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Grilled kebab served with pita bread and sauce', N'Available', N'https://i.ibb.co/MscZLfn/Kebab.png')
INSERT [dbo].[Food] ([foo_id], [cat_id], [foo_name], [foo_price], [foo_sale], [foo_description], [foo_status], [foo_img]) VALUES (N'FOOD003', N'CAT001', N'Italian Pasta', CAST(2.49 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), N'Delicious Italian pasta with your choice of sauce', N'Available', N'https://i.ibb.co/zxnNz2h/Pasta.png')
INSERT [dbo].[Food] ([foo_id], [cat_id], [foo_name], [foo_price], [foo_sale], [foo_description], [foo_status], [foo_img]) VALUES (N'FOOD004', N'CAT002', N'Fried Chicken Wings', CAST(3.49 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), N'Crispy fried chicken wings with your choice of sauce', N'Available', N'https://i.ibb.co/jzLLJkq/Chicken-Wings.png')
INSERT [dbo].[Food] ([foo_id], [cat_id], [foo_name], [foo_price], [foo_sale], [foo_description], [foo_status], [foo_img]) VALUES (N'FOOD005', N'CAT002', N'Fried Chicken Drumsticks', CAST(3.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Crispy fried chicken drumsticks with your choice of sauce', N'Available', N'https://i.ibb.co/cXwkt1L/Chicken-Drumstick.png')
INSERT [dbo].[Food] ([foo_id], [cat_id], [foo_name], [foo_price], [foo_sale], [foo_description], [foo_status], [foo_img]) VALUES (N'FOOD006', N'CAT003', N'Egg Banh Mi', CAST(1.49 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Delicious egg sandwich with fresh ingredients', N'Available', N'https://i.ibb.co/xDnxGBX/Egg-Banh-Mi.png')
INSERT [dbo].[Food] ([foo_id], [cat_id], [foo_name], [foo_price], [foo_sale], [foo_description], [foo_status], [foo_img]) VALUES (N'FOOD007', N'CAT003', N'Meat Banh Mi', CAST(1.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Hearty meat sandwich with a variety of fillings', N'Available', N'https://i.ibb.co/zNtW5wN/Meat-Banh-Mi.png')
INSERT [dbo].[Food] ([foo_id], [cat_id], [foo_name], [foo_price], [foo_sale], [foo_description], [foo_status], [foo_img]) VALUES (N'FOOD008', N'CAT004', N'French Fries', CAST(0.99 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), N'Golden and crispy french fries with ketchup', N'Available', N'https://i.ibb.co/yyvfzsN/French-Fries.png')
INSERT [dbo].[Food] ([foo_id], [cat_id], [foo_name], [foo_price], [foo_sale], [foo_description], [foo_status], [foo_img]) VALUES (N'FOOD009', N'CAT003', N'Hamburger', CAST(2.49 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), N'Delicious hamburger with your choice of toppings', N'Available', N'https://i.ibb.co/Nm3BsQt/Hamburger.png')
INSERT [dbo].[Food] ([foo_id], [cat_id], [foo_name], [foo_price], [foo_sale], [foo_description], [foo_status], [foo_img]) VALUES (N'FOOD010', N'CAT006', N'Xoi Man', CAST(0.99 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), N'Sticky rice with a variety of toppings', N'Available', N'https://i.ibb.co/ydX8vbb/XoiMan.png')
INSERT [dbo].[Food] ([foo_id], [cat_id], [foo_name], [foo_price], [foo_sale], [foo_description], [foo_status], [foo_img]) VALUES (N'FOOD011', N'CAT003', N'Toco', CAST(2.49 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), N'Toco Toco', N'Available', N'https://i.ibb.co/kKxPFRy/Toco.png')
INSERT [dbo].[Food] ([foo_id], [cat_id], [foo_name], [foo_price], [foo_sale], [foo_description], [foo_status], [foo_img]) VALUES (N'FOOD012', N'CAT005', N'Pepsi', CAST(0.49 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), N'Classic Pepsi soda', N'Available', N'https://i.ibb.co/8r2cnDh/Pepsi.png')
INSERT [dbo].[Food] ([foo_id], [cat_id], [foo_name], [foo_price], [foo_sale], [foo_description], [foo_status], [foo_img]) VALUES (N'FOOD013', N'CAT005', N'Coca-Cola', CAST(0.49 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Classic Coca-Cola soda', N'Available', N'https://i.ibb.co/G7jBD5M/CocaCola.png')
INSERT [dbo].[Food] ([foo_id], [cat_id], [foo_name], [foo_price], [foo_sale], [foo_description], [foo_status], [foo_img]) VALUES (N'FOOD014', N'CAT005', N'7UP', CAST(0.49 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Refreshing 7UP soda', N'Available', N'https://i.ibb.co/sVSMXJs/7up.png')
INSERT [dbo].[Food] ([foo_id], [cat_id], [foo_name], [foo_price], [foo_sale], [foo_description], [foo_status], [foo_img]) VALUES (N'FOOD015', N'CAT005', N'Fanta', CAST(0.49 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Fruity Fanta soda', N'Sold Out', N'https://i.ibb.co/9wxKxXW/Fanta.png')
INSERT [dbo].[Food] ([foo_id], [cat_id], [foo_name], [foo_price], [foo_sale], [foo_description], [foo_status], [foo_img]) VALUES (N'FOOD016', N'CAT005', N'Milo', CAST(0.74 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), N'Delicious Milo chocolate drink', N'Available', N'https://i.ibb.co/m8d7Qft/Milo.png')
GO
INSERT [dbo].[Manager] ([username], [password]) VALUES (N'1', N'C4CA4238A0B923820DCC509A6F75849B')
INSERT [dbo].[Manager] ([username], [password]) VALUES (N'admin', N'5F4DCC3B5AA765D61D8327DEB882CF99')
GO
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000001', N'0123456789', N'0987654321', CAST(N'2023-10-18' AS Date), N'Delivery', N'Completed', N'COD', N'Deliver to the back entrance', CAST(4.22 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000002', N'0123456789', N'0987654322', CAST(N'2023-10-18' AS Date), N'Takeout', N'Completed', N'COD', N'Dont include any plastic cutlery', CAST(7.98 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000003', N'0123456788', N'0987654323', CAST(N'2023-10-19' AS Date), N'Delivery', N'Completed', N'COD', N'Please add extra ketchup packets', CAST(5.97 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000004', N'0123456788', N'0987654321', CAST(N'2023-10-19' AS Date), N'Takeout', N'Cancelled', N'COD', N'Deliver after 7 pm', CAST(2.17 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000005', N'0123456788', N'0987654324', CAST(N'2023-10-19' AS Date), N'Takeout', N'Rejected', N'COD', N'', CAST(2.88 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000006', N'0123456787', N'0987654325', CAST(N'2023-10-19' AS Date), N'Delivery', N'Completed', N'COD', N'', CAST(5.96 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000007', N'0123456787', N'0987654322', CAST(N'2023-10-19' AS Date), N'Takeout', N'Completed', N'COD', N'', CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000008', N'0123456787', N'0987654323', CAST(N'2023-10-20' AS Date), N'Takeout', N'Rejected', N'COD', N'Deliver after 5 pm', CAST(2.98 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000009', N'0123456786', N'0987654321', CAST(N'2023-10-20' AS Date), N'Takeout', N'Completed', N'Banking', N'', CAST(2.61 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000010', N'0123456785', N'0987654325', CAST(N'2023-10-20' AS Date), N'Delivery', N'Completed', N'COD', N'', CAST(0.98 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000011', N'0123456785', N'0987654324', CAST(N'2023-10-20' AS Date), N'Delivery', N'Completed', N'Banking', N'Nhanh nhanh', CAST(0.48 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000012', N'0123456784', N'0987654323', CAST(N'2023-10-20' AS Date), N'Takeout', N'Completed', N'COD', N'', CAST(6.91 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000013', N'0123456783', N'0987654321', CAST(N'2023-10-20' AS Date), N'Takeout', N'Waiting', N'COD', N'Dont include any plastic cutlery', CAST(2.45 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000014', N'0123456782', N'0987654324', CAST(N'2023-10-20' AS Date), N'Delivery', N'Waiting', N'Banking', N'', CAST(7.96 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000015', N'0123456780', N'0987654322', CAST(N'2023-10-20' AS Date), N'Delivery', N'Preparing', N'Banking', N'Dont include any plastic cutlery', CAST(1.20 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000016', N'0123456780', N'0987654325', CAST(N'2023-10-20' AS Date), N'Takeout', N'Completed', N'COD', N'', CAST(5.97 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000017', N'0123456780', N'0987654321', CAST(N'2023-10-20' AS Date), N'Takeout', N'Preparing', N'COD', N'Dont include any plastic cutlery', CAST(2.88 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000001', N'FOOD001', 1, CAST(0.24 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000001', N'FOOD002', 2, CAST(1.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000002', N'FOOD005', 2, CAST(3.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000003', N'FOOD007', 3, CAST(1.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000004', N'FOOD009', 1, CAST(2.17 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000005', N'FOOD010', 3, CAST(0.96 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000007', N'FOOD003', 2, CAST(2.37 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000007', N'FOOD004', 3, CAST(3.42 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000006', N'FOOD006', 4, CAST(1.49 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000008', N'FOOD006', 2, CAST(1.49 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000009', N'FOOD008', 3, CAST(0.87 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000010', N'FOOD013', 2, CAST(0.49 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000011', N'FOOD012', 1, CAST(0.48 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000012', N'FOOD016', 2, CAST(0.73 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000012', N'FOOD015', 3, CAST(0.49 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000012', N'FOOD002', 2, CAST(1.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000013', N'FOOD014', 5, CAST(0.49 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000014', N'FOOD007', 4, CAST(1.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000015', N'FOOD001', 5, CAST(0.24 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000016', N'FOOD002', 3, CAST(1.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [foo_id], [quantity], [price]) VALUES (N'ORD0000017', N'FOOD010', 3, CAST(0.96 AS Decimal(10, 2)))
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([cus_phone])
REFERENCES [dbo].[Customer] ([cus_phone])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([foo_id])
REFERENCES [dbo].[Food] ([foo_id])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([cat_id])
REFERENCES [dbo].[Category] ([cat_id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([cus_phone])
REFERENCES [dbo].[Customer] ([cus_phone])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([emp_phone])
REFERENCES [dbo].[Employee] ([emp_phone])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([foo_id])
REFERENCES [dbo].[Food] ([foo_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ord_id])
REFERENCES [dbo].[Order] ([ord_id])
GO
/****** Object:  Trigger [dbo].[FoodStatusUpdateTrigger]    Script Date: 05-Nov-23 16:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[FoodStatusUpdateTrigger]
ON [dbo].[Food]
AFTER UPDATE
AS
BEGIN
    IF UPDATE(foo_status)
    BEGIN
        -- Xóa foo_id từ bảng Cart khi foo_status trong bảng Food là 'Sold Out' hoặc 'Deleted'
        DELETE FROM Cart
        WHERE foo_id IN (
            SELECT d.foo_id
            FROM deleted AS d
            INNER JOIN inserted AS i ON d.foo_id = i.foo_id
            WHERE i.foo_status IN ('Sold Out', 'Deleted')
        );
    END
END;
GO
ALTER TABLE [dbo].[Food] ENABLE TRIGGER [FoodStatusUpdateTrigger]
GO
USE [master]
GO
ALTER DATABASE [CampusMunchies] SET  READ_WRITE 
GO
