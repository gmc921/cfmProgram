
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
    <meta name="author" content="Gabriel Morales Cruz">
    <meta name="description" content="Proyecto de BD">
    <meta name="viewport" content="width-devide-width, initial-sacaled=1.0">
    
    <title>Registro masivo de libros</title>
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
    <a href= "#" class= "navbar-brand">SERVICIO DE REGISTRO MASIVO DE LIBROS</a>
      <div class="navbar-nav">
        <a class="nav-item nav-link" href="FormRegLibro.cfm"><b>Inicio</b></a>
        <a class="nav-item nav-link" href="Index.cfm"><b>Cerrar sesion</b></a>
      </div>
    </div>
</nav>

<cfform name="form1" id="form1" method="post" action="InsertMasivo.cfm">
    <div class="container p-4">
        <div class="row">

            <div class="col-md-4">
                <div class="card card-body">
                    <div class="form-group">
                        <input type="text" name="txtNombre" class="form-control" maxlength="100" 
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
                </div>
            </div>

            <div class="col-md-4">
                <div class="card card-body">
                    <div class="form-group">
                        <input type="text" name="txtNombre2" class="form-control" maxlength="100" 
                        placeholder="Titulo del libro" autofocus required>
                    </div>
                    <div class="form-group">
                        <input type="text" name="txtAutor2" class="form-control" maxlength="50" 
                        placeholder="Autor del libro" autofocus required>
                    </div>
                    <div class="form-group">
                        <select class="custom-select d-block w-100" name="txtGenero2" required>
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
                        <input type="number" name="txtCantidad2" class="form-control" min="0" max="99999"
                        placeholder="Cantidad a registrar" autofocus required>
                    </div>
                    <div class="form-group">
                        <input type="number" name="txtPrecio2" class="form-control" min="0" max="99999.99" 
                        placeholder="Precio del libro" autofocus required>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card card-body">
                    <div class="form-group">
                        <input type="text" name="txtNombre3" class="form-control" maxlength="100" 
                        placeholder="Titulo del libro" autofocus required>
                    </div>
                    <div class="form-group">
                        <input type="text" name="txtAutor3" class="form-control" maxlength="50" 
                        placeholder="Autor del libro" autofocus required>
                    </div>
                    <div class="form-group">
                        <select class="custom-select d-block w-100" name="txtGenero3" required>
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
                        <input type="number" name="txtCantidad3" class="form-control" min="0" max="99999"
                        placeholder="Cantidad a registrar" autofocus required>
                    </div>
                    <div class="form-group">
                        <input type="number" name="txtPrecio3" class="form-control" min="0" max="99999.99" 
                        placeholder="Precio del libro" autofocus required>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mx-auto">
                <hr class="mb-4">   
                <input type="submit" name="btnGuardar" class="btn btn-success btn-block" value="Guardar libros">
            </div>

        </div>  
    </div>   
</cfform>
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
  
