
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
    <meta name="author" content="Gabriel Morales Cruz">
    <meta name="description" content="Proyecto de BD">
    <meta name="viewport" content="width-devide-width, initial-sacaled=1.0">
    
    <title>Modificar usuario</title>
    <!---BOOTSTRAP 4--->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">

</head>

<cfquery name="UsuarioDatos" datasource="LibreriaDNS">

   select * from usuario where username='#nomUser#'

</cfquery>

<cfoutput>
<body background="https://fondos.io/wp-content/uploads/2019/01/fondo-blanco-53.jpg">
<nav class= "navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
         <a href= "FormModUser.cfm?nomUser=#nomUser#&dniUser=#dniUser#" class= "navbar-brand">MI CUENTA</a>
            <div class="navbar-nav">
                <a class="nav-item nav-link" href="IndexUsuario.cfm?nomUser=#nomUser#&dniUser=#dniUser#"><b>Inicio</b></a>
               <a class="nav-item nav-link" href="FormModUser.cfm?nomUser=#nomUser#&dniUser=#dniUser#"><b>Modificar informacion</b></a>
               <a class="nav-item nav-link" href="FormComprUsuarios.cfm?nomUser=#nomUser#&dniUser=#dniUser#"><b>Registro de compras</b></a>
               <a class="nav-item nav-link" href="Index.cfm"><b>Cerrar sesion</b></a>
            </div>
    </div>
</nav>
</cfoutput>

<cfoutput query="UsuarioDatos">
<div class="container-fluid">
    <div class="row">
    <div class="col-md-4 mx-auto">
<cfform name="form1" action="ModUsuario.cfm">
            <div class="col-md-4 mx-auto">
                <img src="https://k62.kn3.net/taringa/1/5/9/7/6/8/66/neco_a/550x550_398.jpg" 
                 width="200" >
            </div>
            <hr class="mb-4">

            <div class="input-group mb-3">
               <div class="input-group-prepend">
                  <span class="input-group-text" id="basic-addon1">Username: </span>
               </div>
                  <input type="text" name="txtUsername" class="form-control" maxlength="25" disabled value=#username# requiered>
            </div>

            <div class="input-group mb-3">
               <div class="input-group-prepend">
                  <span class="input-group-text" id="basic-addon1">Nombre: </span>
               </div>
                  <input type="text" name="txtNombre" class="form-control" maxlength="25" value=#nombre# requiered>
            </div>  

            <div class="input-group mb-3">
               <div class="input-group-prepend">
                  <span class="input-group-text" id="basic-addon1">Apellido paterno: </span>
               </div>
                  <input type="text" name="txtApaterno" class="form-control" maxlength="25" value=#a_paterno#>
            </div> 

            <div class="input-group mb-3">
               <div class="input-group-prepend">
                  <span class="input-group-text" id="basic-addon1">Apellido materno: </span>
               </div>
                  <input type="text" name="txtAmaterno" class="form-control" maxlength="25" value=#a_materno# requiered>
            </div>  

            <div class="input-group mb-3">
               <div class="input-group-prepend">
                  <span class="input-group-text" id="basic-addon1">Correo: </span>
               </div>
                  <input type="email" name="txtCorreo" class="form-control" maxlength="50" value=#correo# requiered>
            </div> 
            
            <hr class="mb-4">
            <div class="form-group">
                <input type="hidden" name="clave" value=#dniUser#>
                <input type="hidden" name="username" value=#nomUser#>
                <cfinput type="submit" name="btnActualizar" class="btn btn-success btn-block" value="Actualizar informacion">
            </div>   
        </div>
        </cfform>
    </div>  
</div>  
 </cfoutput> 

    <!---SCRIPt--->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
</body>
</html>
