

<cfquery name="EliminarLibro" datasource="LibreriaDNS">

delete from libros where sku= #url.fclave#

</cfquery>

 <cflocation url="FormRegLibro.cfm" addtoken="no"> 