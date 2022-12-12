<cfstoredproc procedure="pr_upd_usuario" datasource="LibreriaDNS"> 

    <cfprocparam <!---dni usuario---->
    cfsqltype="cf_sql_number"
    value= #clave#> 

    <cfprocparam<!---nombre de usuario---->
    cfsqltype="cf_sql_varchar2"
    value= #txtNombre#> 

    <cfprocparam<!---apellido paterno de usuario---->
    cfsqltype="cf_sql_varchar2"
    value= #txtApaterno#> 

    <cfprocparam<!---apellido materno de usuario---->
    cfsqltype="cf_sql_varchar2"
    value= #txtAmaterno#> 

    <cfprocparam<!---correo usuario---->
    cfsqltype="cf_sql_varchar2"
    value= #txtCorreo#> 

</cfstoredproc>

<cflocation url="FormModUser.cfm?nomUser=#username#&dniUser=#clave#" addtoken="no"> 