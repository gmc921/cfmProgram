
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
    <meta name="author" content="Gabriel Morales Cruz">
    <meta name="description" content="Proyecto de BD">
    <meta name="viewport" content="width-devide-width, initial-sacaled=1.0">
    
    <title>Registro de libros</title>
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
    <a href= "FormRegLibro.cfm" class= "navbar-brand">SERVICIO DE REGISTRO DE LIBROS</a>
      <div class="navbar-nav">
        <a class="nav-item nav-link" href="FormInsMas.cfm"><b>Registro masivo Max 3</b></a>
        <a class="nav-item nav-link" href="Index.cfm"><b>Cerrar sesion</b></a>
      </div>
    </div>
</nav>

<cfquery name="ConsLibros" datasource="LibreriaDNS">
    Select * from libros order by sku desc
</cfquery>

<div class="container p-4">
    <div class="row">

        <div class="col-md-4">
            <div class="card card-body">
                <cfform name="form1" id="form1" method="post" action="regLibro.cfm">
                    <div class="form-group">
                        <input type="text" name="txtTitulo" class="form-control" maxlength="100" 
                        placeholder="Titulo del libro" autofocus required>
                    </div>
                    <div class="form-group">
                        <input type="text" name="txtAutor" class="form-control" maxlength="50" 
                        placeholder="Autor del libro" autofocus required>
                    </div>
                    <div class="form-group">
                        <select class="custom-select d-block w-100" name="txtGenero" required>
                            <option value="">Elija un genero...</option>
                            <option>Ciencia Ficción</option>
                            <option>Fantasía</option>
                            <option>Thriller</option>
                            <option>Novela</option>
                            <option>Terror</option>
                            <option>Otro</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="number" name="txtCantidad" class="form-control" min="0" max="99999"
                        placeholder="Cantidad a registrar" autofocus required>
                    </div>
                    <div class="form-group">
                        <input type="number" name="txtPrecio" class="form-control" min="0" max="99999.99" 
                        placeholder="Precio del libro" autofocus required>
                    </div>
                    <div class="form-group">
                        <input type="submit" name="btnGuardar" class="btn btn-success btn-block" value="Guardar libro">
                    </div>
                </cfform>
            </div>
        </div>

        <div class="col-md-8">
            <table class="table table-bordered">
            <thead>
                <tr>
                    <th><b>SKU</b></th>
                    <th><b>Titulo</b></th>
                    <th><b>Autor</b></th>
                    <th><b>Genero</b></th>
                    <th><b>Exist</b></th>
                    <th><b>Precio</b></th>
                    <th colspan="2"><b>Acciones</b></th>
                </tr>
            </thead>
            <tbody>
                <cfoutput query="ConsLibros">
                <tr>
                    <td>#sku#</td>
                    <td>#titulo#</td>
                    <td>#autor#</td>
                    <td>#genero#</td>
                    <td>#existencias#</td>
                    <td>$#precio#</td>
                    <td><a href="FormEditLibro.cfm?fclave=#sku#" class="btn btn-secondary">
                    <i class="fas fa-marker"></i></a> </td>
                    <td><a href="ElimLibro.cfm?fclave=#sku#" class="btn btn-danger">
                    <i class="far fa-trash-alt"></i></a></td>
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
  
