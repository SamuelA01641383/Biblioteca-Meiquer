import React from 'react'
import { Link } from "react-router-dom";
import logo from "../imagenes/estacion_meiquer_logo.png"

const NavBar = () => {
  return (
    <div>
        <nav className="navbar navbar-expand-lg bg-body-tertiary">
            <div className="container-fluid">
                <Link to='/'>
                    <img src={logo} alt='' width='10px' height="10px"/>
                </Link>
                <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span className="navbar-toggler-icon"></span>
                </button>
            <div className="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div className="navbar-nav">
                <Link className="nav-link active" aria-current="page" to="/">Inicio</Link>
                <Link className="nav-link" to="/Alumno">Estudiantes</Link>
                <Link className="nav-link" to="/Acompañante">Acompañante</Link>
                <Link className="nav-link" to="/Educador">Educadores</Link>
            </div>
            </div>
            </div>
        </nav>
    </div>
  )
}

export default NavBar