import {Col, Container, Row} from "react-bootstrap";
import Menu from "../../components/menu";
import TrendingSection from "../../components/trendingsection";
import SettingsMenu from "../../components/settingsmenu";

const Settings = () => {
	document.title = "Settings - Chirper";

	return (
		<Container fluid="sm">
			<Row>
				<Col sm={false} md={2}>
					<Menu />
				</Col>

				<Col sm={12} md={8}>
					<SettingsMenu/>
				</Col>

				<Col sm={false} md={2} className="mt-2 d-none d-sm-block">
					<TrendingSection/>
				</Col>
			</Row>
		</Container>
	);
}

export default Settings;
