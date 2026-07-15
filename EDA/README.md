🩺 Exploración y Limpieza de Datos de Salud

Ejercicio de recuperación (Fase 1: Exploración y limpieza / Fase 2: Visualización) sobre un dataset con hábitos y salud de 1200 personas: edad, género, IMC, nivel de actividad física, consumo de alcohol, tabaquismo, presión arterial, colesterol, glucosa, horas de sueño, pasos diarios, satisfacción con la vida y presencia de enfermedad crónica.

🔍 Fase 1: Exploración y limpieza de datos

Exploración inicial

Función eda_basico() para inspeccionar el dataset de forma sistemática: dimensiones, tipos de datos, estadísticas descriptivas (numéricas y categóricas), valores nulos por columna, columnas constantes y filas duplicadas.

Tratamiento de valores nulos

Imputación diferenciada según el tipo de variable, evitando sustituir por un único valor global cuando existía una agrupación más representativa:

Tipo de columnaEstrategiaCategóricas (género, nivel de actividad, consumo de alcohol, fumador, colesterol, enfermedad crónica)ModaVariables fisiológicas (IMC, presión sistólica/diastólica, glucosa)Mediana agrupada por rango de edadPasos diariosMediana agrupada por nivel de actividad físicaHoras de sueño, satisfacción con la vidaMediana global

Corrección de inconsistencias

Se detectaron filas donde la presión sistólica era menor o igual que la diastólica (fisiológicamente incorrecto). Al comprobar que los valores encajaban en rangos normales al invertirlos, se corrigieron asumiendo que estaban simplemente intercambiados.

Ajustes finales

Renumeración de la columna ID (1 a N sin huecos), conversión de columnas numéricas a tipo entero cuando no tenían decimales reales, normalización de nombres de columnas a minúsculas y verificación final: 0 nulos en las 15 columnas, sin duplicados, IDs únicos.

📊 Fase 2: Visualización

¿Cómo se distribuye el IMC en la población? Distribución bastante uniforme entre 18 y 40 (media 29.18, mediana 29.12), sin asimetría marcada. Buena parte de la población está en sobrepeso u obesidad. ¿Cómo varía la presión arterial según el nivel de actividad física? Medias muy similares entre los tres grupos (sistólica 134–136, diastólica 88–90). No hay relación clara con la actividad física. ¿Diferencias en pasos diarios entre fumadores y no fumadores? Media similar (10.744 vs. 10.426). La mediana idéntica entre grupos es un artefacto de la imputación por mediana de grupo, no un patrón real. ¿Relación entre horas de sueño y satisfacción con la vida? Correlación prácticamente nula. Sin relación lineal.

Gráficos adicionales: distribución por categorías de IMC y matriz de correlación entre variables numéricas (sin correlaciones fuertes entre las variables analizadas).

📌 Conclusiones generales

El dataset, tras la limpieza, queda completo (0 nulos), consistente (sin errores lógicos de presión arterial) y con tipos de datos adecuados para el análisis. Ninguna de las relaciones exploradas (actividad física–presión, tabaquismo–pasos, sueño–satisfacción) muestra una asociación relevante en este dataset; las diferencias entre grupos son pequeñas y, en algún caso, explicables por el propio proceso de imputación más que por un patrón real. El hallazgo más interesante a nivel metodológico es el efecto de la imputación por mediana de grupo: rellenar muchos nulos con un mismo número puede generar coincidencias artificiales (como la mediana idéntica entre fumadores y no fumadores) que conviene identificar y explicar en vez de interpretar como resultado real.
