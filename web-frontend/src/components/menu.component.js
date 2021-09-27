import {Col, Nav, Navbar, Row} from "react-bootstrap";
import {Link, withRouter} from "react-router-dom";

const MenuComponent = () => {
	return (
		<Navbar expand="md" className="flex-column align-items-start">
				<Row>
					<Col>
						<Navbar.Toggle aria-controls="menubar" className="float-end" />
					</Col>
					<Col>
						<span className="fw-bold text-muted fs-3 d-md-none p-0">Chirper</span>
					</Col>
				</Row>
			<Navbar.Collapse id="menubar">
				<Nav className="flex-row flex-md-column fs-5">
					<h3 className="fw-bold text-muted fs-2 d-none d-md-block">Chirper</h3>
					<Nav.Link as={Link} to="/" active={window.location.pathname === "/"} className="me-2">
						Home
					</Nav.Link>
					<Nav.Link as={Link} to="/messages" active={window.location.pathname === "/messages"} className="me-2">
						Messages
					</Nav.Link>
					<Nav.Link as={Link} to="/trending" active={window.location.pathname === "/trending"} className="me-2 d-md-none">
						Trending
					</Nav.Link>
					<Nav.Link as={Link} to="/settings" active={window.location.pathname === "/settings"} className="me-2">
						Settings
					</Nav.Link>
				</Nav>
			</Navbar.Collapse>
		</Navbar>
	);
}

export default withRouter(MenuComponent);
