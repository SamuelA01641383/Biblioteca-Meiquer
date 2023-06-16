import { Routes,Route, BrowserRouter } from "react-router-dom"
import Acompañante from "../Pages/Acompañante"
import Main from "../Components/Main"
import Alumno from "../Pages/Alumno"
import Educador from "../Pages/Educador"
import InformacionVideo from "../Components/InformacionVideo"

const Rutas = () => {
  return (
    <BrowserRouter>
    <Routes>
        <Route path='/' element = {<Main/>} />
        <Route path='/Acompañante' element = {<Acompañante/>} />
        <Route path='/Alumno' element = {<Alumno/>} />
        <Route path='/Educador' element = {<Educador/>} />
        <Route path='/InformacionVideo' element = {<InformacionVideo/>} />
    </Routes>
    </BrowserRouter>
  )
}

export default Rutas




