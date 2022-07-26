USE [master]
GO
/****** Object:  Database [YUYITOS]    Script Date: 30-06-2020 17:34:14 ******/
CREATE DATABASE [YUYITOS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YUYITOS', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.BENJAMIN\MSSQL\DATA\YUYITOS.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'YUYITOS_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.BENJAMIN\MSSQL\DATA\YUYITOS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [YUYITOS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YUYITOS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YUYITOS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YUYITOS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YUYITOS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YUYITOS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YUYITOS] SET ARITHABORT OFF 
GO
ALTER DATABASE [YUYITOS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YUYITOS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [YUYITOS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YUYITOS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YUYITOS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YUYITOS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YUYITOS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YUYITOS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YUYITOS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YUYITOS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YUYITOS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YUYITOS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YUYITOS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YUYITOS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YUYITOS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YUYITOS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YUYITOS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YUYITOS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YUYITOS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [YUYITOS] SET  MULTI_USER 
GO
ALTER DATABASE [YUYITOS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YUYITOS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YUYITOS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YUYITOS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [YUYITOS]
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizar_boleta]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_actualizar_boleta]
@id_venta int,
@cod_producto int,
@descripcion varchar(100),
@precio_venta int,
@stock int,
@cantidad int ,
@fecha_venta varchar(100),
@total_a_pagar int
AS
BEGIN
	UPDATE registro_ventas
	SET cod_producto = @cod_producto,
		descripcion_producto = @descripcion,
		precio_venta = @precio_venta,
		stock = @stock,
		cantidad = @cantidad,
		fecha_venta = @fecha_venta,
		total_a_pagar = @total_a_pagar
		WHERE id_ventas = @id_venta
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Actualizar_cliente]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Actualizar_cliente]
	@id_cliente int,
	@nombre varchar(50),
	@apellido varchar(50),
	@rut varchar(50),
	@genero varchar(50),
	@telefono varchar(50),
	@estado varchar(50)

AS
BEGIN
	UPDATE clientes
		
	SET	nombre = @nombre,
		apellido= @apellido,
		rut = @rut,
	    genero = @genero,
	   telefono = @telefono,
	   estado  = @estado
	where id_cliente = @id_cliente
END

GO
/****** Object:  StoredProcedure [dbo].[sp_actualizar_productos]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_actualizar_productos]
@cod_producto int,
@fecha_venci varchar(100),
@descrip varchar(100),
@precio_com int,
@precio_venta int,
@stock int,
@stock_critico int,
@categoria varchar(100)
AS
BEGIN

		UPDATE Productos
		SET descripcion=@descrip,
			fecha_vencimiento=@fecha_venci,
		    precio_compra=@precio_com,
			precio_venta=@precio_venta,
			stock=@stock,
			stock_critico = @stock_critico,
			categoria = @categoria
			WHERE cod_producto = @cod_producto
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Detalle_venta_Tem]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Detalle_venta_Tem]

	@cod_producto int,
	@descripcion_producto varchar(100),
	@precio_venta int,
    @stock int,
    @cantidad int,
    @fecha_venta varchar(100)
AS
BEGIN
insert into dbo.detalle_de_factura(cod_producto,descripcion_producto,precio_venta,stock,cantidad,
    fecha_venta)
	values (
	@cod_producto,
	@descripcion_producto,
	@precio_venta,
    @stock,
    @cantidad,
    @fecha_venta)	
	/*update Productos set stock=stock-@cantidad where cod_producto=@cod_producto*/
END
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_producto]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_eliminar_producto]
@cod_producto int
AS
BEGIN
	DELETE FROM Productos WHERE cod_producto=@cod_producto
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Eliminar_Proveedor]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Eliminar_Proveedor]
@cod_prove int

AS
BEGIN
	DELETE FROM registro_proveedores WHERE cod_proveedor = @cod_prove
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_cliente]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_cliente]
	@nombre varchar(50),
	@apellido varchar(50),
	@rut varchar(50),
	@genero varchar(50),
	@telefono varchar(50),
	@estado varchar(50)

