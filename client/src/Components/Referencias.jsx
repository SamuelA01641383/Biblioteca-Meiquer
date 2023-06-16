import React from 'react'
import { useEffect } from 'react'
import { useState } from 'react'
import axios from 'axios'
import { Link } from "react-router-dom";
//import Referencias from '../imagenes/Referencias.png'
import {context} from "./Dashboard"
import { useContext } from 'react';

const PORT = process.env.PORT || 3001;

const Referencias = () => {
    const [contenido, setContenido] = useState([])
    const etiqueta = useContext(context);

    useEffect(()=>{
        const fetchActividades = async ()=>{
            try{
                if(etiqueta == ""){
                    const res = await axios.get("http://localhost:8800/Referencias")
                    setContenido(res.data);
                }else{
                    const res = await axios.get("http://localhost:8800/Referencias/"+etiqueta)
                    setContenido(res.data);
                }
               
            }catch(err){
                console.log(err)
            }
        }
        fetchActividades()
    },[etiqueta])

    console.log(contenido)   

    return (
        <div className='left'>
            <div className='contenedorDeContenedores'>
            <p>"Recibido Referencias;" {etiqueta}</p>
            {
            contenido.map(Referencia=>(
            
                <div className="contenido" key={Referencia.ID_Contenido}>
                    <div className='contenedor'> 
                    <Link to="/" style={{ textDecoration: 'none' }}>
            <div className="card" style={{width: "18rem"}}>
                <img src="" className="card-img-top" alt="..."/>
            <div className="card-body">
                <h5 className="card-title"><h2>{Referencia.nomCont}</h2></h5>
                <p className="card-text">{Referencia.NombreArticulo}</p>
                <p className="card-text">{Referencia.NombrePagina}</p>
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

export default Referencias