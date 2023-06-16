import '../Styles/InformacionVideo.css'
import NavBar from './NavBar'
import { useNavigate } from 'react-router-dom';
import { useState } from 'react';
import { useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import axios from 'axios';


const InformacionLibros = () => {
    const navigate = useNavigate();
    const location = useLocation()
    const [contenido, setContenido] = useState([])
    
    const idLibro = location.pathname.split("/")[2]

    useEffect(()=>{
        const fetchLibro = async ()=>{
            try{
                const res = await axios.get("http://localhost:8800/Libro/"+idLibro)
                setContenido(res.data);
            }catch(err){
                console.log(err)
            }
        }
        fetchLibro()
    },[])

    console.log(contenido)

    const handleGoBack = () => {
        navigate(-1);
    };
    return (

        <div className='bg'>
            <NavBar></NavBar>
            <div className='bg2'>
            {
                    contenido.map(v=>(
                    <div className='derecho'>
                        <h1>{v.Nombre}</h1>
                        <h1>{v.Paginas} Paginas</h1>
                        <h2>{v.Descripcion}</h2>
                        <img src ={v.Imagen}></img>
                        <div className='left'>
            <a href={v.URL}>Descargar Libros</a>
            </div>
                    </div>
                    ))
            }
            
           
            </div>
            <button className="bt_atras" onClick={handleGoBack}>Atrás</button>
        </div>

    )




}

export default InformacionLibros