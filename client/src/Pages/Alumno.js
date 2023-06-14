import Dashboard from "../Components/Dashboard";
import LeftComponent from "../Components/LeftComponent"
import RightComponent from "../Components/RightComponent";
import Videos from "../Components/Videos";
import '../Styles/PageStyle.css'

function Alumno(){

    return(
        <div className = 'bg'>
            
                <Dashboard></Dashboard>
                <LeftComponent></LeftComponent>
                <RightComponent></RightComponent>
                <Videos></Videos>
                


                
        </div>
    )


}

export default Alumno;