import {Button, Col, Form} from "react-bootstrap";

const ChirpEditor = () => {
	return (
		<div className="my-3 w-100">
			<Col>
				<Form>
					<Form.Group className="mb-3" controlId="chirp">
						<Form.Label className="fw-bold">Post New Chirp</Form.Label>
						<Form.Control as="textarea" placeholder="Chirp" required />
					</Form.Group>
					<Button variant="primary" type="submit">
						Chirp
					</Button>
				</Form>
			</Col>
		</div>
	);
}

export default ChirpEditor;
