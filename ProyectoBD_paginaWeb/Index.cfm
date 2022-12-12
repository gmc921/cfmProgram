
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
    <meta name="author" content="Gabriel Morales Cruz">
    <meta name="description" content="Proyecto de BD">
    <meta name="viewport" content="width-devide-width, initial-sacaled=1.0">
    
    <title>Index</title>
    <!---BOOTSTRAP 4--->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
    <!---FONT OWSOME 4--->
    <script src="https://kit.fontawesome.com/b4001eec8c.js" crossorigin="anonymous"></script>

</head>
<body background="https://fondos.io/wp-content/uploads/2019/01/fondo-blanco-53.jpg">

<nav class= "navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
    <a href= "Index.cfm" class= "navbar-brand">BIENVENIDO</a>
      <div class="navbar-nav">
        <a class="nav-item nav-link" href="FormLogin.cfm"><b>Iniciar sesion</b></a>
        <a class="nav-item nav-link" href="FormRegUser.cfm"><b>Registrarse</b></a>
        <a class="nav-item nav-link" href="FormIniciarAdmin.cfm"><b>Administrar libreria</b></a>
      </div>
    </div>
</nav>

<cfquery name="ConsLibros" datasource="LibreriaDNS">
    Select * from libros order by sku asc
</cfquery>

<div class="container p-4">
    <div class="row">
    <div class="col-md-12 mx-auto">
    
       <table class="table table-bordered">
            <thead>
                <tr>
                    <th><b>SKU</b></th>
                    <th colspan="2"><b>Titulo</b></th>
                    <th><b>Autor</b></th>
                    <th><b>Genero</b></th>
                    <th><b>Existencias</b></th>
                    <th><b>Precio</b></th>
                    <th><b>Acciones</b></th>
                </tr>
            </thead>
            <tbody>
                <cfoutput query="ConsLibros">
                <tr>
                    <td><b>#sku#</b></td>
                    <td><img src= #portada# width="35" ></td>
                    <td><b>#titulo#</b></td>
                    <td><b>#autor#</b></td>
                    <td><b>#genero#</b></td>
                    <td><b>#existencias#</b></td>
                    <td><b>$ #precio#</b></td>
                    <td><a href="FormInfLibro.cfm?fclave=#sku#" class="btn btn-secondary">
                    <i class="fas fa-info-circle"></i></a></td>
                </tr>
                </cfoutput>
            </tbody>
       </table>
    </div>
    </div>  
</div>   
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
  
