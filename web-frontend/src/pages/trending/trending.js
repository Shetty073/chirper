import {Col, Container, Row} from "react-bootstrap";
import Menu from "../../components/menu.component";
import TrendingsectionComponent from "../../components/trendingsection.component";

const Trending = () => {
	document.title = "Home - Trending";

	return (
		<Container fluid="sm">
			<Row>
				<Col sm={false} md={2}>
					<Menu/>
				</Col>

				<Col sm={12} md={10}>
					<TrendingsectionComponent/>
				</Col>
			</Row>
		</Container>
	);
}

export default Trending;
