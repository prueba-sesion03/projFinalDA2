USE [master]
GO
/****** Object:  Database [Sistema_Notas_Colegio]    Script Date: 30/10/2017 23:49:35 ******/
CREATE DATABASE [Sistema_Notas_Colegio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sistema_Notas_Colegio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Sistema_Notas_Colegio.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Sistema_Notas_Colegio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Sistema_Notas_Colegio_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sistema_Notas_Colegio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET  MULTI_USER 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Sistema_Notas_Colegio]
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarAlumno]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	 PROCEDURE [dbo].[usp_ActualizarAlumno]
@Id char(3),
@Nom varchar(25),
@Ape_m varchar(25),
@Ape_p varchar(25),
@Tel char(9),
@fec_nac smalldatetime,
@dni char(8)


AS

Update Alumno set Id_Alumno=@Id , Nom_alu = @Nom, Ape_alu_mat=@Ape_m,
Ape_alu_pat=@Ape_p, Tel_alu = @Tel, Fecha_Nacimiento= @fec_nac  ,Dni=@dni
where Id_Alumno=@Id
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarAuxiliar]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	 PROCEDURE [dbo].[usp_ActualizarAuxiliar]

@Id char(4),
@Nom_a varchar(25),
@Ape_ma varchar(25),
@Ape_pa varchar(25),
@Tele char(9),
@fec smalldatetime 

AS
Update Auxiliar  set id_Auxiliar =@Id , nom_aux = @Nom_a, ape_aux_mat=@Ape_ma,
ape_aux_pat=@Ape_pa, tel_aux = @Tele, fecha_con=@fec
where id_Auxiliar =@Id
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarGrado]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	 PROCEDURE [dbo].[usp_ActualizarGrado]
@cod char (2),
@nota tinyint,
@id_alu char(3),
@id_pro char(3),
@salon varchar(40),
@fec_r smalldatetime
AS

Update Grado set Id_grado=@cod , Nota_conducta = @nota, Id_Alumno=@id_alu,
Id_Profesor=@id_pro, Salon = @salon, Fec_reg = @fec_r
where Id_grado=@cod
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarProfesor]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarProfesor]
@vcod char(3),
@nom varchar(25),
@apempro varchar(25),
@apeppro varchar(25),
@tel char(9),
@tip char(1),
@fec smalldatetime

AS

Update Profesor set Id_Profesor=@vcod , Nom_pro = @nom, Ape_pro_mat=@apempro,
Ape_pro_pat=@apeppro, Tel_pro = @tel, tip_pro = @tip , fec_con=@fec

where Id_Profesor=@vcod
GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultarAlumno]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_ConsultarAlumno] 
@vcod char(3)
as
Select Id_Alumno,Nom_alu,Ape_alu_mat,Ape_alu_pat,Tel_alu, Dni, Fecha_Nacimiento
from Alumno
where Id_Alumno=@vcod
GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultarAuxiliar]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_ConsultarAuxiliar] 
@vcod char(4)
as
Select id_Auxiliar,nom_aux,ape_aux_mat,ape_aux_pat,tel_aux,fecha_con
from Auxiliar
where id_Auxiliar=@vcod
GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultarGrado]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_ConsultarGrado] 
@vcod char(2)
as
Select Id_grado,Nota_conducta,Id_Alumno,Id_Profesor,Salon, Fec_reg
from Grado
where Id_grado=@vcod
GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultarProfesor]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_ConsultarProfesor] 
@vcod char(3)
as
Select Id_Profesor,Nom_pro,Ape_pro_mat,Ape_pro_pat,Tel_pro, tip_pro, fec_con
from Profesor
where Id_Profesor=@vcod
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarAlumno]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarAlumno]
@vcod char(3)
AS
delete from Alumno where Id_Alumno=@vcod
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarAuxiliar]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarAuxiliar]
@vcod char(4)
AS
delete from Auxiliar where id_Auxiliar=@vcod
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarGrado]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarGrado]
@vcod char(2)
AS
delete from Grado where Id_grado=@vcod
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarProfesor]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarProfesor]
@vcod char(3)
AS
delete from Profesor where Id_Profesor=@vcod
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarAlumno]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertarAlumno]
@Nom varchar(25),
@Ape_m varchar(25),
@Ape_p varchar(25),
@Tel char(9),
@fec_nac smalldatetime,
@dni char(8)


