import {Button, Card, Container, Form} from "react-bootstrap";
import {cardStyle, containerStyle} from "../register/register.styles";
import {Link} from "react-router-dom";

const Login = () => {
	return (
		<Container className="align-items-center" style={containerStyle}>
			<h1 className="text-primary">Chirper</h1>
			<h3 className="text-muted">Log In</h3>

			<Card style={cardStyle}>
				<Form>
					<Form.Group className="mb-3" controlId="email">
						<Form.Label>Email address</Form.Label>
						<Form.Control type="email" placeholder="Enter email" required />
						<Form.Text className="text-muted">
							We'll never share your email with anyone else.
						</Form.Text>
					</Form.Group>

					<Form.Group className="mb-3" controlId="password">
						<Form.Label>Password</Form.Label>
						<Form.Control type="password" placeholder="Password" required />
					</Form.Group>

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
