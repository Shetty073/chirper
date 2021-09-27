import {Button, Col, Form} from "react-bootstrap";

const ChirpEditorComponent = () => {
	return (
		<div className="my-3 w-100">
			<Col>
				<Form>
					<Form.Group className="mb-3" controlId="chirp">
						<Form.Control as="textarea" placeholder="What's on your mind?" required/>
					</Form.Group>
					<Button variant="primary" type="submit">
						Chirp
					</Button>
				</Form>
			</Col>
		</div>
	);
}

export default ChirpEditorComponent;
