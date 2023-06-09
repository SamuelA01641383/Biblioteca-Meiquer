import '../Styles/buttons.css'
import alumno from '../imagenes/alumnos.png'
import acompa from '../imagenes/Acompañante.png'
import educador from '../imagenes/educador.png'
import logo from '../imagenes/titulo2.png'
import { Link } from "react-router-dom";


const Main= () => {
    return (

        <div>
    <div className='title'>
      <img src={logo} className='logo'></img>
      
    </div>
    
    <div className='middle'>
    <div className='center'> 
        <h1>¿Quien eres?</h1>
      </div>
      <div className='button-zone'>
        <div className='box'>
          <div className='centertextcircle'>
            <h2>Alumno</h2>
            </div>
            <div className='centertext'>
            <a href="/Alumno">
              <img src={alumno} alt="Botón 2" />
            </a>
            </div>
        </div>
        <div className='box'>
          <div className='centertextcircle'>
            <h2>Acompañante</h2>
            </div>
            <div className='centertext'>
            <Link to ="/Acompañante">
              <img src={acompa} alt="Botón 2" />
              </Link>
            </div>
        </div>
        <div className='box'>
          <div className='centertextcircle'>
            <h2>Educador</h2>
          </div>
          <div className='centertext'>
          <a href="/Educador">
              <img src={educador} alt="Botón 2" />
            </a>
          </div>
          

        </div>
      </div>
    </div>
   </div>
    


    )
}

export default Main;