import '../Styles/PageStyle.css'
import Videos from './Videos'

const Dashboard= () => {

    return(
        <div>
    <div className='navbar2'>
        <h1 className='btt'>Selecciona el contenido: </h1>
        <button className='btt'>Libros</button>
        <button className='btt'>Videos</button>
    </div>
    <div className='navbar'>
        <div>
            <button>Ciencia</button>
            <button>Matematicas</button>
            <button>Tecnología</button>
            <button>Ingeniería</button>
            <button>Pintura</button>
            <button>Musica</button>
            <button>Arte</button>
            </div>
    </div>
    <Videos></Videos> 
    </div>
    )

}

export default Dashboard