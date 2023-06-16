import style from '../Styles/Dashboard.module.css'
import Videos from './Videos'
import Libros from './Libros'
import { useState } from 'react';
import { Component } from 'react';
import { createContext} from 'react';

export const context = createContext();

const Dashboard= () => {
    const [cargar, setCargar] = useState(1)
    const [etiqueta, setEtiqueta] = useState("")

    const cambiarTipo = async (tipo)=>{
        setEtiqueta("")
        setCargar(tipo)
    }
    
    return(
        <div>
    <div className={style.navbar2}>
        <h1 className={style.selecciona}>Selecciona el contenido: </h1>
        <button className={style.btt} onClick={()=>cambiarTipo(2)}>Libros</button>
        <button className={style.btt} onClick={()=>cambiarTipo(1)}>Videos</button>
    </div>
    <div className={style.navbar}>
        <div>
            <button className={style.btt} onClick={()=>setEtiqueta("Ciencia")}>Ciencia</button>
            <button className={style.btt} onClick={()=>setEtiqueta("Matematicas")}>Matematicas</button>
            <button className={style.btt} onClick={()=>setEtiqueta("Tecnologia")}>Tecnología</button>
            <button className={style.btt} onClick={()=>setEtiqueta("Ingenieria")}>Ingeniería</button>
            <button className={style.btt} onClick={()=>setEtiqueta("Pintura")}>Pintura</button>
            <button className={style.btt} onClick={()=>setEtiqueta("Musica")}>Musica</button>
            <button className={style.btt} onClick={()=>setEtiqueta("Arte")}>Arte</button>
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

          case 3:  return "Not yet";
          case 4:  return "Not yet";
          default: return "Not Found";
        }
      })()}
    </div>
    </div>
    )

}

export default Dashboard