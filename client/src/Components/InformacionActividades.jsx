import '../Styles/Informacion.css'
import NavBar from './NavBar'
import { useNavigate } from 'react-router-dom';

const InformacionActividades = () => {
    const navigate = useNavigate();

    const handleGoBack = () => {
        navigate(-1);
    };
    return (
        <div className='bg'>
            <NavBar>

            </NavBar>
            <div className='bg2'>
            
            <div className='left'></div>
            <h1>Titulo del libro: </h1>
            <h2>Descripcion del libro</h2>
            <h2>paginas: </h2>
            <a href='https://hola.com'>Descargar Libros</a>
            </div>
            <button onClick={handleGoBack}>Atrás</button>
        </div>

    )




}

export default InformacionActividades