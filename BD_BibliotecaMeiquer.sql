/*DROP DATABASE IF EXISTS BibliotecaMeiquer;*/

CREATE DATABASE IF NOT EXISTS BibliotecaMeiquer;

USE BibliotecaMeiquer;

/*CONTENIDO*/
CREATE TABLE IF NOT EXISTS Contenido (
ID_Contenido INT NOT NULL AUTO_INCREMENT,
Nombre VARCHAR(255),
URL VARCHAR(255),
Tipo INT,
PRIMARY KEY(ID_Contenido)
);

/*VIDEOS, Duracion en minutos*/
CREATE TABLE IF NOT EXISTS Videos (
 ID_Contenido INT,
 Duracion INT,
 Canal VARCHAR(255),
 PRIMARY KEY(ID_Contenido)
);
ALTER TABLE Videos ADD FOREIGN KEY(ID_Contenido) REFERENCES Contenido(ID_Contenido);

/*ACTIVIDADES*/
CREATE TABLE IF NOT EXISTS Actividades (
 ID_Contenido INT,
 Descripcion VARCHAR(255),
 PRIMARY KEY(ID_Contenido)
);
ALTER TABLE Actividades ADD FOREIGN KEY(ID_Contenido) REFERENCES Contenido(ID_Contenido);