AS
BEGIN
	insert into dbo.clientes(nombre,apellido,rut,genero,telefono,estado)values 
	(@nombre,
	@apellido,
	@rut,
    @genero,
    @telefono,
    @estado)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_proveedor]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Benjamin Alfaro
-- Create date: 21/04/2020
-- Description:	Insercion de datos Tabla Proveedores
-- =============================================
CREATE PROCEDURE [dbo].[sp_insertar_proveedor]
	-- Declaracion de varibles 
	@nombre varchar(50),
	@telefono varchar(50),
	@email varchar(50),
	@comuna varchar(100),
	@direccion varchar(100),
	@rubro varchar(100)
AS
/*if not exists(select nombre_proveedor from registro_proveedores where nombre_proveedor = @nombre)*/
BEGIN
    -- Insert statements for procedure here
	INSERT INTO registro_proveedores (nombre_proveedor,telefono,email,comuna,direccion,rubro) 
	VALUES (@nombre,@telefono,@email,@comuna,@direccion,@rubro)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_listar_clientes]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_listar_clientes]
AS
BEGIN
	select * from registro_clientes
END

GO
/****** Object:  StoredProcedure [dbo].[sp_listar_fiados]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Benjamin Alfaro
-- Create date: <Create Date,,>
-- Description:	Lista todos los fiados para generar informe 
-- =============================================
CREATE PROCEDURE [dbo].[sp_listar_fiados]
AS
BEGIN
	select * from registro_pagos_fiados
END

GO
/****** Object:  StoredProcedure [dbo].[sp_listar_pedidos]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Benjamin Alfaro
-- Create date: <Create Date,,>
-- Description:	Lista los pedidos para la generacion del informe
-- =============================================
CREATE PROCEDURE [dbo].[sp_listar_pedidos]
AS
BEGIN
	SELECT * FROM Registro_de_pedidos
END

GO
/****** Object:  StoredProcedure [dbo].[sp_listar_productos]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Benjamin
-- Create date: <Create Date,,>
-- Description:	lista los productos para poder generar el infome 
-- =============================================
CREATE PROCEDURE [dbo].[sp_listar_productos]
AS
BEGIN
	SELECT * FROM Productos
END

GO
/****** Object:  StoredProcedure [dbo].[sp_listar_proveedores]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Benjamin Alfaro
-- Create date: <Create Date,,>
-- Description:	lista proveedores para la generacion de informes
-- =============================================
CREATE PROCEDURE [dbo].[sp_listar_proveedores]
AS
BEGIN
	SELECT * FROM registro_proveedores
END

GO
/****** Object:  StoredProcedure [dbo].[sp_listar_recepcion_pedidos]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Benjamin Alfaro
-- Create date: <Create Date,,>
-- Description:	lista los pedidos recepcionado para generar informe 
-- =============================================
CREATE PROCEDURE [dbo].[sp_listar_recepcion_pedidos]
AS
BEGIN
	SELECT * FROM recepcion_productos
END

GO
/****** Object:  StoredProcedure [dbo].[sp_listar_ventas]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Lista ventas para la generacion de informes
-- =============================================
CREATE PROCEDURE [dbo].[sp_listar_ventas]
AS
BEGIN
	SELECT * FROM registro_ventas 
END

GO
/****** Object:  StoredProcedure [dbo].[sp_registrar_pago_fiado]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_registrar_pago_fiado]

	@id_cliente int,
	@nombre_cliente varchar(100),
	@apellido_cliente varchar(100),
    @rut varchar(100),
    @deuda_pagada int,
	@estado varchar(100)
AS
BEGIN
insert into dbo.registro_pagos_fiados(id_cliente,nombre_cliente,apellido_cliente,rut,deuda_pagada,
    estado)
	values (
	@id_cliente,
	@nombre_cliente,
	@apellido_cliente,
    @rut,
    @deuda_pagada,
	@estado
)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Registrar_venta]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Registrar_venta] 

	@cod_producto varchar(100),
	@descripcion_producto varchar(100),
	@precio_venta int,
    @stock int,
    @cantidad int,
    @fecha_venta varchar(100),
	@total_a_pagar int
AS
BEGIN
insert into dbo.registro_ventas(cod_producto,descripcion_producto,precio_venta,stock,cantidad,
    fecha_venta,total_a_pagar)
	values (
	@cod_producto,
	@descripcion_producto,
	@precio_venta,
    @stock,
    @cantidad,
    @fecha_venta,
	@total_a_pagar)

END

GO
/****** Object:  StoredProcedure [dbo].[sp_registro_pedidos]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Benjamin Alfaro
-- Create date: 28/04/2020
-- Description:	Ingreso de datos tabla registro_pedidos
-- =============================================
CREATE PROCEDURE [dbo].[sp_registro_pedidos]
	@cod_prove int,
	@nom_prove varchar(100),
	@rubro_prove varchar(100),
	@fecha varchar(100),
	@descripcion varchar(100),
	@cantidad int 
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT INTO Registro_de_pedidos(cod_proveedor,nom_proveedor,rubro_proveedor,fecha,descripcion,cantidad)
	VALUES(@cod_prove,@nom_prove,@rubro_prove,@fecha,@descripcion,@cantidad)
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_registro_productos]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:	Registro de Productos
-- =============================================
CREATE PROCEDURE [dbo].[sp_registro_productos] 
	-- Add the parameters for tabal productos
	@cod_proveedor int,
	@nombre_proveedor varchar(100),
	@fecha_vencimiento varchar(100),
	@descripcio varchar(100),
	@precio_com int,
	@precio_venta int,
	@stock int,
	@stock_critico int,
	@categoria varchar(100)
AS
/*
Valida que no se ingresen datos ya existentes
if not exists(select descripcion from Productos where descripcion=@descripcio)*/
BEGIN
    -- Insert productos
	INSERt INTO Productos(cod_proveedor,nombre_proveedor,fecha_vencimiento,descripcion,precio_compra,precio_venta,stock,stock_critico,categoria) 
	VALUES(@cod_proveedor,@nombre_proveedor,@fecha_vencimiento,@descripcio,@precio_com,@precio_venta,@stock,@stock_critico,@categoria) 
