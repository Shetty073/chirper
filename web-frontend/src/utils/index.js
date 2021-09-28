const isPasswordValid = (password) => {
	let pattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;

	if (password.match(pattern)) {
		return true;
	} else {
		return false;
	}
}

let baseURI = 'http://192.168.1.100:3001';
let authURI = `${baseURI}/api/auth`;
let userURI = `${baseURI}/api/user`;
let chripURI = `${baseURI}/api/chirp`;

const backendURIs = {
	register: `${authURI}/register`,
	login: `${authURI}/login`,
};

export {
	isPasswordValid,
	backendURIs,
}
