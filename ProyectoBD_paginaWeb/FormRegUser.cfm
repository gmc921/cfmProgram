
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
    <meta name="author" content="Gabriel Morales Cruz">
    <meta name="description" content="Proyecto de BD">
    <meta name="viewport" content="width-devide-width, initial-sacaled=1.0">
    
    <title>Registro de usuario</title>
    <!---BOOTSTRAP 4--->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">

</head>
<body background="https://fondos.io/wp-content/uploads/2019/01/fondo-blanco-53.jpg">
<nav class= "navbar navbar-dark bg-dark">
    <div class= "container" >
        <a href= "FormRegUser.cfm" class= "navbar-brand">REGISTRO DE USUARIO</a>
    </div>
</nav>


<div class="container p-1">
    <div class="row">
    <div class="col-md-9 mx-auto">
       <cfform name="form1" method="post" action="regUser.cfm">
            <div class="form-group">
                <label for="user"><b>Ingrese un nombre de usuario: </b></label>
                <input type="text" name="txtUsername" class="form-control" maxlength="25"
                        placeholder = "Username" autofocus required>
            </div>
            <div class="row">
                <div class="col-md-6 mb3">
                    <label for="contraseña"><b>Ingrese una contrasena: </b></label>
                    <input type="password" name="txtPass" class="form-control" maxlength="50"
                           placeholder="Contrasena" autofocus required>
                </div>
                <div class="col-md-6 mb3">
                    <label for="contraseña"><b>Confirmar contrasena: </b></label>
                    <input type="password" name="txtConfPass" class="form-control" maxlength="50"
                            placeholder="Contrasena" autofocus required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="correo"><b>Ingrese un correo: </b></label>
                <input type="email" name="txtCorreo" id="txtUsername" class="form-control" maxlength="50"
                    placeholder="Correo" autofocus required>
            </div>
            <div class="row">
                <div class="col-md-5 mb-3">
                    <label for="Nombre"><b>Ingrese su nombre: </b></label>
                    <input type="text" class="form-control" name="txtNombre" maxlength="25" placeholder="Nombre" required>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="Apaterno"></label>
                    <input type="text" class="form-control" name="txtApaterno" maxlength="25" placeholder="Apellido paterno" required>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="Amaterno"> </label>
                    <input type="text" class="form-control" name="txtAmaterno" maxlength="25" placeholder="Apellido materno">
                </div>
            </div>
            <hr class="mb-4">
            <div class="col-md-6 mx-auto">
                <input type="submit" class="btn btn-success btn-block" name="btnGuardar" value="Aceptar">
            </div>
  	    </cfform>
    </div>
    </div>  
</div>   
    <!---SCRIPt--->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
</body>
</html>
