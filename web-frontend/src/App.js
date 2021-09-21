import {BrowserRouter as Router, Route, Switch, withRouter} from "react-router-dom";
import './App.css';
import Home from "./pages/home/home";
import Login from "./pages/login/login";
import Register from "./pages/register/register";
import Messages from "./pages/messages/messages";
import Settings from "./pages/settings/settings";
import Trending from "./pages/trending/trending";

function App() {
	return (
		<Router>
			<Switch>
				<Route exact path="/" component={withRouter(Home)}/>

				<Route path="/login" component={withRouter(Login)}/>

				<Route path="/register" component={withRouter(Register)}/>

				<Route path="/trending" component={withRouter(Trending)}/>

				<Route path="/messages" component={withRouter(Messages)}/>

				<Route path="/settings" component={withRouter(Settings)}/>

			</Switch>
		</Router>
	);
}

export default App;
