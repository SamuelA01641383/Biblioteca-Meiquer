/*DROP DATABASE IF EXISTS BibliotecaMeiquer;*/

CREATE DATABASE IF NOT EXISTS BibliotecaMeiquer;

USE BibliotecaMeiquer;

/*CONTENIDO*/
CREATE TABLE IF NOT EXISTS Contenido (
ID_Contenido INT NOT NULL AUTO_INCREMENT,
Nombre VARCHAR(255),
URL VARCHAR(255),
Tipo INT,
Descripcion VARCHAR(500),
PRIMARY KEY(ID_Contenido)
);

/*VIDEOS, Duracion en minutos*/
CREATE TABLE IF NOT EXISTS Videos (
 ID_Contenido INT,
 Duracion INT,
 Canal TEXT,
 PRIMARY KEY(ID_Contenido)
);
ALTER TABLE Videos ADD FOREIGN KEY(ID_Contenido) REFERENCES Contenido(ID_Contenido);

/*ACTIVIDADES*/
CREATE TABLE IF NOT EXISTS Actividades (
 ID_Contenido INT,
 Imagen VARCHAR(255),
 PRIMARY KEY(ID_Contenido)
);
ALTER TABLE Actividades ADD FOREIGN KEY(ID_Contenido) REFERENCES Contenido(ID_Contenido);

/*LIBROS*/
CREATE TABLE IF NOT EXISTS Libros (
 ID_Contenido INT,
 Paginas INT,
 Imagen VARCHAR(255),
 PRIMARY KEY(ID_Contenido)
);
ALTER TABLE Libros ADD FOREIGN KEY(ID_Contenido) REFERENCES Contenido(ID_Contenido);

/*REFERENCIAS*/
CREATE TABLE IF NOT EXISTS Referencias (
 ID_Contenido INT,
 NombreArticulo VARCHAR(255),
 NombrePagina VARCHAR(255),
 PRIMARY KEY(ID_Contenido)
);
ALTER TABLE Referencias ADD FOREIGN KEY(ID_Contenido) REFERENCES Contenido(ID_Contenido);

/*ETIQUETAS*/
CREATE TABLE IF NOT EXISTS Etiquetas (
 ID_Etiqueta INT NOT NULL AUTO_INCREMENT,
 Nombre VARCHAR(255),
 PRIMARY KEY(ID_Etiqueta)
);

/*CONTENIDO-ETIQUETAS*/
CREATE TABLE IF NOT EXISTS Contenido_Etiqueta (
 ID_CE INT NOT NULL AUTO_INCREMENT,
 ID_Contenido INT NOT NULL,
 ID_Etiqueta INT NOT NULL,
 PRIMARY KEY(ID_CE)
);
ALTER TABLE Contenido_Etiqueta ADD FOREIGN KEY(ID_Etiqueta) REFERENCES Etiquetas(ID_Etiqueta);
ALTER TABLE Contenido_Etiqueta ADD FOREIGN KEY(ID_Contenido) REFERENCES Contenido(ID_Contenido);

/*COLECCIONES*/
CREATE TABLE IF NOT EXISTS Colecciones (
 ID_Coleccion INT NOT NULL AUTO_INCREMENT,
 Nombre VARCHAR(255),
 PRIMARY KEY(ID_Coleccion)
);

/*COLECCION_CONTENIDO*/
CREATE TABLE IF NOT EXISTS Coleccion_Contenido (
 ID_CC INT NOT NULL AUTO_INCREMENT,
 ID_Contenido INT NOT NULL,
 ID_Coleccion INT NOT NULL,
 PRIMARY KEY(ID_CC)
);
ALTER TABLE Coleccion_Contenido ADD FOREIGN KEY(ID_Coleccion) REFERENCES Colecciones(ID_Coleccion);
ALTER TABLE Coleccion_Contenido ADD FOREIGN KEY(ID_Contenido) REFERENCES Contenido(ID_Contenido);

