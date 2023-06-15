import Dashboard from "../Components/Dashboard";
import LeftComponent from "../Components/LeftComponent"
import RightComponent from "../Components/RightComponent";
import '../Styles/PageStyle.css'
import NavBar from "../Components/NavBar";

function Acompañante(){

    return(
        <div className = 'bg'>
                <NavBar></NavBar>
                <Dashboard></Dashboard>
                <LeftComponent></LeftComponent>
                
                
        </div>
    )


}

export default Acompañante;