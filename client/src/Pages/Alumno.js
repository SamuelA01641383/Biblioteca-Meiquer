import Dashboard from "../Components/Dashboard";
import LeftComponent from "../Components/LeftComponent"
import RightComponent from "../Components/RightComponent";
import '../Styles/PageStyle.css'

function Alumno(){

    return(
        <div className = 'bg'>
            
                <Dashboard></Dashboard>
                <LeftComponent></LeftComponent>
                <RightComponent></RightComponent>
                
        </div>
    )


}

export default Alumno;