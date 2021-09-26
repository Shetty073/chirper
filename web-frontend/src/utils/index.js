
const isPasswordValid = (password) => {
	let pattern=  /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;

	if(password.match(pattern)) {
		return true;
	} else {
		return false;
	}
}

export {
	isPasswordValid
}
