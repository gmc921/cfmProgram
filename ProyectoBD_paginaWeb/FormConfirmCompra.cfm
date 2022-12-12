
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
    <meta name="author" content="Gabriel Morales Cruz">
    <meta name="description" content="Proyecto de BD">
    <meta name="viewport" content="width-devide-width, initial-sacaled=1.0">
    
    <title>Confirmar compra</title>
    <!---BOOTSTRAP 4--->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">

</head>
<body background="https://fondos.io/wp-content/uploads/2019/01/fondo-blanco-53.jpg">
<nav class= "navbar navbar-expand-lg navbar-dark bg-dark">
    
    <a href= "#" class= "navbar-brand">BIENVENIDO</a>
    <div class="navbar-nav">
    </div>
</nav>
<cfquery name="ConsData" datasource="LibreriaDNS">
    select sku,titulo,autor,genero,existencias,precio,portada,dni, username 
    from libros, usuario where sku= #url.fclave# and usuario.username= '#url.idUser#'
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
                <div class="form-group">
                    <input type="hidden" class="btn btn-success btn-block" name="clave" value=#sku#>
                    <input type="hidden" class="btn btn-success btn-block" name="dniUser" value=#dni#>
                    <input type="hidden" class="btn btn-success btn-block" name="txtUsername" value=#username#>
                </div>
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
                    <th><b>Cant a comprar</b></th>
                    <th><b>Precio</b></th>
                    <th><b>Comprar</b></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>#sku#</td>
                    <td>#titulo#</td>
                    <td>#autor#</td>
                    <td>#genero#</td>
                    <td>#existencias#</td>
                    <td><input type="number" validate="Float" id="txtCantidad" name="txtCantidad" class="form-control" min="1" max=#existencias#
                        placeholder="Cantidad a registrar" autofocus required></td>
                    <td>$#precio#</td>
                    <td><input type="submit" class="btn btn-success btn-block" name="btnGuardar" value="Aceptar"></td>
                </tr>
            </tbody>
          </table>
        </div>
       
      </cfoutput> 
    </div>
</div>   
 </form>   
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
