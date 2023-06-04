import './buttons.css'
import alumno from './imagenes/alumnos.png'
import acompa from './imagenes/Acompañante.png'
import educador from './imagenes/educador.png'
import logo from './imagenes/titulo2.png'

function App() {
  return (
   <div>
    <div className='title'>
      <img src={logo} className='logo'></img>
      <div className='center'> 
        <h1>¿Quien eres?</h1>
      </div>
    </div>
    <div className='middle'>
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
            <a href="/Acompañante.js">
              <img src={acompa} alt="Botón 2" />
            </a>
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
    


    
  );
}

export default App;
