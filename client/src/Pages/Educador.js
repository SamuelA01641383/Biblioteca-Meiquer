import Dashboard from "../Components/Dashboard";
import LeftComponent from "../Components/LeftComponent"
import RightComponent from "../Components/RightComponent";
import '../Styles/PageStyle.css'
import NavBar from "../Components/NavBar";
import DashboardAcompanante from "../Components/DashboardAcompanante";
import DashboardEducador from "../Components/DashboardEducador";

function Acompañante(){

    return(
        <div className = 'bg'>
                <NavBar></NavBar>
                <DashboardEducador></DashboardEducador>
                
                
                
        </div>
    )


}

export default Acompañante;