import {Col, Container, Row} from "react-bootstrap";
import Menu from "../../components/menu.component";
import TrendingsectionComponent from "../../components/trendingsection.component";
import SettingsmenuComponent from "../../components/settingsmenu.component";

const Settings = () => {
	document.title = "Settings - Chirper";

	return (
		<Container fluid="sm">
			<Row>
				<Col sm={false} md={2}>
					<Menu />
				</Col>

				<Col sm={12} md={8}>
					<SettingsmenuComponent/>
				</Col>

				<Col sm={false} md={2} className="mt-2 d-none d-sm-block">
					<TrendingsectionComponent/>
				</Col>
			</Row>
		</Container>
	);
}

export default Settings;
