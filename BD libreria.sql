create tablespace BDPROYECTO datafile 'C:\BDPROYECTO.dat' size 50m;

create user PROYECTO identified by pr123
default tablespace BDPROYECTO
temporary tablespace TEMP
profile DEFAULT;
grant dba to PROYECTO;
grant connect to PROYECTO;
grant resource to PROYECTO;
grant unlimited tablespace to PROYECTO; 


create table PROYECTO.ADMINISTRADOR
(
  DNI      NUMBER(5) not null,
  USERNAME VARCHAR2(25) not null,
  PASS     VARCHAR2(25) not null,
  CORREO   VARCHAR2(50) not null
)
tablespace BDPROYECTO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PROYECTO.ADMINISTRADOR
  add constraint PK_DNIAMIN primary key (DNI)
  using index 
  tablespace BDPROYECTO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

create table PROYECTO.LIBROS
(
  SKU         NUMBER(5) not null,
  TITULO      VARCHAR2(100) not null,
  AUTOR       VARCHAR2(50) not null,
  GENERO      VARCHAR2(25),
  EXISTENCIAS NUMBER(5) not null,
  PRECIO      NUMBER(5,2) not null,
  PORTADA     NVARCHAR2(200)
)
tablespace BDPROYECTO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PROYECTO.LIBROS
  add constraint PK_SKU primary key (SKU)
  using index 
  tablespace BDPROYECTO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PROYECTO.LIBROS
  add constraint CHECK_CANT
  check (existencias >=0);
alter table PROYECTO.LIBROS
  add constraint CHECK_GENERO
  check (genero IN ('Ciencia Ficción', 'Fantasía', 'Thriller','Novela','Terror','Otro'));
alter table PROYECTO.LIBROS
  add constraint CHECK_PRECIO
  check (precio >=0);

create table PROYECTO.USUARIO
(
  DNI       NUMBER(5) not null,
  USERNAME  VARCHAR2(25) not null,
  PASS      VARCHAR2(50) not null,
  NOMBRE    VARCHAR2(25) not null,
  A_PATERNO VARCHAR2(25),
  A_MATERNO VARCHAR2(25) not null,
  CORREO    VARCHAR2(50) not null
)
tablespace BDPROYECTO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PROYECTO.USUARIO
  add constraint PK_DNI primary key (DNI)
  using index 
  tablespace BDPROYECTO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

create table PROYECTO.COMPRA
(
  ID_COMPRA    NUMBER(5) not null,
  ID_USER      NUMBER(5) not null,
  ID_LIBRO     NUMBER(5) not null,
  FECHA_COMPRA DATE not null,
  CANTIDAD     NUMBER(3) not null,
  TOTAL        NUMBER(10,2) not null
)
tablespace BDPROYECTO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PROYECTO.COMPRA
  add constraint PK_COMPRA primary key (ID_COMPRA)
  using index 
  tablespace BDPROYECTO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PROYECTO.COMPRA
  add constraint FK_LIBRO foreign key (ID_LIBRO)
  references PROYECTO.LIBROS (SKU);
alter table PROYECTO.COMPRA
  add constraint FK_USUARIO foreign key (ID_USER)
  references PROYECTO.USUARIO (DNI);

create global temporary table PROYECTO.RESP_LIB_ELIM
(
  SKU         NUMBER(5),
  TITULO      VARCHAR2(100),
  AUTOR       VARCHAR2(50),
  GENERO      VARCHAR2(25),
  EXISTENCIAS NUMBER(5),
  PRECIO      NUMBER(5,1),
  PORTADA     VARCHAR2(200),
  F_ELIMINADO DATE
)
on commit preserve rows;

create sequence PROYECTO.SQCOMPRA
minvalue 1
maxvalue 100000
start with 61
increment by 1
cache 20;

create sequence PROYECTO.SQLIBRO
minvalue 1
maxvalue 100000
start with 83
increment by 1
cache 20;

create sequence PROYECTO.SQUSUARIO
minvalue 1
maxvalue 100000
start with 24
increment by 1
cache 20;

create or replace function PROYECTO.fnAcentos(dat varchar2) return varchar2
is
  gen varchar2(25);
begin
  if (dat like 'Ciencia%') then
    gen:= 'Ciencia Ficción';
    else if (dat like 'Fantas%') then
         gen:= 'Fantasía';
    else
         gen:= dat;
    end if;
  end if;
return gen;
end;
/

create or replace function PROYECTO.fnTotalCompra(clave libros.sku%type, cantidad number) return number
is
   vTotal compra.total%type;
   vPrecio number;
begin
   select precio into vPrecio from libros where sku= clave;
   vTotal:= vPrecio * cantidad;
   return vTotal;
end;
/

