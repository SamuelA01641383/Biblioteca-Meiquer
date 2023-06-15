import Dashboard from "../Components/Dashboard";
import LeftComponent from "../Components/LeftComponent"
import RightComponent from "../Components/RightComponent";
import '../Styles/PageStyle.css'
import Videos from "../Components/Videos";
import NavBar from "../Components/NavBar";
function Alumno(){

    return(
        <div className = 'bg'>
                <NavBar></NavBar>
                <Dashboard></Dashboard>       
                
        </div>
    )


}

export default Alumno;