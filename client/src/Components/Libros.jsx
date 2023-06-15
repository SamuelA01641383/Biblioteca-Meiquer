import React from 'react'
import { useEffect } from 'react'
import { useState } from 'react'
import axios from 'axios'
import { Link } from "react-router-dom";
import libros from '../imagenes/libros.png'

const PORT = process.env.PORT || 3001;

const Libros = () => {
    const [contenido, setContenido] = useState([])

    useEffect(()=>{
        const fetchAlumno = async ()=>{
            try{
                //http://localhost:8800/juegos
                const res = await axios.get("http://localhost:8800/Libros")
                setContenido(res.data);
            }catch(err){
                console.log(err)
            }
        }
        fetchAlumno()
    },[])

   

    console.log(contenido)   

    return (
        <div className='left'>
            <div className='contenedorDeContenedores'>
            {
            contenido.map(libro=>(
            
                <div className="contenido" key={libro.ID_Contenido}>
                    <div className='contenedor'> 
                    <Link to="/" style={{ textDecoration: 'none' }}>
            <div className="card" style={{width: "18rem"}}>
                <img src="..." class="card-img-top" alt="..."/>
            <div className="card-body">
                <h5 className="card-title"><h2>{libro.Nombre}</h2></h5>
                <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>
            </div>
                        </Link>
            </div>
            </div>
            
            ))}
        </div>
          
    </div>

            
        
    )
}

export default Libros