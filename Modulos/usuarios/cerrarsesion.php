<?php
    session_start();
    session_destroy();
    header("Location:///Localhost/ProyectoBD/Modulos/index.php");
?>