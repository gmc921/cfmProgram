
<cfstoredproc procedure="prupdlibro" datasource="LibreriaDNS"> 

    <cfprocparam <!---sku libro---->
    cfsqltype="cf_sql_varchar2"
    value= #clave#> 

    <cfprocparam<!---titulo libro---->
    cfsqltype="cf_sql_varchar2"
    value= #txtNombre#> 

    <cfprocparam<!---autor de libro---->
    cfsqltype="cf_sql_varchar2"
    value= #txtAutor#> 

    <cfprocparam<!---Genero de libro---->
    cfsqltype="cf_sql_varchar2"
    value= #txtGenero#> 

    <cfprocparam<!---existencias de libro---->
    cfsqltype="cf_sql_number"
    value= #txtCantidad#> 

    <cfprocparam<!---precio de libro---->
    cfsqltype="cf_sql_number"
    value= #txtPrecio#> 

</cfstoredproc>

<cflocation url="FormRegLibro.cfm" addtoken="no"> 
