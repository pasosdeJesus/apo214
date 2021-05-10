# Control de Geolocalización

## Definición del prototipo:
Se precisa implementar un control de conversión entre sistemas de coordenadas y notaciones principalmente para facilitar al usuario en caso de que no tenga las coordenadas en el formato establecido en la aplicación. El usuario podrá visualizar las coordenadas como latitud y longitud en el sistema WGS84. y a continuación un botón  de conversión que abre un cuadro de diálogo que ofrece la posibilidad de transformar las coordenadas a dieferentes sistemas inicialmente: sistema MAGNA SIRGAS. La transformación de los sistemas de coordenadas se hará utilizando Postgis de Postgresql.

##¿Qué conceptos geográficos se necesitan para la transformación de coordenadas?

De antemano el código EPSG de los sistemas de referencia origen y destino. 
El código EPSG corresponde a las siglas, en inglés, de European Petroleum Survey Group, organización científica relacionada a la industria petrolera. Dicha organización elaboró un repositorio de parámetros geodésico EPSG, base de datos que contiene información, a nivel mundial, sobre los sistemas de referencia de coordenadas (nombre, tipo, código), proyecciones cartográficas, entre otros.
El código 4326 por ejemplo es el correspondiente al sistema de referencia WGS84 que es el estándar, este código es requerido para la consulta. También existen códigos asignados para proyecciones como el 3116 establecido para la proyección de la zona de Bogotá Magna-Sirgas.
Cabe aclarar muchos de los códigos EPSG están registrados en los
identificadores únicos SRIDs que son los propiciados en PostGIS.

### Métodos:
1) st_geomfromtext()
Construye un objeto PostGIS ST_Geometry a partir de la representación de texto OGC..
Hay dos variantes de la función ST_GeomFromText. El primero no toma SRID y devuelve una geometría sin un sistema de referencia espacial definido (SRID = 0). El segundo toma un SRID como segundo argumento y devuelve una geometría que incluye este SRID como parte de sus metadatos.

2) st_transform()
Devuelve una nueva geometría con sus coordenadas transformadas a un sistema de referencia espacial diferente. La referencia espacial de destino to_srid puede identificarse mediante un parámetro de número entero SRID válido (es decir, debe existir en la tabla espacial_ref_sys). Alternativamente, se puede usar una referencia espacial definida como una cadena PROJ.4 para to_proj y / o from_proj, sin embargo, estos métodos no están optimizados. Si el sistema de referencia espacial de destino se expresa con una cadena PROJ.4 en lugar de un SRID, el SRID de la geometría de salida se establecerá en cero. Con la excepción de las funciones con from_proj, las geometrías de entrada deben tener un SRID definido.

3) st_astext()
Devuelve la representación de texto conocido de la geometría / geografía. Se puede usar un argumento opcional para reducir el número máximo de dígitos decimales después del uso del punto flotante en la salida (el valor predeterminado es 15).

Ejemplo de transformación: para el punto 
1116000 E
1135000 N

----------------------
-73.0000000
----------------------
 
Ejemplo para transformar una coordenada flotante en grados, minutos y segundos:
 
----------------------
SELECT (ST_AsLatLonText('POINT (-3.2342342 -2.32498)', 'D°M''S.SSS"C'));
-------------------------

# Implementación

## Descripción.
Antes de continuar con la implementación del control de geolocalización es necesario hacer énfasis en la forma como actualmente se están manejando las coordenadas geográficas y proyecciones en Colombia desde el Agustín codazzi y organismos oficiales. 

El sistema de referencia espacial MAGNA-SIRGAS es el sistema establecido para Colombia y su código EPSG es el 4686, recordemos que el de WGS84 es el 4326. Sin embargo con este código no tiene ningún sentido hacer conversiones entre ellos porque son las mismos valores esto es porque pertenecen a una misma elipsoide. Aquí es donde entran a jugar las proyecciones. El ejemplo realizado anteriormente se hizo con el código 3116 establecido para MAGNA SIRGAS Colombia zona Bogotá y efectivamente se hace la conversión con esa proyección. Colombia zona Bogota junto con otras 4 proyecciones forman el grupo de proyecciones de referencias para Colombia que el “Agustín Codazzi” usó hasta el 2020. Pero en 2020 se cambió a una única proyección denominada “Sistema de proyección cartográfico ORIGEN NACIONAL” [1] en donde el datum seguirá siendo datum MAGNA SIRGAS y la proyección se basará en la proyección cartográfica Transverse de Mercator. Como primera opción se buscó que el origen coincida con el punto materializado del observatorio astronómico y como segunda opción un origen que fuera equidistante a cada extremo del territorio colombiano, definiendo este origen central se establecen un norte falso y un este falso y con otros parámteros se crea el nuevo sistema Origen Nacional CTM12 (el cual aún no ha sido registrado con un srid)
https://origen.igac.gov.co/herramientas.html

Por tanto, según lo anteriormente mencionado, se ha decidido dejar la opción de proyeccion de MAGNA-SIRGAS Colombia zona Bogotá, en el control y además agregar un espació de conversión para Origen Nacional, atentos a actualizar según las actualizaciones en el país.

