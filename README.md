Restaurante Café Gourmet – Proyecto PPW

Descripción
Este proyecto pertenece al primer bimestre de la materia PPW (Programación Para Web).
Es una aplicación web para un Restaurante / Café Gourmet, que incluye:

Gestión de productos del menú

Interfaz web hecha con JSP

Conexión a base de datos PostgreSQL mediante JDBC

Uso de HTML, CSS, JavaScript y recursos multimedia

Estructura completa tipo WebApp

Tecnologías utilizadas

Java (JSP, Servlets)

PostgreSQL

JDBC

Servidor Apache Tomcat

HTML, CSS, JavaScript

Librerías externas (driver PostgreSQL)

Estructura del proyecto
Proyecto/
src/ -> Código fuente Java
build/classes/ -> Clases compiladas
webapp/ -> Archivos JSP y recursos
css/
img/
js/
model3D/
*.jsp
WEB-INF/
lib/ -> Librerías .jar (driver PostgreSQL)
bakap.sql -> Script SQL de la base de datos

Instrucciones de instalación

Clonar el repositorio
git clone https://github.com/aledash3/Practicas-PPW---Primer-Bimestre---Restaurante-Caf-Gourmet.git

cd Practicas-PPW---Primer-Bimestre---Restaurante-Caf-Gourmet

Configurar la base de datos

Instalar PostgreSQL

Crear la base de datos (nombre recomendado en el proyecto: bd_productos)

Ejecutar el archivo bakap.sql si lo incluye el proyecto

Configurar la conexión en Java
Editar el archivo Conexion.java y ajustar los datos:

user = "tu_usuario";
pwd = "tu_contraseña";
cadena = "jdbc:postgresql://localhost:5432/bd_productos";

Verifica que el archivo postgresql-42.x.jar esté dentro de WEB-INF/lib.

Ejecutar el proyecto

Importar el proyecto como Dynamic Web Project en Eclipse/IntelliJ

Seleccionar Apache Tomcat

Ejecutar el proyecto y acceder desde el navegador:

http://localhost:8080/Proyecto

Funcionalidades principales

Inicio de sesión y validación

Gestión de productos

Listado de menús

Conexión a PostgreSQL

Renderizado dinámico con JSP

Recursos multimedia (CSS, imágenes, modelos 3D)

Cómo personalizar el proyecto
Puedes modificar:

La base de datos

El estilo CSS

Las vistas JSP

La lógica Java del backend

Las rutas y funcionalidades

Guía básica para contribuir
git clone <url>
git checkout -b nueva-rama
git commit -m "Descripción del cambio"
git push origin nueva-rama

Crear un pull request.

Autor
David Cruz
Proyecto académico universitario
Repositorio oficial:
https://github.com/aledash3/Practicas-PPW---Primer-Bimestre---Restaurante-Caf-Gourmet
