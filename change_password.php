<?php
    $db = mysqli_connect('localhost', 'root', '1234', 'mysitedb') or die('Fail');
    //VERIFICAR INICIO DE SESIÓN (RECORDAR QUE SE GUARDA EN LOGIN EL ID DEL USUARIO)
    session_start();
    if (empty($_SESSION['user_id'])) {
        die('Debes iniciar sesión para cambiar tu contraseña');
    }
    $pass_actual=$_POST["pass_actual"];
    $pass_nueva=$_POST["pass_nueva"];
    $pass_nueva2=$_POST["pass_nueva2"];
    if ($pass_nueva!==$pass_nueva2){
        echo "Error: las nuevas contraseñas no coinciden";
        echo "<br><a href='change_password.html'>Volver</a>";
    }else{
        //SE COGE LA CORRESPONDIENTE CONTRASEÑA Y LA TUPLA DE LA CONTRASEÑA PARA COMPARARLA CON LA INTRODUCIDA EN EL FORMULARIO
        $consulta=mysqli_query($db,"SELECT contraseña FROM tUsuarios WHERE id=".$_SESSION['user_id']);
        $tupla=mysqli_fetch_array($consulta);
        //SE COMPARA LA CONTRASEÑA INTRODUCIDA EN EL FORMULARIO Y LA DE LA BASE DE DATOS (CORRESPONDIENTE POR EL ID DEL USUARIO), Y SI COINCIDEN SE HACE EL PROCESO
        if (password_verify($pass_actual,$tupla[0])){
            //SE CIFRA LA NUEVA CONTRASEÑA
            $pass_nueva_cifrada=password_hash($pass_nueva,PASSWORD_DEFAULT);
            //SE ACTUALIZA EN LA BASE DE DATOS
            $update="UPDATE tUsuarios SET contraseña='".$pass_nueva_cifrada."' WHERE id=".$_SESSION['user_id'];
            mysqli_query($db,$update);
            echo "<p>Contraseña cambiada correctamente</p>";
            echo "<a href='main.php'>Volver a la página principal</a>";
        }else{
            echo "Error: la contraseña actual es incorrecta";
            echo "<br><a href='change_password.html'>Volver</a>";
        }
    }
?>