import {Col, Container, Row} from "react-bootstrap";
import Menu from "../../components/menu";
import Trending from "../../components/trending";
import SettingsMenu from "../../components/settingsmenu";

const Settings = () => {
	document.title = "Settings - Chirper";

	return (
		<Container>
			<Row>
				<Col className="menu">
					<Menu activeKey="/settings" />
				</Col>

				<Col>
					<SettingsMenu />
				</Col>

				<Col>
					<Trending />
				</Col>
			</Row>
		</Container>
	);
}

export default Settings;
