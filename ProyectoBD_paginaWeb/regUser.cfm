
<cfif #txtPass# EQ #txtConfPass#>
    <cfquery name="AltaUsuario" datasource="LibreriaDNS">
    Insert into USUARIO(DNI, USERNAME, PASS, NOMBRE, A_PATERNO, A_MATERNO, CORREO) 
    VALUES (squsuario.nextval, '#txtUsername#', '#txtPass#', '#txtNombre#', '#txtAPaterno#','#txtAMaterno#','#txtCorreo#') 
    </cfquery>

    <cfquery name= "consUsuario" datasource="LibreriaDNS">
        select dni from usuario where username='#txtUsername#'
    </cfquery>

    <cfoutput query="consUsuario">
        <cflocation url="IndexUsuario.cfm?nomUser=#txtUsername#&dniUser=#dni#" addtoken="no"> 
    </cfoutput>
    
<cfelse>
    <cfform name="form1" action="FormRegUser.cfm">
        <cfoutput>
            Las contraseñas no coinciden, por favor ingrese sus datos correctamente
        </cfoutput>
            <br>
            <br>
            <br>
            <input type="submit" name="btnAceptar" value="Aceptar">
    </cfform>
</cfif>




 
