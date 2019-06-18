--   Fecha:     2019-04-23 19:52:23 CST
--	 Proyecto: 	Maestria.
--   DBMS:      Oracle Database 11g
-- cmd => C:\oracle\product\10.2.0\db_1\BIN
-- sqlplus.exe /nolog
-- connect / as sysdba;
-- alter user SYSTEM identified by yus123456 ACCOUNT UNLOCK;
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
/*==============================================================*/
/* DBMS name:      ORACLE Version 10g                           */
/* Created on:     23/04/2019 20:30:00                          */
/*==============================================================*/


alter table T_AGENCIAS
   drop constraint FK_T_AGENCI_RELATIONS_T_MUNICI;

alter table T_DETALLE_PEDIDO
   drop constraint FK_T_DETALL_RELATIONS_T_PRODUC;

alter table T_ENTREGA_PEDIDO
   drop constraint FK_T_ENTREG_RELATIONS_T_DETALL;

alter table T_ENTREGA_PEDIDO
   drop constraint FK_T_ENTREG_RELATIONS_T_USUARI;

alter table T_MUNICIPIOS
   drop constraint FK_T_MUNICI_RELATIONS_T_DEPART;

alter table T_USUARIO
   drop constraint FK_T_USUARI_RELATIONS_T_MUNICI;

alter table T_USUARIO
   drop constraint FK_T_USUARI_RELATIONS_T_AGENCI;

drop index RELATIONSHIP_8_FK;

drop table T_AGENCIAS cascade constraints;

drop table T_DEPARTAMENTO cascade constraints;

drop index RELATIONSHIP_5_FK;

drop table T_DETALLE_PEDIDO cascade constraints;

drop index RELATIONSHIP_10_FK;

drop index RELATIONSHIP_7_FK;

drop table T_ENTREGA_PEDIDO cascade constraints;

drop index RELATIONSHIP_1_FK;

drop table T_MUNICIPIOS cascade constraints;

drop table T_PRODUCTO cascade constraints;

drop index RELATIONSHIP_3_FK;

drop index RELATIONSHIP_2_FK;

drop table T_USUARIO cascade constraints;

