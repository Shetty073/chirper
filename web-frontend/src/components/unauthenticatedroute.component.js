import {useAuth} from "../contexts/authcontext";
import {Redirect, Route} from "react-router-dom";

const UnAuthenticatedRoute = ({component: Component, ...rest}) => {
	const {currentUser} = useAuth();

	return (
		<Route
			{...rest}
			render={props => {
				return !currentUser ? <Component {...props} /> : <Redirect to="/"/>
			}}
		/>
	);
}

export default UnAuthenticatedRoute;
