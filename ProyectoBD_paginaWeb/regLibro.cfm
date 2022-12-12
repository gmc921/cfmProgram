
<cfstoredproc procedure="prRegLibro" datasource="LibreriaDNS"> 

    <cfprocparam <!---Titulo libro---->
    cfsqltype="cf_sql_varchar2"
    value= #txtTitulo#> 

    <cfprocparam<!---Autor libro---->
    cfsqltype="cf_sql_varchar2"
    value= #txtAutor#> 

    <cfprocparam<!---Genero libro---->
    cfsqltype="cf_sql_varchar2"
    value= #txtGenero#> 

    <cfprocparam<!---Cantidad libro---->
    cfsqltype="cf_sql_numeric"
    value= #txtCantidad#> 

    <cfprocparam<!---Precio libro---->
    cfsqltype="cf_sql_numeric"
    value= #txtPrecio#> 

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
                <td>#txtTitulo#</td>
                <td>#txtAutor#</td>
                <td>#txtGenero#</td>
                <td>#txtCantidad#</td>
                <td>$#txtPrecio#</td>
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

