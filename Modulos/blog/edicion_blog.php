<?php
    require_once 'conexion.php';
    $id = $_POST['id'];
    $titulo = $_POST['titulo'];
    $descripcion = $_POST['descripcion'];
    $fecha = $_POST['fecha'];
    $autor = $_POST['autor'];
    $categoria = $_POST['categorias'];
    
    $consulta = "UPDATE blog set titulo = '$titulo', descripcion = '$descripcion', fecha = '$fecha', categoria = '$categoria', autor = '$autor' WHERE id_blog = $id ";
    mysqli_query($mysqli, $consulta);
    header("Location: index.php");
?>