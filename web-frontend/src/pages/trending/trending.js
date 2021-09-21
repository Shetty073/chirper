import {Col, Container, Row} from "react-bootstrap";
import Menu from "../../components/menu";
import TrendingSection from "../../components/trendingsection";

const Trending = () => {
	document.title = "Home - Trending";

	return (
		<Container fluid="sm">
			<Row>
				<Col sm={false} md={2}>
					<Menu />
				</Col>

				<Col sm={12} md={10}>
					<TrendingSection />
				</Col>
			</Row>
		</Container>
	);
}

export default Trending;