/*LIBROS*/
CREATE TABLE IF NOT EXISTS Libros (
 ID_Contenido INT,
 Paginas INT,
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

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (1, "Misión Meiquer Espacial: Introducción","https://www.youtube.com/watch?v=Rvjdp6k2EVQ",1);
insert into videos(ID_Contenido, Duracion, Canal) values(1,1,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (2, "Construyendo el Ritmo: Trazos Musicales - Espiral Meiquer","https://www.youtube.com/watch?v=4AiFHsbS_fs",1);
insert into videos(ID_Contenido, Duracion, Canal) values(2,4,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (3, "Construyendo el Ritmo: La Magia del Sonido - Espiral Meiquer","https://www.youtube.com/watch?v=sgTtC-fNhZE",1);
insert into videos(ID_Contenido, Duracion, Canal) values(3,4,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (4, "Construyendo el Ritmo: Viaje Musical - Espiral Meiquer","https://www.youtube.com/watch?v=9pG9msLq5hM",1);
insert into videos(ID_Contenido, Duracion, Canal) values(4,4,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (5, "Construyendo el ritmo: Al Ritmo de los Tambores - Espiral Meiquer","https://www.youtube.com/watch?v=vlVjR_RRtT4",1);
insert into videos(ID_Contenido, Duracion, Canal) values(5,4,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (6, "Explorando Mundos: Nuestro Cuerpo - Espiral Meiquer","https://www.youtube.com/watch?v=0gWbXkuaInU",1);
insert into videos(ID_Contenido, Duracion, Canal) values(6,5,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (7, "Explorando Mundos: Viajemos al Futuro - Espiral Meiquer","https://www.youtube.com/watch?v=k_dC1sj9sOE&pp=ygUXbWF0ZW1hdGljYXMgcGFyYSBuacOxb3M%3D",1);
insert into videos(ID_Contenido, Duracion, Canal) values(7,3,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (8, "Mision Meiquer Espacial: Cierre","https://www.youtube.com/watch?v=I8hU6KXhsz4",1);
insert into videos(ID_Contenido, Duracion, Canal) values(8,1,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (9, "Mision Meiquer Espacial: #10 Bienvenido a casa, es tiempo de cambiar","https://www.youtube.com/watch?v=mtRhn-R7OVo",1);
insert into videos(ID_Contenido, Duracion, Canal) values(9,4,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (10, "Mision Meiquer Espacial: #8 De vuelta a casa","https://www.youtube.com/watch?v=BNPBYDy_Hu8",1);
insert into videos(ID_Contenido, Duracion, Canal) values(10,3,"Meiquer TV");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (11, "PAW Patrol. Mis primeras letras y numeros","https://www.planetadelibros.com.mx/libro-paw-patrol-mis-primeras-letras-y-numeros/374404",2);
insert into libros(ID_Contenido, Paginas) values(11, 56);

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (12, "El gran libro del espacio","https://www.planetadelibros.com.mx/libro-geronimo-stilton-el-gran-libro-del-espacio/360025",2);
insert into libros(ID_Contenido, Paginas) values(12, 80);

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (13, "Las pistas de Blue y tú. ¡Arcoíris de pistas!","https://www.planetadelibros.com.mx/libro-las-pistas-de-blue-y-tu-arcoiris-de-pistas/371652",2);
insert into libros(ID_Contenido, Paginas) values(13, 128);

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (14, "Marcus Pocus 1. Magia a domicilio","https://www.planetadelibros.com.mx/libro-marcus-pocus-1-magia-a-domicilio/372889",2);
insert into libros(ID_Contenido, Paginas) values(14, 128);

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (15, "Princesa Piquiriqui y la (espantosa) verdad sobre los bebés","https://www.planetadelibros.com.mx/libro-princesa-piquiriqui-y-la-espantosa-verdad-sobre-los-bebes/369395",2);
insert into libros(ID_Contenido, Paginas) values(15, 40);

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (16, "Las aventuras de Dani y Evan. La isla de los pterosaurios","https://www.planetadelibros.com.mx/libro-las-aventuras-de-dani-y-evan-la-isla-de-los-pterosaurios/377417",2);
insert into libros(ID_Contenido, Paginas) values(16, 144);

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (17, "Gigantosaurus. Cuentos de 5 minutos","https://www.planetadelibros.com.mx/libro-gigantosaurus-cuentos-de-5-minutos/360977",2);
insert into libros(ID_Contenido, Paginas) values(17, 192);

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (18, "No te comas este libro","https://www.planetadelibros.com.mx/libro-no-te-comas-este-libro/372138",2);
insert into libros(ID_Contenido, Paginas) values(18, 56);

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (19, "Stuntboy. El superhéroe de los superhéroes","https://www.planetadelibros.com.mx/libro-stuntboy-el-superheroe-de-los-superheroes/363698",2);
insert into libros(ID_Contenido, Paginas) values(19, 272);

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (20, "Toy Story. Mi primer libro de arte","https://www.planetadelibros.com.mx/libro-toy-story-mi-primer-libro-de-arte/360973",2);
insert into libros(ID_Contenido, Paginas) values(20, 72);

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (21, "Ciencia, Arte","http://tinkerlab.com/",3);
insert into actividades(ID_Contenido, Descripcion) values(21, "Programa de arte hecho en casa para preescolar");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (22, "Steam y Maker","http://makercamp.com/",3);
insert into actividades(ID_Contenido, Descripcion) values(22, "Proyecto que busca apoyar en los intereses de los jóvenes en tecnología");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (23, "Ciencias Computacionales","https://code.org/",3);
insert into actividades(ID_Contenido, Descripcion) values(23, "Organización de educación en programación para niños y adolescentes");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (24, "Manualidades","https://cardboardchallenge.com/",3);
insert into actividades(ID_Contenido, Descripcion) values(24, "Reto educativo con el uso de carton");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (25, "Dibujo y Pintura","http://www.thedotclub.org/",3);
insert into actividades(ID_Contenido, Descripcion) values(25, "Organización basada en el libro the dot, celebra el día internacional del punto");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (26, "Videojuegos y Steam","http://www.gamesforchange.org/",3);
insert into actividades(ID_Contenido, Descripcion) values(26, "Founded in 2004, Games for Change is a 501(c)3 nonprofit that empowers game creators and social innovators to drive real-world impact through games and immersive media. We convene industry experts through our annual Games for Change Festival, inspire youth to explore civic issues and STEAM skills through our Student Challenge, and showcase leading impact-focused games and immersive experiences through live Arcades for the public. ");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (27, "Steam y Maker","https://www.coursera.org/learn/tinkering-circuits",3);
insert into actividades(ID_Contenido, Descripcion) values(27, "Capacitación Maker");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (28, "Outdoor Classroom Day","https://outdoorclassroomday.com/",3);
insert into actividades(ID_Contenido, Descripcion) values(28, "When you join us, you will have the opportunity to put your school or household on the map to show that you're part of the global Outdoor Classroom Day movement!");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (29, "Historia Natural","https://www.amnh.org/explore/ology",3);
insert into actividades(ID_Contenido, Descripcion) values(29, "Plataforma para niños del museo natural de Historia Americana");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (30, "Actividades en casa","https://resources.pitsco.com/stem-at-home",3);
insert into actividades(ID_Contenido, Descripcion) values(30, "PITSCO es un recurso educativo para el hogar desde maternal hasta todas las edades, en tópicos variados, manualidad,es ingeneria, construccion, cocina, etc.");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (31, "Referencia1","https://www.unicef.org/",4);
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(31, "Derechos de infancia, estadisticas","UNICEF");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (32, "Referencia2","https://imagination.org/",4);
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(32, "Fundación dedicada a fomentar el juego creativo","Imagination Foundation");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (33, "Referencia3","https://makered.org/",4);
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(33, "Iniciativa que fomenta la educación Maker","Maker ED");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (34, "Referencia4","https://www.legofoundation.com/",4);
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(34, "Fundación dedicada a promover el juego y a su investigación","Lego Foundation");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (35, "Referencia5","https://www.exploratorium.edu/",4);
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(35, "Museo para niños en California","Exploratorium");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (36, "Referencia6","https://en.unesco.org/",4);
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(36, "Educacion y cultura","UNESCO");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (37, "Referencia7","https://playful.mit.edu/",4);
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(37, "Investigacion del juego","Playful Journey Lab");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (38, "Referencia8","https://www.educ.cam.ac.uk/centres/pedal/",4);
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(38, "Centro de investigación de la universidad de Cambridge","Play in Education, Development & Learning");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (39, "Referencia9","https://www.media.mit.edu/groups/lifelong-kindergarten/overview/",4);
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(39, "Centro de investigación para el aprendizaje","Lifelong Kindergaten");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (40, "Referencia10","https://plchelsinki.fi/",4);
insert into referencias(ID_Contenido, NombreArticulo, NombrePagina) values(40, "Centro de investigación sobre el juego de la Universidad de Helsinki","Playful Learning Center");
