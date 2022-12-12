

<cfstoredproc procedure="prcomprar" datasource="LibreriaDNS"> 

<cfprocparam <!---DNI user---->
cfsqltype="cf_sql_numeric"
value= #dniUser#> 

<cfprocparam<!---sku libro---->
cfsqltype="cf_sql_numeric"
value= #clave#> 

<cfprocparam<!---cantidad de piezas a comprar---->
cfsqltype="cf_sql_numeric"
value= #txtCantidad#> 

</cfstoredproc>  

 <cflocation url="IndexUsuario.cfm?nomUser=#txtUsername#&dniUser=#dniUser#" addtoken="no">