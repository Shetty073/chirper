import {BrowserRouter as Router, Route, Switch, withRouter} from "react-router-dom";
import './App.css';
import Home from "./pages/home/home";
import Login from "./pages/login/login";
import Register from "./pages/register/register";
import Messages from "./pages/messages/messages";
import Settings from "./pages/settings/settings";
import Trending from "./pages/trending/trending";
import UnknownRoute from "./pages/unknown/unknown";
import ProtectedRoute from "./components/protectedroute.component";
import UnAuthenticatedRoute from "./components/unauthenticatedroute.component";

function App() {
	return (
		<Router>
			<Switch>
				<ProtectedRoute exact path="/" component={withRouter(Home)}/>

				<UnAuthenticatedRoute path="/login" component={withRouter(Login)}/>

				<UnAuthenticatedRoute path="/register" component={withRouter(Register)}/>

				<ProtectedRoute path="/trending" component={withRouter(Trending)}/>

				<ProtectedRoute path="/messages" component={withRouter(Messages)}/>

				<ProtectedRoute path="/settings" component={withRouter(Settings)}/>

				<Route path="*" component={withRouter(UnknownRoute)}/>

			</Switch>
		</Router>
	);
}

export default App;
