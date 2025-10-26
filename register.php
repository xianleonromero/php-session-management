<?php
    $db=mysqli_connect('localhost','root','1234','mysitedb') or die('Fail');
    if (!empty($_POST["nombre"]) && !empty($_POST["mail"]) && !empty($_POST["apel"]) && !empty($_POST["pass"]) && !empty($_POST["pass2"])){
        $nombre=$_POST["nombre"];
        $apellidos=$_POST["apel"];
        $mail=$_POST["mail"];
        $contra=$_POST["pass"];
        $contra2=$_POST["pass2"];
        //COMPROBAR SI EL EMAIL YA EXISTE:
        $consulta_email=mysqli_query($db,"SELECT * FROM tUsuarios WHERE email='".$mail."'");
        if (mysqli_num_rows($consulta_email)>0){
            echo "Error: este email ya está registrado";
            echo "<a href='register.html'>Volver al registro</a>";
        // COMPROBAR SI LAS CONTRASEÑAS COINCIDEN
        } elseif ($contra !== $contra2) {
            echo "Error: las contraseñas no coinciden";
            echo "<br><a href='register.html'>Volver al registro</a>";
        }else{
            //CIFRAR CONTRASEÑA
            $contraseña_cifrada=password_hash($contra,PASSWORD_DEFAULT);
            
            //ESTÁ TODO CORRECTO
            //INSERTAR LOS DATOS RECOGIDOS EN EL FORMULARIO A LA BASE DE DATOS
            $insertar_usuarios="INSERT INTO tUsuarios (nombre, apellidos, email, contraseña) VALUES('".$nombre."', '".$apellidos."', '".$mail."', '".$contraseña_cifrada."')"; 
            mysqli_query($db,$insertar_usuarios);
            header('Location: main.php');
        }
    }else{
        echo "Faltan campos por cubrir";
        echo "<br><a href='register.html'>Volver al registro</a>";
    }
?>