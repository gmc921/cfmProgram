
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
    <meta name="author" content="Gabriel Morales Cruz">
    <meta name="description" content="Proyecto de BD">
    <meta name="viewport" content="width-devide-width, initial-sacaled=1.0">
    
    <title>Información del libro</title>
    <!---BOOTSTRAP 4--->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">

</head>
<body background="https://fondos.io/wp-content/uploads/2019/01/fondo-blanco-53.jpg">
<nav class= "navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a href= "Index.cfm" class= "navbar-brand">INFORMACION DEL LIBRO</a>
    </div>
</nav>
<cfquery name="ConsData" datasource="LibreriaDNS">
    select * from libros where sku= #url.fclave# 
</cfquery>

<form name="form1" method="post" action="regCompra.cfm">
<div class="container p-4">

    <div class="row">
      <cfoutput query="ConsData">
        <div class="col-sm-4">
            <div class="card card-body">
                <div class="form-group">
                    <img src=#portada# width="300" >
                </div>
            </div>
        </div>    

        <div class="col-md-8">
          <div class="card card-body">

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">Nombre: </span>
                        </div>
                        <input type="text" name="txtNombre" class="form-control" disabled value=#titulo# >
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">Autor: </span>
                        </div>
                        <input type="text" name="txtAutor" class="form-control" disabled value=#autor#>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">Genero: </span>
                        </div>
                        <input type="text" name="txtGenero" class="form-control" disabled value=#genero#>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">Existencias: </span>
                        </div>
                        <input type="number" name="txtExistencias" class="form-control" disabled value=#existencias#>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">Precio: </span>
                        </div>
                        <input type="number" name="txtPrecio" class="form-control" disabled value=#precio#>
                    </div>
            </div>
        </div>
       
      </cfoutput> 
    </div>
</div>   
 </form>   
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
