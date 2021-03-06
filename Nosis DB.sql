USE [master]
GO
/****** Object:  Database [LineaSupermercadoDb]    Script Date: 7/6/2020 19:33:42 ******/
CREATE DATABASE [LineaSupermercadoDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LineaSupermercadoDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LineaSupermercadoDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LineaSupermercadoDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LineaSupermercadoDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LineaSupermercadoDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LineaSupermercadoDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LineaSupermercadoDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LineaSupermercadoDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LineaSupermercadoDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LineaSupermercadoDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LineaSupermercadoDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [LineaSupermercadoDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LineaSupermercadoDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LineaSupermercadoDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LineaSupermercadoDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LineaSupermercadoDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LineaSupermercadoDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LineaSupermercadoDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LineaSupermercadoDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LineaSupermercadoDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LineaSupermercadoDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LineaSupermercadoDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LineaSupermercadoDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LineaSupermercadoDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LineaSupermercadoDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LineaSupermercadoDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LineaSupermercadoDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [LineaSupermercadoDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LineaSupermercadoDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LineaSupermercadoDb] SET  MULTI_USER 
GO
ALTER DATABASE [LineaSupermercadoDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LineaSupermercadoDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LineaSupermercadoDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LineaSupermercadoDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LineaSupermercadoDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LineaSupermercadoDb] SET QUERY_STORE = OFF
GO
USE [LineaSupermercadoDb]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 7/6/2020 19:33:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ClientStatusId] [int] NOT NULL,
	[SupermarketCheckoutId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientStatus]    Script Date: 7/6/2020 19:33:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.ClientStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupermarketCheckouts]    Script Date: 7/6/2020 19:33:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupermarketCheckouts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupermarketCheckoutStatuId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.SupermarketCheckouts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupermarketCheckoutStatus]    Script Date: 7/6/2020 19:33:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupermarketCheckoutStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.SupermarketCheckoutStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ClientStatus] ON 

INSERT [dbo].[ClientStatus] ([Id], [Description]) VALUES (1, N'Atendido')
INSERT [dbo].[ClientStatus] ([Id], [Description]) VALUES (2, N'Por atender')
SET IDENTITY_INSERT [dbo].[ClientStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[SupermarketCheckoutStatus] ON 

INSERT [dbo].[SupermarketCheckoutStatus] ([Id], [Description]) VALUES (1, N'Abierta')
INSERT [dbo].[SupermarketCheckoutStatus] ([Id], [Description]) VALUES (2, N'Cerrada')
SET IDENTITY_INSERT [dbo].[SupermarketCheckoutStatus] OFF
GO
/****** Object:  Index [IX_ClientStatusId]    Script Date: 7/6/2020 19:33:43 ******/
CREATE NONCLUSTERED INDEX [IX_ClientStatusId] ON [dbo].[Clients]
(
	[ClientStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupermarketCheckoutId]    Script Date: 7/6/2020 19:33:43 ******/
CREATE NONCLUSTERED INDEX [IX_SupermarketCheckoutId] ON [dbo].[Clients]
(
	[SupermarketCheckoutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupermarketCheckoutStatuId]    Script Date: 7/6/2020 19:33:43 ******/
CREATE NONCLUSTERED INDEX [IX_SupermarketCheckoutStatuId] ON [dbo].[SupermarketCheckouts]
(
	[SupermarketCheckoutStatuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Clients_dbo.ClientStatus_ClientStatusId] FOREIGN KEY([ClientStatusId])
REFERENCES [dbo].[ClientStatus] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_dbo.Clients_dbo.ClientStatus_ClientStatusId]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Clients_dbo.SupermarketCheckouts_SupermarketCheckoutId] FOREIGN KEY([SupermarketCheckoutId])
REFERENCES [dbo].[SupermarketCheckouts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_dbo.Clients_dbo.SupermarketCheckouts_SupermarketCheckoutId]
GO
ALTER TABLE [dbo].[SupermarketCheckouts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SupermarketCheckouts_dbo.SupermarketCheckoutStatus_SupermarketCheckoutStatuId] FOREIGN KEY([SupermarketCheckoutStatuId])
REFERENCES [dbo].[SupermarketCheckoutStatus] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SupermarketCheckouts] CHECK CONSTRAINT [FK_dbo.SupermarketCheckouts_dbo.SupermarketCheckoutStatus_SupermarketCheckoutStatuId]
GO
/****** Object:  StoredProcedure [dbo].[AddClient]    Script Date: 7/6/2020 19:33:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddClient] 
AS
BEGIN
	DECLARE @Id AS INT;
	DECLARE @SupermarketCheckoutId AS INT;

	SET @Id = (SELECT IDENT_CURRENT('Clients') + 1);

	SET @SupermarketCheckoutId = (SELECT top 1
										s.Id
									FROM SupermarketCheckouts s
									WHERE s.SupermarketCheckoutStatuId = 1
									ORDER BY (select COUNT(c.id) from Clients c WHERE c.SupermarketCheckoutId = s.Id AND c.ClientStatusId = 2) asc, 1 asc);


	INSERT INTO Clients
	VALUES(CONCAT('Cliente ', @Id),2,@SupermarketCheckoutId);
END
GO
/****** Object:  StoredProcedure [dbo].[CloseSupermarketCheckout]    Script Date: 7/6/2020 19:33:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CloseSupermarketCheckout] 
	@Id AS INT
AS
BEGIN
	DECLARE @SupermarketCheckoutId AS INT;

	UPDATE SupermarketCheckouts
	SET SupermarketCheckoutStatuId = 2
	WHERE Id = @Id;

	SET @SupermarketCheckoutId = (SELECT top 1
										s.Id
									FROM SupermarketCheckouts s
									WHERE s.SupermarketCheckoutStatuId = 1
									AND s.Id <> @Id
									ORDER BY (select COUNT(c.id) from Clients c WHERE c.SupermarketCheckoutId = s.Id AND c.ClientStatusId = 2) asc, 1 asc);

	UPDATE Clients
	SET SupermarketCheckoutId = @SupermarketCheckoutId
	WHERE SupermarketCheckoutId = @Id AND ClientStatusId = 2;

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllSupermarketCheckouts]    Script Date: 7/6/2020 19:33:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllSupermarketCheckouts]
	
AS
BEGIN
	SELECT 
		s.Id AS 'Id',
		CONCAT('Caja ', s.id) AS 'Description', 
		(select COUNT(c.id) from Clients c WHERE c.SupermarketCheckoutId = s.Id AND c.ClientStatusId = 1) AS 'ClientsServed', 
		(select COUNT(c.id) from Clients c WHERE c.SupermarketCheckoutId = s.Id AND c.ClientStatusId = 2) AS 'ClientsToAttend'
	FROM SupermarketCheckouts s
	WHERE s.SupermarketCheckoutStatuId = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[ServeClient]    Script Date: 7/6/2020 19:33:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ServeClient] 
	@Id AS int
AS
BEGIN

	With c As
	(
		SELECT top 1 c.Id, c.ClientStatusId, c.SupermarketCheckoutId
		FROM Clients c
		WHERE c.ClientStatusId = 2 AND c.SupermarketCheckoutId = @Id
		ORDER BY Id DESC
	)

	UPDATE c SET ClientStatusId = 1;

END
GO
USE [master]
GO
ALTER DATABASE [LineaSupermercadoDb] SET  READ_WRITE 
GO
