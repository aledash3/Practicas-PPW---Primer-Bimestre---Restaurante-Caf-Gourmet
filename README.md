# Restaurante Café Gourmet -- Aplicación Web (PPW)

## 📌 Descripción General

Este proyecto es una aplicación web desarrollada como parte del **Primer
Bimestre de Programación Para Web (PPW)**.\
Simula un sistema administrativo para un **Restaurante / Café Gourmet**,
permitiendo gestionar usuarios, productos, bitácoras y navegación
mediante JSP, con acceso a una base de datos PostgreSQL a través de
JDBC.

El proyecto está estructurado como una **WebApp profesional**,
integrando backend en Java y frontend dinámico basado en JSP, HTML, CSS,
JavaScript e incluso recursos 3D.

------------------------------------------------------------------------

## 🚀 Funcionalidades Principales

### 🔐 Gestión de usuarios

-   Inicio de sesión con validación en base de datos\
-   Registro de usuarios\
-   Modificación y eliminación de usuarios\
-   Control básico de sesiones

### 🍽️ Gestión de productos

-   Administración del catálogo del restaurante\
-   Visualización dinámica de productos\
-   Integración con base de datos PostgreSQL

### 🛠️ Funciones adicionales

-   Bitácora de auditoría\
-   Páginas JSP modulares (menú, mantenimiento, contacto, servicios,
    etc.)\
-   Archivos 3D (.glb) para vistas interactivas\
-   Recursos multimedia (CSS, imágenes, íconos)

------------------------------------------------------------------------

## 🧩 Tecnologías Utilizadas

### Backend

-   **Java 8+**
-   **JSP / Servlets**
-   **JDBC**
-   **Apache Tomcat**

### Base de datos

-   **PostgreSQL**
-   Driver JDBC: `postgresql-42.x.jar`

### Frontend

-   **HTML5**
-   **CSS3**
-   **JavaScript**
-   Modelos **GLB 3D**
-   JSP dinámico

### Herramientas

-   IDE: Eclipse / IntelliJ\
-   Git / GitHub\
-   Servidor Tomcat 8/9

------------------------------------------------------------------------

## 📁 Estructura del Proyecto

    Proyecto/
    ├── src/main/java/
    │   ├── com/productos/datoss/Conexion.java
    │   ├── com/productos/seguridad/Usuario.java
    │   ├── com/productos/seguridad/Auditoria.java
    │   └── com/productos/seguridad/Pagina.java
    │
    ├── src/main/webapp/
    │   ├── css/
    │   ├── js/
    │   ├── imagenes/
    │   ├── model3D/ (archivos GLB)
    │   ├── WEB-INF/lib/ (Driver PostgreSQL)
    │   ├── *.jsp (páginas del sistema)
    │   └── META-INF/
    │
    ├── build/classes/ (archivos compilados)
    └── README.md

------------------------------------------------------------------------

## 🗄️ Configuración de Base de Datos

### 1️⃣ Crear base de datos en PostgreSQL

    CREATE DATABASE bd_productos;

### 2️⃣ Ejecutar el script SQL si está disponible

    psql -U postgres -d bd_productos -f bakap.sql

### 3️⃣ Configurar credenciales en `Conexion.java`

    this.user = "admin";
    this.pwd = "admin";
    this.cadena = "jdbc:postgresql://localhost:5432/bd_productos";

### 4️⃣ Verificar el driver PostgreSQL

Debe estar en:

    src/main/webapp/WEB-INF/lib/postgresql-42.x.jar

------------------------------------------------------------------------

## ▶️ Ejecución del Proyecto

### 1️⃣ Importar en Eclipse/IntelliJ

Seleccionar: - "Import as Dynamic Web Project"\
- Configurar **Apache Tomcat**

### 2️⃣ Ejecutar el proyecto

Acceder desde el navegador:

    http://localhost:8080/RestauranteCafeGourmet

------------------------------------------------------------------------

## 🧪 Pruebas recomendadas

-   Validación de login\
-   Pruebas CRUD de productos\
-   Creación y modificación de usuarios\
-   Visualización de modelos 3D en el menú\
-   Navegación entre módulos mediante JSP

------------------------------------------------------------------------

## 📌 Buenas prácticas implementadas

-   Separación clara entre frontend y backend\
-   Código organizado por paquetes\
-   Acceso a datos encapsulado (clase `Conexion`)\
-   Reutilización de componentes JSP (menú, encabezados, pie)\
-   Control estructurado de errores y excepciones

------------------------------------------------------------------------

## 🤝 Cómo Contribuir

    git clone <repo>
    git checkout -b nueva-rama
    git add .
    git commit -m "Mejora: descripción del cambio"
    git push origin nueva-rama

Enviar un *Pull Request*.

------------------------------------------------------------------------

## 👤 Autor

**David Cruz**\
Proyecto académico universitario\
Repositorio oficial:\
https://github.com/aledash3/Practicas-PPW---Primer-Bimestre---Restaurante-Caf-Gourmet

------------------------------------------------------------------------

## 📄 Licencia

Proyecto académico de libre uso para prácticas, estudios y pruebas
técnicas.
