USE [master]
GO
/****** Object:  Database [taxis]    Script Date: 7/10/2016 12:08:00 AM ******/
CREATE DATABASE [taxis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'taxis', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\taxis.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'taxis_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\taxis_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [taxis] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [taxis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [taxis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [taxis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [taxis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [taxis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [taxis] SET ARITHABORT OFF 
GO
ALTER DATABASE [taxis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [taxis] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [taxis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [taxis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [taxis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [taxis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [taxis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [taxis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [taxis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [taxis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [taxis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [taxis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [taxis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [taxis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [taxis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [taxis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [taxis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [taxis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [taxis] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [taxis] SET  MULTI_USER 
GO
ALTER DATABASE [taxis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [taxis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [taxis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [taxis] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [taxis]
GO
/****** Object:  StoredProcedure [dbo].[Actualiza_Asignaciones]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actualiza_Asignaciones] 
	-- Add the parameters for the stored procedure here
	@ID_ASIGNACIONES numeric(18),
	@ID_UNIDAD numeric(18),
	@DIRECCION_ORIGEN nvarchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[ASIGNACIONES]
   SET [ID_UNIDAD] = @ID_UNIDAD
      ,[DIRECCION_ORIGEN] = @DIRECCION_ORIGEN
 WHERE [ID_ASIGNACIONES] = @ID_ASIGNACIONES
END

GO
/****** Object:  StoredProcedure [dbo].[Actualiza_Cliente]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actualiza_Cliente]
	-- Add the parameters for the stored procedure here
	@ID_CLIENTE numeric(18),
	@TELEFONO varchar(15),
	@CELULAR varchar(15),
	@DIRECCION varchar(250),
	@REFERENCIA varchar(250),
	@NOMBRE varchar(250),
	@ESTADO char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[CLIENTES]
   SET [TELEFONO] = @TELEFONO
      ,[CELULAR] = @CELULAR
      ,[DIRECCION] = @DIRECCION
      ,[REFERENCIA] = @REFERENCIA
      ,[NOMBRE] = @NOMBRE
      ,[ESTADO] = @ESTADO
 WHERE ID_CLIENTE = @ID_CLIENTE
END

GO
/****** Object:  StoredProcedure [dbo].[Actualiza_Configuracion]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actualiza_Configuracion]
	-- Add the parameters for the stored procedure here
	@ID_CONFIGURACION numeric(18,0),
	@PUERTO varchar(10),
	@VELOCIDAD int,
	@PARIDAD varchar(10),
	@ESTADO char(1),
	@BITS_DATOS int,
	@BITS_PARADA varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[CONFIGURACIONES]
   SET [PUERTO] = @PUERTO
      ,[VELOCIDAD] = @VELOCIDAD
      ,[PARIDAD] = @PARIDAD
	  ,[ESTADO] = @ESTADO
      ,[BITS_DATOS] = @BITS_DATOS
      ,[BITS_PARADA] = @BITS_PARADA
 WHERE [ID_CONFIGURACION] = @ID_CONFIGURACION
END

GO
/****** Object:  StoredProcedure [dbo].[Actualiza_Unidad]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actualiza_Unidad]
	-- Add the parameters for the stored procedure here
	@ID_UNIDAD numeric(18),
	@PROPIETARIO varchar(150),
	@CHOFER varchar(150),
	@NUMERO_UNIDAD int,
	@PLACA varchar(23),
	@COLOR varchar (25),
	@AUTORIZACION varchar(50),
	@MATRICULA varchar(100),
	@ESTADO char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[UNIDADES]
   SET [PROPIETARIO] = @PROPIETARIO
      ,[CHOFER] = @CHOFER
      ,[NUMERO_UNIDAD] = @NUMERO_UNIDAD
      ,[PLACA] = @PLACA
      ,[COLOR] = @COLOR
      ,[AUTORIZACION] = @AUTORIZACION
      ,[MATRICULA] = @MATRICULA
      ,[ESTADO] = @ESTADO
 WHERE ID_UNIDAD = @ID_UNIDAD
END

GO
/****** Object:  StoredProcedure [dbo].[Actualiza_Usuario]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actualiza_Usuario] 
	-- Add the parameters for the stored procedure here
	@ID_USUARIO numeric(18,0),
	@ROL varchar(10),
	@PASS int,
	@USER varchar(10),
	@ESTADO char(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[USUARIOS]
   SET [ROL] = @ROL,
      [PASS] = @PASS,
      [USER] = @USER,
	  [ESTADO] = @ESTADO
 WHERE [ID_USUARIO] = @ID_USUARIO
END

GO
/****** Object:  StoredProcedure [dbo].[Inserta_Asignaciones]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Inserta_Asignaciones]
	-- Add the parameters for the stored procedure here
	@ID_UNIDAD numeric(18),
	@ID_CLIENTE numeric(18),
	@FECHA datetime,
	@HORA datetime,
	@DIRECCION_ORIGEN nvarchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[ASIGNACIONES]
           ([ID_UNIDAD]
           ,[ID_CLIENTE]
           ,[FECHA]
           ,[HORA]
		   ,[DIRECCION_ORIGEN])
     VALUES
           (@ID_UNIDAD
           ,@ID_CLIENTE
           ,CONVERT(datetime, GETDATE())
           ,CONVERT(datetime, GETDATE())
		   ,@DIRECCION_ORIGEN);

END


GO
/****** Object:  StoredProcedure [dbo].[Inserta_Cliente]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Inserta_Cliente]
	-- Add the parameters for the stored procedure here
	@TELEFONO varchar(15),
	@CELULAR varchar(15),
	@DIRECCION varchar(250),
	@REFERENCIA varchar(250),
	@NOMBRE varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[CLIENTES]
           ([TELEFONO]
           ,[CELULAR]
           ,[DIRECCION]
           ,[REFERENCIA]
           ,[NOMBRE]
           ,[ESTADO])
     VALUES
           (@TELEFONO
           ,@CELULAR
           ,@DIRECCION
           ,@REFERENCIA
           ,@NOMBRE
           ,'A')
END

GO
/****** Object:  StoredProcedure [dbo].[Inserta_Configuracion]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Inserta_Configuracion]
	-- Add the parameters for the stored procedure here
	@PUERTO varchar(10),
	@VELOCIDAD int,
	@PARIDAD varchar(10),
	@BITS_DATOS int,
	@BITS_PARADA varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CONFIGURACIONES
           (PUERTO
           ,VELOCIDAD
           ,PARIDAD
           ,ESTADO
           ,BITS_DATOS
		   ,BITS_PARADA)
     VALUES
           (@PUERTO
           ,@VELOCIDAD
           ,@PARIDAD
           ,'A'
           ,@BITS_DATOS
		   ,@BITS_PARADA)
END

GO
/****** Object:  StoredProcedure [dbo].[Inserta_Unidad]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Inserta_Unidad] 
	-- Add the parameters for the stored procedure here
	@PROPIETARIO varchar(150),
	@CHOFER varchar(150),
	@NUMERO_UNIDAD int,
	@PLACA varchar(23),
	@COLOR varchar (25),
	@AUTORIZACION varchar(50),
	@MATRICULA varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[UNIDADES]
           ([PROPIETARIO]
           ,[CHOFER]
           ,[NUMERO_UNIDAD]
           ,[PLACA]
           ,[COLOR]
           ,[AUTORIZACION]
           ,[MATRICULA]
           ,[ESTADO])
     VALUES
           (@PROPIETARIO,
           @CHOFER,
           @NUMERO_UNIDAD,
           @PLACA,
           @COLOR,
           @AUTORIZACION,
           @MATRICULA,
           'A')
END

GO
/****** Object:  StoredProcedure [dbo].[Inserta_Usuario]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Inserta_Usuario]
	-- Add the parameters for the stored procedure here
	@ROL varchar(50),
	@PASS varchar(250),
	@USER varchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[USUARIOS]
           ([ROL]
           ,[PASS]
           ,[USER]
           ,[ESTADO])
     VALUES
           (@ROL,
           @PASS,
           @USER,
           'A')
END

GO
/****** Object:  StoredProcedure [dbo].[Reporte_Llamadas]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Reporte_Llamadas]
	-- Add the parameters for the stored procedure here
	@Fecha datetime,
	@fecha2 datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select ID_ASIGNACIONES AS NUM, TELEFONO ,CELULAR, 
	a.DIRECCION_ORIGEN,REFERENCIA, a.ID_UNIDAD , FECHA 
	from CLIENTES c,  /*UNIDADES u,*/ ASIGNACIONES a 
	where a.ID_CLIENTE = c.ID_CLIENTE  
	/*AND a.ID_UNIDAD = u.ID_UNIDAD*/ 
	AND (CONVERT(date, FECHA) BETWEEN CONVERT(date, @Fecha) AND CONVERT(date, @Fecha2))
END

GO
/****** Object:  StoredProcedure [dbo].[Reporte_Llamadas_Direccion]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Reporte_Llamadas_Direccion] 
	-- Add the parameters for the stored procedure here
	@Fecha datetime,
	@Fecha2 datetime,
	@Direccion nvarchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select ID_ASIGNACIONES AS NUM, TELEFONO ,CELULAR, 
	a.DIRECCION_ORIGEN,REFERENCIA, a.ID_UNIDAD , FECHA 
	from CLIENTES c,  /*UNIDADES u,*/ ASIGNACIONES a 
	where a.ID_CLIENTE = c.ID_CLIENTE  
	/*AND a.ID_UNIDAD = u.ID_UNIDAD*/ 
	AND a.DIRECCION_ORIGEN like '%'+@Direccion+'%'
	AND (CONVERT(date, FECHA) BETWEEN CONVERT(date, @Fecha) AND CONVERT(date, @Fecha2)) 
	 ;
END

GO
/****** Object:  Table [dbo].[ASIGNACIONES]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASIGNACIONES](
	[ID_ASIGNACIONES] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ID_UNIDAD] [numeric](18, 0) NULL,
	[ID_CLIENTE] [numeric](18, 0) NULL,
	[FECHA] [datetime] NULL,
	[HORA] [datetime] NULL,
	[DIRECCION_ORIGEN] [nvarchar](500) NULL,
 CONSTRAINT [PK_ASIGNACIONES] PRIMARY KEY NONCLUSTERED 
(
	[ID_ASIGNACIONES] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[ID_CLIENTE] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TELEFONO] [varchar](15) NULL,
	[CELULAR] [varchar](15) NULL,
	[DIRECCION] [varchar](250) NULL,
	[REFERENCIA] [varchar](250) NULL,
	[NOMBRE] [varchar](250) NULL,
	[ESTADO] [char](1) NULL,
 CONSTRAINT [PK_CLIENTES] PRIMARY KEY NONCLUSTERED 
(
	[ID_CLIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CONFIGURACIONES]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONFIGURACIONES](
	[ID_CONFIGURACION] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[PUERTO] [varchar](10) NULL,
	[VELOCIDAD] [int] NULL,
	[PARIDAD] [varchar](10) NULL,
	[ESTADO] [char](1) NULL,
	[BITS_DATOS] [varchar](15) NULL,
	[BITS_PARADA] [varchar](15) NULL,
 CONSTRAINT [PK_CONFIGURACIONES] PRIMARY KEY NONCLUSTERED 
(
	[ID_CONFIGURACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORGANIZACION]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORGANIZACION](
	[ID_ORGANIZACION] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](250) NULL,
	[DIRECCION] [varchar](250) NULL,
	[TELEFONO1] [varchar](15) NULL,
	[TELEFONO2] [varchar](15) NULL,
	[EMAIL] [varchar](150) NULL,
	[RUC] [varchar](13) NULL,
	[CELULAR] [varchar](15) NULL,
 CONSTRAINT [PK_ORGANIZACION] PRIMARY KEY NONCLUSTERED 
(
	[ID_ORGANIZACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UNIDADES]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UNIDADES](
	[ID_UNIDAD] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[PROPIETARIO] [varchar](150) NULL,
	[CHOFER] [varchar](150) NULL,
	[NUMERO_UNIDAD] [int] NULL,
	[PLACA] [varchar](25) NULL,
	[COLOR] [varchar](25) NULL,
	[AUTORIZACION] [varchar](50) NULL,
	[MATRICULA] [varchar](100) NULL,
	[ESTADO] [char](1) NULL,
 CONSTRAINT [PK_UNIDADES] PRIMARY KEY NONCLUSTERED 
(
	[ID_UNIDAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 7/10/2016 12:08:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[ID_USUARIO] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ROL] [varchar](50) NULL,
	[PASS] [varchar](250) NULL,
	[USER] [varchar](150) NULL,
	[ESTADO] [char](1) NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY NONCLUSTERED 
(
	[ID_USUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [RELATIONSHIP_1_FK]    Script Date: 7/10/2016 12:08:00 AM ******/
CREATE NONCLUSTERED INDEX [RELATIONSHIP_1_FK] ON [dbo].[ASIGNACIONES]
(
	[ID_UNIDAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [RELATIONSHIP_2_FK]    Script Date: 7/10/2016 12:08:00 AM ******/
CREATE NONCLUSTERED INDEX [RELATIONSHIP_2_FK] ON [dbo].[ASIGNACIONES]
(
	[ID_CLIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ASIGNACIONES]  WITH CHECK ADD  CONSTRAINT [FK_ASIGNACI_RELATIONS_CLIENTES] FOREIGN KEY([ID_CLIENTE])
REFERENCES [dbo].[CLIENTES] ([ID_CLIENTE])
GO
ALTER TABLE [dbo].[ASIGNACIONES] CHECK CONSTRAINT [FK_ASIGNACI_RELATIONS_CLIENTES]
GO
ALTER TABLE [dbo].[ASIGNACIONES]  WITH CHECK ADD  CONSTRAINT [FK_ASIGNACI_RELATIONS_UNIDADES] FOREIGN KEY([ID_UNIDAD])
REFERENCES [dbo].[UNIDADES] ([ID_UNIDAD])
GO
ALTER TABLE [dbo].[ASIGNACIONES] CHECK CONSTRAINT [FK_ASIGNACI_RELATIONS_UNIDADES]
GO
USE [master]
GO
ALTER DATABASE [taxis] SET  READ_WRITE 
GO
