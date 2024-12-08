USE [master]
GO
/****** Object:  Database [iNUPCO]    Script Date: 12/8/2024 6:26:46 PM ******/
CREATE DATABASE [iNUPCO];
GO
ALTER DATABASE [iNUPCO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [iNUPCO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [iNUPCO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [iNUPCO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [iNUPCO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [iNUPCO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [iNUPCO] SET ARITHABORT OFF 
GO
ALTER DATABASE [iNUPCO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [iNUPCO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [iNUPCO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [iNUPCO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [iNUPCO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [iNUPCO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [iNUPCO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [iNUPCO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [iNUPCO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [iNUPCO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [iNUPCO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [iNUPCO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [iNUPCO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [iNUPCO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [iNUPCO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [iNUPCO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [iNUPCO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [iNUPCO] SET RECOVERY FULL 
GO
ALTER DATABASE [iNUPCO] SET  MULTI_USER 
GO
ALTER DATABASE [iNUPCO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [iNUPCO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [iNUPCO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [iNUPCO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [iNUPCO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [iNUPCO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'iNUPCO', N'ON'
GO
ALTER DATABASE [iNUPCO] SET QUERY_STORE = OFF
GO
USE [iNUPCO]
GO
/****** Object:  User [wa]    Script Date: 12/8/2024 6:26:46 PM ******/
CREATE USER [wa] FOR LOGIN [wa] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sa1]    Script Date: 12/8/2024 6:26:46 PM ******/
CREATE USER [sa1] FOR LOGIN [sa1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Good]    Script Date: 12/8/2024 6:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Good](
	[Good_Code] [int] IDENTITY(1,1) NOT NULL,
	[Good_Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Good] PRIMARY KEY CLUSTERED 
(
	[Good_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PODocument]    Script Date: 12/8/2024 6:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PODocument](
	[PO_Number] [int] NOT NULL,
	[PO_Date] [datetime] NOT NULL,
	[PO_TotalAmount] [decimal](18, 3) NOT NULL,
	[PO_State] [int] NOT NULL,
	[PO_IsHolded] [bit] NOT NULL,
 CONSTRAINT [PK_PODocument] PRIMARY KEY CLUSTERED 
(
	[PO_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PODocument_Item]    Script Date: 12/8/2024 6:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PODocument_Item](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PODocument_Number] [int] NOT NULL,
	[Good_Code] [int] NOT NULL,
	[SerialNumber] [int] NOT NULL,
	[PurchasedGoodPrice] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_PODocument_Item] PRIMARY KEY CLUSTERED 
(
	[PODocument_Number] ASC,
	[Good_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SHO]    Script Date: 12/8/2024 6:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHO](
	[SHO_Number] [int] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[PalletCount] [int] NOT NULL,
	[PODocument_Number] [int] NOT NULL,
 CONSTRAINT [PK_SHO] PRIMARY KEY CLUSTERED 
(
	[SHO_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Good] ON 
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (1, N'Product 1')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (2, N'Product 2')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (3, N'Product 3')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (4, N'Product 4')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (5, N'Product 5')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (6, N'Product 6')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (7, N'Product 7')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (8, N'Product 8')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (9, N'Product 9')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (10, N'Product 10')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (11, N'Product 11')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (12, N'Product 12')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (13, N'Product 13')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (14, N'Product 14')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (15, N'Product 15')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (16, N'Product 16')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (17, N'Product 17')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (18, N'Product 18')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (19, N'Product 19')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (20, N'Product 20')
GO
INSERT [dbo].[Good] ([Good_Code], [Good_Name]) VALUES (21, N'Product 21')
GO
SET IDENTITY_INSERT [dbo].[Good] OFF
GO
INSERT [dbo].[PODocument] ([PO_Number], [PO_Date], [PO_TotalAmount], [PO_State], [PO_IsHolded]) VALUES (-337955593, CAST(N'2024-12-08T12:50:39.670' AS DateTime), CAST(120.000 AS Decimal(18, 3)), 0, 1)
GO
SET IDENTITY_INSERT [dbo].[PODocument_Item] ON 
GO
INSERT [dbo].[PODocument_Item] ([ID], [PODocument_Number], [Good_Code], [SerialNumber], [PurchasedGoodPrice]) VALUES (2, -337955593, 21, 1, CAST(5.000 AS Decimal(18, 3)))
GO
SET IDENTITY_INSERT [dbo].[PODocument_Item] OFF
GO
/****** Object:  Index [IX_SHO]    Script Date: 12/8/2024 6:26:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_SHO] ON [dbo].[SHO]
(
	[SHO_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PODocument] ADD  CONSTRAINT [DF_PODocument_PO_Date]  DEFAULT (getdate()) FOR [PO_Date]
GO
ALTER TABLE [dbo].[PODocument] ADD  CONSTRAINT [DF_PODocument_PO_State]  DEFAULT ((0)) FOR [PO_State]
GO
ALTER TABLE [dbo].[PODocument] ADD  CONSTRAINT [DF_PODocument_PO_IsHolded]  DEFAULT ((0)) FOR [PO_IsHolded]
GO
ALTER TABLE [dbo].[PODocument_Item]  WITH CHECK ADD  CONSTRAINT [FK_PODocument_Item_Good] FOREIGN KEY([Good_Code])
REFERENCES [dbo].[Good] ([Good_Code])
GO
ALTER TABLE [dbo].[PODocument_Item] CHECK CONSTRAINT [FK_PODocument_Item_Good]
GO
ALTER TABLE [dbo].[PODocument_Item]  WITH CHECK ADD  CONSTRAINT [FK_PODocument_Item_PODocument] FOREIGN KEY([PODocument_Number])
REFERENCES [dbo].[PODocument] ([PO_Number])
GO
ALTER TABLE [dbo].[PODocument_Item] CHECK CONSTRAINT [FK_PODocument_Item_PODocument]
GO
ALTER TABLE [dbo].[SHO]  WITH CHECK ADD  CONSTRAINT [FK_SHO_PODocument] FOREIGN KEY([PODocument_Number])
REFERENCES [dbo].[PODocument] ([PO_Number])
GO
ALTER TABLE [dbo].[SHO] CHECK CONSTRAINT [FK_SHO_PODocument]
GO
USE [master]
GO
ALTER DATABASE [iNUPCO] SET  READ_WRITE 
GO
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (2, '2024-02-18', 21, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (3, '2024-05-11', 70, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (4, '2024-05-08', 12, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (5, '2024-08-26', 62, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (6, '2024-11-28', 92, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (7, '2024-10-22', 55, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (8, '2024-08-26', 97, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (9, '2024-08-20', 74, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (10, '2024-07-19', 13, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (11, '2024-09-14', 6, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (12, '2024-04-10', 90, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (13, '2023-12-20', 7, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (14, '2024-10-04', 52, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (15, '2023-12-27', 83, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (16, '2024-06-09', 18, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (17, '2024-04-11', 26, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (18, '2023-12-20', 98, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (19, '2024-05-05', 27, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (20, '2024-11-19', 17, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (21, '2024-07-09', 32, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (22, '2024-10-08', 63, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (23, '2024-04-15', 76, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (24, '2024-03-07', 20, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (25, '2024-05-05', 48, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (26, '2024-11-30', 41, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (27, '2024-03-20', 43, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (28, '2023-12-26', 28, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (29, '2024-08-16', 47, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (30, '2024-03-09', 81, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (31, '2024-02-29', 52, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (32, '2024-04-08', 52, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (33, '2024-09-04', 14, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (34, '2024-04-30', 64, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (35, '2024-04-03', 38, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (36, '2024-12-07', 39, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (37, '2023-12-28', 40, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (38, '2024-12-04', 21, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (39, '2024-11-12', 85, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (40, '2024-02-13', 4, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (41, '2024-04-01', 85, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (42, '2024-09-13', 29, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (43, '2023-12-31', 93, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (44, '2024-09-16', 48, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (45, '2024-04-04', 86, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (46, '2024-03-14', 75, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (47, '2024-03-21', 94, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (48, '2024-08-02', 64, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (49, '2024-01-19', 40, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (50, '2024-09-06', 21, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (51, '2024-03-17', 77, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (52, '2024-09-08', 90, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (53, '2023-12-17', 80, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (54, '2024-07-27', 30, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (55, '2024-03-03', 70, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (56, '2024-03-12', 79, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (57, '2024-03-07', 56, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (58, '2024-11-13', 83, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (59, '2024-04-15', 50, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (60, '2024-03-11', 95, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (61, '2024-10-18', 96, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (62, '2024-04-19', 63, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (63, '2024-08-22', 13, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (64, '2023-12-17', 23, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (65, '2024-06-30', 94, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (66, '2024-05-19', 77, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (67, '2024-03-14', 5, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (68, '2024-10-01', 59, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (69, '2024-09-02', 58, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (70, '2024-08-20', 35, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (71, '2024-04-11', 84, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (72, '2024-09-26', 50, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (73, '2024-01-27', 19, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (74, '2024-04-11', 95, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (75, '2024-11-07', 4, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (76, '2024-10-01', 65, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (77, '2024-07-21', 24, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (78, '2024-05-13', 45, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (79, '2024-10-10', 87, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (80, '2024-03-27', 34, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (81, '2024-11-19', 31, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (82, '2024-06-25', 67, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (83, '2024-04-19', 21, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (84, '2024-09-28', 67, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (85, '2023-12-15', 38, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (86, '2024-04-29', 38, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (87, '2024-02-15', 53, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (88, '2024-09-12', 91, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (89, '2024-05-16', 33, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (90, '2024-06-30', 5, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (91, '2024-01-30', 5, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (92, '2024-02-20', 63, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (93, '2024-07-15', 18, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (94, '2024-04-07', 43, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (95, '2024-11-21', 17, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (96, '2024-04-01', 56, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (97, '2024-04-09', 36, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (98, '2024-06-14', 50, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (99, '2024-02-13', 17, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (100, '2024-06-07', 69, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (101, '2024-08-06', 53, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (102, '2024-02-04', 75, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (103, '2024-06-13', 68, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (104, '2024-09-18', 47, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (105, '2024-05-06', 12, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (106, '2023-12-24', 50, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (107, '2024-08-15', 32, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (108, '2024-04-26', 56, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (109, '2024-01-27', 7, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (110, '2024-09-17', 21, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (111, '2024-10-29', 38, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (112, '2024-03-31', 50, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (113, '2024-11-14', 86, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (114, '2024-04-07', 46, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (115, '2024-07-30', 32, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (116, '2024-05-11', 14, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (117, '2024-07-22', 6, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (118, '2024-06-25', 16, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (119, '2024-10-03', 24, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (120, '2024-10-04', 86, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (121, '2024-03-28', 17, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (122, '2024-06-27', 68, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (123, '2023-12-10', 12, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (124, '2024-09-03', 74, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (125, '2023-12-15', 39, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (126, '2024-06-16', 15, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (127, '2024-03-25', 7, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (128, '2024-09-11', 26, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (129, '2024-09-10', 49, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (130, '2024-06-27', 8, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (131, '2024-06-17', 39, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (132, '2023-12-15', 67, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (133, '2024-10-03', 19, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (134, '2024-01-17', 47, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (135, '2024-09-16', 33, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (136, '2024-05-15', 47, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (137, '2024-08-21', 26, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (138, '2024-05-18', 1, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (139, '2024-09-03', 43, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (140, '2024-04-27', 69, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (141, '2024-03-01', 33, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (142, '2024-08-16', 16, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (143, '2023-12-13', 89, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (144, '2024-04-08', 21, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (145, '2024-05-02', 50, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (146, '2024-12-04', 25, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (147, '2024-04-03', 67, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (148, '2024-10-15', 86, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (149, '2023-12-15', 68, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (150, '2024-02-01', 38, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (151, '2024-03-06', 66, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (152, '2024-04-17', 49, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (153, '2023-12-09', 50, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (154, '2024-01-10', 23, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (155, '2024-05-04', 79, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (156, '2024-09-06', 51, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (157, '2024-03-06', 54, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (158, '2024-08-26', 86, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (159, '2024-08-16', 5, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (160, '2024-08-27', 38, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (161, '2024-01-27', 88, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (162, '2024-07-14', 80, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (163, '2024-09-24', 53, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (164, '2024-09-10', 89, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (165, '2024-06-09', 18, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (166, '2024-10-05', 71, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (167, '2024-03-13', 84, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (168, '2024-07-25', 94, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (169, '2024-02-22', 99, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (170, '2024-07-28', 82, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (171, '2024-06-22', 88, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (172, '2024-12-07', 10, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (173, '2024-06-19', 78, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (174, '2024-09-11', 42, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (175, '2024-06-13', 62, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (176, '2024-06-08', 10, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (177, '2024-04-26', 64, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (178, '2024-04-03', 78, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (179, '2024-03-27', 38, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (180, '2024-09-25', 8, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (181, '2024-07-04', 14, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (182, '2024-03-16', 27, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (183, '2024-05-09', 5, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (184, '2024-06-17', 43, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (185, '2024-02-22', 98, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (186, '2024-10-12', 38, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (187, '2024-10-12', 41, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (188, '2024-10-11', 14, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (189, '2024-01-25', 76, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (190, '2024-03-18', 45, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (191, '2024-07-19', 57, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (192, '2024-11-11', 8, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (193, '2024-03-07', 6, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (194, '2024-08-20', 20, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (195, '2024-03-06', 89, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (196, '2024-11-18', 35, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (197, '2024-04-08', 36, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (198, '2024-09-13', 55, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (199, '2024-01-02', 32, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (200, '2024-07-12', 40, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (201, '2023-12-08', 52, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (202, '2024-11-06', 77, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (203, '2023-12-22', 89, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (204, '2024-08-28', 12, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (205, '2024-03-17', 72, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (206, '2024-01-24', 2, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (207, '2024-10-14', 14, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (208, '2024-03-02', 47, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (209, '2024-10-03', 76, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (210, '2024-04-09', 65, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (211, '2024-10-28', 37, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (212, '2024-05-30', 47, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (213, '2024-04-03', 24, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (214, '2024-03-19', 51, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (215, '2024-09-05', 47, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (216, '2024-11-30', 3, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (217, '2024-07-14', 61, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (218, '2024-02-23', 29, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (219, '2024-02-27', 42, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (220, '2024-04-21', 68, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (221, '2024-08-07', 26, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (222, '2024-09-25', 46, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (223, '2024-08-06', 31, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (224, '2024-05-16', 3, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (225, '2024-03-20', 23, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (226, '2024-05-24', 7, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (227, '2024-01-18', 48, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (228, '2024-01-18', 68, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (229, '2024-04-24', 66, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (230, '2024-01-09', 28, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (231, '2024-02-27', 95, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (232, '2024-10-27', 81, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (233, '2024-01-29', 84, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (234, '2024-05-31', 85, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (235, '2024-05-13', 53, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (236, '2024-09-03', 10, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (237, '2024-08-26', 9, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (238, '2024-08-06', 32, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (239, '2024-07-27', 36, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (240, '2024-06-21', 81, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (241, '2024-07-24', 65, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (242, '2024-11-25', 18, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (243, '2024-07-27', 91, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (244, '2024-08-27', 42, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (245, '2024-04-10', 19, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (246, '2024-04-01', 70, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (247, '2024-01-05', 64, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (248, '2024-03-22', 17, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (249, '2024-03-25', 85, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (250, '2024-05-08', 31, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (251, '2024-11-30', 92, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (252, '2024-10-08', 53, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (253, '2024-09-14', 19, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (254, '2024-11-25', 84, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (255, '2024-06-17', 2, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (256, '2024-06-17', 22, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (257, '2024-11-03', 47, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (258, '2024-10-10', 61, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (259, '2024-01-01', 49, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (260, '2024-06-06', 61, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (261, '2024-11-28', 46, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (262, '2024-01-08', 57, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (263, '2024-08-29', 43, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (264, '2023-12-31', 52, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (265, '2024-06-26', 57, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (266, '2024-04-10', 41, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (267, '2023-12-18', 50, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (268, '2024-03-15', 88, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (269, '2024-11-17', 48, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (270, '2024-07-23', 25, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (271, '2023-12-26', 61, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (272, '2024-06-30', 95, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (273, '2024-05-22', 92, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (274, '2024-07-08', 66, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (275, '2024-06-30', 18, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (276, '2023-12-14', 72, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (277, '2024-09-03', 9, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (278, '2023-12-31', 12, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (279, '2024-09-27', 43, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (280, '2024-06-01', 49, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (281, '2024-09-22', 30, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (282, '2024-05-07', 9, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (283, '2024-08-09', 39, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (284, '2024-09-25', 66, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (285, '2024-10-04', 46, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (286, '2024-01-16', 15, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (287, '2024-05-23', 80, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (288, '2024-06-10', 86, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (289, '2024-10-21', 25, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (290, '2024-06-06', 53, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (291, '2024-03-10', 8, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (292, '2024-06-10', 92, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (293, '2024-11-25', 99, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (294, '2024-05-14', 98, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (295, '2024-02-22', 98, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (296, '2024-01-26', 93, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (297, '2023-12-31', 5, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (298, '2024-01-17', 17, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (299, '2024-07-13', 13, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (300, '2024-07-31', 56, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (301, '2024-06-26', 54, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (302, '2024-02-25', 57, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (303, '2024-09-25', 53, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (304, '2024-07-14', 100, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (305, '2024-09-16', 55, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (306, '2024-06-27', 98, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (307, '2024-03-03', 80, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (308, '2024-05-08', 26, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (309, '2024-10-17', 12, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (310, '2024-03-26', 51, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (311, '2024-05-09', 81, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (312, '2024-06-15', 70, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (313, '2024-11-07', 99, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (314, '2024-03-10', 24, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (315, '2024-10-18', 95, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (316, '2024-06-28', 68, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (317, '2024-07-30', 42, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (318, '2024-06-28', 61, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (319, '2024-09-24', 72, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (320, '2024-09-17', 4, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (321, '2024-03-09', 81, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (322, '2024-03-04', 36, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (323, '2024-11-11', 11, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (324, '2024-01-03', 27, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (325, '2024-10-21', 79, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (326, '2024-09-29', 91, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (327, '2024-08-29', 27, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (328, '2024-03-01', 45, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (329, '2024-05-20', 94, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (330, '2024-11-18', 65, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (331, '2024-11-27', 45, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (332, '2024-01-12', 4, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (333, '2024-07-05', 14, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (334, '2024-09-03', 87, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (335, '2024-02-03', 9, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (336, '2024-09-29', 55, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (337, '2024-02-03', 21, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (338, '2024-07-09', 95, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (339, '2024-02-13', 74, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (340, '2023-12-19', 99, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (341, '2024-02-09', 82, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (342, '2024-01-15', 11, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (343, '2024-05-30', 79, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (344, '2024-07-13', 81, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (345, '2024-08-29', 51, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (346, '2024-02-03', 17, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (347, '2024-03-06', 58, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (348, '2024-09-29', 85, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (349, '2024-06-17', 10, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (350, '2023-12-16', 40, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (351, '2024-09-09', 93, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (352, '2024-02-20', 10, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (353, '2024-08-08', 3, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (354, '2024-11-20', 72, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (355, '2024-12-07', 55, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (356, '2024-09-06', 11, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (357, '2024-11-05', 62, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (358, '2024-02-01', 21, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (359, '2024-05-26', 88, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (360, '2024-03-28', 50, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (361, '2024-06-10', 95, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (362, '2024-04-15', 99, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (363, '2024-03-30', 24, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (364, '2024-07-30', 68, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (365, '2024-11-07', 62, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (366, '2024-10-30', 17, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (367, '2024-01-30', 82, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (368, '2024-05-02', 17, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (369, '2024-03-31', 65, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (370, '2024-11-15', 73, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (371, '2023-12-12', 54, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (372, '2024-01-18', 15, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (373, '2024-09-12', 23, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (374, '2024-05-16', 5, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (375, '2024-11-14', 19, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (376, '2024-09-18', 35, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (377, '2024-10-25', 78, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (378, '2024-11-09', 66, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (379, '2023-12-19', 12, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (380, '2024-09-26', 76, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (381, '2024-05-08', 44, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (382, '2024-10-23', 56, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (383, '2024-06-10', 11, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (384, '2024-06-10', 51, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (385, '2024-07-26', 52, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (386, '2024-12-04', 10, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (387, '2023-12-13', 64, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (388, '2024-11-08', 34, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (389, '2024-06-10', 28, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (390, '2024-09-16', 22, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (391, '2024-12-06', 44, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (392, '2023-12-22', 60, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (393, '2024-02-20', 12, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (394, '2024-08-31', 65, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (395, '2024-08-31', 19, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (396, '2024-08-06', 58, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (397, '2024-06-24', 75, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (398, '2024-08-12', 75, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (399, '2024-06-13', 65, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (400, '2023-12-21', 54, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (401, '2024-03-08', 19, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (402, '2024-01-23', 40, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (403, '2024-01-25', 56, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (404, '2024-02-04', 35, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (405, '2024-09-07', 30, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (406, '2024-08-14', 65, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (407, '2024-01-31', 81, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (408, '2023-12-25', 63, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (409, '2024-05-13', 59, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (410, '2024-08-28', 9, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (411, '2024-03-11', 71, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (412, '2024-11-14', 23, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (413, '2024-08-17', 13, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (414, '2024-02-14', 43, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (415, '2024-10-02', 69, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (416, '2024-03-16', 41, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (417, '2024-10-11', 53, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (418, '2024-05-03', 98, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (419, '2024-06-06', 50, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (420, '2024-09-30', 96, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (421, '2024-06-14', 78, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (422, '2024-07-06', 67, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (423, '2024-09-21', 60, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (424, '2024-07-10', 40, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (425, '2023-12-28', 92, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (426, '2024-09-13', 42, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (427, '2024-01-02', 65, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (428, '2024-04-26', 41, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (429, '2024-06-22', 68, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (430, '2023-12-25', 86, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (431, '2024-03-11', 26, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (432, '2023-12-14', 48, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (433, '2024-03-22', 24, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (434, '2024-12-05', 16, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (435, '2024-04-30', 15, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (436, '2024-09-18', 63, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (437, '2024-11-14', 51, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (438, '2024-03-16', 63, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (439, '2024-03-05', 83, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (440, '2024-09-10', 76, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (441, '2024-08-11', 86, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (442, '2024-03-30', 11, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (443, '2023-12-11', 82, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (444, '2024-07-24', 57, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (445, '2024-01-23', 68, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (446, '2024-04-05', 54, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (447, '2024-01-26', 28, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (448, '2024-05-10', 45, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (449, '2024-08-05', 80, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (450, '2024-01-22', 73, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (451, '2024-05-22', 24, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (452, '2024-08-05', 99, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (453, '2024-07-17', 91, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (454, '2024-02-05', 13, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (455, '2024-11-12', 85, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (456, '2023-12-28', 39, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (457, '2024-05-07', 5, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (458, '2024-01-11', 73, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (459, '2024-09-28', 84, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (460, '2024-11-26', 35, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (461, '2024-04-05', 6, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (462, '2023-12-25', 30, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (463, '2024-05-24', 72, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (464, '2024-03-03', 67, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (465, '2024-08-13', 43, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (466, '2024-11-18', 21, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (467, '2024-10-09', 33, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (468, '2024-07-31', 1, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (469, '2024-06-30', 36, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (470, '2024-03-23', 96, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (471, '2023-12-21', 46, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (472, '2024-06-19', 41, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (473, '2024-10-28', 85, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (474, '2024-11-22', 90, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (475, '2024-06-30', 61, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (476, '2024-07-11', 36, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (477, '2024-08-08', 84, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (478, '2024-09-26', 68, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (479, '2024-08-09', 48, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (480, '2024-07-15', 60, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (481, '2024-06-03', 1, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (482, '2024-05-02', 83, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (483, '2024-06-11', 57, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (484, '2024-02-16', 90, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (485, '2024-03-15', 53, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (486, '2024-10-22', 37, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (487, '2024-08-13', 95, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (488, '2024-03-22', 12, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (489, '2024-08-31', 12, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (490, '2024-11-18', 48, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (491, '2024-03-09', 14, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (492, '2024-03-09', 65, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (493, '2024-06-13', 31, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (494, '2024-08-09', 42, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (495, '2024-06-20', 20, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (496, '2024-11-08', 59, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (497, '2024-03-18', 45, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (498, '2024-12-07', 78, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (499, '2024-04-12', 96, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (500, '2024-05-16', 45, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (501, '2024-08-08', 27, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (502, '2024-11-28', 53, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (503, '2024-04-13', 30, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (504, '2024-05-22', 77, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (505, '2024-09-22', 9, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (506, '2024-10-07', 90, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (507, '2024-04-09', 15, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (508, '2024-05-10', 21, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (509, '2024-08-30', 12, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (510, '2024-10-01', 96, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (511, '2024-08-23', 67, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (512, '2024-01-02', 49, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (513, '2024-02-17', 64, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (514, '2024-11-28', 55, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (515, '2024-05-25', 81, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (516, '2024-03-18', 94, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (517, '2024-09-13', 59, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (518, '2024-04-26', 75, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (519, '2024-07-02', 63, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (520, '2024-09-14', 25, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (521, '2024-02-28', 29, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (522, '2024-08-25', 16, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (523, '2024-03-15', 74, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (524, '2024-01-25', 91, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (525, '2024-06-04', 46, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (526, '2024-03-08', 49, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (527, '2024-01-29', 10, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (528, '2024-08-02', 5, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (529, '2024-06-06', 92, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (530, '2024-01-30', 27, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (531, '2024-09-05', 87, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (532, '2024-04-15', 55, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (533, '2024-08-19', 99, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (534, '2024-02-07', 61, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (535, '2024-10-27', 15, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (536, '2024-04-19', 50, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (537, '2024-07-08', 93, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (538, '2023-12-30', 68, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (539, '2024-01-05', 69, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (540, '2024-01-22', 53, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (541, '2024-05-15', 85, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (542, '2024-03-24', 25, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (543, '2024-01-18', 37, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (544, '2024-06-12', 100, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (545, '2024-08-28', 34, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (546, '2024-10-24', 72, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (547, '2023-12-22', 82, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (548, '2024-06-17', 37, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (549, '2024-11-02', 92, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (550, '2024-02-14', 70, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (551, '2024-07-31', 87, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (552, '2024-09-16', 83, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (553, '2024-02-16', 11, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (554, '2024-08-12', 20, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (555, '2024-01-07', 96, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (556, '2024-01-22', 21, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (557, '2024-02-21', 44, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (558, '2024-01-15', 25, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (559, '2024-11-18', 50, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (560, '2024-09-23', 81, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (561, '2024-11-28', 27, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (562, '2023-12-22', 99, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (563, '2024-10-10', 87, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (564, '2024-12-04', 81, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (565, '2024-06-23', 75, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (566, '2024-08-25', 34, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (567, '2024-04-18', 16, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (568, '2024-03-03', 16, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (569, '2024-04-26', 26, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (570, '2024-11-14', 66, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (571, '2023-12-22', 27, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (572, '2024-06-15', 93, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (573, '2024-08-21', 70, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (574, '2024-09-16', 32, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (575, '2024-08-23', 70, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (576, '2024-03-19', 89, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (577, '2024-11-11', 72, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (578, '2024-10-30', 2, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (579, '2024-06-23', 93, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (580, '2024-08-01', 71, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (581, '2024-05-08', 35, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (582, '2024-01-21', 29, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (583, '2024-08-10', 59, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (584, '2023-12-27', 84, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (585, '2024-10-29', 51, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (586, '2024-10-13', 94, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (587, '2024-05-18', 88, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (588, '2024-09-28', 51, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (589, '2024-07-27', 70, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (590, '2024-07-17', 74, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (591, '2024-11-12', 62, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (592, '2024-08-18', 10, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (593, '2024-04-17', 17, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (594, '2024-09-05', 10, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (595, '2024-10-26', 60, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (596, '2024-01-03', 21, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (597, '2024-05-03', 71, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (598, '2024-03-29', 65, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (599, '2024-03-31', 33, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (600, '2024-06-27', 32, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (601, '2024-06-01', 61, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (602, '2024-11-14', 34, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (603, '2024-10-22', 6, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (604, '2024-07-28', 81, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (605, '2024-08-29', 17, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (606, '2024-04-24', 96, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (607, '2024-04-04', 86, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (608, '2024-01-22', 9, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (609, '2024-10-01', 14, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (610, '2024-11-11', 33, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (611, '2024-10-27', 10, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (612, '2024-11-22', 84, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (613, '2024-03-09', 62, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (614, '2024-08-27', 28, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (615, '2024-10-27', 59, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (616, '2024-07-29', 46, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (617, '2024-04-14', 36, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (618, '2024-10-01', 63, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (619, '2024-10-07', 53, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (620, '2024-12-01', 81, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (621, '2024-09-22', 23, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (622, '2024-08-12', 39, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (623, '2024-05-10', 14, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (624, '2024-04-26', 35, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (625, '2023-12-17', 39, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (626, '2024-10-10', 58, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (627, '2024-09-16', 60, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (628, '2024-09-13', 42, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (629, '2024-05-22', 78, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (630, '2024-09-29', 25, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (631, '2024-04-05', 33, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (632, '2024-06-29', 29, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (633, '2024-10-22', 95, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (634, '2024-05-28', 68, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (635, '2024-04-08', 57, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (636, '2024-05-30', 76, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (637, '2024-04-30', 10, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (638, '2024-10-20', 44, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (639, '2024-05-17', 40, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (640, '2024-04-05', 28, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (641, '2024-10-20', 93, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (642, '2024-09-15', 43, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (643, '2024-07-06', 92, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (644, '2024-05-09', 77, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (645, '2024-08-08', 45, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (646, '2024-01-22', 47, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (647, '2024-10-22', 41, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (648, '2024-03-17', 7, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (649, '2024-05-10', 57, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (650, '2024-07-23', 16, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (651, '2024-04-06', 81, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (652, '2024-10-13', 24, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (653, '2024-02-19', 28, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (654, '2024-10-25', 9, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (655, '2024-07-27', 32, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (656, '2024-08-29', 99, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (657, '2024-05-04', 39, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (658, '2024-05-16', 66, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (659, '2024-11-05', 97, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (660, '2024-02-17', 77, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (661, '2024-08-20', 93, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (662, '2024-01-12', 33, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (663, '2023-12-31', 98, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (664, '2024-03-17', 40, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (665, '2024-05-19', 96, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (666, '2024-12-04', 30, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (667, '2023-12-11', 64, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (668, '2024-06-08', 11, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (669, '2024-01-26', 38, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (670, '2024-03-25', 20, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (671, '2024-01-31', 65, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (672, '2024-07-21', 94, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (673, '2024-12-06', 42, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (674, '2023-12-31', 84, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (675, '2024-04-24', 80, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (676, '2024-09-01', 52, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (677, '2024-04-03', 70, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (678, '2024-03-06', 51, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (679, '2024-02-05', 97, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (680, '2024-05-01', 53, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (681, '2024-04-25', 58, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (682, '2024-03-28', 11, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (683, '2024-08-03', 80, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (684, '2024-05-27', 91, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (685, '2024-05-25', 44, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (686, '2024-03-11', 67, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (687, '2024-04-09', 88, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (688, '2024-11-04', 23, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (689, '2024-06-19', 2, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (690, '2024-04-03', 18, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (691, '2024-10-23', 7, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (692, '2024-04-23', 17, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (693, '2024-02-05', 52, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (694, '2024-05-25', 75, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (695, '2024-12-06', 37, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (696, '2024-07-27', 87, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (697, '2024-07-31', 8, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (698, '2024-08-05', 62, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (699, '2024-09-19', 51, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (700, '2024-08-19', 52, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (701, '2024-05-24', 30, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (702, '2024-06-19', 97, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (703, '2024-01-17', 7, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (704, '2024-01-17', 6, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (705, '2024-05-17', 39, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (706, '2024-03-30', 7, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (707, '2024-09-05', 71, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (708, '2024-06-19', 55, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (709, '2024-08-22', 68, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (710, '2024-02-06', 58, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (711, '2024-08-08', 73, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (712, '2024-10-04', 39, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (713, '2024-09-24', 22, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (714, '2024-11-17', 56, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (715, '2024-01-11', 94, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (716, '2024-06-20', 95, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (717, '2024-09-03', 73, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (718, '2024-06-10', 7, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (719, '2024-07-18', 70, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (720, '2024-05-19', 97, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (721, '2024-01-23', 14, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (722, '2024-08-17', 96, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (723, '2024-08-10', 13, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (724, '2024-11-04', 22, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (725, '2024-02-19', 68, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (726, '2024-05-12', 44, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (727, '2024-08-09', 48, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (728, '2024-11-21', 93, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (729, '2024-11-08', 29, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (730, '2024-09-05', 66, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (731, '2024-06-12', 31, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (732, '2024-03-11', 13, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (733, '2024-03-30', 44, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (734, '2024-05-20', 74, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (735, '2024-07-20', 35, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (736, '2024-04-05', 14, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (737, '2024-04-09', 4, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (738, '2024-09-15', 15, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (739, '2024-04-02', 87, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (740, '2024-03-04', 24, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (741, '2024-06-22', 13, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (742, '2024-06-21', 66, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (743, '2023-12-12', 78, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (744, '2024-07-03', 22, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (745, '2024-09-23', 12, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (746, '2024-08-12', 93, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (747, '2024-02-07', 97, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (748, '2024-07-22', 27, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (749, '2024-05-06', 64, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (750, '2023-12-21', 60, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (751, '2024-08-24', 73, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (752, '2024-06-21', 52, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (753, '2024-06-02', 3, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (754, '2024-10-11', 20, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (755, '2024-09-09', 93, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (756, '2024-09-12', 10, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (757, '2024-11-22', 42, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (758, '2024-06-06', 11, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (759, '2024-02-18', 60, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (760, '2024-04-29', 78, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (761, '2024-07-19', 36, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (762, '2024-11-30', 21, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (763, '2024-03-09', 58, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (764, '2024-02-07', 25, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (765, '2024-07-29', 46, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (766, '2024-10-05', 58, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (767, '2024-11-11', 31, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (768, '2023-12-13', 47, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (769, '2024-05-12', 88, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (770, '2024-11-20', 41, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (771, '2024-11-16', 51, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (772, '2024-09-23', 8, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (773, '2024-09-30', 23, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (774, '2024-02-13', 70, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (775, '2024-08-12', 4, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (776, '2024-11-24', 66, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (777, '2023-12-12', 52, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (778, '2024-03-24', 28, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (779, '2024-09-10', 27, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (780, '2024-01-20', 82, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (781, '2024-05-20', 97, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (782, '2024-08-17', 72, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (783, '2024-03-01', 39, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (784, '2024-06-04', 43, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (785, '2024-07-06', 41, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (786, '2024-08-23', 18, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (787, '2024-07-04', 95, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (788, '2024-07-29', 88, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (789, '2024-10-10', 61, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (790, '2024-09-20', 24, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (791, '2024-02-10', 64, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (792, '2024-08-26', 77, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (793, '2024-04-30', 59, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (794, '2023-12-15', 41, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (795, '2024-05-13', 46, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (796, '2024-07-07', 100, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (797, '2024-08-22', 46, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (798, '2024-02-20', 83, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (799, '2023-12-21', 40, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (800, '2024-05-06', 22, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (801, '2024-05-30', 12, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (802, '2024-01-14', 71, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (803, '2024-09-04', 8, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (804, '2024-02-08', 82, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (805, '2024-04-04', 78, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (806, '2024-11-17', 64, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (807, '2024-10-14', 26, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (808, '2024-05-11', 59, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (809, '2024-07-08', 24, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (810, '2024-03-07', 50, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (811, '2024-06-06', 32, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (812, '2024-01-22', 51, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (813, '2024-11-14', 22, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (814, '2024-05-13', 34, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (815, '2024-06-18', 12, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (816, '2024-11-09', 59, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (817, '2024-04-08', 43, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (818, '2024-06-28', 57, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (819, '2024-04-17', 80, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (820, '2024-09-01', 45, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (821, '2024-05-01', 59, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (822, '2024-11-23', 2, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (823, '2024-07-17', 6, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (824, '2024-06-04', 69, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (825, '2024-03-31', 27, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (826, '2024-11-20', 1, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (827, '2024-06-12', 99, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (828, '2024-04-02', 21, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (829, '2024-08-19', 69, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (830, '2024-07-19', 65, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (831, '2024-04-01', 98, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (832, '2023-12-13', 67, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (833, '2024-05-15', 6, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (834, '2024-05-31', 85, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (835, '2024-07-13', 56, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (836, '2024-03-15', 40, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (837, '2024-11-13', 8, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (838, '2024-09-10', 16, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (839, '2024-03-03', 35, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (840, '2024-11-10', 5, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (841, '2024-05-22', 72, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (842, '2024-06-28', 98, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (843, '2024-01-17', 60, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (844, '2024-09-19', 1, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (845, '2024-09-22', 75, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (846, '2024-03-27', 21, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (847, '2024-01-08', 51, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (848, '2024-12-04', 42, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (849, '2024-09-12', 44, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (850, '2024-04-02', 91, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (851, '2024-09-15', 94, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (852, '2024-09-15', 78, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (853, '2024-01-27', 73, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (854, '2024-11-04', 24, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (855, '2024-04-03', 15, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (856, '2024-10-21', 7, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (857, '2024-07-06', 100, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (858, '2024-09-04', 2, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (859, '2024-06-12', 66, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (860, '2024-03-18', 31, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (861, '2024-07-19', 22, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (862, '2024-03-24', 22, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (863, '2024-03-26', 29, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (864, '2024-03-16', 41, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (865, '2024-05-23', 46, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (866, '2024-10-10', 88, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (867, '2024-11-23', 81, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (868, '2024-02-15', 77, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (869, '2024-10-07', 67, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (870, '2024-07-21', 25, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (871, '2024-06-04', 76, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (872, '2024-08-21', 96, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (873, '2024-09-21', 20, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (874, '2024-01-02', 78, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (875, '2024-05-11', 94, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (876, '2024-08-02', 54, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (877, '2023-12-13', 94, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (878, '2024-01-14', 94, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (879, '2024-03-23', 67, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (880, '2024-04-28', 14, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (881, '2024-04-19', 66, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (882, '2024-07-30', 94, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (883, '2023-12-13', 29, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (884, '2024-02-21', 95, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (885, '2024-11-16', 31, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (886, '2024-07-22', 74, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (887, '2024-06-19', 18, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (888, '2024-05-02', 47, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (889, '2023-12-25', 36, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (890, '2024-10-29', 21, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (891, '2024-05-09', 78, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (892, '2024-06-14', 60, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (893, '2024-04-02', 50, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (894, '2024-09-04', 6, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (895, '2024-02-11', 84, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (896, '2024-03-19', 23, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (897, '2023-12-21', 14, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (898, '2024-11-26', 53, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (899, '2024-11-26', 2, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (900, '2024-04-18', 31, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (901, '2024-07-20', 46, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (902, '2024-05-08', 81, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (903, '2024-10-17', 7, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (904, '2024-04-30', 87, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (905, '2024-06-20', 51, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (906, '2024-03-20', 82, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (907, '2024-09-19', 41, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (908, '2023-12-27', 53, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (909, '2024-11-21', 19, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (910, '2024-10-26', 14, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (911, '2024-09-19', 59, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (912, '2024-10-27', 60, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (913, '2024-11-02', 63, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (914, '2024-05-15', 22, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (915, '2024-02-08', 2, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (916, '2024-07-30', 82, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (917, '2024-08-06', 39, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (918, '2024-03-27', 64, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (919, '2024-10-04', 36, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (920, '2024-10-16', 85, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (921, '2024-08-08', 1, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (922, '2024-03-14', 58, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (923, '2024-05-28', 95, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (924, '2024-03-25', 32, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (925, '2024-01-26', 30, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (926, '2024-11-24', 2, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (927, '2024-03-20', 58, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (928, '2024-01-17', 31, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (929, '2024-12-06', 61, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (930, '2024-01-13', 76, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (931, '2024-11-18', 35, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (932, '2023-12-18', 14, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (933, '2024-03-18', 55, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (934, '2024-11-03', 54, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (935, '2024-05-12', 15, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (936, '2024-01-09', 4, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (937, '2024-03-27', 24, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (938, '2024-05-23', 26, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (939, '2024-10-24', 43, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (940, '2024-01-26', 53, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (941, '2024-02-10', 25, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (942, '2024-06-18', 83, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (943, '2023-12-14', 73, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (944, '2024-01-22', 52, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (945, '2024-02-23', 2, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (946, '2023-12-12', 86, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (947, '2024-01-10', 43, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (948, '2024-06-07', 6, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (949, '2024-04-22', 61, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (950, '2024-08-13', 47, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (951, '2024-09-04', 80, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (952, '2024-11-14', 2, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (953, '2024-11-07', 78, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (954, '2024-04-20', 10, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (955, '2023-12-19', 98, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (956, '2023-12-12', 22, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (957, '2024-05-24', 62, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (958, '2024-06-07', 82, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (959, '2024-01-22', 43, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (960, '2024-09-08', 24, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (961, '2024-01-02', 80, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (962, '2024-06-25', 32, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (963, '2024-08-04', 18, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (964, '2024-10-21', 23, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (965, '2024-10-16', 4, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (966, '2024-04-28', 28, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (967, '2024-03-28', 25, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (968, '2024-04-22', 74, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (969, '2024-11-20', 75, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (970, '2024-01-13', 47, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (971, '2024-08-02', 55, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (972, '2023-12-17', 64, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (973, '2024-07-11', 77, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (974, '2024-08-17', 10, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (975, '2024-01-01', 30, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (976, '2024-11-19', 55, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (977, '2024-05-15', 27, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (978, '2024-08-13', 99, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (979, '2024-05-02', 71, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (980, '2023-12-24', 8, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (981, '2024-10-18', 10, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (982, '2024-05-21', 40, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (983, '2024-11-13', 61, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (984, '2024-04-09', 77, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (985, '2024-08-08', 39, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (986, '2024-05-07', 35, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (987, '2024-09-15', 1, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (988, '2024-10-19', 33, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (989, '2023-12-25', 66, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (990, '2024-01-03', 57, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (991, '2023-12-31', 57, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (992, '2024-01-26', 71, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (993, '2024-11-29', 38, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (994, '2024-08-25', 92, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (995, '2024-04-08', 24, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (996, '2024-10-20', 91, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (997, '2024-06-02', 52, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (998, '2023-12-31', 72, 1);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (999, '2024-10-13', 44, 0);
insert into PODocument (PO_Number, PO_Date, PO_TotalAmount, PO_IsHolded) values (1000, '2024-06-29', 11, 1);
