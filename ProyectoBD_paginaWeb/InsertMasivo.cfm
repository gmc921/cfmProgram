
<cfstoredproc  procedure="prRegMasiv" datasource="LibreriaDNS">

    <cfprocparam <!---Titulo libro---->
    cfsqltype="cf_sql_varchar2"
    value= #txtNombre#> 

    <cfprocparam <!---Titulo libro2---->
    cfsqltype="cf_sql_varchar2"
    value= #txtNombre2#> 

    <cfprocparam <!---Titulo libro3---->
    cfsqltype="cf_sql_varchar2"
    value= #txtNombre3#> 
<!------------------------------------------------------------------->
    <cfprocparam<!---Autor libro---->
    cfsqltype="cf_sql_varchar2"
    value= #txtAutor#> 

    <cfprocparam<!---Autor libro2---->
    cfsqltype="cf_sql_varchar2"
    value= #txtAutor2#> 

    <cfprocparam<!---Autor libro3---->
    cfsqltype="cf_sql_varchar2"
    value= #txtAutor3#> 
<!------------------------------------------------------------------->    
    <cfprocparam<!---Genero libro---->
    cfsqltype="cf_sql_varchar2"
    value= #txtGenero#> 

    <cfprocparam<!---Genero libro2---->
    cfsqltype="cf_sql_varchar2"
    value= #txtGenero2#> 

    <cfprocparam<!---Genero libro3---->
    cfsqltype="cf_sql_varchar2"
    value= #txtGenero3#> 
<!------------------------------------------------------------------->       
    <cfprocparam<!---Cantidad libro---->
    cfsqltype="cf_sql_numeric"
    value= #txtCantidad#> 

    <cfprocparam<!---Cantidad libro2---->
    cfsqltype="cf_sql_numeric"
    value= #txtCantidad2#> 

    <cfprocparam<!---Cantidad libro3---->
    cfsqltype="cf_sql_numeric"
    value= #txtCantidad3#> 
<!------------------------------------------------------------------->   
    <cfprocparam<!---Precio libro---->
    cfsqltype="cf_sql_numeric"
    value= #txtPrecio#> 

    <cfprocparam<!---Precio libro2---->
    cfsqltype="cf_sql_numeric"
    value= #txtPrecio2#> 

    <cfprocparam<!---Precio libro3---->
    cfsqltype="cf_sql_numeric"
    value= #txtPrecio3#> 
<!------------------------------------------------------------------->
</cfstoredproc>

<cfform name="form1" action="FormRegLibro.cfm">
<div class="col-md-8">
    <table width="600" border="1">
        <tr>
            <td><b>Titulo</b></td>
            <td><b>Autor</b></td>
            <td><b>Genero</b></td>
            <td><b>Cantidad</b></td>
            <td><b>Precio</b></td>
        </tr>
        <cfoutput>
            <tr>
                <td>#txtNombre#</td>
                <td>#txtAutor#</td>
                <td>#txtGenero#</td>
                <td>#txtCantidad#</td>
                <td>$#txtPrecio#</td>
            </tr>
            <tr>
                <td>#txtNombre2#</td>
                <td>#txtAutor2#</td>
                <td>#txtGenero2#</td>
                <td>#txtCantidad2#</td>
                <td>$#txtPrecio2#</td>
            </tr>
            <tr>
                <td>#txtNombre3#</td>
                <td>#txtAutor3#</td>
                <td>#txtGenero3#</td>
                <td>#txtCantidad3#</td>
                <td>$#txtPrecio3#</td>
            </tr>
        </cfoutput>
    </table>
</div>
    <br/>
    <br/>
    <br/>
    <br/>
<div class="form-group" >
    <label for="Aceptar"></label>
    <input type="submit" name="btnAceptar" value="Aceptar">
</div>
</cfform>