create or replace procedure PROYECTO.prComprar(dniUser compra.id_user%type,clave libros.sku%type,cantidad number)
is
  sFecha Varchar2(40);
  vId_compra compra.id_compra%type;
  V_exist libros.existencias%type;
begin
  select existencias into V_exist from libros where sku = clave;
  V_exist:= V_exist - cantidad;
  select sqCompra.Nextval into vId_compra from dual;
  select sysdate into sFecha from dual;
  insert into compra values(vId_compra,dniUser,clave,sFecha,cantidad,fnTotalCompra(clave,cantidad));
  update libros set existencias = V_exist where sku=clave;
  commit;
  dbms_output.put_line('Se realizo una compra');
exception
  when others then
     dbms_output.put_line('Fallo al realizar el procedimiento de compra');
end;
/

create or replace procedure PROYECTO.prRegLibro(nom libros.titulo%type,autorLib libros.autor%type,
gen libros.genero%type, cant libros.existencias%type, prec libros.precio%type)
as
  vGen libros.genero%type;
begin
  select fnAcentos(gen)into vGen from dual;
  insert into libros values(sqlibro.nextval,nom,autorLib,vGen,cant,prec,null);
  dbms_output.put_line('Se Registro un libro');
exception
  when others then
     dbms_output.put_line('Fallo al realizar el procedimiento de registro de libro');
end;
/

create or replace procedure PROYECTO.prUpdLibro(clave libros.sku%type,nom libros.titulo%type,autorLib libros.autor%type,
gen libros.genero%type, cant libros.existencias%type, prec libros.precio%type)
as
  vGen libros.genero%type;
begin
  select fnAcentos(gen)into vGen from dual;
  update libros set
     titulo= nom, autor= autorLib, genero= vGen, existencias= cant, precio= prec
  where sku= clave;
  dbms_output.put_line('Se actualizo un libro');
exception
  when others then
     dbms_output.put_line('Fallo al realizar el procedimiento de actualizar libro');
end;
/

create or replace procedure PROYECTO.prRegMasiv(nom libros.titulo%type,nom2 libros.titulo%type,nom3 libros.titulo%type,
autorLib libros.autor%type,autorLib2 libros.autor%type,autorLib3 libros.autor%type,
gen libros.genero%type,gen2 libros.genero%type,gen3 libros.genero%type,
cant libros.existencias%type, cant2 libros.existencias%type,cant3 libros.existencias%type,
prec libros.precio%type,prec2 libros.precio%type,prec3 libros.precio%type)
as
begin
  insert all 
         into libros values(sqlibro.nextval,nom,autorLib,gen,cant,prec,null)
         into libros values(sqlibro.nextval,nom2,autorLib2,gen2,cant2,prec2,null)
         into libros values(sqlibro.nextval,nom3,autorLib3,gen3,cant3,prec3,null)
  select * from dual;       
  dbms_output.put_line('Se Registro un libro');
end;
/

create or replace procedure PROYECTO.pr_Upd_Usuario(clave usuario.dni%type,nom usuario.nombre%type,
Ap1 usuario.a_paterno%type, Ap2 usuario.a_materno%type, email usuario.correo%type)
as
begin
  update usuario set
     nombre= nom, a_paterno= Ap1, a_materno= Ap2, correo= email
  where dni= clave;
  dbms_output.put_line('Se actualizo un usuario');
exception
  when others then
     dbms_output.put_line('Fallo al realizar el procedimiento de actualizar usuario');
end;
/

create or replace trigger PROYECTO.tr_deleteLibro
before delete on PROYECTO.libros for each row
begin
   if(:old.existencias > 0) then
      Raise_Application_Error(-20099, 'No puede eliminar este dato');
   else
     dbms_output.put_line('dato eliminado' || :old.existencias);
   end if;
end;
/

create or replace trigger PROYECTO.tr_regUsuario
before insert on PROYECTO.usuario for each row
declare
   vDni number:= 0;
begin
   select count(*) into vDni from usuario where username=:new.username;
   if(vDni > 0) then
      Raise_Application_Error(-20099, 'El usuario ya existe');
   else
     dbms_output.put_line('Usuario agregado ' || :new.username);
   end if;
end;
/

create or replace trigger PROYECTO.tr_RespLibro
before delete on PROYECTO.libros for each row
begin
   insert into resp_lib_elim (sku,titulo,autor,genero,existencias,precio,portada,f_eliminado)
   values(:old.sku, :old.titulo, :old.autor, :old.genero, :old.existencias, :old.precio, :old.portada,sysdate);
end;
/

