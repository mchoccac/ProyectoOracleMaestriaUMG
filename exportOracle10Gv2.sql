--   Fecha:     2019-04-23 19:52:23 CST
--	 Proyecto: 	Maestria.
--   DBMS:      Oracle Database 10g
---------------------------------------------------------------------------
---------------------------------------------------------------------------
--NOTA: esto se debe crear con el usuario system.
--- Creacion de tablaspace de ProyectoMaestria.
--creamos un table space para el usuario_maestria.
CREATE BIGFILE TABLESPACE ProyectoMaestria DATAFILE 'ProyectoMaestria.dat' SIZE 100M AUTOEXTEND ON;
--creamos un usuario, desbloquemos el usuario y damos permiso de coneccion 
CREATE USER usuario_maestria  PROFILE DEFAULT IDENTIFIED BY usuario_maestria DEFAULT TABLESPACE ProyectoMaestria ACCOUNT UNLOCK;
GRANT CONNECT TO usuario_maestria;
-- permiso para crear tablas, rol, procedure, usuario y conneccion
GRANT CREATE TABLE TO usuario_maestria;
GRANT CREATE ROLE TO usuario_maestria;
GRANT CREATE USER TO usuario_maestria;
GRANT CREATE PROCEDURE TO usuario_maestria;
GRANT CREATE SEQUENCE TO usuario_maestria;
GRANT CREATE TRIGGER TO usuario_maestria;
GRANT UNLIMITED TABLESPACE  TO usuario_maestria;
GRANT CREATE SESSION TO usuario_maestria WITH ADMIN OPTION;
-- habilitamos que el usuario que tenga un permiso ilimitado a la tablesspace.
ALTER USER usuario_maestria quota unlimited ON ProyectoMaestria;
--NOTA: ahora nos desconectamos del usuario system y nos conectamos al nuevo usuario creado.
---------------------------------------------------------------------------
---------------------------------------------------------------------------

