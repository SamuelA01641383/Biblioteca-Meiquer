import '../Styles/PageStyle.css'
import libros from '../imagenes/libros.png'

const LeftComponent= () => {

    return(

    <div className='left'>
           <div className='contenedor'>
                <div className='contenedorimg'>
                    <img src={libros}></img>
                </div>
                <div className='contenedortexto'>
                    <h1>Titulo del contenido </h1>
                    <h2>Descripción</h2>
                </div>
           </div>
           <div className='contenedor'>
           <div className='contenedorimg'>
                    <img src={libros}></img>
                </div>
                <div className='contenedortexto'>
                    <h1>Titulo del contenido </h1>
                    <h2>Descripción</h2>
                </div>
           </div>
           <div className='contenedor'>

           </div>
    </div>

    )

}

export default LeftComponent