/*==============================================================*/
/* Table: T_AGENCIAS                                            */
/*==============================================================*/
create table T_AGENCIAS  (
   ID_AGENCIA           INTEGER                         not null,
   ID_MUNICIPIO         INTEGER,
   NOMBRE_AGENCIA       VARCHAR2(255),
   constraint PK_T_AGENCIAS primary key (ID_AGENCIA)
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_8_FK on T_AGENCIAS (
   ID_MUNICIPIO ASC
);

/*==============================================================*/
/* Table: T_DEPARTAMENTO                                        */
/*==============================================================*/
create table T_DEPARTAMENTO  (
   ID_DEPARTAMENTO      INTEGER                         not null,
   NOMBRE_DEPARTAMENTO  VARCHAR2(255),
   constraint PK_T_DEPARTAMENTO primary key (ID_DEPARTAMENTO)
);

/*==============================================================*/
/* Table: T_DETALLE_PEDIDO                                      */
/*==============================================================*/
create table T_DETALLE_PEDIDO  (
   ID_DETALLE_PEDIDO    INTEGER                         not null,
   ID_PRODUCTO          VARCHAR2(255),
   FECHA_PEDIDO         DATE,
   CANTIDAD             INTEGER,
   constraint PK_T_DETALLE_PEDIDO primary key (ID_DETALLE_PEDIDO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on T_DETALLE_PEDIDO (
   ID_PRODUCTO ASC
);

/*==============================================================*/
/* Table: T_ENTREGA_PEDIDO                                      */
/*==============================================================*/
create table T_ENTREGA_PEDIDO  (
   ID_ENTREGA_PEDIDO    INTEGER                         not null,
   ID_DETALLE_PEDIDO    INTEGER,
   ID_USUARIO           INTEGER,
   FECHA_ENTREGA_PEDIDO DATE,
   HORA_ENTREGA_PEDIDO  DATE,
   constraint PK_T_ENTREGA_PEDIDO primary key (ID_ENTREGA_PEDIDO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on T_ENTREGA_PEDIDO (
   ID_USUARIO ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_10_FK on T_ENTREGA_PEDIDO (
   ID_DETALLE_PEDIDO ASC
);

/*==============================================================*/
/* Table: T_MUNICIPIOS                                          */
/*==============================================================*/
create table T_MUNICIPIOS  (
   ID_MUNICIPIO         INTEGER                         not null,
   ID_DEPARTAMENTO      INTEGER,
   NOMBRE_MUNICIPIO     VARCHAR2(100),
   constraint PK_T_MUNICIPIOS primary key (ID_MUNICIPIO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on T_MUNICIPIOS (
   ID_DEPARTAMENTO ASC
);

/*==============================================================*/
/* Table: T_PRODUCTO                                            */
/*==============================================================*/
create table T_PRODUCTO  (
   ID_PRODUCTO          VARCHAR2(255)                   not null,
   NOMBRE_PRODUCTO      VARCHAR2(100),
   DESCRIPCION_PRODUCTO VARCHAR2(100),
   EXISTENCIA_PRODUCTO  INTEGER,
   constraint PK_T_PRODUCTO primary key (ID_PRODUCTO)
);

/*==============================================================*/
/* Table: T_USUARIO                                             */
/*==============================================================*/
create table T_USUARIO  (
   ID_USUARIO           INTEGER                         not null,
   ID_AGENCIA           INTEGER,
   ID_MUNICIPIO         INTEGER,
   PRIMER_NOMBRE        VARCHAR2(50),
   SEGUNDO_NOMBRE       VARCHAR2(50),
   TERCER_NOMBRE        VARCHAR2(50),
   PRIMER_APELLIDO      VARCHAR2(50),
   SEGUNDO_APELLIDO     VARCHAR2(50),
   TELEFONO             VARCHAR2(20),
   DIRECCION            VARCHAR2(50),
   constraint PK_T_USUARIO primary key (ID_USUARIO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on T_USUARIO (
   ID_MUNICIPIO ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on T_USUARIO (
   ID_AGENCIA ASC
);

alter table T_AGENCIAS
   add constraint FK_T_AGENCI_RELATIONS_T_MUNICI foreign key (ID_MUNICIPIO)
      references T_MUNICIPIOS (ID_MUNICIPIO);

alter table T_DETALLE_PEDIDO
   add constraint FK_T_DETALL_RELATIONS_T_PRODUC foreign key (ID_PRODUCTO)
      references T_PRODUCTO (ID_PRODUCTO);

alter table T_ENTREGA_PEDIDO
   add constraint FK_T_ENTREG_RELATIONS_T_DETALL foreign key (ID_DETALLE_PEDIDO)
      references T_DETALLE_PEDIDO (ID_DETALLE_PEDIDO);

alter table T_ENTREGA_PEDIDO
   add constraint FK_T_ENTREG_RELATIONS_T_USUARI foreign key (ID_USUARIO)
      references T_USUARIO (ID_USUARIO);

alter table T_MUNICIPIOS
   add constraint FK_T_MUNICI_RELATIONS_T_DEPART foreign key (ID_DEPARTAMENTO)
      references T_DEPARTAMENTO (ID_DEPARTAMENTO);

alter table T_USUARIO
   add constraint FK_T_USUARI_RELATIONS_T_MUNICI foreign key (ID_MUNICIPIO)
      references T_MUNICIPIOS (ID_MUNICIPIO);

alter table T_USUARIO
   add constraint FK_T_USUARI_RELATIONS_T_AGENCI foreign key (ID_AGENCIA)
      references T_AGENCIAS (ID_AGENCIA);

