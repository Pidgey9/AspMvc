USE [master]
GO
/****** Object:  Database [RESTAURANT-AIRE-CS]    Script Date: 15/01/2024 13:49:50 ******/
CREATE DATABASE [RESTAURANT-AIRE-CS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RESTAURANT-AIRE-CS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\RESTAURANT-AIRE-CS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RESTAURANT-AIRE-CS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\RESTAURANT-AIRE-CS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RESTAURANT-AIRE-CS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET ARITHABORT OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET RECOVERY FULL 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET  MULTI_USER 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RESTAURANT-AIRE-CS', N'ON'
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET QUERY_STORE = OFF
GO
USE [RESTAURANT-AIRE-CS]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [RESTAURANT-AIRE-CS]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 15/01/2024 13:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[idArticle] [int] NOT NULL,
	[article] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
	[prix] [float] NULL,
 CONSTRAINT [PK_Articles] PRIMARY KEY CLUSTERED 
(
	[idArticle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 15/01/2024 13:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[id] [int] NOT NULL,
	[password] [nvarchar](50) NULL,
	[nom] [nvarchar](50) NULL,
	[prenom] [nvarchar](50) NULL,
	[adresse] [nvarchar](50) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commandes]    Script Date: 15/01/2024 13:49:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commandes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idClient] [int] NULL,
	[date] [date] NULL,
	[prixTotal] [float] NULL,
	[infos] [nvarchar](50) NULL,
 CONSTRAINT [PK_Commandes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (1, N'Salade a la caprese', N'Salade, mozarella, tomate', 10)
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (2, N'Aubergine parmigiana', N'Aubergine, parmesan', 12)
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (3, N'Salade Grecque', N'Salade, tomate, concombre, feta', 8)
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (4, N'Salade japonaise', N'Salade, crevette, asiatique', 8.5)
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (5, N'Salade de lentilles au saumon fumé', N'Salade, lentilles, saumon', 12)
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (6, N'Salade Cesar', N'Salade, fromage, poulet', 9)
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (7, N'Les lasagnes', N'Lasagne, bolognaise, beschamel', 20)
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (8, N'Pizza Royal', N'Pizza, fromage, pepperoni', 15)
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (9, N'Feuilleté au saumon', N'Saumon, pain, herbes', 18)
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (10, N'Quiche au Fromage', N'Pain, oeuf, fromage', 6)
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (11, N'Tiramisu', N'Chocolat, mascarpone, café', 7)
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (12, N'Brownies', N'Chocolat, glace', 5)
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (13, N'Cheesecake classique', N'Fromage blanc, biscuit', 7.5)
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (14, N'Crème anglaise', N'Crème, caramel', 6.5)
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (15, N'coca cola', N'Boisson, cola', 4)
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (16, N'sprite', N'Boisson, limonade', 3)
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (17, N'Eau minérale', N'Eau plate', 2.5)
INSERT [dbo].[Articles] ([idArticle], [article], [description], [prix]) VALUES (18, N'The froid', N'Thé, sucre', 4.5)
INSERT [dbo].[Clients] ([id], [password], [nom], [prenom], [adresse]) VALUES (1, N'1', N'a', N'b', N'adr')
INSERT [dbo].[Clients] ([id], [password], [nom], [prenom], [adresse]) VALUES (2, N'2', N'a', N'b', N'adr')
INSERT [dbo].[Clients] ([id], [password], [nom], [prenom], [adresse]) VALUES (3, N'3', N'dd', N'sss', N'edrt2')
SET IDENTITY_INSERT [dbo].[Commandes] ON 

INSERT [dbo].[Commandes] ([id], [idClient], [date], [prixTotal], [infos]) VALUES (1, 1, CAST(N'2024-01-11' AS Date), 5, N'5')
INSERT [dbo].[Commandes] ([id], [idClient], [date], [prixTotal], [infos]) VALUES (2, 1, CAST(N'2024-01-11' AS Date), 5, N'5')
INSERT [dbo].[Commandes] ([id], [idClient], [date], [prixTotal], [infos]) VALUES (3, 10, CAST(N'2024-01-15' AS Date), 0, N'hi')
INSERT [dbo].[Commandes] ([id], [idClient], [date], [prixTotal], [infos]) VALUES (4, 1, CAST(N'2024-01-15' AS Date), 0, N'hi')
INSERT [dbo].[Commandes] ([id], [idClient], [date], [prixTotal], [infos]) VALUES (5, 1, CAST(N'2024-01-15' AS Date), 528, N'hi')
SET IDENTITY_INSERT [dbo].[Commandes] OFF
USE [master]
GO
ALTER DATABASE [RESTAURANT-AIRE-CS] SET  READ_WRITE 
GO
