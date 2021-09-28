import React, {useContext, useEffect, useState} from 'react';
import {backendURIs} from "../utils";
import {default as axios} from "axios";

const AuthContext = React.createContext();

export const useAuth = () => {
	return useContext(AuthContext);
}

export const AuthProvider = ({children}) => {
	const [currentUser, setCurrentUser] = useState();
	const [authToken, setAuthToken] = useState();
	const [loading, setLoading] = useState(true);

	// register new user
	const register = (name, email, dob, password) => {
		// send register request
		return axios.post(
			backendURIs.register,
			{
				name,
				email,
				dob,
				password
			}
		).then((response) => {
			if (response.status === 200) {
				setCurrentUser(response.data.user);
				setAuthToken(response.headers.authorization);

				localStorage.setItem('user', JSON.stringify(response.data.user));
				localStorage.setItem('authorization', response.headers.authorization);

				return [true, ''];
			} else {
				return [false, response.data.message];
			}
		}).catch((error) => {
			if (error.response) {
				return [false, error.response.data.message];
			} else {
				return [false, 'Could not connect to the server. Please try again later.'];
			}
		});
	}

	const login = (email, password) => {
		// send login request
		return axios.post(
			backendURIs.login,
			{
				email,
				password
			}
		).then((response) => {
			if (response.status === 200) {
				setCurrentUser(response.data.user);
				setAuthToken(response.headers.authorization);

				localStorage.setItem('user', JSON.stringify(response.data.user));
				localStorage.setItem('authorization', response.headers.authorization);

				return [true, ''];
			} else {
				return [false, response.data.message];
			}
		}).catch((error) => {
			if (error.response) {
				return [false, error.response.data.message];
			} else {
				return [false, 'Could not connect to the server. Please try again later.'];
			}
		});
	}

	const logout = () => {
		// log the user out
		setCurrentUser('');
		setAuthToken('');
		localStorage.clear();
	}

	const loadData = () => {
		let user = JSON.parse(localStorage.getItem('user'));
		let authorization = localStorage.getItem('authorization');

		setCurrentUser(user);
		setAuthToken(authorization);
		setLoading(false);
	}

	useEffect(() => {
		return loadData();
	}, []);

	const value = {
		currentUser,
		authToken,
		register,
		login,
		logout,
	};

	return (
		<AuthContext.Provider value={value}>
			{!loading && children}
		</AuthContext.Provider>
	);

}
