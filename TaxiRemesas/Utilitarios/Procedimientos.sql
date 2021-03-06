USE [taxis]
GO
/****** Object:  StoredProcedure [dbo].[Actualiza_Asignaciones]    Script Date: 7/10/2016 12:11:33 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Actualiza_Cliente]    Script Date: 7/10/2016 12:11:33 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Actualiza_Configuracion]    Script Date: 7/10/2016 12:11:33 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Actualiza_Unidad]    Script Date: 7/10/2016 12:11:33 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Actualiza_Usuario]    Script Date: 7/10/2016 12:11:33 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Inserta_Asignaciones]    Script Date: 7/10/2016 12:11:33 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Inserta_Cliente]    Script Date: 7/10/2016 12:11:33 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Inserta_Configuracion]    Script Date: 7/10/2016 12:11:33 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Inserta_Unidad]    Script Date: 7/10/2016 12:11:33 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Inserta_Usuario]    Script Date: 7/10/2016 12:11:33 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Reporte_Llamadas]    Script Date: 7/10/2016 12:11:33 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Reporte_Llamadas_Direccion]    Script Date: 7/10/2016 12:11:33 AM ******/
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