END

GO
/****** Object:  UserDefinedFunction [dbo].[TotalMontoFiado]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[TotalMontoFiado]() RETURNS INT
as 
begin
DECLARE @SUM INT
select @SUM=sum(total_a_pagar) from registro_clientes
RETURN @SUM
/*mensaje para probar funcion
print 'Monto Total Fiado : ' + cast(dbo.TotalMontoFiado() as varchar(100))
*/
end
GO
/****** Object:  UserDefinedFunction [dbo].[TotalPagoDeFiados]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TotalPagoDeFiados]() RETURNS INT
as

begin
DECLARE @SUM INT
select @SUM=sum(deuda_pagada) from registro_pagos_fiados
RETURN @SUM
/*mensaje para probar funcion
print 'Monto Total Cancelado por fiados : ' + cast(dbo.TotalPagoDeFiados() as varchar(100))
*/
end

GO
/****** Object:  UserDefinedFunction [dbo].[TotalRecaudadoPorVentas]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TotalRecaudadoPorVentas]() RETURNS INT
AS
BEGIN
DECLARE @SUM INT
select @SUM=sum(total_a_pagar) from registro_ventas

RETURN @SUM 

/*
Mensaje para probar funcion
print 'Monto rescaudado : ' + cast(dbo.TotalRecaudadoPorVentas() as varchar(100)) */
END


