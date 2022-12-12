
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
    <meta name="author" content="Gabriel Morales Cruz">
    <meta name="description" content="Proyecto de BD">
    <meta name="viewport" content="width-devide-width, initial-sacaled=1.0">
    
    <title>Inicio de sesion</title>
    <!---BOOTSTRAP 4--->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">

</head>
<body background="https://fondos.io/wp-content/uploads/2019/01/fondo-blanco-53.jpg">
<nav class= "navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a href= "FormLogin.cfm" class= "navbar-brand">INICIO DE SESION</a>
    </div>
</nav>

<div class="container p-4">
    <div class="row">
    <div class="col-md-4 mx-auto">
       <cfform name="form1" method="post" action="consUsuario.cfm">
            <div class="form group mx-auto">
                <img src="https://k62.kn3.net/taringa/1/5/9/7/6/8/66/neco_a/550x550_398.jpg" 
                 width="200" >
            </div>
            <div class="form-group">
                <label for="username"><b></b></label>
                <input type="text" name="txtUsername" class="form-control" maxlength="25"
                        placeholder = "Username" autofocus required>
            </div>
                <div class="form-group">
                    <input type="password" name="txtPass" class="form-control" maxlength="50"
                           placeholder="Contrasena" autofocus required>
                </div>
            <hr class="mb-4">
            <div class="col-md-8 mx-auto">
                <input type="submit" class="btn btn-success btn-block" name="btnGuardar" value="Aceptar">
                <input type="hidden" class="btn btn-success btn-block" name="clave" value="0">
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
