<!DOCTYPE html>
<html lang="es-MX">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Blog</title>
  <!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>
<?php require_once 'conexion.php';
$id = $_GET["id"];
$consulta = "SELECT * FROM blog WHERE id_blog = $id";
$resultado = mysqli_query($mysqli, $consulta);
$fila = mysqli_fetch_array($resultado);
?>
  <div class="container mt-5">
        <div class="row">
        <div class="col-sm-12">
            <form action="edicion_blog.php" method="POST">
                <div class="form-group">
                    <label for="titulo">Titulo de post</label>
                    <input type="text" name="titulo" id="titulo" class="form-control" placeholder="Ingresa el titulo" value="<?php echo $fila['titulo']?>">
                </div>

                <div class="form-group">
                    <label for="descripcion">Descripcion</label>
                    <input type="text" name="descripcion" id="descripcion" class="form-control" placeholder="Ingresa la descripcion" value="<?php echo $fila['descripcion']?>">
                </div>

                <div class="form-group">
                    <label for="fecha">fecha</label>
                    <input type="date" name="fecha" id="fecha" class="form-control" placeholder="Ingresa la fecha" value="<?php echo $fila['fecha']?>">
                </div>

                <div class="form-group">
                    <label for="autor">Autor</label>
                    <input type="text" name="autor" id="autor" class="form-control" placeholder="Ingresa tu nombre" value="<?php echo $fila['autor']?>">
                    <input type="hidden" name="id" id="id" class="form-control" placeholder="" value="<?php echo $fila['id_blog']?>">
                </div>

                <div class="form-group">
                    <label for="categorias">Categorias</label>
                    <select name="categorias" id="categorias" class="form-control">
                        <option value="0">Seleccione la categoria:</option>
                        <?php
                        $consulta = "SELECT * FROM categorias";
                        $resultado = mysqli_query($mysqli, $consulta);
                        while ($fila = mysqli_fetch_array($resultado))
                        
                        {
                            ?>
                            <option value="<?php echo $fila["id_cat"]; ?>"><?php echo $fila["nombre_cat"];?></option>
                            <?php
                        }
                        ?>
                    </select>                
                </div>
                
                <div class="form-group">
                    <input type="submit" value="Actualizar" class="btn btn-success">
                </div>

                
            </form>
        </div>
        </div>
    </div>
<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>