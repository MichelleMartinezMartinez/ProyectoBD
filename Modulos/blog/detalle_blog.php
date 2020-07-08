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
  <?php require_once 'conexion.php'; ?>
  <div class="table-reponsive">
    <table class="table table-stripped">
    <thead>
      <tr>
        <th>ID</th>
        <th>Titulo</th>
        <th>Autor</th>
        <th>Fecha</th>
        <th>Descripcion</th>
        <th>Status</th>
        <th>Categoria</th>
      </tr>
    </thead>
    <tbody>
      <?php 
      $id = $_GET['id'];
      $consulta = "SELECT * FROM blog WHERE id_blog = $id";
      $resultado = mysqli_query($mysqli, $consulta);
      $fila = mysqli_fetch_array($resultado);
      ?>
      <tr>
        <td><?php echo $fila["id_blog"]; ?></td>
        <td><?php echo $fila["titulo"]; ?></td>
        <td><?php echo $fila["autor"]; ?></td>
        <td><?php echo $fila["fecha"]; ?></td>
        <td><?php echo $fila["descripcion"]; ?></td>
        <td><?php echo $fila["status"]; ?></td>
        <td><?php echo $fila["categoria"]; ?></td>
        <td><a href="index.php">Regresar a la tabla principal</a></td>
      </tr>
    </tbody>
    </table>
  </div>
  <!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>