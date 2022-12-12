

<!--------------------------------------------------------------->
<cfif #clave# EQ "1">
    <cfquery name="consAdmin" datasource="LibreriaDNS">
        select dni,username,pass from administrador where username= '#txtUsername#'
    </cfquery>

    <cfoutput query="consAdmin">
        <cfif #username# EQ #txtUsername# >
            <cfif #pass# EQ #txtPass#>
                <cflocation url="FormRegLibro.cfm?nomUser=#username#" addtoken="no">
            <cfelse>
                <cflocation url="FormIniciarAdmin.cfm" addtoken="no" > 
            </cfif>
        </cfif>
    </cfoutput>
<cfelse>

    <cfquery name="consUsuario" datasource="LibreriaDNS">
        select dni,username, pass from usuario where username= '#txtUsername#'
    </cfquery>

<cfoutput query="consUsuario">
        <cfif #username# EQ #txtUsername# >
            <cfif #pass# EQ #txtPass#>
                <cflocation url="IndexUsuario.cfm?nomUser=#username#&dniUser=#dni#" addtoken="no">
            </cfif>
        <cfelse>
            <cflocation url="FormLogin.cfm" addtoken="no" > 
        </cfif>
    </cfoutput>

</cfif>
    
    



<!--------------------------------------------------------------->
