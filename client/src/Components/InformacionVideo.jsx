import '../Styles/Informacion.css'
import Alumno from '../imagenes/alumnos.png'

const InformacionVideo = () => {

    return (
        <div className='bg2'>
            
            <div className='bg'>
            <iframe width="560" height="315" src="https://www.youtube.com/embed/3XKk-xBpB0U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                
                <h1>Titulo</h1>
                <h1>Duracion: </h1>
                <a href={Alumno} download="acompa.jpeg">Descargar archivo</a>
            </div>
            
        </div>


    )

}


export default InformacionVideo