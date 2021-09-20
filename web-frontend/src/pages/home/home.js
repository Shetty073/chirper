import {Container, Row, Col} from "react-bootstrap";
import Menu from "../../components/menu";
import Trending from "../../components/trending";
import ChirpEditor from "../../components/chirpeditor";
import Feed from "../../components/feed";

const Home = () => {
	document.title = "Home - Chirper";

	return (
		<Container>
			<Row>
				<Col className="menu">
					<Menu activeKey="/" />
				</Col>

				<Col>
					<ChirpEditor />
					<Feed />
				</Col>

				<Col>
					<Trending />
				</Col>
			</Row>
		</Container>
	);
}

export default Home;
