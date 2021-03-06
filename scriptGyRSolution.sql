USE [master]
GO
/****** Object:  Database [MasterServiceDB]    Script Date: 31/08/2020 21:49:13 ******/
CREATE DATABASE [MasterServiceDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MasterServiceDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MasterServiceDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MasterServiceDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MasterServiceDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MasterServiceDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MasterServiceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MasterServiceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MasterServiceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MasterServiceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MasterServiceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MasterServiceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MasterServiceDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MasterServiceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MasterServiceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MasterServiceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MasterServiceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MasterServiceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MasterServiceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MasterServiceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MasterServiceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MasterServiceDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MasterServiceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MasterServiceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MasterServiceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MasterServiceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MasterServiceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MasterServiceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MasterServiceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MasterServiceDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MasterServiceDB] SET  MULTI_USER 
GO
ALTER DATABASE [MasterServiceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MasterServiceDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MasterServiceDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MasterServiceDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MasterServiceDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MasterServiceDB] SET QUERY_STORE = OFF
GO
USE [MasterServiceDB]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 31/08/2020 21:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[Cedula] [nvarchar](11) NULL,
	[Rnc] [nvarchar](20) NULL,
	[RegistroMercantil] [nvarchar](20) NULL,
	[PerteneceEmpresa] [bit] NULL,
	[NombreEmpresa] [nvarchar](50) NULL,
	[Telefono] [nvarchar](20) NULL,
	[Celular] [nvarchar](20) NULL,
	[TelefonoEmpresa] [nvarchar](20) NULL,
	[Ext] [nvarchar](5) NULL,
	[Correo] [nvarchar](50) NULL,
	[Usuario] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Estado] [bit] NULL,
	[FechaCreado] [date] NULL,
	[UsuarioId] [int] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cotizacion]    Script Date: 31/08/2020 21:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cotizacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[No.Cotizacion] [nvarchar](50) NOT NULL,
	[ClienteId] [int] NULL,
	[DetalleCotizacion] [nvarchar](max) NULL,
	[TipoCotizacion] [char](1) NULL,
	[Fecha] [datetime] NULL,
	[UsuarioId] [int] NULL,
 CONSTRAINT [PK_Cotizacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleServicio]    Script Date: 31/08/2020 21:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleServicio](
	[Id] [int] NOT NULL,
	[ClienteId] [int] NOT NULL,
	[TipoServicioId] [int] NOT NULL,
	[UsuarioId] [int] NULL,
	[EstadoServicioId] [int] NULL,
	[Comentario] [int] NULL,
	[FechaActualizacion] [datetime] NULL,
	[FinalizoServicio] [bit] NULL,
 CONSTRAINT [PK_DetalleServicio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoServicio]    Script Date: 31/08/2020 21:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoServicio](
	[Id] [int] NOT NULL,
	[Detalle] [nchar](10) NULL,
 CONSTRAINT [PK_EstadoServicio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListaServicioCotizacion]    Script Date: 31/08/2020 21:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListaServicioCotizacion](
	[Id] [int] NOT NULL,
	[TipoServicioId] [int] NULL,
	[CotizacionId] [int] NULL,
	[Fecha] [datetime] NULL,
 CONSTRAINT [PK_ListaServicioCotizacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoServicio]    Script Date: 31/08/2020 21:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoServicio](
	[Id] [int] NOT NULL,
	[Detalle] [nvarchar](50) NULL,
 CONSTRAINT [PK_TipoServicio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 31/08/2020 21:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NULL,
	[Usuario] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Usuario]
GO
ALTER TABLE [dbo].[Cotizacion]  WITH CHECK ADD  CONSTRAINT [FK_Cotizacion_Cliente] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Cotizacion] CHECK CONSTRAINT [FK_Cotizacion_Cliente]
GO
ALTER TABLE [dbo].[Cotizacion]  WITH CHECK ADD  CONSTRAINT [FK_Cotizacion_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Cotizacion] CHECK CONSTRAINT [FK_Cotizacion_Usuario]
GO
ALTER TABLE [dbo].[DetalleServicio]  WITH CHECK ADD  CONSTRAINT [FK_DetalleServicio_Cliente] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[DetalleServicio] CHECK CONSTRAINT [FK_DetalleServicio_Cliente]
GO
ALTER TABLE [dbo].[DetalleServicio]  WITH CHECK ADD  CONSTRAINT [FK_DetalleServicio_EstadoServicio] FOREIGN KEY([EstadoServicioId])
REFERENCES [dbo].[EstadoServicio] ([Id])
GO
ALTER TABLE [dbo].[DetalleServicio] CHECK CONSTRAINT [FK_DetalleServicio_EstadoServicio]
GO
ALTER TABLE [dbo].[DetalleServicio]  WITH CHECK ADD  CONSTRAINT [FK_DetalleServicio_TipoServicio] FOREIGN KEY([TipoServicioId])
REFERENCES [dbo].[TipoServicio] ([Id])
GO
ALTER TABLE [dbo].[DetalleServicio] CHECK CONSTRAINT [FK_DetalleServicio_TipoServicio]
GO
ALTER TABLE [dbo].[DetalleServicio]  WITH CHECK ADD  CONSTRAINT [FK_DetalleServicio_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[DetalleServicio] CHECK CONSTRAINT [FK_DetalleServicio_Usuario]
GO
ALTER TABLE [dbo].[ListaServicioCotizacion]  WITH CHECK ADD  CONSTRAINT [FK_ListaServicioCotizacion_Cotizacion] FOREIGN KEY([CotizacionId])
REFERENCES [dbo].[Cotizacion] ([Id])
GO
ALTER TABLE [dbo].[ListaServicioCotizacion] CHECK CONSTRAINT [FK_ListaServicioCotizacion_Cotizacion]
GO
ALTER TABLE [dbo].[ListaServicioCotizacion]  WITH CHECK ADD  CONSTRAINT [FK_ListaServicioCotizacion_TipoServicio] FOREIGN KEY([TipoServicioId])
REFERENCES [dbo].[TipoServicio] ([Id])
GO
ALTER TABLE [dbo].[ListaServicioCotizacion] CHECK CONSTRAINT [FK_ListaServicioCotizacion_TipoServicio]
GO
USE [master]
GO
ALTER DATABASE [MasterServiceDB] SET  READ_WRITE 
GO
