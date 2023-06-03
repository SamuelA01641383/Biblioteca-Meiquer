import './App.css';
import './buttons.css'
import alumno from './imagenes/Alumno.jpeg'
import acompa from './imagenes/acompa.jpeg'
import educador from './imagenes/Educador.jpeg'


function App() {
  return (
    <div className="button-container">
      <h1 className="header-text">¿Quién eres?</h1>
      <div className="button-wrapper">
        <button className="button">
          <img src={alumno} alt="Botón 1" />
        </button>
        <button className="button">
          <img src={acompa} alt="Botón 2" />
        </button>
        <button className="button">
          <img src={educador} alt="Botón 3" />
        </button>
      </div>
    </div>
  );
}

export default App;
