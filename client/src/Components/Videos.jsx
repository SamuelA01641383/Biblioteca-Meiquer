import React, { useContext } from 'react'
import { useEffect } from 'react'
import { useState } from 'react'
import axios from 'axios'
import { Link } from "react-router-dom";
//import videos from '../imagenes/videos.png'
import {context} from "./Dashboard"

const PORT = process.env.PORT || 3001;

const Videos = () => {
    const [contenido, setContenido] = useState([])
    const etiqueta = useContext(context);

    useEffect(()=>{
        const fetchVideos = async ()=>{
            try{
                if(etiqueta == ""){
                    const res = await axios.get("http://localhost:8800/Videos")
                    setContenido(res.data);
                }else{
                    const res = await axios.get("http://localhost:8800/Videos/"+etiqueta)
                    setContenido(res.data);
                }
            }catch(err){
                console.log(err)
            }
        }
        fetchVideos()
    },[etiqueta])

   

    console.log(contenido)   

    return (
        <div className='left'>
            <div className='contenedorDeContenedores'>
            <p>"Recibido;" {etiqueta}</p>
            {
            contenido.map(video=>(
            
                <div className="contenido" key={video.ID_Contenido}>
                    <div className='contenedor'> 
                    <Link to="/" style={{ textDecoration: 'none' }}>
            <div className="card" style={{width: "18rem"}}>
            
            <iframe
                src="https://www.youtube.com/embed/mCdA4bJAGGk" >
            </iframe> 
                
            <div className="card-body">
                <h5 className="card-title"><h2>{video.nomCont}</h2></h5>
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

export default Videos