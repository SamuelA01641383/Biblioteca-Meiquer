import Dashboard from "../Components/Dashboard";
import LeftComponent from "../Components/LeftComponent"
import RightComponent from "../Components/RightComponent";
import '../Styles/PageStyle.css'

function Acompañante(){

    return(
        <div className = 'bg'>
            
                <Dashboard></Dashboard>
                <LeftComponent></LeftComponent>
                
                
        </div>
    )


}

export default Acompañante;