import {Nav, Navbar} from "react-bootstrap";
import {Link, withRouter} from "react-router-dom";

const Menu = ({activeKey}) => {
	return (
		<Navbar>
			<Nav activeKey={activeKey} className="flex-column fs-5">
				<h3 className="fw-bold text-muted fs-3 mb-4">Chirper</h3>
				<Nav.Item>
					<Nav.Link as={Link} to="/" active={activeKey === "/"}>Home</Nav.Link>
				</Nav.Item>
				<Nav.Item>
					<Nav.Link as={Link} to="/messages" active={activeKey === "/messages"}>Messages</Nav.Link>
				</Nav.Item>
				<Nav.Item>
					<Nav.Link as={Link} to="/settings" active={activeKey === "/settings"}>Settings</Nav.Link>
				</Nav.Item>
			</Nav>
		</Navbar>
	);
}

export default withRouter(Menu);
