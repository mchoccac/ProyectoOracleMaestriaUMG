-- call procedure agencia
call SP_AGENCIA_INS(9,1,'Zoan 2');

-- call package agencia
call T_AGENCIAS_TAPI.ins(15,1,'Agencia 8');
variable RcPrueba refcursor
exec sp_agencia_select_all(:RcPrueba)
print RcPrueba;


-- call funcion total de productos entregados a usuario
select FN_TOT_PRODUCT_ENTRE_A_USUARIO(1,1) as total from dual;

-- call funcion taotal de productos entregados por municipio
select FN_TOT_PRODUCT_ENTRE_MUNICIPIO(1,1) as total from dual;

-- mostrar cursordiferences exec and call oracle
variable RcPrueba refcursor
exec sp_agencia_select_all(:RcPrueba)
print RcPrueba;



-- tabla agencia
-- insert
create or replace procedure sp_agencia_ins (
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
);end;/

-- update
create or replace procedure  sp_agencia_upd (
p_ID_AGENCIA in T_AGENCIAS.ID_AGENCIA%type
,p_ID_MUNICIPIO in T_AGENCIAS.ID_MUNICIPIO%type default null 
,p_NOMBRE_AGENCIA in T_AGENCIAS.NOMBRE_AGENCIA%type default null 
) is
begin
update T_AGENCIAS set
ID_MUNICIPIO = p_ID_MUNICIPIO
,NOMBRE_AGENCIA = p_NOMBRE_AGENCIA
where ID_AGENCIA = p_ID_AGENCIA;
end;/

-- del
create or replace procedure sp_agencia_del (
p_ID_AGENCIA in T_AGENCIAS.ID_AGENCIA%type
) is
begin
delete from T_AGENCIAS
where ID_AGENCIA = p_ID_AGENCIA;
end;/


-- tabla departamento
-- insert
create or replace procedure  sp_departamento_ins (
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
);end;/

-- update
create or replace procedure  sp_departamento_upd (
p_NOMBRE_DEPARTAMENTO in T_DEPARTAMENTO.NOMBRE_DEPARTAMENTO%type default null 
,p_ID_DEPARTAMENTO in T_DEPARTAMENTO.ID_DEPARTAMENTO%type
) is
begin
update T_DEPARTAMENTO set
NOMBRE_DEPARTAMENTO = p_NOMBRE_DEPARTAMENTO
where ID_DEPARTAMENTO = p_ID_DEPARTAMENTO;
end;/

-- del
create or replace procedure  sp_departamento_del (
p_ID_DEPARTAMENTO in T_DEPARTAMENTO.ID_DEPARTAMENTO%type
) is
begin
delete from T_DEPARTAMENTO
where ID_DEPARTAMENTO = p_ID_DEPARTAMENTO;
end;/

-- tabla detalle_pedido
-- insert
create or replace procedure   sp_detalle_pedido_ins (
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
);end;/

