import express from "express"

const app = express()

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password:"password",
    database: "BibliotecaMeiquer"
})

app.listen(8800, ()=>{
    console.log("connected to back")
})