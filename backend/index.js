import express from "express"

const app = express()

// Cambiar username y contrasena en deploy
const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password:"password",
    database: "BibliotecaMeiquer"
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
    const q = "SELECT nombre FROM contenido WHERE tipo=1 OR tipo=2 OR tipo=3;"
    db.query(q,(err,data)=>{
        if(err) return res.json(err)
        return res.json(data)
    })
})

app.listen(8800, ()=>{
    console.log("connected to back")
})