-- update
create or replace procedure   sp_detalle_pedido_upd (
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
end;/

-- del
create or replace procedure   sp_detalle_pedido_del (
p_ID_DETALLE_PEDIDO in T_DETALLE_PEDIDO.ID_DETALLE_PEDIDO%type
) is
begin
delete from T_DETALLE_PEDIDO
where ID_DETALLE_PEDIDO = p_ID_DETALLE_PEDIDO;
end;/

-- tabla entrega_pedido
-- insert
create or replace procedure sp_entrega_pedido_ins (
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
);end;/

-- update
create or replace procedure sp_entrega_pedido_upd (
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
end;/

-- del
create or replace procedure sp_entrega_pedido_del (
p_ID_ENTREGA_PEDIDO in T_ENTREGA_PEDIDO.ID_ENTREGA_PEDIDO%type
) is
begin
delete from T_ENTREGA_PEDIDO
where ID_ENTREGA_PEDIDO = p_ID_ENTREGA_PEDIDO;
end;/


-- tabla municipio
-- insert
create or replace procedure sp_municipio_ins (
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
);end;/

-- update
create or replace procedure sp_municipio_upd (
p_NOMBRE_MUNICIPIO in T_MUNICIPIOS.NOMBRE_MUNICIPIO%type default null 
,p_ID_MUNICIPIO in T_MUNICIPIOS.ID_MUNICIPIO%type
,p_ID_DEPARTAMENTO in T_MUNICIPIOS.ID_DEPARTAMENTO%type default null 
) is
begin
update T_MUNICIPIOS set
NOMBRE_MUNICIPIO = p_NOMBRE_MUNICIPIO
,ID_DEPARTAMENTO = p_ID_DEPARTAMENTO
where ID_MUNICIPIO = p_ID_MUNICIPIO;
end;/

-- del
create or replace procedure sp_municipio_del (
p_ID_MUNICIPIO in T_MUNICIPIOS.ID_MUNICIPIO%type
) is
begin
delete from T_MUNICIPIOS
where ID_MUNICIPIO = p_ID_MUNICIPIO;
end;/

-- tabla producto
-- insert
create or replace procedure sp_producto_ins (
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
);end;/

-- update
create or replace procedure sp_producto_upd (
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
end;/

-- del
create or replace procedure sp_producto_del (
p_ID_PRODUCTO in T_PRODUCTO.ID_PRODUCTO%type
) is
begin
delete from T_PRODUCTO
where ID_PRODUCTO = p_ID_PRODUCTO;
end;/

--tabla usuario
-- insert
create or replace procedure sp_usuario_ins (
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
);end;/

-- update
create or replace procedure sp_usuario_upd (
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
end;/

-- del
create or replace procedure sp_usuario_del (
p_ID_USUARIO in T_USUARIO.ID_USUARIO%type
) is
begin
delete from T_USUARIO
where ID_USUARIO = p_ID_USUARIO;
end;/


-- funciones
-- total de productos entregados al usuario 
create or replace FUNCTION fn_tot_product_entre_a_usuario (
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

-- total de productos entregados por municipio
create or replace FUNCTION fn_tot_product_entre_municipio (
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

-- variable RcPrueba refcursor;
-- exec selectAllGrupo(:RcPrueba);
-- print RcPrueba
create or replace 
procedure sp_agencia_select_id(
p_ID_GRUPO IN proyecto_nueva_verapaz.grupo.ID_GRUPO%TYPE, 
micursor out sys_refcursor) As
begin
	open micursor for 
	SELECT * 
	FROM proyecto_nueva_verapaz.grupo 
	where ID_GRUPO = p_ID_GRUPO 
	ORDER BY ID_GRUPO;
end;
/

-- tabla agencia
create or replace 
procedure sp_agencia_select_all(
micursor out sys_refcursor
) As
begin
open micursor 
for 
select * from T_AGENCIAS;
end;
/

create or replace 
procedure sp_agencia_select_id(
p_id_agencia IN T_AGENCIAS.ID_AGENCIA%TYPE, 
micursor out sys_refcursor) As
begin
	open micursor for 
    select * from T_AGENCIAS  WHERE ID_AGENCIA = p_id_agencia;
end;
/

-- tabla departamento
create or replace 
procedure sp_departamento_select_all(
micursor out sys_refcursor
) As
begin
open micursor 
for 
select * from T_DEPARTAMENTO;
end;
/

create or replace 
procedure sp_departamento_select_id(
p_id_deparmento IN T_DEPARTAMENTO.ID_DEPARTAMENTO%TYPE, 
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_DEPARTAMENTO  WHERE ID_DEPARTAMENTO = p_id_deparmento;
end;
/


-- tabla detalle pedido
create or replace 
procedure sp_DETALLE_PEDIDO_select_id(
p_id IN T_DETALLE_PEDIDO.ID_DETALLE_PEDIDO%TYPE, 
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_DETALLE_PEDIDO  WHERE ID_DETALLE_PEDIDO = p_id;
end;
/

create or replace 
procedure sp_DETALLE_PEDIDO_select_all(
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_DETALLE_PEDIDO;
end;
/
-- talba entrega pedido
create or replace 
procedure sp_ENTREGA_PEDIDO_select_id(
p_id IN T_ENTREGA_PEDIDO.ID_ENTREGA_PEDIDO%TYPE, 
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_ENTREGA_PEDIDO  WHERE ID_ENTREGA_PEDIDO = p_id;
end;
/

create or replace 
procedure sp_ENTREGA_PEDIDO_select_all(
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_ENTREGA_PEDIDO;
end;
/


-- tabla municipio
create or replace 
procedure sp_MUNICIPIO_select_id(
p_id IN T_MUNICIPIOS.ID_MUNICIPIO%TYPE, 
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_MUNICIPIOS WHERE ID_MUNICIPIO = p_id;
end;
/


create or replace 
procedure sp_MUNICIPIO_select_all(
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_MUNICIPIOS;
end;
/

-- tabla producto
create or replace 
procedure sp_PRODUCTO_select_id(
p_id IN T_PRODUCTO.ID_PRODUCTO%TYPE, 
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_PRODUCTO WHERE ID_PRODUCTO = p_id;
end;
/

create or replace 
procedure sp_PRODUCTO_select_all(
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_PRODUCTO;
end;
/

-- tabla usuario
create or replace 
procedure sp_USUARIO_select_id(
p_id IN T_USUARIO.ID_USUARIO%TYPE, 
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_USUARIO WHERE ID_USUARIO = p_id;
end;
/

create or replace 
procedure sp_USUARIO_select_all(
micursor out sys_refcursor) As
begin
	open micursor for 
    SELECT * FROM T_USUARIO;
end;
/