AS
declare @Id nvarchar(3)
declare @vcont int 
set @vcont=(Select count(*) from Alumno)
if @vcont = 0
          set @Id = 'A01'
 else

		  set @Id=(Select 'A' +Right(Max (Right(Id_Alumno,2)+101),2)
		  from Alumno)

 insert into Alumno values (@Id,@Nom,@Ape_m,@Ape_p,@Tel, @fec_nac, @dni)
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarAuxiliar]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertarAuxiliar]
@Nom_a varchar(25),
@Ape_ma varchar(25),
@Ape_pa varchar(25),
@Tele char(9),
@fec smalldatetime 

AS
declare @Id nvarchar(4)
declare @vcont int 
set @vcont=(Select count(*) from  Auxiliar)
if @vcont = 0
          set @Id = 'AX01'
 else

		  set @Id=(Select 'AX' +Right(Max (Right(  id_Auxiliar ,2)+1101),2)
		  from  Auxiliar)

 insert into Auxiliar values (@Id,@Nom_a,@Ape_ma,@Ape_pa,@Tele,@fec)
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarGrado]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertarGrado]
@cod char (2),
@nota tinyint,
@id_alu char(3),
@id_pro char(3),
@salon varchar(40),
@fec_r smalldatetime,
@id_ax  char(4)
AS



insert into Grado values(@cod,@nota,@id_alu,@id_pro,@salon,@fec_r,@id_ax)
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarProfesor]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertarProfesor]
@nom varchar(50),
@apempro varchar(50),
@apeppro varchar(50),
@tel char(9),
@tip char(1),
@fec smalldatetime
AS
declare @vcod char(3)
declare @vcont int
set @vcont=(Select count(*) from Profesor)
if @vcont=0 
       set @vcod ='P01'
else
        set @vcod=(Select 'P' +Right(Max (Right(Id_Profesor,2)+ 101 ),2) 
    From Profesor)
