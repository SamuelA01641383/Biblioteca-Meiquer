import React from 'react'
import { useEffect } from 'react'
import { useState } from 'react'
import axios from 'axios'
import { Link } from "react-router-dom";
import libros from '../imagenes/libros.png'
import {context} from "./Dashboard"
import { useContext } from 'react';

const PORT = process.env.PORT || 3001;

const Libros = () => {
    const [contenido, setContenido] = useState([])
    const etiqueta = useContext(context);

    useEffect(()=>{
        const fetchLibros = async ()=>{
            try{
                if(etiqueta == ""){
                    const res = await axios.get("http://localhost:8800/Libros")
                    setContenido(res.data);
                }else{
                    const res = await axios.get("http://localhost:8800/Libros/"+etiqueta)
                    setContenido(res.data);
                }
               
            }catch(err){
                console.log(err)
            }
        }
        fetchLibros()
    },[etiqueta])

    console.log(contenido)   

    return (
        <div className='left'>
            <div className='contenedorDeContenedores'>
            <p>"Recibido libros;" {etiqueta}</p>
            {
            contenido.map(libro=>(
            
                <div className="contenido" key={libro.ID_Contenido}>
                    <div className='contenedor'> 
                    <Link to="/" style={{ textDecoration: 'none' }}>
            <div className="card" style={{width: "18rem"}}>
                <img src={libros} className="card-img-top" alt="..."/>
            <div className="card-body">
                <h5 className="card-title"><h2>{libro.nomCont}</h2></h5>
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