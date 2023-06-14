import React from 'react'
import { useEffect } from 'react'
import { useState } from 'react'
import axios from 'axios'
import { Link } from "react-router-dom";

const PORT = process.env.PORT || 3001;

const Videos = () => {
    const [contenido, setContenido] = useState([])

    useEffect(()=>{
        const fetchAlumno = async ()=>{
            try{
                //http://localhost:8800/juegos
                const res = await axios.get("http://localhost:8800/Alumno")
                setContenido(res.data);
            }catch(err){
                console.log(err)
            }
        }
        fetchAlumno()
    },[])

    
    console.log(contenido)   

    return (
        <div className='bg2'>
        <div className='bg'>
        <div className='header'>
            <h1>Libros</h1>
        </div>
        
        <div className='libros'>
            {
            contenido.map(libro=>(
                <div className="contenido" key={libro.ID_Contenido}>
                    <div className='contenedor'>
                    <div>   
                    
                    </div>
                    <div className='texto'>
                    <h2>{libro.Nombre}</h2>
                    <h3>{libro.URL}</h3>
                    </div>
                    
                    </div>
                </div>
                
            ))}
        </div>
        
        </div>
        </div>
    )
}

export default Videos