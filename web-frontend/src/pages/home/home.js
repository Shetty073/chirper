import {Col, Container, Row} from "react-bootstrap";
import Menu from "../../components/menu.component";
import TrendingsectionComponent from "../../components/trendingsection.component";
import ChirpeditorComponent from "../../components/chirpeditor.component";
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
					<ChirpeditorComponent/>
					<FeedComponent/>
				</Col>

				<Col sm={false} md={2} className="mt-2 d-none d-sm-block">
					<TrendingsectionComponent />
				</Col>
			</Row>
		</Container>
	);
}

export default Home;
