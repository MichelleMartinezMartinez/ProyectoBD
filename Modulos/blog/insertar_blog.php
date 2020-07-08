<?php
    require_once 'conexion.php';
    $titulo = $_POST['titulo'];
    $descripcion = $_POST['descripcion'];
    $fecha = $_POST['fecha'];
    $autor = $_POST['autor'];
    $categoria = $_POST['categorias'];
    
    $consulta = "INSERT INTO blog (titulo, descripcion, fecha, autor, categoria) VALUES ('$titulo','$descripcion','$fecha','$autor','$categoria')";
    mysqli_query($mysqli, $consulta);
    header("Location: index.php");
?>