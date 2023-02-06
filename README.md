# Proyecto de creacción de base de datos de un videoclub


Lo primero que se ha hecho en este proyecto ha sido una investigación de cada tabla. En ese investigación se ha llegado a diferentes conclusiones.
Nuestro fin es crear una base de datos para un nuevo videoclub, en el que nos apoyaremos de las peliculas que ya teniamos en inventario, pero eliminamos tanto los clientes anteriores como tiendas y staff. Esas tablas parten de cero, por lo que al crearlas, las hemos dejado desconectadas del resto para que se puedan poner en el futuro.
La primera es que hay columnas que son innecesarias, como pueda ser last_update en la mayoria de tablas
La tabla languaje, que en principio puede resultar inutil dado que todas son en inglés, hemos decidido conservarla para mantener los codigos de idiomas de DVD. Hemos establecido una relacion de 1:n y no n:m porque el videoclub se centra en peliculas en V.O. Solo teniendo un idioma y considerando la existencia de los subtítulos multidioma de forma implícita.


Además de eso, se han encontrado diferentes incongruencias en los datos, como que la fecha de lanzamiento sea un año (2006 concretamente) y hubiera referencia de alquiler de alguna pelicula en 2005. Tras una investigación sobre cómo funcionan los lanzamientos en DVD, se ha llegado a la conclusión de que se puede haber tomado la fecha de lanzamiento como la fecha en la que aparece el DVD en las tiendas, pero que en las llamadas "ventanas" la fecha de cine y de alquiler son anteriores a cuando aparece el DVD para el público. Si bien es cierto que estos periodos de ventanas se han acortado drásticamente en los ultimos años por los servicios de streaming, en la época de la que tenemos constancia en los registros, las ventanas tenian plazos de varios meses.

Otra incongruencia encontrada en los datos, ha sido que en de las 223 peliculas que habia en film coincidentes con el id de inventario, habia 16 peliculas que estaban en films pero no en inventario. Para poder solucionar si el cliente tenia todas las peliculas que aparecian en films y tomar como datos válidos esa tabla, se llegó a la solución de "llamar al cliente" y su "contestación" fue que esas 16 peliculas perdidas se las comió un tiburón blanco mientras hacia surf en estados unidos, y que del resto que no aparecian en inventory pero si en films, conservaba una única copia de cada una de ellas.


Otra cosa que hemos dejado constancia por escrito al cliente es la futura creación de una tabla de "directores". Si bien el cliente no parecía muy entusiasmado porque había que meter los datos de las películas que ya están en inventario, se ha insistido mucho en esta idea, partiendo de la base que sería una relación n:m y que necesitaria de una tabla intermedia en la base de datos.


Las instrucciones que se seguirán para la creación de la base de datos es lanzar el cuaderno de jupiter, que exportar a mysql, y desde mysql lanzar la query de crearbase.sql que contiene tanto la creación de las tablas que serán conectadas en el futuro, como la modificación de las actuales para crear las conexiones apropiadas entre ellas.


Se plantean algunas dudas de las tablas resultantes por la falta de tiempo. Una de esas dudas sería la compatibilidad de las nuevas tablas cuya ID es de tipo int, con las otras cuyo tipo es bigint. Se parte de la idea de que si que se podrán conectar, y después de una investigación se ha concluido que se podrian modificar las columnas de bigint por int. 