import React from 'react'
import { useEffect } from 'react'
import { useState } from 'react'
import axios from 'axios'
import { Link } from "react-router-dom";
import libros from '../imagenes/libros.png'
import {context} from "./Dashboard"
import { useContext } from 'react';
import '../Styles/PageStyle.css'
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
                    <Link to={`/InformacionLibros/${libro.ID_Contenido}`} style={{ textDecoration: 'none' }}>
            <div className="card" style={{width: "18rem"}}>
                <div className='centrar'>
                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-books" width="100" height="100" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
  <path d="M5 4m0 1a1 1 0 0 1 1 -1h2a1 1 0 0 1 1 1v14a1 1 0 0 1 -1 1h-2a1 1 0 0 1 -1 -1z" />
  <path d="M9 4m0 1a1 1 0 0 1 1 -1h2a1 1 0 0 1 1 1v14a1 1 0 0 1 -1 1h-2a1 1 0 0 1 -1 -1z" />
  <path d="M5 8h4" />
  <path d="M9 16h4" />
  <path d="M13.803 4.56l2.184 -.53c.562 -.135 1.133 .19 1.282 .732l3.695 13.418a1.02 1.02 0 0 1 -.634 1.219l-.133 .041l-2.184 .53c-.562 .135 -1.133 -.19 -1.282 -.732l-3.695 -13.418a1.02 1.02 0 0 1 .634 -1.219l.133 -.041z" />
  <path d="M14 9l4 -1" />
  <path d="M16 16l3.923 -.98" />
</svg>      </div>
                { /*<img src={libros} className="card-img-top" alt="..."/>*/}
            <div className="card-body">
                <h5 className="titulo">{libro.nomCont}</h5>
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