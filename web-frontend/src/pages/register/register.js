import {Alert, Button, Card, Container, Form} from "react-bootstrap";
import {cardStyle, containerStyle} from "./register.styles";
import {Link} from "react-router-dom";
import {useEffect, useState} from "react";
import {isPasswordValid} from "../../utils";

const Register = () => {
	const [name, setName] = useState('');
	const [email, setEmail] = useState('');
	const [dob, setDob] = useState('');
	const [password, setPassword] = useState('');
	const [confirmPassword, setConfirmPassword] = useState('');
	const [error, setError] = useState(false);
	const [errorMessage, setErrorMessage] = useState('');

	useEffect(() => {
		setError(false);
		setErrorMessage('');
	}, []);

	const handleSubmit = (e) => {
		e.preventDefault();
		if (password === confirmPassword) {
			if(isPasswordValid(password)) {
				// submit the data
				console.log({name, email, dob, password});
			} else {
				// display error message
				setError(true);
				setErrorMessage('Password must be between 8 to 16 characters long and must be alphanumeric');
			}
		} else {
			// display error message
			setError(true);
			setErrorMessage('Passwords do not match');
		}
	}

	return (
		<Container fluid="sm" className="align-items-center mb-3" style={containerStyle}>
			<h1 className="text-primary">Chirper</h1>
			<h3 className="text-muted">Register for a new account</h3>

			<Card style={cardStyle}>
				<Form onSubmit={handleSubmit}>
					<Form.Group className="mb-3" controlId="name">
						<Form.Label>Full Name</Form.Label>
						<Form.Control type="text" placeholder="Full Name" onChange={e => setName(e.target.value)} required />
					</Form.Group>

					<Form.Group className="mb-3" controlId="email">
						<Form.Label>Email address</Form.Label>
						<Form.Control type="email" placeholder="Enter email" onChange={e => setEmail(e.target.value)} required />
						<Form.Text className="text-muted">
							We'll never share your email with anyone else.
						</Form.Text>
					</Form.Group>

					<Form.Group className="mb-3" controlId="dob">
						<Form.Label>Date Of Birth</Form.Label>
						<Form.Control type="date" onChange={e => setDob(e.target.value)} required />
					</Form.Group>

					<Form.Group className="mb-3" controlId="password">
						<Form.Label>Password</Form.Label>
						<Form.Control type="password" placeholder="Password" onChange={e => setPassword(e.target.value)} required />
					</Form.Group>

					<Form.Group className="mb-3" controlId="confirmPassword">
						<Form.Label>Confirm Password</Form.Label>
						<Form.Control type="password" placeholder="Confirm Password" onChange={e => setConfirmPassword(e.target.value)} required />
					</Form.Group>

					<Alert variant='danger' hidden={!error}>
						{errorMessage}
					</Alert>

					<Button variant="primary" type="submit">
						Register
					</Button>

				</Form>

				<Link to="/login" className="w-25 mt-3 text-primary">
					Already have an account?
				</Link>
			</Card>
		</Container>
	);
}

export default Register;