DELIMITER //
CREATE PROCEDURE sp_Details(IN id_param INT)
BEGIN
	SELECT Tipo INTO @TipoParam FROM Contenido where id=id_param; 
	IF(@TipoParam = 1) THEN
		SELECT * FROM Videos WHERE ID_Contenido = id_param;
	ELSEIF(@TipoParam = 2) THEN 
		SELECT * FROM Libros WHERE ID_Contenido = id_param;
	ELSEIF(@TipoParam = 3) THEN 
		SELECT * FROM Actividades WHERE ID_Contenido = id_param;
	ELSEIF(@TipoParam = 4) THEN 
		SELECT * FROM Referencias WHERE ID_Contenido = id_param;
	END IF;
END //
DELIMITER ;

#Videos
insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (1, "Misión Meiquer Espacial: Introducción","https://www.youtube.com/embed/Rvjdp6k2EVQ",1,"Cadetes, les tenemos un mensaje importante de parte de la Doctora Luna. La misión comienza el lunes 13, recuerden que todos los materiales para realizar nuestras actividades se encuentran fácilmente en casa. ¿Están listos? ¡Los esperamos!");
insert into videos(ID_Contenido, Duracion, Canal) values(1,1,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (2, "Construyendo el Ritmo: Trazos Musicales - Espiral Meiquer","https://www.youtube.com/embed/4AiFHsbS_fs",1, 
"Diseño de contenido educativo: Estación Meiquer, coordinado por Hugo Michel 
Producción: Daniel Blanco y Tony Andrea Navarrete Morales 
Edición: Daniel Blanco 
Actuación: Tony Andrea Navarrete Morales (Dra. Luna)");
insert into videos(ID_Contenido, Duracion, Canal) values(2,4,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (3, "Construyendo el Ritmo: La Magia del Sonido - Espiral Meiquer","https://www.youtube.com/embed/sgTtC-fNhZE",1,
"Diseño de contenido educativo: Estación Meiquer, coordinado por Hugo Michel
Producción: Daniel Blanco y Tony Andrea Navarrete Morales 
Edición: Daniel Blanco
Actuación: Tony Andrea Navarrete Morales (Dra. Luna)");
insert into videos(ID_Contenido, Duracion, Canal) values(3,4,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (4, "Construyendo el Ritmo: Viaje Musical - Espiral Meiquer","https://www.youtube.com/embed/9pG9msLq5hM",1,
"Misión 2: Viaje Musical 
Diseño de contenido educativo: Estación Meiquer, coordinado por Hugo Michel 
Producción: Daniel Blanco y Tony Andrea Navarrete Morales 
Edición: Daniel Blanco 
Actuación: Tony Andrea Navarrete Morales (Dra. Luna)");
insert into videos(ID_Contenido, Duracion, Canal) values(4,4,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (5, "Construyendo el ritmo: Al Ritmo de los Tambores - Espiral Meiquer","https://www.youtube.com/embed/vlVjR_RRtT4",1,
"Misión 1: Al Ritmo de los Tambores 
Diseño de contenido educativo: Estación Meiquer, coordinado por Hugo Michel 
Producción: Daniel Blanco y Tony Andrea Navarrete Morales 
Edición: Daniel Blanco 
Actuación: Tony Andrea Navarrete Morales (Dra. Luna)
");
insert into videos(ID_Contenido, Duracion, Canal) values(5,4,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (6, "Explorando Mundos: Nuestro Cuerpo - Espiral Meiquer","https://www.youtube.com/embed/0gWbXkuaInU",1,
"¡Viajemos al sistema respiratorio con Espiral Meiquer! 

Colección Explorando Mundos 
Misión 4: Nuestro Cuerpo 

Diseño de contenido educativo: Estación Meiquer, coordinado por Hugo Michel 
Producción: Daniel Blanco y Tony Andrea Navarrete Morales 
Edición: Daniel Blanco 
Actuación: Tony Andrea Navarrete Morales (Dra. Luna)");
insert into videos(ID_Contenido, Duracion, Canal) values(6,5,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (7, "Explorando Mundos: Viajemos al Futuro - Espiral Meiquer","https://www.youtube.com/embed/hZvA__EMBY0",1,
"¡Bienvenidos a la segunda misión de Espiral Meiquer!  

Colección Explorando Mundos 
Misión 2: Viajemos al Futuro 

Diseño de contenido educativo: Estación Meiquer, coordinado por Hugo Michel 
Producción: Daniel Blanco y Tony Andrea Navarrete Morales 
Edición: Daniel Blanco 
Actuación: Tony Andrea Navarrete Morales (Dra. Luna)");
insert into videos(ID_Contenido, Duracion, Canal) values(7,3,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (8, "Mision Meiquer Espacial: Cierre","https://www.youtube.com/embed/I8hU6KXhsz4",1,
"¡Gracias por participar en nuestra misión! 

Cadete, gracias por ayudarnos a cumplir nuestros objetivos. 
No los hubiéramos logrado sin tu apoyo, fue un gusto jugar juntos. 

Te esperamos en próximas misiones, no olvides seguirnos en nuestras redes:
Facebook (Estación Meiquer) e Instagram(estacionmeiquer). 

¡Hasta pronto, cadetes!");
insert into videos(ID_Contenido, Duracion, Canal) values(8,1,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (9, "Mision Meiquer Espacial: #10 Bienvenido a casa, es tiempo de cambiar","https://www.youtube.com/embed/mtRhn-R7OVo",1,
"¡Cadete, bienvenido a tu última misión! Es un gusto saludarte. 
Has logrado completar de la mejor manera todas las misiones que tuvimos juntos, 
ojalá estés tan orgulloso y satisfecho con todo lo que hiciste como nosotros lo estamos de ti. 
Ha llegado el momento de la última misión. 
Esta es un poco diferente a las que ya tuvimos, pues necesitamos que la hagas todos los días. 
Tu misión es: cuidar de la Tierra. 
");
insert into videos(ID_Contenido, Duracion, Canal) values(9,4,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (10, "Mision Meiquer Espacial: #8 De vuelta a casa","https://www.youtube.com/embed/BNPBYDy_Hu8",1,"Ha llegado el momento de una misión más; esta vez, necesitamos más que nunca de tu ingenio y creatividad. Necesitamos que regreses lo antes que puedas para poder empezar a reparar nuestro hogar… pero tenemos un problema. El planeta que descubriste estaba demasiado alejado de nuestro sistema solar y el combustible no será suficiente para que puedas regresar a casa. Es por ello que tu siguiente misión es crear tu propio sistema de propulsión.");
insert into videos(ID_Contenido, Duracion, Canal) values(10,3,"Meiquer TV");

#LIBROS
insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (11, "PAW Patrol. Mis primeras letras y numeros","https://www.planetadelibros.com.mx/libro-paw-patrol-mis-primeras-letras-y-numeros/374404",2, "En este colorido libro de actividades podrán practicar trazando el abecedario en minúsculas, además de los números del 1 al 10.");
insert into libros(ID_Contenido, Paginas, Imagen) values(11, 56, "https://static5planetadelibroscommx.cdnstatics.com/usuaris/libros/fotos/375/m_libros/portada_paw-patrol-mis-primeras-letras-y-numeros_nickelodeon_202302281855.jpg");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (12, "El gran libro del espacio","https://www.planetadelibros.com.mx/libro-geronimo-stilton-el-gran-libro-del-espacio/360025",2, "De la mano de tus roedores favoritos conocerás todas las curiosidades que encierra el universo: los planetas más parecidos a la Tierra, las estrellas y los agujeros negros, los distintos tipos de galaxias, las naves espaciales, el día a día de los astronautas… ¡Una aventura superratónica!");
insert into libros(ID_Contenido, Paginas, Imagen) values(12, 80, "https://static1planetadelibroscommx.cdnstatics.com/usuaris/libros/fotos/361/m_libros/portada_geronimo-stilton-el-gran-libro-del-espacio_geronimo-stilton_202208162321.jpg");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (13, "Las pistas de Blue y tú. ¡Arcoíris de pistas!","https://www.planetadelibros.com.mx/libro-las-pistas-de-blue-y-tu-arcoiris-de-pistas/371652",2, "Intrucciones
1. Recorta a los personajes por la línea punteada.
2. Recorta la base por la línea punteada.
3. Inserta la ranura A en la B.

");
insert into libros(ID_Contenido, Paginas, Imagen) values(13, 128, "https://static2planetadelibroscommx.cdnstatics.com/usuaris/libros/fotos/372/m_libros/portada_las-pistas-de-blue-y-tu-arcoiris-de-pistas_nickelodeon_202302230033.jpg");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (14, "Marcus Pocus 1. Magia a domicilio","https://www.planetadelibros.com.mx/libro-marcus-pocus-1-magia-a-domicilio/372889",2, "En la moderna ciudad de Suncity no hay lugar para la magia. O al menos eso cree Marcus Pocus, un travieso aprendiz de brujo del Club de la Luna Llena, hasta que entra por casualidad en una misteriosa tienda oculta al fondo de un callejón");
insert into libros(ID_Contenido, Paginas, Imagen) values(14, 128, "https://static3planetadelibroscommx.cdnstatics.com/usuaris/libros/fotos/373/m_libros/372889_portada_marcus-pocus-1-magia-a-domicilio_pedro-manas_202205021741.jpg");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (15, "Princesa Piquiriqui y la (espantosa) verdad sobre los bebés","https://www.planetadelibros.com.mx/libro-princesa-piquiriqui-y-la-espantosa-verdad-sobre-los-bebes/369395",2, "Los adultos dicen que se trata de un bebé y que lo trajo la cigüeña, pero Piquiriqui es muy lista y no se detendrá hasta descubrir la verdad detrás de este misterio.");
insert into libros(ID_Contenido, Paginas, Imagen) values(15, 40, "https://static0planetadelibroscommx.cdnstatics.com/usuaris/libros/fotos/370/m_libros/portada_princesa-piquiriqui-y-la-espantosa-verdad-sobre-los-bebes_hannele-lampela_202303242217.jpg");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (16, "Las aventuras de Dani y Evan. La isla de los pterosaurios","https://www.planetadelibros.com.mx/libro-las-aventuras-de-dani-y-evan-la-isla-de-los-pterosaurios/377417",2, "¡Vuelven las aventuras de Dani y Evan! Ha aparecido una misteriosa isla en el Santuario de los Dinosaurios y los dos hermanos regresarán con el Profesor Bizcoché para explorarla.");
insert into libros(ID_Contenido, Paginas, Imagen) values(16, 144, "https://static8planetadelibroscommx.cdnstatics.com/usuaris/libros/fotos/378/m_libros/377417_portada_las-aventuras-de-dani-y-evan-2-la-isla-de-los-pterosaurios_las-aventuras-de-dani-y-evan_202007091436.jpg");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (17, "Gigantosaurus. Cuentos de 5 minutos","https://www.planetadelibros.com.mx/libro-gigantosaurus-cuentos-de-5-minutos/360977",2, "Acompaña a los prehistóricos amigos Rocky, Bill, Mazu y Tiny mientras exploran Cretacia y viven aventuras llenas de diversión que los acercarán a ¡GIGANTOSAURUS!");
insert into libros(ID_Contenido, Paginas, Imagen) values(17, 192, "https://static1planetadelibroscommx.cdnstatics.com/usuaris/libros/fotos/361/m_libros/portada_gigantosaurus-cuentos-de-5-minutos_jonny-duddle_202303242142.jpg");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (18, "No te comas este libro","https://www.planetadelibros.com.mx/libro-no-te-comas-este-libro/372138",2, "Crea, juega, resuelve enigmas, cumple misiones y, sobre todo, diviértete con el libro-juego de Mike.");
insert into libros(ID_Contenido, Paginas, Imagen) values(18, 56, "https://static3planetadelibroscommx.cdnstatics.com/usuaris/libros/fotos/373/m_libros/372138_portada_no-te-comas-este-libro_mikecrack_202301271354.jpg");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (19, "Stuntboy. El superhéroe de los superhéroes","https://www.planetadelibros.com.mx/libro-stuntboy-el-superheroe-de-los-superheroes/363698",2,"Un superhéroe extraordinario que intenta pasar desapercibido bajo la identidad de Portico Reeves, un chico que vive en la casa más grande de la ciudad y a quien de vez en cuando le da la temblorina.");
insert into libros(ID_Contenido, Paginas, Imagen) values(19, 272, "https://static4planetadelibroscommx.cdnstatics.com/usuaris/libros/fotos/364/m_libros/portada_stuntboy-el-superheroe-de-los-superheroes_jason-reynolds_202301121849.jpg");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (20, "Toy Story. Mi primer libro de arte","https://www.planetadelibros.com.mx/libro-toy-story-mi-primer-libro-de-arte/360973",2, "Mi primer libro de arte es una colección especialmente pensada para acompañar a los más pequeños en sus primeras aventuras en el mundo del arte y la creatividad");
insert into libros(ID_Contenido, Paginas, Imagen) values(20, 72, "https://static1planetadelibroscommx.cdnstatics.com/usuaris/libros/fotos/361/m_libros/portada_toy-story-mi-primer-libro-de-arte_disney_202209092202.jpg");

#ACTIVIDADES

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (21, "Ciencia, Arte","http://tinkerlab.com/",3, "Programa de arte hecho en casa para preescolar");
insert into actividades(ID_Contenido, Imagen) values(21, "https://meiquer.mx/static/logo-meiquer-star-bg-8e6eb8cb414362b53fea1076e5d9305d.png");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (22, "Steam y Maker","http://makercamp.com/",3, "Proyecto que busca apoyar en los intereses de los jóvenes en tecnología");
insert into actividades(ID_Contenido, Imagen) values(22,"https://meiquer.mx/static/logo-meiquer-star-bg-8e6eb8cb414362b53fea1076e5d9305d.png");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (23, "Ciencias Computacionales","https://code.org/",3,"Organización de educación en programación para niños y adolescentes");
insert into actividades(ID_Contenido, Imagen) values(23,"https://meiquer.mx/static/logo-meiquer-star-bg-8e6eb8cb414362b53fea1076e5d9305d.png");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (24, "Manualidades","https://cardboardchallenge.com/",3, "Reto educativo con el uso de carton");
insert into actividades(ID_Contenido, Imagen) values(24,"https://meiquer.mx/static/logo-meiquer-star-bg-8e6eb8cb414362b53fea1076e5d9305d.png");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (25, "Dibujo y Pintura","http://www.thedotclub.org/",3, "Organización basada en el libro the dot, celebra el día internacional del punto");
insert into actividades(ID_Contenido, Imagen) values(25,"https://meiquer.mx/static/logo-meiquer-star-bg-8e6eb8cb414362b53fea1076e5d9305d.png");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (26, "Videojuegos y Steam","http://www.gamesforchange.org/",3, "Games for Change, fundada en 2004, es una organización sin fines de lucro 501(c)3 que empodera a los creadores de juegos e innovadores sociales para impulsar el impacto en el mundo real a través de juegos y medios inmersivos. ");
insert into actividades(ID_Contenido, Imagen) values(26,"https://meiquer.mx/static/logo-meiquer-star-bg-8e6eb8cb414362b53fea1076e5d9305d.png");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (27, "Steam y Maker","https://www.coursera.org/learn/tinkering-circuits",3, "Capacitación Maker");
insert into actividades(ID_Contenido, Imagen) values(27,"https://meiquer.mx/static/logo-meiquer-star-bg-8e6eb8cb414362b53fea1076e5d9305d.png");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (28, "Outdoor Classroom Day","https://outdoorclassroomday.com/",3, "¡Cuando se una a nosotros, tendrá la oportunidad de poner su escuela o su hogar en el mapa para demostrar que es parte del movimiento global del Día del Aula al Aire Libre!");
insert into actividades(ID_Contenido, Imagen) values(28,"https://meiquer.mx/static/logo-meiquer-star-bg-8e6eb8cb414362b53fea1076e5d9305d.png");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (29, "Historia Natural","https://www.amnh.org/explore/ology",3, "Plataforma para niños del museo natural de Historia Americana");
insert into actividades(ID_Contenido, Imagen) values(29,"https://meiquer.mx/static/logo-meiquer-star-bg-8e6eb8cb414362b53fea1076e5d9305d.png");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (30, "Actividades en casa","https://resources.pitsco.com/stem-at-home",3, "PITSCO es un recurso educativo para el hogar desde maternal hasta todas las edades, en tópicos variados, manualidad,es ingeneria, construccion, cocina, etc.");
insert into actividades(ID_Contenido, Imagen) values(30,"https://meiquer.mx/static/logo-meiquer-star-bg-8e6eb8cb414362b53fea1076e5d9305d.png");

#REFERENCIAS

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (31, "UNICEF","https://www.unicef.org/",4,"Derechos de infancia, estadísticas");
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(31, "Derechos de infancia, estadisticas","UNICEF");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (32, "Imagination Foundation","https://imagination.org/",4, "Fundación dedicada a fomentar el juego creativo");
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(32, "Fundación dedicada a fomentar el juego creativo","Imagination Foundation");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (33, "Maker ED","https://makered.org/",4,"Iniciativa que fomenta la educación Maker");
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(33, "Iniciativa que fomenta la educación Maker","Maker ED");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (34, "Lego Foundation","https://www.legofoundation.com/",4,"Fundación dedicada a promover el juego y a su investigación");
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(34, "Fundación dedicada a promover el juego y a su investigación","Lego Foundation");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (35, "Exploratorium","https://www.exploratorium.edu/",4,"Museo para niños en California");
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(35, "Museo para niños en California","Exploratorium");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (36, "UNESCO","https://en.unesco.org/",4,"Educación y Cultura");
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(36, "Educacion y cultura","UNESCO");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (37, "Playful Journey Lab","https://playful.mit.edu/",4,"Investigación del juego");
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(37, "Investigacion del juego","Playful Journey Lab");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (38, "Play in Education, Development & Learning","https://www.educ.cam.ac.uk/centres/pedal/",4, "Centro de investigación de la universidad de Cambridge");
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(38, "Centro de investigación de la universidad de Cambridge","Play in Education, Development & Learning");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (39, "Lifelong Kindergaten","https://www.media.mit.edu/groups/lifelong-kindergarten/overview/",4, "Recursos y noticias para educación con diferentes temas");
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(39, "Centro de investigación para el aprendizaje","Lifelong Kindergaten");

insert into contenido(ID_Contenido, Nombre, URL, Tipo, Descripcion) values (40, "Playful Learning Center","https://plchelsinki.fi/",4, "Centro de investigación para el aprendizaje");
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(40, "Centro de investigación sobre el juego de la Universidad de Helsinki","Playful Learning Center");

#Etiquetas 

INSERT INTO `etiquetas` (`ID_Etiqueta`, `Nombre`) VALUES
(1, 'Ciencia'),
(2, 'Tecnologia'),
(3, 'Matematicas'),
(4, 'Ingenieria '),
(5, 'Pintura '),
(6, 'Musica');

INSERT INTO `contenido_etiqueta` (`ID_Contenido`, `ID_Etiqueta`) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 6),
(2, 1),
(2, 3),
(3, 6),
(3, 1),
(3, 4),
(4, 6),
(4, 5),
(4, 3),
(5, 6),
(5, 3),
(5, 1),
(6, 1),
(6, 2),
(6, 3),
(7, 1),
(7, 2),
(7, 4),
(8, 1),
(8, 2),
(8, 3),
(9, 1),
(9, 2),
(9, 4),
(10, 1),
(10, 2),
(10, 3),
(11, 2),
(11, 3),
(11, 4),
(12, 1),
(12, 2),
(12, 3),
(13, 1),
(14, 5),
(15, 5),
(16, 4),
(16, 5),
(16, 6),
(17, 1),
(17, 2),
(17, 6),
(18, 1),
(19, 5),
(20, 3),
(21, 1),
(21, 5),
(22, 2),
(23, 1),
(24, 3),
(25, 5),
(25, 6),
(26, 2),
(26, 6),
(27, 2),
(28, 5),
(28, 6),
(29, 1),
(29, 4),
(29, 3),
(30, 1),
(30, 2),
(30, 3),
(31, 3),
(31, 1),
(31, 2),
(32, 3),
(32, 2),
(32, 3),
(33, 4),
(33, 3),
(33, 4),
(34, 5),
(34, 4),
(34, 5),
(35, 6),
(35, 1),
(35, 2),
(36, 3),
(36, 4),
(36, 1),
(37, 1),
(37, 2),
(38, 2),
(38, 3),
(39, 3),
(39, 4),
(40, 1),
(40, 4);



