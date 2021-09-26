import {Alert, Button, Card, Container, Form} from "react-bootstrap";
import {cardStyle, containerStyle} from "../register/register.styles";
import {Link} from "react-router-dom";
import {useEffect, useState} from "react";
import {isPasswordValid} from "../../utils";

const Login = () => {
	const [email, setEmail] = useState('');
	const [password, setPassword] = useState('');
	const [error, setError] = useState(false);
	const [errorMessage, setErrorMessage] = useState('');

	useEffect(() => {
		setError(false);
		setErrorMessage('');
	}, []);

	const handleSubmit = (e) => {
		e.preventDefault();
		// log the user in
		console.log({email, password});
	}

	return (
		<Container fluid="sm" className="align-items-center" style={containerStyle}>
			<h1 className="text-primary">Chirper</h1>
			<h3 className="text-muted">Log In</h3>

			<Card style={cardStyle}>
				<Form onSubmit={handleSubmit}>
					<Form.Group className="mb-3" controlId="email">
						<Form.Label>Email address</Form.Label>
						<Form.Control type="email" placeholder="Enter email" onChange={e => setEmail(e.target.value)} required />
						<Form.Text className="text-muted">
							We'll never share your email with anyone else.
						</Form.Text>
					</Form.Group>

					<Form.Group className="mb-3" controlId="password">
						<Form.Label>Password</Form.Label>
						<Form.Control type="password" placeholder="Password" onChange={e => setPassword(e.target.value)} required />
					</Form.Group>

					<Alert variant='danger' hidden={!error}>
						{errorMessage}
					</Alert>

					<Button variant="primary" type="submit">
						Login
					</Button>

				</Form>

				<Link to="/register" className="w-25 mt-3 text-primary">
					Don't have an account?
				</Link>
			</Card>
		</Container>
	);
}

export default Login;
