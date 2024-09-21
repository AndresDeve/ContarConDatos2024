
# Proyecto de Shiny App para el concurso Contar con Datos 2024

Este repositorio contiene los archivos necesarios para una aplicación Shiny desarrollada en R. A continuación, se detallan los componentes y la estructura de los archivos incluidos, así como una guía básica para la instalación y el uso del proyecto.

## Estructura

Archivos clave:

- **`app.R`**: Archivo principal que lanza la aplicación Shiny. Combina todos los componentes (`ui`, `server`, y `server`) y los ejecuta.
- **`global.R`**: Contiene las variables globales, funciones y librerías que se cargarán al iniciar la aplicación. Este archivo se ejecuta una sola vez al inicio.
- **`server.R`**: Define la lógica del servidor para la aplicación Shiny. Aquí se manejan las reacciones a las entradas del usuario, la manipulación de datos y la renderización de los outputs.
- **`ui.R`**: Define la interfaz de usuario de la aplicación Shiny, incluyendo la disposición de los controles, gráficos y otros elementos visuales.

**Nota:** En este repositorio solo se comparte el código de R utilizado para crear la aplicación y los scripts empleados para generar los gráficos. Las imágenes en mapa de bits (como PNG o JPG) no están incluidas en el repositorio. Por lo tanto, si ejecutas la aplicación, las imágenes no se cargarán.

## Requisitos

Antes de ejecutar la aplicación, asegúrate de tener instalado:

- R (versión 4.0 o superior)
- RStudio
- Librerías R necesarias para el funcionamiento de la app. Las librerias las podes encontrar en la primera parte del archivo `global.R`.


## Instalación y Ejecución

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone https://github.com/tu_usuario/tu_repositorio.git
   ```
2. Abre el proyecto en RStudio o tu entorno de desarrollo preferido.
3. Ejecuta `app.R` para iniciar la aplicación.


## Uso de la Aplicación

La aplicación está diseñada para [describir la funcionalidad principal]. Para interactuar con la app, los usuarios pueden [detallar interacciones clave].

## Contribuciones

Si deseas contribuir a este proyecto, por favor sigue estos pasos:

1. Haz un fork del repositorio.
2. Crea una nueva rama (`git checkout -b feature/nueva-funcionalidad`).
3. Realiza tus cambios y súbelos (`git commit -am 'Añadir nueva funcionalidad'`).
4. Envía un Pull Request.

## Contacto

Para preguntas o sugerencias, por favor contactá a andresdevegili@gmail.com