insert into Profesor values(@vcod,@nom,@apempro,@apeppro,@tel,@tip, @fec)
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarAlumno]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarAlumno]
AS
Select Id_Alumno,Nom_alu,Ape_alu_mat,Ape_alu_pat,Tel_alu, Fecha_Nacimiento, Dni
from Alumno
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarAlumnoGrado]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Consultar
CREATE	 PROCEDURE [dbo].[usp_ListarAlumnoGrado]
@Id_Alumno char (3)
as
select Alumno.Id_Alumno, Nom_alu, Ape_alu_mat, Ape_alu_pat, Nom_pro, Ape_pro_mat, Ape_pro_pat, Grado.Nota_conducta, Nom_alu , ape_aux_mat, ape_aux_pat
 from Alumno left join Grado on Alumno.Id_Alumno = Grado.Id_grado left join Profesor on Grado.Id_Profesor = Profesor.Id_Profesor left join Grado g on Profesor.Id_Profesor = g.Id_grado left join Auxiliar on g.id_Auxiliar = Auxiliar.id_Auxiliar
 where Alumno.Id_Alumno= @Id_Alumno
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarAuxiliar]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarAuxiliar]
AS
Select id_Auxiliar,nom_aux,ape_aux_mat,ape_aux_pat,tel_aux,fecha_con
from Auxiliar
GO
/****** Object:  StoredProcedure [dbo].[usp_listarAuxiliarAlumno]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_listarAuxiliarAlumno]
@codAx char(4)
as
select Nom_alu, Ape_alu_pat, Ape_alu_mat, Salon from vw_vistaAuxiliarAlumno
where id_Auxiliar = @codAx

GO
/****** Object:  StoredProcedure [dbo].[usp_ListarGrado]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarGrado]
AS
Select Id_grado,Nota_conducta,Id_Alumno,id_Auxiliar ,Id_Profesor,Salon, Fec_reg,
Tipo = case
            when Nota_conducta >=16                                  then 'Buen comportamiento'
            when Nota_conducta >11 and Nota_conducta < 16            then 'Regular'
			when Nota_conducta <=11                                  then 'Mal comportamiento'
          end 
from Grado
GO
/****** Object:  StoredProcedure [dbo].[usp_listarNotasconducta]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	 procedure [dbo].[usp_listarNotasconducta]

@Notini INT,
@Notfin INT	

as
select Nom_alu, Ape_alu_pat, Ape_alu_mat, Tel_alu, Nota_conducta, Salon from vw_notaAlumno 
where  Nota_conducta between @Notini and @Notfin

GO
/****** Object:  StoredProcedure [dbo].[usp_ListarProfesor]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarProfesor]
AS
Select Id_Profesor,Nom_pro,Ape_pro_mat, Ape_pro_pat, Tel_pro, tip_pro, fec_con,
Tipo = case
            when tip_pro=1 then 'Reemplazo'
            when tip_pro=2 then 'Estable'
          end 
from Profesor
GO
/****** Object:  StoredProcedure [dbo].[usp_listarProfesorAlumno]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_listarProfesorAlumno]

@fecini smalldatetime,
@fecfin smalldatetime

as
select Nom_pro, Ape_pro_pat, Ape_pro_mat, Tel_pro, tip_pro, fec_con from vw_vistaProf   
where  fec_con between @fecini and @fecfin

GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alumno](
	[Id_Alumno] [nvarchar](3) NOT NULL,
	[Nom_alu] [nvarchar](50) NULL,
	[Ape_alu_mat] [nvarchar](50) NULL,
	[Ape_alu_pat] [nvarchar](50) NULL,
	[Tel_alu] [nvarchar](9) NULL,
	[Fecha_Nacimiento] [smalldatetime] NULL,
	[Dni] [char](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Auxiliar]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Auxiliar](
	[id_Auxiliar] [char](4) NOT NULL,
	[nom_aux] [varchar](50) NULL,
	[ape_aux_mat] [varchar](50) NULL,
	[ape_aux_pat] [varchar](50) NULL,
	[tel_aux] [char](9) NULL,
	[fecha_con] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Auxiliar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[Id_Curso] [nvarchar](4) NOT NULL,
	[Nom_cur] [nvarchar](50) NULL,
	[Id_Examen] [nvarchar](4) NOT NULL,
	[Id_practica] [nvarchar](3) NOT NULL,
	[Id_grado] [nvarchar](2) NOT NULL,
	[Estado] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distrito](
	[Cod_dis] [nvarchar](3) NOT NULL,
	[Nom_dis] [nvarchar](50) NOT NULL,
	[Id_Alumno] [nvarchar](3) NOT NULL,
	[Id_Profesor] [nvarchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_dis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Examen]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Examen](
	[Id_Examen] [nvarchar](4) NOT NULL,
	[Fec_exa] [smalldatetime] NULL,
	[Id_Alumno] [nvarchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Examen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grado]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grado](
	[Id_grado] [nvarchar](2) NOT NULL,
	[Nota_conducta] [tinyint] NOT NULL,
	[Id_Alumno] [nvarchar](3) NOT NULL,
	[Id_Profesor] [nvarchar](3) NOT NULL,
	[Salon] [varchar](40) NULL,
	[Fec_reg] [datetime] NULL,
	[id_Auxiliar] [char](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_grado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Practica]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practica](
	[Id_practica] [nvarchar](3) NOT NULL,
	[Fec_pra] [smalldatetime] NULL,
	[Id_Alumno] [nvarchar](3) NOT NULL,
	[Id_Profesor] [nvarchar](3) NOT NULL,
	[Nota_pra] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_practica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[Id_Profesor] [nvarchar](3) NOT NULL,
	[Nom_pro] [nvarchar](50) NULL,
	[Ape_pro_mat] [nvarchar](50) NULL,
	[Ape_pro_pat] [nvarchar](50) NULL,
	[Tel_pro] [nvarchar](9) NULL,
	[tip_pro] [nvarchar](1) NULL,
	[fec_con] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Profesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_notaAlumno]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_notaAlumno]
as
SELECT        Alumno.Nom_alu, Alumno.Ape_alu_pat, Alumno.Ape_alu_mat, Grado.Nota_conducta, Alumno.Tel_alu, Grado.Salon
FROM            Alumno INNER JOIN
                         Grado ON Alumno.Id_Alumno = Grado.Id_Alumno

GO
/****** Object:  View [dbo].[vw_vistaAuxiliarAlumno]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_vistaAuxiliarAlumno]
as
SELECT        Alumno.Nom_alu, Alumno.Ape_alu_mat, Alumno.Ape_alu_pat, Grado.Salon, Auxiliar.id_Auxiliar
FROM            Alumno INNER JOIN
                         Grado ON Alumno.Id_Alumno = Grado.Id_Alumno INNER JOIN
                         Auxiliar ON Grado.id_Auxiliar = Auxiliar.id_Auxiliar
GO
/****** Object:  View [dbo].[vw_vistaProf]    Script Date: 30/10/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_vistaProf] as
SELECT Id_Profesor, Nom_pro, Ape_pro_pat, Ape_pro_mat, Tel_pro, tip_pro, fec_con
FROM  Profesor
GO
INSERT [dbo].[Alumno] ([Id_Alumno], [Nom_alu], [Ape_alu_mat], [Ape_alu_pat], [Tel_alu], [Fecha_Nacimiento], [Dni]) VALUES (N'A01', N'Paul', N'Reyes', N'Crosby', N'948453364', CAST(0x8B930000 AS SmallDateTime), N'73295003')
INSERT [dbo].[Alumno] ([Id_Alumno], [Nom_alu], [Ape_alu_mat], [Ape_alu_pat], [Tel_alu], [Fecha_Nacimiento], [Dni]) VALUES (N'A02', N'Diego', N'Torres', N'Vila', N'948372145', CAST(0x8D000000 AS SmallDateTime), N'73831975')
INSERT [dbo].[Alumno] ([Id_Alumno], [Nom_alu], [Ape_alu_mat], [Ape_alu_pat], [Tel_alu], [Fecha_Nacimiento], [Dni]) VALUES (N'A03', N'Diana', N'Carolina', N'Sandoval', N'985643721', CAST(0x8FDB0000 AS SmallDateTime), N'78964345')
INSERT [dbo].[Alumno] ([Id_Alumno], [Nom_alu], [Ape_alu_mat], [Ape_alu_pat], [Tel_alu], [Fecha_Nacimiento], [Dni]) VALUES (N'A04', N'Fiorella', N'Ferrandez', N'Jimenez', N'982847723', CAST(0x91480000 AS SmallDateTime), N'73295892')
INSERT [dbo].[Alumno] ([Id_Alumno], [Nom_alu], [Ape_alu_mat], [Ape_alu_pat], [Tel_alu], [Fecha_Nacimiento], [Dni]) VALUES (N'A05', N'Elvis', N'Garrido', N'Basquet', N'983748394', CAST(0x8E6D0000 AS SmallDateTime), N'74832934')
INSERT [dbo].[Auxiliar] ([id_Auxiliar], [nom_aux], [ape_aux_mat], [ape_aux_pat], [tel_aux], [fecha_con]) VALUES (N'AX01', N'Carlos', N'Rivera', N'Martinez', N'987657846', CAST(0x000A0000 AS SmallDateTime))
INSERT [dbo].[Auxiliar] ([id_Auxiliar], [nom_aux], [ape_aux_mat], [ape_aux_pat], [tel_aux], [fecha_con]) VALUES (N'AX02', N'Renzo', N'Gallardo', N'Crispin', N'987657846', CAST(0xA66C0000 AS SmallDateTime))
INSERT [dbo].[Auxiliar] ([id_Auxiliar], [nom_aux], [ape_aux_mat], [ape_aux_pat], [tel_aux], [fecha_con]) VALUES (N'AX03', N'Fernanda', N'Jauregui', N'Reategui', N'986576544', CAST(0xA8120000 AS SmallDateTime))
INSERT [dbo].[Grado] ([Id_grado], [Nota_conducta], [Id_Alumno], [Id_Profesor], [Salon], [Fec_reg], [id_Auxiliar]) VALUES (N'1 ', 18, N'A01', N'P01', N'Tercero A', CAST(0x0000A69D00000000 AS DateTime), N'AX01')
INSERT [dbo].[Grado] ([Id_grado], [Nota_conducta], [Id_Alumno], [Id_Profesor], [Salon], [Fec_reg], [id_Auxiliar]) VALUES (N'2 ', 2, N'A02', N'P01', N'Cuarto A', CAST(0x0000A59D00000000 AS DateTime), N'AX01')
INSERT [dbo].[Grado] ([Id_grado], [Nota_conducta], [Id_Alumno], [Id_Profesor], [Salon], [Fec_reg], [id_Auxiliar]) VALUES (N'3 ', 15, N'A03', N'P01', N'Tercera B', CAST(0x0000A6AF00000000 AS DateTime), N'AX01')
INSERT [dbo].[Grado] ([Id_grado], [Nota_conducta], [Id_Alumno], [Id_Profesor], [Salon], [Fec_reg], [id_Auxiliar]) VALUES (N'4 ', 13, N'A04', N'P02', N'Segundo D', CAST(0x0000A81C00000000 AS DateTime), N'AX02')
INSERT [dbo].[Profesor] ([Id_Profesor], [Nom_pro], [Ape_pro_mat], [Ape_pro_pat], [Tel_pro], [tip_pro], [fec_con]) VALUES (N'P01', N'Diego', N'Moran', N'Calletano', N'984532545', N'2', CAST(0x0000A81B00000000 AS DateTime))
INSERT [dbo].[Profesor] ([Id_Profesor], [Nom_pro], [Ape_pro_mat], [Ape_pro_pat], [Tel_pro], [tip_pro], [fec_con]) VALUES (N'P02', N'Piero', N'Gonzalez', N'Basauri', N'985345352', N'1', CAST(0x0000A5C600000000 AS DateTime))
INSERT [dbo].[Profesor] ([Id_Profesor], [Nom_pro], [Ape_pro_mat], [Ape_pro_pat], [Tel_pro], [tip_pro], [fec_con]) VALUES (N'P03', N'Bryan', N'Garrido', N'Jimenez', N'946367643', N'2', CAST(0x0000A2EC00000000 AS DateTime))
INSERT [dbo].[Profesor] ([Id_Profesor], [Nom_pro], [Ape_pro_mat], [Ape_pro_pat], [Tel_pro], [tip_pro], [fec_con]) VALUES (N'P04', N'Raul', N'Ramirez', N'Bobadilla', N'943434563', N'1', CAST(0x0000A5D900000000 AS DateTime))
INSERT [dbo].[Profesor] ([Id_Profesor], [Nom_pro], [Ape_pro_mat], [Ape_pro_pat], [Tel_pro], [tip_pro], [fec_con]) VALUES (N'P05', N'Fernando', N'Catellano', N'Florez', N'963646743', N'2', CAST(0x0000A80B00000000 AS DateTime))
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [fk_Examen] FOREIGN KEY([Id_Examen])
REFERENCES [dbo].[Examen] ([Id_Examen])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [fk_Examen]
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [fk_Grado2] FOREIGN KEY([Id_grado])
REFERENCES [dbo].[Grado] ([Id_grado])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [fk_Grado2]
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [fk_Practica] FOREIGN KEY([Id_practica])
REFERENCES [dbo].[Practica] ([Id_practica])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [fk_Practica]
GO
ALTER TABLE [dbo].[Distrito]  WITH CHECK ADD  CONSTRAINT [fk_Id_Alumno] FOREIGN KEY([Id_Alumno])
REFERENCES [dbo].[Alumno] ([Id_Alumno])
GO
ALTER TABLE [dbo].[Distrito] CHECK CONSTRAINT [fk_Id_Alumno]
GO
ALTER TABLE [dbo].[Distrito]  WITH CHECK ADD  CONSTRAINT [fk_Id_Profesor] FOREIGN KEY([Id_Profesor])
REFERENCES [dbo].[Profesor] ([Id_Profesor])
GO
ALTER TABLE [dbo].[Distrito] CHECK CONSTRAINT [fk_Id_Profesor]
GO
ALTER TABLE [dbo].[Examen]  WITH CHECK ADD  CONSTRAINT [fk_Alumno3] FOREIGN KEY([Id_Alumno])
REFERENCES [dbo].[Alumno] ([Id_Alumno])
GO
ALTER TABLE [dbo].[Examen] CHECK CONSTRAINT [fk_Alumno3]
GO
ALTER TABLE [dbo].[Grado]  WITH CHECK ADD FOREIGN KEY([id_Auxiliar])
REFERENCES [dbo].[Auxiliar] ([id_Auxiliar])
GO
ALTER TABLE [dbo].[Grado]  WITH CHECK ADD  CONSTRAINT [FK_Id_Alumno1] FOREIGN KEY([Id_Alumno])
REFERENCES [dbo].[Alumno] ([Id_Alumno])
GO
ALTER TABLE [dbo].[Grado] CHECK CONSTRAINT [FK_Id_Alumno1]
GO
ALTER TABLE [dbo].[Grado]  WITH CHECK ADD  CONSTRAINT [FK_Id_Profesor1] FOREIGN KEY([Id_Profesor])
REFERENCES [dbo].[Profesor] ([Id_Profesor])
GO
ALTER TABLE [dbo].[Grado] CHECK CONSTRAINT [FK_Id_Profesor1]
GO
ALTER TABLE [dbo].[Practica]  WITH CHECK ADD  CONSTRAINT [FK_Id_Alumno2] FOREIGN KEY([Id_Alumno])
REFERENCES [dbo].[Alumno] ([Id_Alumno])
GO
ALTER TABLE [dbo].[Practica] CHECK CONSTRAINT [FK_Id_Alumno2]
GO
ALTER TABLE [dbo].[Practica]  WITH CHECK ADD  CONSTRAINT [FK_Id_Profesor2] FOREIGN KEY([Id_Profesor])
REFERENCES [dbo].[Profesor] ([Id_Profesor])
GO
ALTER TABLE [dbo].[Practica] CHECK CONSTRAINT [FK_Id_Profesor2]
GO
USE [master]
GO
ALTER DATABASE [Sistema_Notas_Colegio] SET  READ_WRITE 
GO
