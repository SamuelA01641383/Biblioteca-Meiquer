import '../Styles/Informacion.css'
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
            <div className='left'></div>
            {
                    contenido.map(v=>(
                    <div className='derecho'>
                        <h1>Nombre: {v.Nombre}</h1>
                        <h1>Paginas: {v.Paginas} </h1>
                        <h2>Esto es la descripcion bababababababbabbababab   </h2>
                    </div>
                    ))
                }
            <a href='https://hola.com'>Descargar Libros</a>
            </div>
            <button className="bt_atras" onClick={handleGoBack}>Atrás</button>
        </div>

    )




}

export default InformacionLibros