import '../Styles/Informacion.css'
import Alumno from '../imagenes/alumnos.png'
import { useLocation } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';
import { useState } from 'react';
import { useEffect } from 'react';
import axios from 'axios';

const InformacionVideo = () => {
    const navigate = useNavigate()
    const location = useLocation()
    const [contenido, setContenido] = useState([])

    const idVideo = location.pathname.split("/")[2]
    console.log(idVideo)

    useEffect(()=>{
        const fetchVideo = async ()=>{
            try{
                const res = await axios.get("http://localhost:8800/Video/"+idVideo)
                setContenido(res.data);
            }catch(err){
                console.log(err)
            }
        }
        fetchVideo()
    },[])

    console.log(contenido)
    return (
        <div className='bg2'>
            
            <div className='bg'>
            <iframe width="560" height="315" src="https://www.youtube.com/embed/3XKk-xBpB0U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                {
                    contenido.map(v=>(
                    <div>
                        <h1>Nombre: {v.Nombre}</h1>
                        <h1>Duracion: {v.Duracion} </h1>
                        <h2>Esto es la descripcion bababababababbabbababab   </h2>
                    </div>
                    ))
                }
               
            </div>
            
        </div>


    )

}


export default InformacionVideo