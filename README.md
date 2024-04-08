# Programación de Scripts » Bloque #3
## Reporte de Ventas con Bash
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)

Este repositorio contiene un script en Bash para generar un reporte de ventas a partir de un conjunto de datos en formato CSV, así como también instrucciones para configurar un CRON que automatice la generación del reporte.

## Descripción del Proyecto

El script `reporte_ventas.sh` analiza un conjunto de datos de ventas en formato CSV para generar un informe que incluye:

- Total de ventas por mes.
- Monto total anual de ventas.
- Producto más vendido.
- Cliente más frecuente.

## Conjunto de Datos

El conjunto de datos utilizado para este proyecto puede ser creado o proporcionado por el usuario. Debe contener al menos las siguientes columnas:

1. Fecha de la venta.
2. Unidades vendidas.
3. Producto vendido.
4. Monto de la venta.
5. Cliente.

## Uso del Script

Para ejecutar el script, simplemente siga estos pasos:

1. Asegúrese de tener el archivo `reporte_ventas.sh` en su sistema.
2. Asegúrese de tener los datos de ventas en un archivo CSV en el mismo directorio.
3. Ejecute el script utilizando uno de los siguientes comandos en su terminal:

```bash
./reporte_ventas.sh suarchivo.csv
```
Reemplace suarchivo.csv por el nombre del archivo CSV que contiene sus datos.

```bash
./reporte_ventas.sh
```
En caso de no definir el nombre del archivo, el nombre predeterminado es `ventas.csv`

## Configuración del CRON

Para automatizar la generación del reporte, puedes configurar un CRON para que se ejecute semanalmente. Aquí hay un ejemplo de cómo hacerlo:

### Abra el archivo de configuración de CRON:

```bash
crontab -e
```
Añada la siguiente línea al archivo para programar la ejecución del script todos los domingos a las 2:00 AM:

```bash
0 2 * * 0 /ruta/archivo/reporte_ventas.sh /ruta/archivo/datos_ventas.csv
```

Asegúrese de reemplazar `/ruta/archivo/reporte_ventas.sh` y `/ruta/archivo/datos_ventas.csv` con las rutas absolutas del script y datos de ventas, respectivamente.


## INTEGRANTES DEL GRUPO
#### - DSNP158023 FLORES RIVAS, DOUGLAS OMAR
#### - DNSP117823 JOYA VASQUEZ, ERICK ALFREDO
#### - DSNP021823 TURCIOS ALVAREZ, LUIS ANTONIO
