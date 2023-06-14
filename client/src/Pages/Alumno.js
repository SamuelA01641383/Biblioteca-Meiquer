import Dashboard from "../Components/Dashboard";
import LeftComponent from "../Components/LeftComponent"
import RightComponent from "../Components/RightComponent";
import '../Styles/PageStyle.css'
import Videos from "../Components/Videos";
function Alumno(){

    return(
        <div className = 'bg'>
            
                <Dashboard></Dashboard>
                <Videos></Videos>        
                
        </div>
    )


}

export default Alumno;