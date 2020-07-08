<?php 
session_start();
error_reporting(0);
$varsesion = $_SESSION['nombre'];

if($varsesion == null || $varsesion = ''){
  echo "No tienes acceso";
  die();
}
print_r($_SESSION);
?>
<!DOCTYPE html>
<html lang="es-MX">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gestión de usuarios</title>
  <!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>
<?php require_once 'conexion.php'; ?>
  <div class="container mt-5">
        <div class="row">
        <div class="col-sm-12">
            <form action="insertar_usuarios.php" method="POST">
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <input type="text" name="nombre" id="nombre" class="form-control" placeholder="Ingresa tu Nombre">
                </div>

                <div class="form-group">
                    <label for="telefono">Telefono</label>
                    <input type="tel" name="telefono" id="telefono" class="form-control" placeholder="Ingresa tu telefono">
                </div>

                <div class="form-group">
                    <label for="direccion">Direccion</label>
                    <input type="text" name="direccion" id="direccion" class="form-control" placeholder="Ingresa tu Direccion">
                </div>

                <div class="form-group">
                    <label for="correo">Correo</label>
                    <input type="email" name="correo" id="correo" class="form-control" placeholder="Ingresa tu correo">
                </div>

                <div class="form-group">
                    <label for="password">Contraseña</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Ingresa tu contraseña">
                </div>

                <div class="form-group">
                    <input type="submit" value="Registra a tu usuario" class="btn btn-success">
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