-- nos connectamos y ejecutamos este script
-- usuario es: usuario_maestria
-- password:   usuario_maestria
--------------------------------------------------------
--  File created - Tuesday-April-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table T_AGENCIAS
--------------------------------------------------------

  CREATE TABLE "USUARIO_MAESTRIA"."T_AGENCIAS" 
   (	"ID_AGENCIA" NUMBER(*,0), 
	"ID_MUNICIPIO" NUMBER(*,0), 
	"NOMBRE_AGENCIA" VARCHAR2(255 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Table T_DEPARTAMENTO
--------------------------------------------------------

  CREATE TABLE "USUARIO_MAESTRIA"."T_DEPARTAMENTO" 
   (	"ID_DEPARTAMENTO" NUMBER(*,0), 
	"NOMBRE_DEPARTAMENTO" VARCHAR2(255 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Table T_DETALLE_PEDIDO
--------------------------------------------------------

  CREATE TABLE "USUARIO_MAESTRIA"."T_DETALLE_PEDIDO" 
   (	"ID_DETALLE_PEDIDO" NUMBER(*,0), 
	"ID_PRODUCTO" VARCHAR2(255 BYTE), 
	"FECHA_PEDIDO" TIMESTAMP (6), 
	"CANTIDAD" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Table T_ENTREGA_PEDIDO
--------------------------------------------------------

  CREATE TABLE "USUARIO_MAESTRIA"."T_ENTREGA_PEDIDO" 
   (	"ID_ENTREGA_PEDIDO" NUMBER(*,0), 
	"ID_DETALLE_PEDIDO" NUMBER(*,0), 
	"ID_USUARIO" NUMBER(*,0), 
	"FECHA_ENTREGA_PEDIDO" TIMESTAMP (6), 
	"HORA_ENTREGA_PEDIDO" TIMESTAMP (6)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Table T_MUNICIPIOS
--------------------------------------------------------

  CREATE TABLE "USUARIO_MAESTRIA"."T_MUNICIPIOS" 
   (	"ID_MUNICIPIO" NUMBER(*,0), 
	"ID_DEPARTAMENTO" NUMBER(*,0), 
	"NOMBRE_MUNICIPIO" VARCHAR2(100 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Table T_PRODUCTO
--------------------------------------------------------

  CREATE TABLE "USUARIO_MAESTRIA"."T_PRODUCTO" 
   (	"ID_PRODUCTO" VARCHAR2(255 BYTE), 
	"NOMBRE_PRODUCTO" VARCHAR2(100 BYTE), 
	"DESCRIPCION_PRODUCTO" VARCHAR2(100 BYTE), 
	"EXISTENCIA_PRODUCTO" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Table T_USUARIO
--------------------------------------------------------

  CREATE TABLE "USUARIO_MAESTRIA"."T_USUARIO" 
   (	"ID_USUARIO" NUMBER(*,0), 
	"ID_AGENCIA" NUMBER(*,0), 
	"ID_MUNICIPIO" NUMBER(*,0), 
	"PRIMER_NOMBRE" VARCHAR2(50 BYTE), 
	"SEGUNDO_NOMBRE" VARCHAR2(50 BYTE), 
	"TERCER_NOMBRE" VARCHAR2(50 BYTE), 
	"PRIMER_APELLIDO" VARCHAR2(50 BYTE), 
	"SEGUNDO_APELLIDO" VARCHAR2(50 BYTE), 
	"TELEFONO" VARCHAR2(20 BYTE), 
	"DIRECCION" VARCHAR2(50 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
REM INSERTING into USUARIO_MAESTRIA.T_AGENCIAS
SET DEFINE OFF;
Insert into USUARIO_MAESTRIA.T_AGENCIAS (ID_AGENCIA,ID_MUNICIPIO,NOMBRE_AGENCIA) values (1,1,'Llamas');
Insert into USUARIO_MAESTRIA.T_AGENCIAS (ID_AGENCIA,ID_MUNICIPIO,NOMBRE_AGENCIA) values (2,1,'Centra Norte');
Insert into USUARIO_MAESTRIA.T_AGENCIAS (ID_AGENCIA,ID_MUNICIPIO,NOMBRE_AGENCIA) values (3,3,'Valle dorado');
Insert into USUARIO_MAESTRIA.T_AGENCIAS (ID_AGENCIA,ID_MUNICIPIO,NOMBRE_AGENCIA) values (4,4,'LEX-NORTE');
REM INSERTING into USUARIO_MAESTRIA.T_DEPARTAMENTO
SET DEFINE OFF;
Insert into USUARIO_MAESTRIA.T_DEPARTAMENTO (ID_DEPARTAMENTO,NOMBRE_DEPARTAMENTO) values (1,'Guatemala');
Insert into USUARIO_MAESTRIA.T_DEPARTAMENTO (ID_DEPARTAMENTO,NOMBRE_DEPARTAMENTO) values (2,'Zacapa');
Insert into USUARIO_MAESTRIA.T_DEPARTAMENTO (ID_DEPARTAMENTO,NOMBRE_DEPARTAMENTO) values (3,'Alta Verapaz');
REM INSERTING into USUARIO_MAESTRIA.T_DETALLE_PEDIDO
SET DEFINE OFF;
Insert into USUARIO_MAESTRIA.T_DETALLE_PEDIDO (ID_DETALLE_PEDIDO,ID_PRODUCTO,FECHA_PEDIDO,CANTIDAD) values (2,'1',to_timestamp('20-APR-19 06.51.21.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),10);
Insert into USUARIO_MAESTRIA.T_DETALLE_PEDIDO (ID_DETALLE_PEDIDO,ID_PRODUCTO,FECHA_PEDIDO,CANTIDAD) values (3,'3',to_timestamp('20-APR-19 06.51.21.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),40);
Insert into USUARIO_MAESTRIA.T_DETALLE_PEDIDO (ID_DETALLE_PEDIDO,ID_PRODUCTO,FECHA_PEDIDO,CANTIDAD) values (1,'1',to_timestamp('23-APR-19 06.51.09.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),2);
Insert into USUARIO_MAESTRIA.T_DETALLE_PEDIDO (ID_DETALLE_PEDIDO,ID_PRODUCTO,FECHA_PEDIDO,CANTIDAD) values (4,'2',to_timestamp('20-APR-19 06.51.21.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),20);
Insert into USUARIO_MAESTRIA.T_DETALLE_PEDIDO (ID_DETALLE_PEDIDO,ID_PRODUCTO,FECHA_PEDIDO,CANTIDAD) values (5,'1',to_timestamp('20-APR-19 06.51.21.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),11);
REM INSERTING into USUARIO_MAESTRIA.T_ENTREGA_PEDIDO
SET DEFINE OFF;
Insert into USUARIO_MAESTRIA.T_ENTREGA_PEDIDO (ID_ENTREGA_PEDIDO,ID_DETALLE_PEDIDO,ID_USUARIO,FECHA_ENTREGA_PEDIDO,HORA_ENTREGA_PEDIDO) values (1,1,1,null,null);
Insert into USUARIO_MAESTRIA.T_ENTREGA_PEDIDO (ID_ENTREGA_PEDIDO,ID_DETALLE_PEDIDO,ID_USUARIO,FECHA_ENTREGA_PEDIDO,HORA_ENTREGA_PEDIDO) values (2,2,2,to_timestamp('24-APR-19 05.16.10.591000000 AM','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('24-APR-19 05.16.19.871000000 AM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into USUARIO_MAESTRIA.T_ENTREGA_PEDIDO (ID_ENTREGA_PEDIDO,ID_DETALLE_PEDIDO,ID_USUARIO,FECHA_ENTREGA_PEDIDO,HORA_ENTREGA_PEDIDO) values (3,4,4,to_timestamp('23-APR-19 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('01-APR-19 06.55.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into USUARIO_MAESTRIA.T_ENTREGA_PEDIDO (ID_ENTREGA_PEDIDO,ID_DETALLE_PEDIDO,ID_USUARIO,FECHA_ENTREGA_PEDIDO,HORA_ENTREGA_PEDIDO) values (4,3,1,to_timestamp('23-APR-19 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('01-APR-19 06.55.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'));
Insert into USUARIO_MAESTRIA.T_ENTREGA_PEDIDO (ID_ENTREGA_PEDIDO,ID_DETALLE_PEDIDO,ID_USUARIO,FECHA_ENTREGA_PEDIDO,HORA_ENTREGA_PEDIDO) values (5,5,1,to_timestamp('23-APR-19 12.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('01-APR-19 06.55.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'));
REM INSERTING into USUARIO_MAESTRIA.T_MUNICIPIOS
SET DEFINE OFF;
Insert into USUARIO_MAESTRIA.T_MUNICIPIOS (ID_MUNICIPIO,ID_DEPARTAMENTO,NOMBRE_MUNICIPIO) values (1,1,'Ciudad Guatemala');
Insert into USUARIO_MAESTRIA.T_MUNICIPIOS (ID_MUNICIPIO,ID_DEPARTAMENTO,NOMBRE_MUNICIPIO) values (2,1,'Mixco');
Insert into USUARIO_MAESTRIA.T_MUNICIPIOS (ID_MUNICIPIO,ID_DEPARTAMENTO,NOMBRE_MUNICIPIO) values (3,2,'Cabañas');
Insert into USUARIO_MAESTRIA.T_MUNICIPIOS (ID_MUNICIPIO,ID_DEPARTAMENTO,NOMBRE_MUNICIPIO) values (4,3,'Coban');
Insert into USUARIO_MAESTRIA.T_MUNICIPIOS (ID_MUNICIPIO,ID_DEPARTAMENTO,NOMBRE_MUNICIPIO) values (5,3,'San Cristobal');
REM INSERTING into USUARIO_MAESTRIA.T_PRODUCTO
SET DEFINE OFF;
Insert into USUARIO_MAESTRIA.T_PRODUCTO (ID_PRODUCTO,NOMBRE_PRODUCTO,DESCRIPCION_PRODUCTO,EXISTENCIA_PRODUCTO) values ('1','Papel bond','Resma de papel tamanio carta',20);
Insert into USUARIO_MAESTRIA.T_PRODUCTO (ID_PRODUCTO,NOMBRE_PRODUCTO,DESCRIPCION_PRODUCTO,EXISTENCIA_PRODUCTO) values ('2','Lapiz','Lapiz tipo B2',5000);
Insert into USUARIO_MAESTRIA.T_PRODUCTO (ID_PRODUCTO,NOMBRE_PRODUCTO,DESCRIPCION_PRODUCTO,EXISTENCIA_PRODUCTO) values ('3','Marcadore Azul','Para pizzarra',500);
Insert into USUARIO_MAESTRIA.T_PRODUCTO (ID_PRODUCTO,NOMBRE_PRODUCTO,DESCRIPCION_PRODUCTO,EXISTENCIA_PRODUCTO) values ('5','Marcadore Negro','Para pizzarra',100);
REM INSERTING into USUARIO_MAESTRIA.T_USUARIO
SET DEFINE OFF;
Insert into USUARIO_MAESTRIA.T_USUARIO (ID_USUARIO,ID_AGENCIA,ID_MUNICIPIO,PRIMER_NOMBRE,SEGUNDO_NOMBRE,TERCER_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,TELEFONO,DIRECCION) values (1,1,1,'Mynor',null,null,'choc',null,'32323232','Guatemala');
Insert into USUARIO_MAESTRIA.T_USUARIO (ID_USUARIO,ID_AGENCIA,ID_MUNICIPIO,PRIMER_NOMBRE,SEGUNDO_NOMBRE,TERCER_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,TELEFONO,DIRECCION) values (2,2,1,'Cesar',null,null,'Hidalgo',null,'36562652',null);
Insert into USUARIO_MAESTRIA.T_USUARIO (ID_USUARIO,ID_AGENCIA,ID_MUNICIPIO,PRIMER_NOMBRE,SEGUNDO_NOMBRE,TERCER_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,TELEFONO,DIRECCION) values (3,3,3,'Miguel',null,null,'Cruz',null,null,null);
Insert into USUARIO_MAESTRIA.T_USUARIO (ID_USUARIO,ID_AGENCIA,ID_MUNICIPIO,PRIMER_NOMBRE,SEGUNDO_NOMBRE,TERCER_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,TELEFONO,DIRECCION) values (4,4,4,'Miguel',null,null,'Chocooj',null,null,null);
--------------------------------------------------------
--  DDL for Index RELATIONSHIP_1_FK
--------------------------------------------------------

  CREATE INDEX "USUARIO_MAESTRIA"."RELATIONSHIP_1_FK" ON "USUARIO_MAESTRIA"."T_MUNICIPIOS" ("ID_DEPARTAMENTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Index PK_T_USUARIO
--------------------------------------------------------

  CREATE UNIQUE INDEX "USUARIO_MAESTRIA"."PK_T_USUARIO" ON "USUARIO_MAESTRIA"."T_USUARIO" ("ID_USUARIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Index PK_T_ENTREGA_PEDIDO
--------------------------------------------------------

  CREATE UNIQUE INDEX "USUARIO_MAESTRIA"."PK_T_ENTREGA_PEDIDO" ON "USUARIO_MAESTRIA"."T_ENTREGA_PEDIDO" ("ID_ENTREGA_PEDIDO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Index RELATIONSHIP_8_FK
--------------------------------------------------------

  CREATE INDEX "USUARIO_MAESTRIA"."RELATIONSHIP_8_FK" ON "USUARIO_MAESTRIA"."T_AGENCIAS" ("ID_MUNICIPIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Index PK_T_AGENCIAS
--------------------------------------------------------

  CREATE UNIQUE INDEX "USUARIO_MAESTRIA"."PK_T_AGENCIAS" ON "USUARIO_MAESTRIA"."T_AGENCIAS" ("ID_AGENCIA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Index RELATIONSHIP_2_FK
--------------------------------------------------------

  CREATE INDEX "USUARIO_MAESTRIA"."RELATIONSHIP_2_FK" ON "USUARIO_MAESTRIA"."T_USUARIO" ("ID_MUNICIPIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Index RELATIONSHIP_3_FK
--------------------------------------------------------

  CREATE INDEX "USUARIO_MAESTRIA"."RELATIONSHIP_3_FK" ON "USUARIO_MAESTRIA"."T_USUARIO" ("ID_AGENCIA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Index RELATIONSHIP_10_FK
--------------------------------------------------------

  CREATE INDEX "USUARIO_MAESTRIA"."RELATIONSHIP_10_FK" ON "USUARIO_MAESTRIA"."T_ENTREGA_PEDIDO" ("ID_DETALLE_PEDIDO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Index RELATIONSHIP_7_FK
--------------------------------------------------------

  CREATE INDEX "USUARIO_MAESTRIA"."RELATIONSHIP_7_FK" ON "USUARIO_MAESTRIA"."T_ENTREGA_PEDIDO" ("ID_USUARIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Index PK_T_PRODUCTO
--------------------------------------------------------

  CREATE UNIQUE INDEX "USUARIO_MAESTRIA"."PK_T_PRODUCTO" ON "USUARIO_MAESTRIA"."T_PRODUCTO" ("ID_PRODUCTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Index PK_T_DETALLE_PEDIDO
--------------------------------------------------------

  CREATE UNIQUE INDEX "USUARIO_MAESTRIA"."PK_T_DETALLE_PEDIDO" ON "USUARIO_MAESTRIA"."T_DETALLE_PEDIDO" ("ID_DETALLE_PEDIDO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Index RELATIONSHIP_5_FK
--------------------------------------------------------

  CREATE INDEX "USUARIO_MAESTRIA"."RELATIONSHIP_5_FK" ON "USUARIO_MAESTRIA"."T_DETALLE_PEDIDO" ("ID_PRODUCTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Index PK_T_MUNICIPIOS
--------------------------------------------------------

  CREATE UNIQUE INDEX "USUARIO_MAESTRIA"."PK_T_MUNICIPIOS" ON "USUARIO_MAESTRIA"."T_MUNICIPIOS" ("ID_MUNICIPIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Index PK_T_DEPARTAMENTO
--------------------------------------------------------

  CREATE UNIQUE INDEX "USUARIO_MAESTRIA"."PK_T_DEPARTAMENTO" ON "USUARIO_MAESTRIA"."T_DEPARTAMENTO" ("ID_DEPARTAMENTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA" ;
--------------------------------------------------------
--  DDL for Procedure SP_AGENCIA_DEL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_AGENCIA_DEL" (
p_ID_AGENCIA in T_AGENCIAS.ID_AGENCIA%type
) is
begin
delete from T_AGENCIAS
where ID_AGENCIA = p_ID_AGENCIA;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_AGENCIA_INS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_AGENCIA_INS" (
p_ID_AGENCIA in T_AGENCIAS.ID_AGENCIA%type
,p_ID_MUNICIPIO in T_AGENCIAS.ID_MUNICIPIO%type default null 
,p_NOMBRE_AGENCIA in T_AGENCIAS.NOMBRE_AGENCIA%type default null 
) is
begin
insert into T_AGENCIAS(
ID_AGENCIA
,ID_MUNICIPIO
,NOMBRE_AGENCIA
) values (
p_ID_AGENCIA
,p_ID_MUNICIPIO
,p_NOMBRE_AGENCIA
);end;

/
--------------------------------------------------------
--  DDL for Procedure SP_AGENCIA_SELECT_ALL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_AGENCIA_SELECT_ALL" (
micursor out sys_refcursor
) As
begin
open micursor 
for 
select * from T_AGENCIAS;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_AGENCIA_SELECT_ID
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_AGENCIA_SELECT_ID" (
p_id_agencia IN T_AGENCIAS.ID_AGENCIA%TYPE, 
micursor out sys_refcursor) As
begin
	open micursor for 
    select * from T_AGENCIAS  WHERE ID_AGENCIA = p_id_agencia;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_AGENCIA_UPD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_AGENCIA_UPD" (
p_ID_AGENCIA in T_AGENCIAS.ID_AGENCIA%type
,p_ID_MUNICIPIO in T_AGENCIAS.ID_MUNICIPIO%type default null 
,p_NOMBRE_AGENCIA in T_AGENCIAS.NOMBRE_AGENCIA%type default null 
) is
begin
update T_AGENCIAS set
ID_MUNICIPIO = p_ID_MUNICIPIO
,NOMBRE_AGENCIA = p_NOMBRE_AGENCIA
where ID_AGENCIA = p_ID_AGENCIA;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_DEPARTAMENTO_DEL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_DEPARTAMENTO_DEL" (
p_ID_DEPARTAMENTO in T_DEPARTAMENTO.ID_DEPARTAMENTO%type
) is
begin
delete from T_DEPARTAMENTO
where ID_DEPARTAMENTO = p_ID_DEPARTAMENTO;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_DEPARTAMENTO_INS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_DEPARTAMENTO_INS" (
p_NOMBRE_DEPARTAMENTO in T_DEPARTAMENTO.NOMBRE_DEPARTAMENTO%type default null 
,p_ID_DEPARTAMENTO in T_DEPARTAMENTO.ID_DEPARTAMENTO%type
) is
begin
insert into T_DEPARTAMENTO(
NOMBRE_DEPARTAMENTO
,ID_DEPARTAMENTO
) values (
p_NOMBRE_DEPARTAMENTO
,p_ID_DEPARTAMENTO
);end;

/
--------------------------------------------------------
--  DDL for Procedure SP_DEPARTAMENTO_SELECT_ALL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_DEPARTAMENTO_SELECT_ALL" (
micursor out sys_refcursor
) As
begin
open micursor 
for 
select * from T_DEPARTAMENTO;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_DEPARTAMENTO_SELECT_ID
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_DEPARTAMENTO_SELECT_ID" (
p_id_deparmento IN T_DEPARTAMENTO.ID_DEPARTAMENTO%TYPE, 
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_DEPARTAMENTO  WHERE ID_DEPARTAMENTO = p_id_deparmento;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_DEPARTAMENTO_UPD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_DEPARTAMENTO_UPD" (
p_NOMBRE_DEPARTAMENTO in T_DEPARTAMENTO.NOMBRE_DEPARTAMENTO%type default null 
,p_ID_DEPARTAMENTO in T_DEPARTAMENTO.ID_DEPARTAMENTO%type
) is
begin
update T_DEPARTAMENTO set
NOMBRE_DEPARTAMENTO = p_NOMBRE_DEPARTAMENTO
where ID_DEPARTAMENTO = p_ID_DEPARTAMENTO;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_DETALLE_PEDIDO_DEL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_DETALLE_PEDIDO_DEL" (
p_ID_DETALLE_PEDIDO in T_DETALLE_PEDIDO.ID_DETALLE_PEDIDO%type
) is
begin
delete from T_DETALLE_PEDIDO
where ID_DETALLE_PEDIDO = p_ID_DETALLE_PEDIDO;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_DETALLE_PEDIDO_INS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_DETALLE_PEDIDO_INS" (
p_ID_DETALLE_PEDIDO in T_DETALLE_PEDIDO.ID_DETALLE_PEDIDO%type
,p_ID_PRODUCTO in T_DETALLE_PEDIDO.ID_PRODUCTO%type default null 
,p_FECHA_PEDIDO in T_DETALLE_PEDIDO.FECHA_PEDIDO%type default null 
,p_CANTIDAD in T_DETALLE_PEDIDO.CANTIDAD%type default null 
) is
begin
insert into T_DETALLE_PEDIDO(
ID_DETALLE_PEDIDO
,ID_PRODUCTO
,FECHA_PEDIDO
,CANTIDAD
) values (
p_ID_DETALLE_PEDIDO
,p_ID_PRODUCTO
,p_FECHA_PEDIDO
,p_CANTIDAD
);end;

/
--------------------------------------------------------
--  DDL for Procedure SP_DETALLE_PEDIDO_SELECT_ALL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_DETALLE_PEDIDO_SELECT_ALL" (
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_DETALLE_PEDIDO;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_DETALLE_PEDIDO_SELECT_ID
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_DETALLE_PEDIDO_SELECT_ID" (
p_id IN T_DETALLE_PEDIDO.ID_DETALLE_PEDIDO%TYPE, 
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_DETALLE_PEDIDO  WHERE ID_DETALLE_PEDIDO = p_id;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_DETALLE_PEDIDO_UPD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_DETALLE_PEDIDO_UPD" (
p_ID_DETALLE_PEDIDO in T_DETALLE_PEDIDO.ID_DETALLE_PEDIDO%type
,p_ID_PRODUCTO in T_DETALLE_PEDIDO.ID_PRODUCTO%type default null 
,p_FECHA_PEDIDO in T_DETALLE_PEDIDO.FECHA_PEDIDO%type default null 
,p_CANTIDAD in T_DETALLE_PEDIDO.CANTIDAD%type default null 
) is
begin
update T_DETALLE_PEDIDO set
ID_PRODUCTO = p_ID_PRODUCTO
,FECHA_PEDIDO = p_FECHA_PEDIDO
,CANTIDAD = p_CANTIDAD
where ID_DETALLE_PEDIDO = p_ID_DETALLE_PEDIDO;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_ENTREGA_PEDIDO_DEL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_ENTREGA_PEDIDO_DEL" (
p_ID_ENTREGA_PEDIDO in T_ENTREGA_PEDIDO.ID_ENTREGA_PEDIDO%type
) is
begin
delete from T_ENTREGA_PEDIDO
where ID_ENTREGA_PEDIDO = p_ID_ENTREGA_PEDIDO;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_ENTREGA_PEDIDO_INS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_ENTREGA_PEDIDO_INS" (
p_ID_DETALLE_PEDIDO in T_ENTREGA_PEDIDO.ID_DETALLE_PEDIDO%type default null 
,p_ID_USUARIO in T_ENTREGA_PEDIDO.ID_USUARIO%type default null 
,p_HORA_ENTREGA_PEDIDO in T_ENTREGA_PEDIDO.HORA_ENTREGA_PEDIDO%type default null 
,p_FECHA_ENTREGA_PEDIDO in T_ENTREGA_PEDIDO.FECHA_ENTREGA_PEDIDO%type default null 
,p_ID_ENTREGA_PEDIDO in T_ENTREGA_PEDIDO.ID_ENTREGA_PEDIDO%type
) is
begin
insert into T_ENTREGA_PEDIDO(
ID_DETALLE_PEDIDO
,ID_USUARIO
,HORA_ENTREGA_PEDIDO
,FECHA_ENTREGA_PEDIDO
,ID_ENTREGA_PEDIDO
) values (
p_ID_DETALLE_PEDIDO
,p_ID_USUARIO
,p_HORA_ENTREGA_PEDIDO
,p_FECHA_ENTREGA_PEDIDO
,p_ID_ENTREGA_PEDIDO
);end;

/
--------------------------------------------------------
--  DDL for Procedure SP_ENTREGA_PEDIDO_SELECT_ALL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_ENTREGA_PEDIDO_SELECT_ALL" (
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_ENTREGA_PEDIDO;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_ENTREGA_PEDIDO_SELECT_ID
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_ENTREGA_PEDIDO_SELECT_ID" (
p_id IN T_ENTREGA_PEDIDO.ID_ENTREGA_PEDIDO%TYPE, 
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_ENTREGA_PEDIDO  WHERE ID_ENTREGA_PEDIDO = p_id;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_ENTREGA_PEDIDO_UPD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_ENTREGA_PEDIDO_UPD" (
p_ID_DETALLE_PEDIDO in T_ENTREGA_PEDIDO.ID_DETALLE_PEDIDO%type default null 
,p_ID_USUARIO in T_ENTREGA_PEDIDO.ID_USUARIO%type default null 
,p_HORA_ENTREGA_PEDIDO in T_ENTREGA_PEDIDO.HORA_ENTREGA_PEDIDO%type default null 
,p_FECHA_ENTREGA_PEDIDO in T_ENTREGA_PEDIDO.FECHA_ENTREGA_PEDIDO%type default null 
,p_ID_ENTREGA_PEDIDO in T_ENTREGA_PEDIDO.ID_ENTREGA_PEDIDO%type
) is
begin
update T_ENTREGA_PEDIDO set
ID_DETALLE_PEDIDO = p_ID_DETALLE_PEDIDO
,ID_USUARIO = p_ID_USUARIO
,HORA_ENTREGA_PEDIDO = p_HORA_ENTREGA_PEDIDO
,FECHA_ENTREGA_PEDIDO = p_FECHA_ENTREGA_PEDIDO
where ID_ENTREGA_PEDIDO = p_ID_ENTREGA_PEDIDO;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_MUNICIPIO_DEL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_MUNICIPIO_DEL" (
p_ID_MUNICIPIO in T_MUNICIPIOS.ID_MUNICIPIO%type
) is
begin
delete from T_MUNICIPIOS
where ID_MUNICIPIO = p_ID_MUNICIPIO;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_MUNICIPIO_INS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_MUNICIPIO_INS" (
p_NOMBRE_MUNICIPIO in T_MUNICIPIOS.NOMBRE_MUNICIPIO%type default null 
,p_ID_MUNICIPIO in T_MUNICIPIOS.ID_MUNICIPIO%type
,p_ID_DEPARTAMENTO in T_MUNICIPIOS.ID_DEPARTAMENTO%type default null 
) is
begin
insert into T_MUNICIPIOS(
NOMBRE_MUNICIPIO
,ID_MUNICIPIO
,ID_DEPARTAMENTO
) values (
p_NOMBRE_MUNICIPIO
,p_ID_MUNICIPIO
,p_ID_DEPARTAMENTO
);end;

/
--------------------------------------------------------
--  DDL for Procedure SP_MUNICIPIO_SELECT_ALL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_MUNICIPIO_SELECT_ALL" (
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_MUNICIPIOS;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_MUNICIPIO_SELECT_ID
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_MUNICIPIO_SELECT_ID" (
p_id IN T_MUNICIPIOS.ID_MUNICIPIO%TYPE, 
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_MUNICIPIOS WHERE ID_MUNICIPIO = p_id;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_MUNICIPIO_UPD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_MUNICIPIO_UPD" (
p_NOMBRE_MUNICIPIO in T_MUNICIPIOS.NOMBRE_MUNICIPIO%type default null 
,p_ID_MUNICIPIO in T_MUNICIPIOS.ID_MUNICIPIO%type
,p_ID_DEPARTAMENTO in T_MUNICIPIOS.ID_DEPARTAMENTO%type default null 
) is
begin
update T_MUNICIPIOS set
NOMBRE_MUNICIPIO = p_NOMBRE_MUNICIPIO
,ID_DEPARTAMENTO = p_ID_DEPARTAMENTO
where ID_MUNICIPIO = p_ID_MUNICIPIO;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_PRODUCTO_DEL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_PRODUCTO_DEL" (
p_ID_PRODUCTO in T_PRODUCTO.ID_PRODUCTO%type
) is
begin
delete from T_PRODUCTO
where ID_PRODUCTO = p_ID_PRODUCTO;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_PRODUCTO_INS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_PRODUCTO_INS" (
p_NOMBRE_PRODUCTO in T_PRODUCTO.NOMBRE_PRODUCTO%type default null 
,p_DESCRIPCION_PRODUCTO in T_PRODUCTO.DESCRIPCION_PRODUCTO%type default null 
,p_EXISTENCIA_PRODUCTO in T_PRODUCTO.EXISTENCIA_PRODUCTO%type default null 
,p_ID_PRODUCTO in T_PRODUCTO.ID_PRODUCTO%type
) is
begin
insert into T_PRODUCTO(
NOMBRE_PRODUCTO
,DESCRIPCION_PRODUCTO
,EXISTENCIA_PRODUCTO
,ID_PRODUCTO
) values (
p_NOMBRE_PRODUCTO
,p_DESCRIPCION_PRODUCTO
,p_EXISTENCIA_PRODUCTO
,p_ID_PRODUCTO
);end;

/
--------------------------------------------------------
--  DDL for Procedure SP_PRODUCTO_SELECT_ALL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_PRODUCTO_SELECT_ALL" (
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_PRODUCTO;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_PRODUCTO_SELECT_ID
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_PRODUCTO_SELECT_ID" (
p_id IN T_PRODUCTO.ID_PRODUCTO%TYPE, 
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_PRODUCTO WHERE ID_PRODUCTO = p_id;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_PRODUCTO_UPD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_PRODUCTO_UPD" (
p_NOMBRE_PRODUCTO in T_PRODUCTO.NOMBRE_PRODUCTO%type default null 
,p_DESCRIPCION_PRODUCTO in T_PRODUCTO.DESCRIPCION_PRODUCTO%type default null 
,p_EXISTENCIA_PRODUCTO in T_PRODUCTO.EXISTENCIA_PRODUCTO%type default null 
,p_ID_PRODUCTO in T_PRODUCTO.ID_PRODUCTO%type
) is
begin
update T_PRODUCTO set
NOMBRE_PRODUCTO = p_NOMBRE_PRODUCTO
,DESCRIPCION_PRODUCTO = p_DESCRIPCION_PRODUCTO
,EXISTENCIA_PRODUCTO = p_EXISTENCIA_PRODUCTO
where ID_PRODUCTO = p_ID_PRODUCTO;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_USUARIO_DEL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_USUARIO_DEL" (
p_ID_USUARIO in T_USUARIO.ID_USUARIO%type
) is
begin
delete from T_USUARIO
where ID_USUARIO = p_ID_USUARIO;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_USUARIO_INS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_USUARIO_INS" (
p_SEGUNDO_NOMBRE in T_USUARIO.SEGUNDO_NOMBRE%type default null 
,p_DIRECCION in T_USUARIO.DIRECCION%type default null 
,p_ID_USUARIO in T_USUARIO.ID_USUARIO%type
,p_ID_AGENCIA in T_USUARIO.ID_AGENCIA%type default null 
,p_ID_MUNICIPIO in T_USUARIO.ID_MUNICIPIO%type default null 
,p_PRIMER_NOMBRE in T_USUARIO.PRIMER_NOMBRE%type default null 
,p_SEGUNDO_APELLIDO in T_USUARIO.SEGUNDO_APELLIDO%type default null 
,p_TERCER_NOMBRE in T_USUARIO.TERCER_NOMBRE%type default null 
,p_TELEFONO in T_USUARIO.TELEFONO%type default null 
,p_PRIMER_APELLIDO in T_USUARIO.PRIMER_APELLIDO%type default null 
) is
begin
insert into T_USUARIO(
SEGUNDO_NOMBRE
,DIRECCION
,ID_USUARIO
,ID_AGENCIA
,ID_MUNICIPIO
,PRIMER_NOMBRE
,SEGUNDO_APELLIDO
,TERCER_NOMBRE
,TELEFONO
,PRIMER_APELLIDO
) values (
p_SEGUNDO_NOMBRE
,p_DIRECCION
,p_ID_USUARIO
,p_ID_AGENCIA
,p_ID_MUNICIPIO
,p_PRIMER_NOMBRE
,p_SEGUNDO_APELLIDO
,p_TERCER_NOMBRE
,p_TELEFONO
,p_PRIMER_APELLIDO
);end;

/
--------------------------------------------------------
--  DDL for Procedure SP_USUARIO_SELECT_ALL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_USUARIO_SELECT_ALL" (
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_USUARIO;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_USUARIO_SELECT_ID
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_USUARIO_SELECT_ID" (
p_id IN T_USUARIO.ID_USUARIO%TYPE, 
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_USUARIO WHERE ID_USUARIO = p_id;
end;

/
--------------------------------------------------------
--  DDL for Procedure SP_USUARIO_UPD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USUARIO_MAESTRIA"."SP_USUARIO_UPD" (
p_SEGUNDO_NOMBRE in T_USUARIO.SEGUNDO_NOMBRE%type default null 
,p_DIRECCION in T_USUARIO.DIRECCION%type default null 
,p_ID_USUARIO in T_USUARIO.ID_USUARIO%type
,p_ID_AGENCIA in T_USUARIO.ID_AGENCIA%type default null 
,p_ID_MUNICIPIO in T_USUARIO.ID_MUNICIPIO%type default null 
,p_PRIMER_NOMBRE in T_USUARIO.PRIMER_NOMBRE%type default null 
,p_SEGUNDO_APELLIDO in T_USUARIO.SEGUNDO_APELLIDO%type default null 
,p_TERCER_NOMBRE in T_USUARIO.TERCER_NOMBRE%type default null 
,p_TELEFONO in T_USUARIO.TELEFONO%type default null 
,p_PRIMER_APELLIDO in T_USUARIO.PRIMER_APELLIDO%type default null 
) is
begin
update T_USUARIO set
SEGUNDO_NOMBRE = p_SEGUNDO_NOMBRE
,DIRECCION = p_DIRECCION
,ID_AGENCIA = p_ID_AGENCIA
,ID_MUNICIPIO = p_ID_MUNICIPIO
,PRIMER_NOMBRE = p_PRIMER_NOMBRE
,SEGUNDO_APELLIDO = p_SEGUNDO_APELLIDO
,TERCER_NOMBRE = p_TERCER_NOMBRE
,TELEFONO = p_TELEFONO
,PRIMER_APELLIDO = p_PRIMER_APELLIDO
where ID_USUARIO = p_ID_USUARIO;
end;

/
--------------------------------------------------------
--  DDL for Function FN_TOT_PRODUCT_ENTRE_A_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "USUARIO_MAESTRIA"."FN_TOT_PRODUCT_ENTRE_A_USUARIO" (
f_id_producto IN T_PRODUCTO.ID_PRODUCTO%type,
f_id_usuario IN T_USUARIO.ID_USUARIO%type
)
RETURN integer IS
idTemp integer;
BEGIN
SELECT 
sum(detalle.CANTIDAD) INTO idTemp
FROM T_DETALLE_PEDIDO detalle
inner join  T_PRODUCTO producto
on detalle.ID_PRODUCTO = producto.ID_PRODUCTO
inner join T_ENTREGA_PEDIDO entrega
on entrega.ID_DETALLE_PEDIDO = detalle.ID_DETALLE_PEDIDO 
inner join  T_USUARIO usuario
on usuario.ID_USUARIO = entrega.ID_USUARIO
where producto.ID_PRODUCTO = f_id_producto and usuario.ID_USUARIO = 1;

IF idTemp is null THEN
	idTemp := 0;
END IF;

RETURN idTemp;

END fn_tot_product_entre_a_usuario;

/
--------------------------------------------------------
--  DDL for Function FN_TOT_PRODUCT_ENTRE_MUNICIPIO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "USUARIO_MAESTRIA"."FN_TOT_PRODUCT_ENTRE_MUNICIPIO" (
f_id_producto IN T_PRODUCTO.ID_PRODUCTO%type,
f_id_municipio IN T_MUNICIPIOS.ID_MUNICIPIO%type
)
RETURN integer IS
idTemp integer;
BEGIN

SELECT 
sum(detalle.CANTIDAD)  into idTemp
FROM T_DETALLE_PEDIDO detalle
inner join  T_PRODUCTO producto
on detalle.ID_PRODUCTO = producto.ID_PRODUCTO
inner join T_ENTREGA_PEDIDO entrega
on entrega.ID_DETALLE_PEDIDO = detalle.ID_DETALLE_PEDIDO 
inner join  T_USUARIO usuario
on usuario.ID_USUARIO = entrega.ID_USUARIO
inner join T_AGENCIAS agencia
on agencia.ID_AGENCIA =  usuario.ID_AGENCIA
where producto.ID_PRODUCTO = f_id_producto and agencia.ID_MUNICIPIO = f_id_municipio;

IF idTemp is null THEN
	idTemp := 0;
END IF;

RETURN idTemp;

END fn_tot_product_entre_municipio;

/
--------------------------------------------------------
--  Constraints for Table T_MUNICIPIOS
--------------------------------------------------------

  ALTER TABLE "USUARIO_MAESTRIA"."T_MUNICIPIOS" ADD CONSTRAINT "PK_T_MUNICIPIOS" PRIMARY KEY ("ID_MUNICIPIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA"  ENABLE;
 
  ALTER TABLE "USUARIO_MAESTRIA"."T_MUNICIPIOS" MODIFY ("ID_MUNICIPIO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_USUARIO
--------------------------------------------------------

  ALTER TABLE "USUARIO_MAESTRIA"."T_USUARIO" ADD CONSTRAINT "PK_T_USUARIO" PRIMARY KEY ("ID_USUARIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA"  ENABLE;
 
  ALTER TABLE "USUARIO_MAESTRIA"."T_USUARIO" MODIFY ("ID_USUARIO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_AGENCIAS
--------------------------------------------------------

  ALTER TABLE "USUARIO_MAESTRIA"."T_AGENCIAS" ADD CONSTRAINT "PK_T_AGENCIAS" PRIMARY KEY ("ID_AGENCIA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA"  ENABLE;
 
  ALTER TABLE "USUARIO_MAESTRIA"."T_AGENCIAS" MODIFY ("ID_AGENCIA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_DEPARTAMENTO
--------------------------------------------------------

  ALTER TABLE "USUARIO_MAESTRIA"."T_DEPARTAMENTO" ADD CONSTRAINT "PK_T_DEPARTAMENTO" PRIMARY KEY ("ID_DEPARTAMENTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA"  ENABLE;
 
  ALTER TABLE "USUARIO_MAESTRIA"."T_DEPARTAMENTO" MODIFY ("ID_DEPARTAMENTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_ENTREGA_PEDIDO
--------------------------------------------------------

  ALTER TABLE "USUARIO_MAESTRIA"."T_ENTREGA_PEDIDO" ADD CONSTRAINT "PK_T_ENTREGA_PEDIDO" PRIMARY KEY ("ID_ENTREGA_PEDIDO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA"  ENABLE;
 
  ALTER TABLE "USUARIO_MAESTRIA"."T_ENTREGA_PEDIDO" MODIFY ("ID_ENTREGA_PEDIDO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_DETALLE_PEDIDO
--------------------------------------------------------

  ALTER TABLE "USUARIO_MAESTRIA"."T_DETALLE_PEDIDO" ADD CONSTRAINT "PK_T_DETALLE_PEDIDO" PRIMARY KEY ("ID_DETALLE_PEDIDO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA"  ENABLE;
 
  ALTER TABLE "USUARIO_MAESTRIA"."T_DETALLE_PEDIDO" MODIFY ("ID_DETALLE_PEDIDO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_PRODUCTO
--------------------------------------------------------

  ALTER TABLE "USUARIO_MAESTRIA"."T_PRODUCTO" ADD CONSTRAINT "PK_T_PRODUCTO" PRIMARY KEY ("ID_PRODUCTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "PROYECTOMAESTRIA"  ENABLE;
 
  ALTER TABLE "USUARIO_MAESTRIA"."T_PRODUCTO" MODIFY ("ID_PRODUCTO" NOT NULL ENABLE);
