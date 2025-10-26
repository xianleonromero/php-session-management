<?php
    $db=mysqli_connect('localhost','root','1234','mysitedb') or die('Fail');
    //NO SE COMPRUEBA QUE FALTAN CAMPOS, YA QUE HAY CODIGO DE JS EN EL HTML COMPROBANDOLO
    $mail=$_POST["mail"];
    $contra=$_POST["pass"];
    //COMPROBAR SI EL EMAIL EXISTE PARA HACER LOGIN:
    $consulta_email=mysqli_query($db,"SELECT * FROM tUsuarios WHERE email='".$mail."'");
    //SI HAI ALGUNA FILA AFECTADA (>0)....
    if (mysqli_num_rows($consulta_email)>0){
        $consulta_contra=mysqli_query($db,"SELECT id,contraseña FROM tUsuarios WHERE email='".$mail."'");
        $tupla_contra=mysqli_fetch_array($consulta_contra);
        //SE COMPARA LA TUPLA OBTENIDA DE LA BASE DE DATOS (tupla_contra[0]) CON LA CONTRASEÑA QUE HEMOS PUESTO
        if (password_verify($contra,$tupla_contra[1])){
            //INICIA SESIÓN CON EL USUARIO (COGIDO EN LA POSICION 0 DEL SELECT)
            session_start();
            $_SESSION['user_id']=$tupla_contra[0];
            //REDIRIGE A main.php
            header('Location: main.php');
        }else{
            echo "Contraseña incorrecta";
            echo "<br><a href='login.html'>Volver al login</a>";
        }
    } else{
        echo "No se ha encontrado ninguna cuenta con ese correo electrónico.";
        echo "<br><a href='login.html'>Volver al login</a>";
    }
?>