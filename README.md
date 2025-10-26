# 🔐 Sistema de Sesiones Web - PHP

Sistema completo de autenticación y gestión de usuarios desarrollado con PHP y MySQL. Incluye registro, login, comentarios vinculados a usuarios, cambio de contraseña y animaciones CSS.

[![PHP](https://img.shields.io/badge/PHP-8.2-777BB4?style=flat&logo=php&logoColor=white)](https://www.php.net/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=flat&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white)](https://developer.mozilla.org/es/docs/Web/HTML)
[![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=css3&logoColor=white)](https://developer.mozilla.org/es/docs/Web/CSS)
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black)](https://developer.mozilla.org/es/docs/Web/JavaScript)

---

## 📋 Características

✅ **Registro de usuarios** - Sistema completo con validación de emails duplicados  
✅ **Contraseñas cifradas** - Uso de `password_hash()` y `password_verify()` para seguridad  
✅ **Login con sesiones** - Gestión de sesiones PHP con `$_SESSION`  
✅ **Comentarios vinculados** - Sistema de comentarios asociados a usuarios o anónimos  
✅ **Cambio de contraseña** - Los usuarios pueden actualizar su contraseña de forma segura  
✅ **Validación JavaScript** - Formularios con validación del lado del cliente  
✅ **Animaciones CSS** - Efectos hover con transiciones suaves  
✅ **Logout** - Cierre de sesión con destrucción de sesiones  
✅ **Navegación intuitiva** - Enlaces dinámicos según estado de sesión  
✅ **Mensajes de error** - Retroalimentación clara con enlaces de regreso  

---

## 🛠 Tecnologías Utilizadas

- **PHP 8.2** - Lenguaje del lado del servidor
- **MySQL 8.0** - Sistema de gestión de base de datos
- **HTML5** - Estructura de las páginas
- **CSS3** - Estilos y animaciones
- **JavaScript** - Validación de formularios del lado del cliente
- **XAMPP** - Entorno de desarrollo local

---

## 🚀 Instalación Local

### Prerrequisitos

- XAMPP (o LAMP/WAMP/MAMP) instalado
- PHP 8.0 o superior
- MySQL 5.7 o superior
- Navegador web moderno

### Pasos

#### 1. Clonar el repositorio
```bash
git clone https://github.com/xianleonromero/php-session-management.git
```

#### 2. Mover archivos a la carpeta de XAMPP

Copia **solo la carpeta `php-session-management/`** (el código fuente) a:
- **Windows:** `C:\xampp\htdocs\php-session-management\`
- **Linux:** `/opt/lampp/htdocs/php-session-management/`
- **Mac:** `/Applications/XAMPP/htdocs/php-session-management/`

> **Nota:** Los archivos `mysitedb.sql` y `README.md` no necesitan copiarse, están en el repositorio para documentación.

#### 3. Iniciar servicios

Abre el **Panel de Control de XAMPP** e inicia:
- ✅ Apache
- ✅ MySQL

#### 4. Crear la base de datos

1. Abre tu navegador y ve a: `http://localhost/phpmyadmin`
2. Haz clic en **"Nueva"** (en el menú izquierdo)
3. Nombre de la base de datos: `mysitedb`
4. Cotejamiento: `utf8mb4_general_ci`
5. Haz clic en **"Crear"**

#### 5. Importar las tablas

1. Selecciona la base de datos `mysitedb`
2. Haz clic en la pestaña **"Importar"**
3. Haz clic en **"Seleccionar archivo"**
4. Selecciona el archivo `mysitedb.sql` (ubicado en la raíz del repositorio)
5. Haz clic en **"Continuar"**

#### 6. Acceder a la aplicación

Abre tu navegador y ve a:
```
http://localhost/php-session-management/
```

---

## 📂 Estructura del Proyecto
```
📁 Raíz del repositorio/
├── 📁 php-session-management/    # Código fuente
│   ├── index.php                 # Página de entrada (redirige según sesión)
│   ├── login.html                # Formulario de inicio de sesión
│   ├── login.php                 # Procesa el login
│   ├── register.html             # Formulario de registro
│   ├── register.php              # Procesa el registro
│   ├── logout.php                # Cierra la sesión
│   ├── main.php                  # Página principal con lista de juegos
│   ├── detail.php                # Detalle de juego con comentarios
│   ├── comment.php               # Procesa nuevos comentarios
│   ├── change_password.html      # Formulario de cambio de contraseña
│   ├── change_password.php       # Procesa el cambio de contraseña
│   └── main-estilos.css          # Estilos y animaciones
├── mysitedb.sql                  # Script SQL de la base de datos
└── README.md                     # Documentación del proyecto
```

---

## 🗄️ Estructura de la Base de Datos

### Tabla: `tUsuarios`

| Campo       | Tipo         | Descripción                    |
|-------------|--------------|--------------------------------|
| `id`        | INT (PK)     | ID único del usuario           |
| `nombre`    | VARCHAR(50)  | Nombre del usuario             |
| `apellidos` | VARCHAR(100) | Apellidos del usuario          |
| `email`     | VARCHAR(100) | Email único                    |
| `contraseña`| VARCHAR(255) | Contraseña cifrada             |

### Tabla: `tJuegos`

| Campo        | Tipo         | Descripción                   |
|--------------|--------------|-------------------------------|
| `id`         | INT (PK)     | ID único del juego            |
| `nombre`     | VARCHAR(100) | Nombre del juego              |
| `imagen`     | VARCHAR(255) | URL de la imagen              |
| `descripcion`| TEXT         | Descripción del juego         |
| `plataforma` | VARCHAR(50)  | Plataforma (PS5, PC, etc.)    |

### Tabla: `tComentarios`

| Campo       | Tipo         | Descripción                     |
|-------------|--------------|---------------------------------|
| `id`        | INT (PK)     | ID único del comentario         |
| `comentario`| TEXT         | Contenido del comentario        |
| `juego_id`  | INT (FK)     | ID del juego comentado          |
| `usuario_id`| INT (FK)     | ID del usuario (NULL = anónimo) |
| `fecha`     | TIMESTAMP    | Fecha del comentario            |

---

## 🎯 Funcionalidades Principales

### Sistema de Autenticación
- Registro de usuarios con validación de campos
- Verificación de emails duplicados
- Cifrado de contraseñas con `password_hash()`
- Login con verificación mediante `password_verify()`
- Gestión de sesiones PHP
- Logout con destrucción de sesiones

### Gestión de Usuarios
- Página de perfil personalizada
- Cambio de contraseña seguro
- Verificación de contraseña actual antes de actualizar
- Mensajes de bienvenida personalizados

### Sistema de Comentarios
- Comentarios vinculados a usuarios registrados
- Opción de comentarios anónimos
- Visualización con fecha y hora
- Asociación a diferentes juegos

### Validaciones
- Validación JavaScript del lado del cliente
- Prevención de campos vacíos
- Validación PHP del lado del servidor
- Mensajes de error descriptivos

### Interfaz de Usuario
- Diseño responsive y adaptable
- Animaciones CSS con efectos hover
- Transiciones suaves
- Feedback visual claro
- Navegación dinámica según sesión

---

## 🎨 Características de Diseño

- **Responsive design** - Adaptable a diferentes tamaños de pantalla
- **Formularios centrados** - Diseño limpio y profesional
- **Animaciones suaves** - Transiciones CSS en hover con fade-in y crecimiento
- **Colores coherentes** - Paleta azul profesional (#007bff)
- **Feedback visual** - Mensajes de error y éxito claros
- **Bordes redondeados** - Estética moderna con `border-radius`
- **Sombras dinámicas** - Efecto de elevación en elementos interactivos

---

## 🔒 Seguridad Implementada

- ✅ Contraseñas cifradas con `password_hash()` usando `PASSWORD_DEFAULT`
- ✅ Verificación segura con `password_verify()`
- ✅ Validación de sesiones en páginas protegidas
- ✅ Verificación de emails duplicados en el registro
- ✅ Validación en cliente (JavaScript) y servidor (PHP)
- ✅ Mensajes de error que no revelan información sensible
- ✅ Protección contra envío de formularios vacíos

---

## 📝 Configuración

### Conexión a la Base de Datos

Los parámetros de conexión están definidos en cada archivo PHP:
```php
$db = mysqli_connect('localhost', 'root', '1234', 'mysitedb') or die('Fail');
```

Si usas credenciales diferentes, modifica estos valores en:
- `login.php`
- `register.php`
- `main.php`
- `detail.php`
- `comment.php`
- `change_password.php`

**Parámetros por defecto:**
- **Host:** `localhost`
- **Usuario:** `root`
- **Contraseña:** `1234`
- **Base de datos:** `mysitedb`
---

## 👤 Autor

**Xián León Romero**  
- GitHub: [@xianleonromero](https://github.com/xianleonromero)
- LinkedIn: [Xián León Romero](https://linkedin.com/in/xián-león-romero-7a57b7352)