insert all
   into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
   values (2, 'Sinsajo','Suzanne Collins','Ciencia Ficción',25,422)

   into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
   values (3, 'Insurgente','Veronica Roth','Ciencia Ficción',30,560)

    into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
    values (4, 'La leyenda de Sleepy Hollow','Washington Irving','Terror',20,320)

    into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
    values (5, 'El tren de la 4:50','Agatha Christie','Novela',55,380)

    into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
    values (6, 'Mr. Mercedes','Stephen King','Thriller',45,399)

    into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
    values (7, ' El verano de los juguetes muertos','Toni Hill','Terror',40,250)

    into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
    values (8, 'Legado en los huesos','Dolores Redondo','Thriller',15,280)

    into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
    values (9, 'Robopocalipsis','Daniel H. Wilson','Ciencia Ficción',28,360)

    into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
    values (10, 'Buick 8: Un coche perverso','Stephen King','Thriller',10,420)

    into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
    values (11, 'El club de los poetas muertos','N. H. Kleinbaum','',25,510)

    into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
    values (12, 'El talismán','Stephen King y Peter Straub','Thriller',33,422)

    into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
    values (13, 'Del amor y otros demonios','Gabriel García Márquez','Novela',25,380)

    into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
    values (14, 'El valle de los leones','Ken Follet','Novela',10,440)

    into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
    values (15, 'El guardián invisible','Dolores Redondo','Thriller',23,245)

    into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
    values (16, 'El Hobbit','J. R. R. Tolkien','Ciencia Ficción',31,550)

    into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
    values (17, 'Desesperación',' Stephen King','Thriller',0,380)

    into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
    values (18, 'Harry Potter y el cáliz de fuego','J. K. Rowling','Fantasía',25,490)

    into PROYECTO.libros(sku,titulo,autor,genero,existencias,precio)
    values (19, 'Fahrenheit 451','Ray Bradbury','Thriller',25,340)
select * from dual;

update PROYECTO.libros set portada='https://images-na.ssl-images-amazon.com/images/I/416emtIsM2L._SY445_QL70_.jpg' where sku=2;
update PROYECTO.libros set portada='https://vignette.wikia.nocookie.net/divergente/images/5/59/Portada_de_Insurgente.jpg/revision/latest?cb=20131020225046&path-prefix=es' where sku=3;
update PROYECTO.libros set portada='https://images-na.ssl-images-amazon.com/images/I/511db6HSNXL._SX357_BO1,204,203,200_.jpg' where sku=4;
update PROYECTO.libros set portada='https://pictures.abebooks.com/LAVF2017/30325032216.jpg' where sku=5;
update PROYECTO.libros set portada='https://images-na.ssl-images-amazon.com/images/I/51e%2BPPjSQWL._SX327_BO1,204,203,200_.jpg' where sku=6;
update PROYECTO.libros set portada='https://static.megustaleer.com/images/libros_200_x/EP893242.jpg' where sku=7;
update PROYECTO.libros set portada='https://www.popularlibros.com/imagenes_grandes/9788423/978842335100.JPG' where sku=8;
update PROYECTO.libros set portada='https://berzosaescritor.files.wordpress.com/2013/08/cover_robopocalypse1.png' where sku=9;
update PROYECTO.libros set portada='https://images.cdn1.buscalibre.com/5c7ba3f887efb5527f8b4568.__RS360x360__.jpg' where sku=10;
update PROYECTO.libros set portada='https://4.bp.blogspot.com/-BMAfGjmu2kY/W2XbNADsxuI/AAAAAAAABFA/M2dKBzczQrUo6NnGQ40kZ6_Azah0Pbs8wCLcBGAs/s1600/clubpoetasmuertos.jpg' where sku=11;
update PROYECTO.libros set portada='https://static.megustaleer.com/images/libros_200_x/EP346764.jpg' where sku=12;
update PROYECTO.libros set portada='https://imagessl0.casadellibro.com/a/l/t5/20/9788497592420.jpg' where sku=13;
update PROYECTO.libros set portada='https://statics.convergencia.trevenque.es/portadas/Originales/LIBRANDA/9788490329726.jpg' where sku=14;
update PROYECTO.libros set portada='https://librosentrealgodones.files.wordpress.com/2017/12/9788423341986.jpg?w=825' where sku=15;
update PROYECTO.libros set portada='https://libreriamorelos.mx/images/assets/portadas/9788445001769.jpg' where sku=16;
update PROYECTO.libros set portada='https://images.cdn1.buscalibre.com/5c2d7605bee073cb718b4567.__RS360x360__.jpg' where sku=17;
update PROYECTO.libros set portada='https://imagessl6.casadellibro.com/a/l/t5/56/9788478886456.jpg' where sku=18;
update PROYECTO.libros set portada='https://siguealconejoblanco.es/wp-content/uploads/2014/03/fahrenheit-451-674x1030.jpg' where sku=19;

insert into PROYECTO.administrador (dni,username,pass,correo)values(1,'administrador','123','administrador@gmail.com');
commit;

