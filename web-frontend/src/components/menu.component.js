import {Col, Nav, Navbar, Row} from "react-bootstrap";
import {Link, withRouter} from "react-router-dom";
import {AiFillHome, IoSettings, MdInsertChart, RiMessage3Fill} from "react-icons/all";

const MenuComponent = () => {
	return (
		<Navbar expand="md" className="flex-column align-items-start">
			<Row className="w-100 px-2">
				<span className="fw-bold text-muted fs-3 d-md-none p-0 border-bottom">Chirper</span>
			</Row>
			<style type='text/css'>
				{`
				@media (max-width: 767px) {
					.mobile-nav {
						position: fixed;
					  left: 0;
					  bottom: 0;
					  width: 100%;
					  box-shadow: 0px -1px 10px 1px lightgrey;
					} 
			  }
				`}
			</style>
			<Nav className="flex-row flex-md-column fs-5 w-100 justify-content-around pb-2 border-top-1 border-dark mobile-nav">
				<h3 className="fw-bold text-muted fs-2 d-none d-md-block">Chirper</h3>
				<Nav.Link as={Link} to="/" active={window.location.pathname === "/"} className="me-2">
					<AiFillHome className="d-md-none" /> <span className="d-none d-md-block">Home</span>
				</Nav.Link>
				<Nav.Link as={Link} to="/messages" active={window.location.pathname === "/messages"} className="me-2">
					<RiMessage3Fill className="d-md-none" /> <span className="d-none d-md-block">Messages</span>
				</Nav.Link>
				<Nav.Link as={Link} to="/trending" active={window.location.pathname === "/trending"}
          className="me-2 d-md-none">
					<MdInsertChart className="d-md-none" /> <span className="d-none d-md-block">Trending</span>
				</Nav.Link>
				<Nav.Link as={Link} to="/settings" active={window.location.pathname === "/settings"} className="me-2">
					<IoSettings className="d-md-none" /> <span className="d-none d-md-block">Settings</span>
				</Nav.Link>
			</Nav>
		</Navbar>
	);
}

export default withRouter(MenuComponent);
