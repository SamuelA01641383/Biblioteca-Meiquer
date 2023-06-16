import '../Styles/PageStyle.css'
import Videos from './Videos'
import Libros from './Libros'
import Actividades from './Actividades';
import { useState } from 'react';
import { Component } from 'react';
import { createContext} from 'react';
import {context} from "./Dashboard";

const DashboardAcompanante= () => {
    const [cargar, setCargar] = useState(1)
    const [etiqueta, setEtiqueta] = useState("")

    const cambiarTipo = async (tipo)=>{
      setEtiqueta("")
      setCargar(tipo)
  }
    
    return(
        <div>
    <div className='navbar2'>
        <h1 className='btt'>Selecciona el contenido: </h1>
        <button className='btt' onClick={()=>cambiarTipo(3)}>Actividades</button>
        <button className='btt' onClick={()=>cambiarTipo(2)}>Libros</button>
        <button className='btt' onClick={()=>cambiarTipo(1)}>Videos</button>
    </div>
    <div className='navbar'>
        <div>
            <button className='btt' onClick={()=>setEtiqueta("Ciencia")}>Ciencia</button>
            <button className='btt' onClick={()=>setEtiqueta("Matematicas")}>Matematicas</button>
            <button className='btt' onClick={()=>setEtiqueta("Tecnologia")}>Tecnología</button>
            <button className='btt' onClick={()=>setEtiqueta("Ingenieria")}>Ingeniería</button>
            <button className='btt' onClick={()=>setEtiqueta("Pintura")}>Pintura</button>
            <button className='btt' onClick={()=>setEtiqueta("Musica")}>Musica</button>
            <button className='btt' onClick={()=>setEtiqueta("Arte")}>Arte</button>
            </div>
    </div>
    <div>
    {(() => {
        switch (cargar) {
          case 1:  return <context.Provider value={etiqueta}>
                            <Videos></Videos>
                          </context.Provider>

          case 2:  return <context.Provider value={etiqueta}>
                            <Libros></Libros>
                           </context.Provider>

          case 3:  return <context.Provider value={etiqueta}>
                            <Actividades></Actividades>
                          </context.Provider>

          case 4:  return "Not yet";
          
          default: return "Not Found";
        }
      })()}
    </div>
    </div>
    )

}

export default DashboardAcompanante