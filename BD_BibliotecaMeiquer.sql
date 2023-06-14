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
