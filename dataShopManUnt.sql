USE [master]
GO
/****** Object:  Database [shopManUnt]    Script Date: 03/03/2023 19:53:01 ******/
CREATE DATABASE [shopManUnt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shopManUnt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\shopManUnt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shopManUnt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\shopManUnt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [shopManUnt] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shopManUnt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shopManUnt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shopManUnt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shopManUnt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shopManUnt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shopManUnt] SET ARITHABORT OFF 
GO
ALTER DATABASE [shopManUnt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shopManUnt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shopManUnt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shopManUnt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shopManUnt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shopManUnt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shopManUnt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shopManUnt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shopManUnt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shopManUnt] SET  ENABLE_BROKER 
GO
ALTER DATABASE [shopManUnt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shopManUnt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shopManUnt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shopManUnt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shopManUnt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shopManUnt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shopManUnt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shopManUnt] SET RECOVERY FULL 
GO
ALTER DATABASE [shopManUnt] SET  MULTI_USER 
GO
ALTER DATABASE [shopManUnt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shopManUnt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shopManUnt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shopManUnt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shopManUnt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shopManUnt] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'shopManUnt', N'ON'
GO
ALTER DATABASE [shopManUnt] SET QUERY_STORE = OFF
GO
USE [shopManUnt]
GO
/****** Object:  Table [dbo].[account]    Script Date: 03/03/2023 19:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](max) NULL,
	[password] [varchar](max) NULL,
	[role] [int] NULL,
	[amount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 03/03/2023 19:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 03/03/2023 19:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[color]    Script Date: 03/03/2023 19:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 03/03/2023 19:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[firstname] [nvarchar](20) NULL,
	[lastname] [nvarchar](20) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](60) NULL,
	[address] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
	[ida] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image]    Script Date: 03/03/2023 19:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[idp] [int] NULL,
	[img] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 03/03/2023 19:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ida] [int] NULL,
	[status] [binary](1) NULL,
	[orderDate] [date] NULL,
	[orderShip] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetail]    Script Date: 03/03/2023 19:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetail](
	[idPro] [int] NULL,
	[quantity] [int] NULL,
	[size] [nvarchar](20) NULL,
	[price] [float] NULL,
	[ido] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 03/03/2023 19:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[idType] [int] NULL,
	[idColor] [int] NULL,
	[idBrand] [int] NULL,
	[price] [float] NULL,
	[releaseDate] [date] NULL,
	[description] [varchar](max) NULL,
	[idCategory] [int] NULL,
	[image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size]    Script Date: 03/03/2023 19:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size](
	[name] [nvarchar](5) NULL,
	[quantity] [int] NULL,
	[pid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type]    Script Date: 03/03/2023 19:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voucher]    Script Date: 03/03/2023 19:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voucher](
	[code] [varchar](1) NOT NULL,
	[sale] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([id], [username], [password], [role], [amount]) VALUES (1, N'manager', N'123', 1, 0)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[brand] ON 

INSERT [dbo].[brand] ([id], [name]) VALUES (1, N'adidas')
INSERT [dbo].[brand] ([id], [name]) VALUES (2, N'nike')
INSERT [dbo].[brand] ([id], [name]) VALUES (3, N'puma')
SET IDENTITY_INSERT [dbo].[brand] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name]) VALUES (1, N'clothes')
INSERT [dbo].[category] ([id], [name]) VALUES (2, N'shoes')
INSERT [dbo].[category] ([id], [name]) VALUES (3, N'ball')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[color] ON 

INSERT [dbo].[color] ([id], [name]) VALUES (1, N'red')
INSERT [dbo].[color] ([id], [name]) VALUES (2, N'white')
INSERT [dbo].[color] ([id], [name]) VALUES (3, N'blue')
INSERT [dbo].[color] ([id], [name]) VALUES (4, N'yellow')
INSERT [dbo].[color] ([id], [name]) VALUES (5, N'green')
INSERT [dbo].[color] ([id], [name]) VALUES (6, N'primegreen')
INSERT [dbo].[color] ([id], [name]) VALUES (7, N'black')
INSERT [dbo].[color] ([id], [name]) VALUES (8, N'gray')
INSERT [dbo].[color] ([id], [name]) VALUES (9, N'navy')
SET IDENTITY_INSERT [dbo].[color] OFF
GO
INSERT [dbo].[image] ([idp], [img]) VALUES (1, N'1.jpg')
INSERT [dbo].[image] ([idp], [img]) VALUES (1, N'2.jpg')
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [idType], [idColor], [idBrand], [price], [releaseDate], [description], [idCategory], [image]) VALUES (1, N'Manchester United Home Shirt 2022-23', 1, 1, 1, 70, CAST(N'2022-12-09' AS Date), N'Turned up or pressed down, the humble polo collar has played a starring role in many of Manchester Uniteds biggest moments. Making a comeback on this adidas football jersey, it joins a shield-style badge and engineered pinstripe graphic to produce an eye-catching look. Moisture-absorbing AEROREADY and mesh panels make it a comfortable choice for passionate supporters. Made with 100% recycled materials, this product represents just one of our solutions to help end plastic waste.', 1, N'home_short.jpg')
INSERT [dbo].[product] ([id], [name], [idType], [idColor], [idBrand], [price], [releaseDate], [description], [idCategory], [image]) VALUES (2, N'Manchester United Away Shirt 2022-23', 2, 2, 1, 70, CAST(N'2022-12-09' AS Date), N'Theyre famous for wearing red. But Manchester United have had more than a few glory nights in white. With its subtle allover design, shield badge and red-and-black 3-Stripes, this adidas away football jersey adds to that rich legacy. Moisture-wicking AEROREADY and mesh panels make it a comfortable wear for supporters. Made with 100% recycled materials, this product represents just one of our solutions to help end plastic waste.', 1, N'away_short.jpg')
INSERT [dbo].[product] ([id], [name], [idType], [idColor], [idBrand], [price], [releaseDate], [description], [idCategory], [image]) VALUES (3, N'Manchester United Third Shirt 2022-23', 3, 6, 1, 70, CAST(N'2022-12-09' AS Date), N'Created to catch the eye at rivals grounds. This adidas Manchester United third jersey highlights electrifying away performances with bold colours and a dynamic, 90s-style graphic. Shared with the home and away kits, an embroidered shield badge takes pride of place on the chest. Behind the brilliance, moisture-absorbing AEROREADY keeps football fans comfortable. Made with 100% recycled materials, this product represents just one of our solutions to help end plastic waste.', 1, N'third_short.jpg')
INSERT [dbo].[product] ([id], [name], [idType], [idColor], [idBrand], [price], [releaseDate], [description], [idCategory], [image]) VALUES (4, N'Manchester United Training Hoodie - Navy', 5, 9, 1, 50, CAST(N'2022-12-09' AS Date), N'At their high-tech training complex southwest of the city, Manchester United prepare for glory. This adidas football hoodie is part of the movement-focused Condivo 22 range they wearing during training. Ideal for staying warm between sessions, it combines soft French terry fabric and moisture-wicking AEROREADY. When you really need to wind down, pull up the hood and stuff your hands into its kangaroo pocket. Made with 100% recycled materials, this product represents just one of our solutions to help end plastic waste.', 1, N'train_hoodi2.jpg')
INSERT [dbo].[product] ([id], [name], [idType], [idColor], [idBrand], [price], [releaseDate], [description], [idCategory], [image]) VALUES (5, N'Manchester United Third Shorts 2022-23', 3, 7, 1, 28, CAST(N'2022-12-10' AS Date), N'A perfect complement to a loud statement. Wear these juniors adidas football shorts with the vibrant Manchester United third jersey to get the on-pitch look. A mesh gusset and moisture-absorbing AEROREADY keep you comfortable whether youre playing or watching from the sidelines. Made with 100% recycled materials, this product represents just one of our solutions to help end plastic waste.', 1, N'short_third.jpg')
INSERT [dbo].[product] ([id], [name], [idType], [idColor], [idBrand], [price], [releaseDate], [description], [idCategory], [image]) VALUES (6, N'Manchester United Training Pants-Navy', 5, 9, 1, 55, CAST(N'2022-12-10' AS Date), N'On or off the pitch, keep the faith. These adidas training track pants not only have Manchester United style writ large, but their AEROREADY also keeps you fresh and dry. With ankle zips for easy dressing, the slim-fit cut allows for freedom of movement. A club badge proclaims your football loyalty. Made with 100% recycled materials, this product represents just one of our solutions to help end plastic waste.', 1, N'short_train.jpg')
INSERT [dbo].[product] ([id], [name], [idType], [idColor], [idBrand], [price], [releaseDate], [description], [idCategory], [image]) VALUES (7, N'Manchester United Training T-Shirt - Navy', 5, 9, 1, 33, CAST(N'2022-12-10' AS Date), N'Modern football is all about movement. So is Manchester Uniteds Condivo 22 training kit. This adidas tee will keep you comfortable with soft single jersey fabric. A woven club badge shares your pride. Our cotton products support more sustainable cotton farming.', 1, N'train_short2.jpg')
INSERT [dbo].[product] ([id], [name], [idType], [idColor], [idBrand], [price], [releaseDate], [description], [idCategory], [image]) VALUES (9, N'Manchester United Pre Match Top - White', 5, 2, 1, 55, CAST(N'2022-12-10' AS Date), N'A collision of club colours and a classic adidas design. Starring on the pitch before kickoff, this football jersey helps Manchester United players prepare for games. AEROREADY absorbs moisture to keep them fresh for when the real action begins. A woven badge adds the perfect finish. Made with 100% recycled materials, this product represents just one of our solutions to help end plastic waste.', 1, N'train_short1.jpg')
INSERT [dbo].[product] ([id], [name], [idType], [idColor], [idBrand], [price], [releaseDate], [description], [idCategory], [image]) VALUES (10, N'Manchester United Third Shirt 2022-23-Long Sleeve', 3, 6, 1, 75, CAST(N'2022-12-10' AS Date), N'Created to catch the eye at rivals grounds. This adidas Manchester United third jersey highlights electrifying away performances with bold colours and a dynamic,90s-style graphic. Shared with the home and away kits, a woven crest takes pride of place on the chest. Behind the brilliance, moisture-absorbing AEROREADY keeps football fans comfortable. Made with 100% recycled materials, this product represents just one of our solutions to help end plastic waste.', 1, N'third_long.jpg')
SET IDENTITY_INSERT [dbo].[product] OFF
GO
INSERT [dbo].[size] ([name], [quantity], [pid]) VALUES (N's', 0, 1)
INSERT [dbo].[size] ([name], [quantity], [pid]) VALUES (N'm', 42, 1)
INSERT [dbo].[size] ([name], [quantity], [pid]) VALUES (N'l', 67, 1)
INSERT [dbo].[size] ([name], [quantity], [pid]) VALUES (N'xl', 80, 1)
INSERT [dbo].[size] ([name], [quantity], [pid]) VALUES (N'xxl', 34, 1)
INSERT [dbo].[size] ([name], [quantity], [pid]) VALUES (N'3xl', 54, 1)
INSERT [dbo].[size] ([name], [quantity], [pid]) VALUES (N'4xl', 26, 1)
GO
SET IDENTITY_INSERT [dbo].[type] ON 

INSERT [dbo].[type] ([id], [name]) VALUES (1, N'home')
INSERT [dbo].[type] ([id], [name]) VALUES (2, N'away')
INSERT [dbo].[type] ([id], [name]) VALUES (3, N'third')
INSERT [dbo].[type] ([id], [name]) VALUES (4, N'goalkeeper')
INSERT [dbo].[type] ([id], [name]) VALUES (5, N'training')
SET IDENTITY_INSERT [dbo].[type] OFF
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD FOREIGN KEY([ida])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[image]  WITH CHECK ADD FOREIGN KEY([idp])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([ida])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD FOREIGN KEY([idPro])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD FOREIGN KEY([ido])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([idBrand])
REFERENCES [dbo].[brand] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([idCategory])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([idColor])
REFERENCES [dbo].[color] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([idType])
REFERENCES [dbo].[type] ([id])
GO
ALTER TABLE [dbo].[size]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[product] ([id])
GO
USE [master]
GO
ALTER DATABASE [shopManUnt] SET  READ_WRITE 
GO
