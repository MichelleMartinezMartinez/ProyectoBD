<?php
require_once 'conexion.php';
$usuario= $_POST["usuario"];
$password= $_POST["password"];
$respuesta = '';
if($usuario == '' && empty($password)){
    $respuesta = 'Los valores no deben ser vacios';
        header('Location: index.php?data='. $respuesta);
}
    else
    {
        $consulta = "SELECT * FROM usuarios WHERE correo_usr = '$usuario'";
        $resultado = mysqli_query($mysqli, $consulta);
        $fila = mysqli_fetch_array($resultado);
        $respuesta = '';
        if(sizeof($fila) > 0)
        {
            if($fila["password_usr"] == $password)
            {
                session_start();
                $_SESSION["id"] = $fila["id_usr"];
                $_SESSION["nombre"] = $fila["nombre_usr"];
                $_SESSION["status"] = $fila["status"];
                $respuesta = 1;
            }
            else
            {
                $respuesta = "La contrasela no es correcta.";
            }
        }        
        else
        {
            $respuesta = "El usuario no existe.". $consulta;
        }
            if($respuesta == 1)
            {
                header('Location: usuarios/index.php');
            }
            else
            {
                header('Location: index.php?data='. $respuesta);
            }
    }
?>