import {Col, Container, Row} from "react-bootstrap";
import Menu from "../../components/menu.component";
import TrendingsectionComponent from "../../components/trendingsection.component";
import ChirpEditorComponent from "../../components/chirpeditor.component";
import FeedComponent from "../../components/feed.component";

const Home = () => {
	document.title = "Home - Chirper";

	return (
		<Container fluid="sm">
			<Row>
				<Col sm={false} md={2}>
					<Menu />
				</Col>

				<Col sm={12} md={8}>
					<ChirpEditorComponent/>
					<FeedComponent/>
				</Col>

				<Col sm={false} md={2} className="mt-2 d-none d-md-block">
					<TrendingsectionComponent />
				</Col>
			</Row>
		</Container>
	);
}

export default Home;
