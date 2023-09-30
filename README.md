# SQL avanzado y Data Warehousing del bootcamp XII de Big Data y ML

<h2>Ejercicio 1 </h2>

## Creación de la Tabla ivr_detail en BigQuery

Este repositorio contiene un conjunto de consultas SQL que se pueden utilizar en Google BigQuery para crear la tabla `ivr_detail` dentro del dataset `keepcoding`. La tabla `ivr_detail` se utiliza para consolidar datos de llamadas de un sistema IVR de atención al cliente, proporcionando una visión detallada de las interacciones.

## Descripción

La tabla `ivr_detail` se crea a partir de datos almacenados en las tablas `ivr_calls`, `ivr_modules`, e `ivr_steps`. A través de una serie de JOINs, se relacionan los datos de llamadas, módulos y pasos para construir una vista detallada de las interacciones del cliente con la IVR.

## Uso

Las consultas SQL proporcionadas en este repositorio se pueden ejecutar en Google BigQuery para crear la tabla `ivr_detail` en el dataset `keepcoding`. Los datos resultantes proporcionarán una vista detallada de las interacciones del cliente con la IVR.

##Ejercicio 2

# Creación de la Tabla ivr_summary en BigQuery

Este código SQL se utiliza en Google BigQuery para crear la tabla `ivr_summary` en el dataset `keepcoding`. La tabla `ivr_summary` es un resumen de las llamadas del sistema IVR de atención al cliente, que incluye varios indicadores y características importantes de las interacciones de los clientes.

## Descripción

La consulta SQL selecciona datos de la tabla `ivr_detail` y realiza transformaciones para crear una vista resumida de las llamadas. Los campos incluidos en la tabla `ivr_summary` son:

- `ivr_id`: Identificador de la llamada.
- `phone_number`: Número de teléfono del cliente.
- `ivr_result`: Resultado de la llamada.
- `vdn_aggregation`: Agregación de la etiqueta VDN.
- `start_date_id` y `end_date_id`: Fechas de inicio y fin en formato AAAAMMDD.
- `start_date` y `end_date`: Fechas y horas de inicio y fin de la llamada.
- `total_duration`: Duración total de la llamada en segundos.
- `customer_segment`: Segmento del cliente.
- `ivr_language`: Idioma de la IVR.
- `steps_module`: Número de módulos por los que pasa la llamada.
- `module_aggregation`: Agregación de módulos.
- `masiva_lg`: Indicador si la llamada pasa por el módulo "AVERIA_MASIVA".
- `info_by_phone_lg` e `info_by_dni_lg`: Indicadores si se identifica al cliente por teléfono o DNI.
- `customer_phone`: Número de teléfono del cliente.
- `step_description_error`: Descripción del error del paso.
- `document_type` e `document_identification`: Tipo e identificación del documento.
- `billing_account_id`: Identificador de la cuenta de facturación.
- `repeated_phone_24H` y `cause_recall_phone_24H`: Indicadores de llamadas repetidas en 24 horas anteriores o posteriores.

## Uso

Este código SQL se puede ejecutar en Google BigQuery para crear la tabla `ivr_summary` en el dataset `keepcoding`. La tabla resultante proporcionará un resumen de las interacciones de los clientes con el sistema IVR de atención al cliente.

##Ejercicio 3

## Función SQL para Limpiar Enteros

Este código SQL define una función llamada `clean_integer` que se utiliza para limpiar valores enteros. La función toma un parámetro `value` de tipo INT64 y devuelve un valor limpio.

## Descripción

La función `clean_integer` tiene un propósito simple: si el valor de entrada es nulo (NULL), devuelve el valor predeterminado de -999999; de lo contrario, devuelve el valor de entrada sin cambios. Esto es útil para garantizar que los valores enteros nunca sean nulos en los resultados de las consultas SQL.

## Uso

Para utilizar esta función en una consulta SQL, simplemente llámala con un valor entero como argumento.