GO
/****** Object:  Table [dbo].[clientes]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clientes](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[rut] [varchar](50) NOT NULL,
	[genero] [varchar](100) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[estado] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalle_de_factura]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[detalle_de_factura](
	[id_ventas] [int] IDENTITY(1,1) NOT NULL,
	[cod_producto] [int] NOT NULL,
	[descripcion_producto] [varchar](100) NOT NULL,
	[precio_venta] [int] NOT NULL,
	[stock] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[fecha_venta] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ventas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalle_fiados]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_fiados](
	[id_cliente] [int] NOT NULL,
	[id_fiados] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historial_productos]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[historial_productos](
	[nombre_proveedor] [varchar](100) NULL,
	[fecha_vencimiento] [varchar](100) NULL,
	[descripcion] [varchar](100) NOT NULL,
	[precio_compra] [int] NOT NULL,
	[precio_venta] [int] NOT NULL,
	[stock] [int] NOT NULL,
	[stock_critico] [int] NOT NULL,
	[categoria] [varchar](100) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[historial_proveedores]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[historial_proveedores](
	[nombre_proveedor] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[comuna] [varchar](100) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[rubro] [varchar](100) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[cod_producto] [int] IDENTITY(100,1) NOT NULL,
	[cod_proveedor] [int] NULL,
	[nombre_proveedor] [varchar](100) NULL,
	[fecha_vencimiento] [varchar](100) NULL,
	[descripcion] [varchar](100) NOT NULL,
	[precio_compra] [int] NOT NULL,
	[precio_venta] [int] NOT NULL,
	[stock] [int] NOT NULL,
	[stock_critico] [int] NOT NULL,
	[categoria] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[recepcion_productos]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[recepcion_productos](
	[id_recepcion_producto] [int] IDENTITY(1,1) NOT NULL,
	[nro_orden] [int] NULL,
	[nom_proveedor] [varchar](100) NOT NULL,
	[rubro_proveedor] [varchar](100) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[cantidad] [int] NOT NULL,
	[estado] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_recepcion_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[registro_clientes]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[registro_clientes](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[rut] [varchar](50) NOT NULL,
	[genero] [varchar](100) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[fecha_de_fiado] [varchar](50) NOT NULL,
	[fecha_de_pago] [varchar](50) NOT NULL,
	[cod_producto] [int] NOT NULL,
	[descripcion_producto] [varchar](50) NOT NULL,
	[stock] [int] NOT NULL,
	[precio_venta] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[total_a_pagar] [int] NOT NULL,
	[estado] [varchar](100) NOT NULL,
 CONSTRAINT [PK_registro_clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Registro_de_pedidos]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Registro_de_pedidos](
	[nro_orden] [int] IDENTITY(100,1) NOT NULL,
	[cod_proveedor] [int] NULL,
	[nom_proveedor] [varchar](100) NOT NULL,
	[rubro_proveedor] [varchar](100) NOT NULL,
	[fecha] [varchar](100) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Registro_de_pedidos] PRIMARY KEY CLUSTERED 
(
	[nro_orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[registro_pagos_fiados]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[registro_pagos_fiados](
	[id_fiados] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[nombre_cliente] [varchar](50) NOT NULL,
	[apellido_cliente] [varchar](50) NOT NULL,
	[rut] [varchar](50) NOT NULL,
	[deuda_pagada] [int] NOT NULL,
	[estado] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_fiados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[registro_proveedores]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[registro_proveedores](
	[cod_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[nombre_proveedor] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[comuna] [varchar](100) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[rubro] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[registro_ventas]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[registro_ventas](
	[id_ventas] [int] IDENTITY(1,1) NOT NULL,
	[cod_producto] [int] NOT NULL,
	[numero_boleta] [varchar](100) NULL,
	[descripcion_producto] [varchar](100) NOT NULL,
	[precio_venta] [int] NOT NULL,
	[stock] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[fecha_venta] [varchar](100) NOT NULL,
	[total_a_pagar] [int] NOT NULL,
 CONSTRAINT [PK_registro_ventas] PRIMARY KEY CLUSTERED 
(
	[id_ventas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[cargo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[detalle_fiados]  WITH CHECK ADD  CONSTRAINT [FK_detalle_fiados_registro_clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[registro_clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[detalle_fiados] CHECK CONSTRAINT [FK_detalle_fiados_registro_clientes]
GO
ALTER TABLE [dbo].[detalle_fiados]  WITH CHECK ADD  CONSTRAINT [FK_detalle_fiados_registro_pagos_fiados] FOREIGN KEY([id_fiados])
REFERENCES [dbo].[registro_pagos_fiados] ([id_fiados])
GO
ALTER TABLE [dbo].[detalle_fiados] CHECK CONSTRAINT [FK_detalle_fiados_registro_pagos_fiados]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_registro_proveedores] FOREIGN KEY([cod_proveedor])
REFERENCES [dbo].[registro_proveedores] ([cod_proveedor])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_registro_proveedores]
GO
ALTER TABLE [dbo].[recepcion_productos]  WITH CHECK ADD  CONSTRAINT [FK_recepcion_productos_Registro_de_pedidos] FOREIGN KEY([nro_orden])
REFERENCES [dbo].[Registro_de_pedidos] ([nro_orden])
GO
ALTER TABLE [dbo].[recepcion_productos] CHECK CONSTRAINT [FK_recepcion_productos_Registro_de_pedidos]
GO
ALTER TABLE [dbo].[registro_clientes]  WITH CHECK ADD  CONSTRAINT [FK_registro_clientes_Productos] FOREIGN KEY([cod_producto])
REFERENCES [dbo].[Productos] ([cod_producto])
GO
ALTER TABLE [dbo].[registro_clientes] CHECK CONSTRAINT [FK_registro_clientes_Productos]
GO
ALTER TABLE [dbo].[Registro_de_pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Registro_de_pedidos_registro_proveedores] FOREIGN KEY([cod_proveedor])
REFERENCES [dbo].[registro_proveedores] ([cod_proveedor])
GO
ALTER TABLE [dbo].[Registro_de_pedidos] CHECK CONSTRAINT [FK_Registro_de_pedidos_registro_proveedores]
GO
ALTER TABLE [dbo].[registro_ventas]  WITH CHECK ADD  CONSTRAINT [FK_registro_ventas_Productos] FOREIGN KEY([cod_producto])
REFERENCES [dbo].[Productos] ([cod_producto])
GO
ALTER TABLE [dbo].[registro_ventas] CHECK CONSTRAINT [FK_registro_ventas_Productos]
GO
/****** Object:  Trigger [dbo].[tr.historial_productos]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr.historial_productos] on [dbo].[Productos]
   AFTER INSERT
AS 
BEGIN
	declare @nom_provee varchar(100);
	declare @fecha_venci varchar(100);
	declare @descripcio varchar(100);
	declare @precio_compra int;
	declare @precio_venta int;
	declare @stock int;
	declare @stock_critico int;
	declare @categoria varchar(100);

	select @nom_provee=Productos.nombre_proveedor from inserted Productos;
	select @fecha_venci=Productos.fecha_vencimiento from inserted Productos;
	select @descripcio = Productos.descripcion from inserted Productos;
	select @precio_compra = Productos.precio_compra from inserted Productos;
	select @precio_venta = Productos.precio_venta from inserted Productos;
	select @stock = Productos.stock from inserted Productos;
	select @stock_critico = Productos.stock_critico from inserted Productos;
	select @categoria = Productos.categoria from inserted Productos;
	
	INSERT INTO historial_productos(nombre_proveedor,fecha_vencimiento,descripcion,precio_compra,precio_venta,stock,stock_critico,categoria) 
	VALUES(@nom_provee,@fecha_venci,@descripcio,@precio_compra,@precio_venta,@stock,@stock_critico,@categoria)

END

GO
/****** Object:  Trigger [dbo].[tr_historial_proveedores]    Script Date: 30-06-2020 17:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_historial_proveedores] on [dbo].[registro_proveedores]
   AFTER INSERT
AS 
BEGIN
	declare @nombre varchar(50);
	declare @telefono varchar(50);
	declare @email varchar(50);
	declare @comuna varchar(100);
	declare @direccion varchar(100);
	declare @rubro varchar(100);

	select @nombre = registro_proveedores.nombre_proveedor from inserted registro_proveedores; 
	select @telefono = registro_proveedores.telefono from inserted registro_proveedores;
	select @email = registro_proveedores.email from inserted registro_proveedores;
	select @comuna = registro_proveedores.comuna from inserted registro_proveedores;
	select @direccion = registro_proveedores.direccion from inserted registro_proveedores;
	select @rubro = registro_proveedores.rubro from inserted registro_proveedores;

	INSERT INTO historial_proveedores(nombre_proveedor,telefono,email,comuna,direccion,rubro) 
	VALUES(@nombre,@telefono,@email,@comuna,@direccion,@rubro)

END

GO
USE [master]
GO
ALTER DATABASE [YUYITOS] SET  READ_WRITE 
GO
