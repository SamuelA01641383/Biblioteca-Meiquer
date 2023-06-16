import '../Styles/Informacion.css'
import Alumno from '../imagenes/alumnos.png'
import NavBar from './NavBar'
import { useNavigate } from 'react-router-dom';

const InformacionVideo = () => {
    const navigate = useNavigate();

    const handleGoBack = () => {
        navigate(-1);
    };
    return (
        <div className='bg2'>
        <NavBar></NavBar>
        
            
            <div className='bg'>
                <div className='izquierda'>
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/3XKk-xBpB0U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                </div>
                <div className='derecho'>
                    <h1>Titulo</h1>
                    <h1>Duracion: </h1>
                    <a href={Alumno} download="acompa.jpeg">Descargar archivo</a>
                </div>
                
            </div>
            
            <button className="bt_atras" onClick={handleGoBack}>Atrás</button>

        </div>
    )

}


export default InformacionVideo