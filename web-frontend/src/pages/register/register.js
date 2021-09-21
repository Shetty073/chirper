import {Button, Card, Container, Form} from "react-bootstrap";
import {cardStyle, containerStyle} from "./register.styles";
import {Link} from "react-router-dom";

const Register = () => {

	return (
		<Container fluid="sm" className="align-items-center" style={containerStyle}>
			<h1 className="text-primary">Chirper</h1>
			<h3 className="text-muted">Register for a new account</h3>

			<Card style={cardStyle}>
				<Form>
					<Form.Group className="mb-3" controlId="name">
						<Form.Label>Full Name</Form.Label>
						<Form.Control type="text" placeholder="Full Name" required/>
					</Form.Group>

					<Form.Group className="mb-3" controlId="email">
						<Form.Label>Email address</Form.Label>
						<Form.Control type="email" placeholder="Enter email" required/>
						<Form.Text className="text-muted">
							We'll never share your email with anyone else.
						</Form.Text>
					</Form.Group>

					<Form.Group className="mb-3" controlId="dob">
						<Form.Label>Date Of Birth</Form.Label>
						<Form.Control type="date" required/>
					</Form.Group>

					<Form.Group className="mb-3" controlId="password">
						<Form.Label>Password</Form.Label>
						<Form.Control type="password" placeholder="Password" required/>
					</Form.Group>

					<Form.Group className="mb-3" controlId="confirmPassword">
						<Form.Label>Confirm Password</Form.Label>
						<Form.Control type="password" placeholder="Confirm Password" required/>
					</Form.Group>

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
