import express from "express"
import mysql from "mysql"
import cors from "cors"

const app = express()
app.use(cors({origin:true}))

// Cambiar username y contrasena en deploy
const db = mysql.createConnection({
    host: "localhost",
    user: "biblioteca",
    password:"password",
    database: "bibliotecameiquer"
})

// Alumnos solo pueden acceder a videos y libros
app.get("/Alumno", (req, res)=>{
    const q = "SELECT * FROM contenido WHERE tipo=1 OR tipo=2;"
    db.query(q,(err,data)=>{
        if(err) return res.json(err)
        return res.json(data)
    })
})

// Acompanantes solo pueden acceder a videos, libros y actividades
app.get("/Acompanante", (req, res)=>{
    const q = "SELECT * FROM contenido WHERE tipo=1 OR tipo=2 OR tipo=3;"
    db.query(q,(err,data)=>{
        if(err) return res.json(err)
        return res.json(data)
    })
})

// Maestros pueden acceder a todo el contenido disponible
app.get("/Maestro", (req, res)=>{
    const q = "SELECT * FROM contenido;"
    db.query(q,(err,data)=>{
        if(err) return res.json(err)
        return res.json(data)
    })
})

//Obtiene todos los videos y sus detalles 
app.get("/Videos", (req, res)=>{
    const q = "SELECT contenido.ID_Contenido, Nombre AS nomCont, URL, Duracion, Canal FROM contenido INNER JOIN videos WHERE contenido.Tipo =1 AND contenido.ID_Contenido = videos.ID_Contenido"
    db.query(q,(err,data)=>{
        if(err) return res.json(err)
        return res.json(data)
    })
})

//Obtiene todos los videos por filtro de 1 etiqueta 
app.get("/Videos/:nombre", (req, res)=>{
    const nombre = req.params.nombre
    const q = "SELECT contenido.ID_Contenido, contenido.Nombre AS nomCont, URL, Duracion, Canal, etiquetas.Nombre FROM contenido INNER JOIN videos USING(ID_contenido) INNER JOIN contenido_etiqueta USING(ID_contenido) INNER JOIN etiquetas USING(ID_Etiqueta) WHERE contenido.ID_Contenido = videos.ID_Contenido AND etiquetas.Nombre= ?;"
    db.query(q,[nombre],(err,data)=>{
        if(err) return res.json(err)
        return res.json(data)
    })
})

//Obtiene todos los libros y sus detalles 
app.get("/Libros", (req, res)=>{
    const q = "SELECT contenido.ID_Contenido, Nombre AS nomCont, URL, Paginas FROM contenido INNER JOIN libros WHERE contenido.Tipo =2 AND contenido.ID_Contenido = libros.ID_Contenido"
    db.query(q,(err,data)=>{
        if(err) return res.json(err)
        return res.json(data)
    })
})

//Obtiene todos los libros por filtro de 1 etiqueta 
app.get("/Libros/:nombre", (req, res)=>{
    const nombre = req.params.nombre
    const q = "SELECT contenido.ID_Contenido, contenido.Nombre AS nomCont, etiquetas.Nombre, Paginas FROM contenido INNER JOIN libros USING(ID_contenido) INNER JOIN contenido_etiqueta USING(ID_contenido) INNER JOIN etiquetas USING(ID_Etiqueta) WHERE contenido.ID_Contenido = libros.ID_Contenido AND etiquetas.Nombre= ?;"
    db.query(q,[nombre],(err,data)=>{
        if(err) return res.json(err)
        return res.json(data)
    })
})

// Se define stored procedure en BD_BibliotecaMeiquer.sql
// En lista solo se hace fetch de la tabla contenido
// Cuando se da click en mas detalles, entonces se hace fetch de la tabla respectiva del tipo de contenido
// Ejemplo Fila en contenido con columna "Tipo" 1 (Video) cuando le doy click a mas detalles hace fetch de la tabla "Videos" 
app.get("/Alumno/:idparam", (req, res)=>{
    const q = "CALL sp_Details(${req.params.idparam});"
    db.query(q,(err,data)=>{
        if(err) return res.json(err)
        return res.json(data)
    })
})

app.get("/Acompanante/:idparam", (req, res)=>{
    const q = "CALL sp_Details(${req.params.idparam});"
    db.query(q,(err,data)=>{
        if(err) return res.json(err)
        return res.json(data)
    })
})

app.get("/Maestro/:idparam", (req, res)=>{
    const q = "CALL sp_Details(${req.params.idparam});"
    db.query(q,(err,data)=>{
        if(err) return res.json(err)
        return res.json(data)
    })
})

app.listen(8800, ()=>{
    console.log("connected to back")
})
