import '../Styles/PageStyle.css'
import Videos from './Videos'
import Libros from './Libros'
import { useState } from 'react';
import { Component } from 'react';
import { createContext} from 'react';

export const context = createContext();

const DashboardEducador= () => {
    const [cargar, setCargar] = useState(1)
    const [etiqueta, setEtiqueta] = useState("")

    return(
        <div>
    <div className='navbar2'>
        <h1 className='btt'>Selecciona el contenido: </h1>
        <button className='btt' onClick={()=>setCargar(2)}>Referencias</button>
        <button className='btt' onClick={()=>setCargar(2)}>Actividades</button>
        <button className='btt' onClick={()=>setCargar(2)}>Libros</button>
        <button className='btt' onClick={()=>setCargar(1)}>Videos</button>
    </div>
    <div className='navbar'>
        <div>
            <button onClick={()=>setEtiqueta("Ciencia")}>Ciencia</button>
            <button onClick={()=>setEtiqueta("Matematicas")}>Matematicas</button>
            <button onClick={()=>setEtiqueta("Tecnologia")}>Tecnología</button>
            <button onClick={()=>setEtiqueta("Ingenieria")}>Ingeniería</button>
            <button onClick={()=>setEtiqueta("Pintura")}>Pintura</button>
            <button onClick={()=>setEtiqueta("Musica")}>Musica</button>
            <button onClick={()=>setEtiqueta("Arte")}>Arte</button>
            </div>
    </div>
    <div>
    {(() => {
        switch (cargar) {
          case 1:  return <context.Provider value={etiqueta}>
                            <Videos></Videos>
                          </context.Provider>

          case 2:  return <Libros></Libros>
          case 3:  return "Not yet";
          case 4:  return "Not yet";
          default: return "Not Found";
        }
      })()}
    </div>
    </div>
    )

}

export default DashboardEducador