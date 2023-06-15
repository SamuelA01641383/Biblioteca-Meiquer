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

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (1, "las aventuras de sr arduino","google.com",1);
insert into videos(ID_Contenido, Duracion, Canal) values(1,20,"Arduino");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (2, "Tutorial armado de lego mindstorms","youtube.com",1);
insert into videos(ID_Contenido, Duracion, Canal) values(2,23,"Lego Mindstorms");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (3, "Partes del cuerpo humano","youtube.com",1);
insert into videos(ID_Contenido, Duracion, Canal) values(3,15,"MedicalHub");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (4, "TORNADO EN UNA BOTELLA - EXPERIMENTOS PARA NIÑOS","https://www.youtube.com/watch?v=qLOfffoODok&pp=ygUYZXhwZXJpbWVudG9zIHBhcmEgbmnDsW9z",1);
insert into videos(ID_Contenido, Duracion, Canal) values(4,3,"Maeta Marlene");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (5, "Estación Meiquer: transformar mi comunidad, jugando","https://www.youtube.com/watch?v=NbbFoqpJ7ZM",1);
insert into videos(ID_Contenido, Duracion, Canal) values(5,1,"Estacion Meiquer");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (6, "Cómo Hacer una Bobina de tesla (Muy fácil de hacer)","https://www.youtube.com/watch?v=PyMK_UGlGIw&pp=ygUYZXhwZXJpbWVudG9zIHBhcmEgbmnDsW9z",1);
insert into videos(ID_Contenido, Duracion, Canal) values(6,7,"Muy facil de hacer");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (7, "Aprende con Eddie a Sumar y Restar con Comida - Matemáticas divertidas para niños","https://www.youtube.com/watch?v=k_dC1sj9sOE&pp=ygUXbWF0ZW1hdGljYXMgcGFyYSBuacOxb3M%3D",1);
insert into videos(ID_Contenido, Duracion, Canal) values(7,6,"Aprende con EDDIE - El dinosaurio travieso");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (8, "UNIDADES, DECENAS Y CENTENAS - El valor posicional de los números - Matemáticas para niños","https://www.youtube.com/watch?v=eC6-OOfx1tQ&pp=ygUXbWF0ZW1hdGljYXMgcGFyYSBuacOxb3M%3D",1);
insert into videos(ID_Contenido, Duracion, Canal) values(8,5,"Smile and Learn");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (9, "Aprendiendo a multiplicar. La Multiplicación - Vídeos Educativos para niños","https://www.youtube.com/watch?v=YFtEaVw5k1A&pp=ygUXbWF0ZW1hdGljYXMgcGFyYSBuacOxb3M%3D",1);
insert into videos(ID_Contenido, Duracion, Canal) values(9,3,"Happy Learn Español");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (10, "LEGO 45544 MINDSTORMS Education EV3 Core Set (PART1)","https://www.youtube.com/watch?v=V-G9_qiH7Qc&pp=ygUbbGVnbyBtaW5kc3Rvcm1zIHBhcmEgbmnDsW9z",1);
insert into videos(ID_Contenido, Duracion, Canal) values(10,4,"Brick Up");

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (11, "PAW Patrol. Mis primeras letras y numeros","https://www.planetadelibros.com.mx/libro-paw-patrol-mis-primeras-letras-y-numeros/374404",2);
insert into libros(ID_Contenido, Paginas) values(11, 56);

insert into contenido(ID_Contenido, Nombre, URL, Tipo) values (12, "PAW Patrol. Mis primeras letras y numeros","https://www.planetadelibros.com.mx/libro-paw-patrol-mis-primeras-letras-y-numeros/374404",2);
insert into libros(ID_Contenido, Paginas) values(12, 56);

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
