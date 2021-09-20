import {Col, Container, Row} from "react-bootstrap";
import Menu from "../../components/menu";
import Trending from "../../components/trending";
import ChatList from "../../components/chatlist";

const Messages = () => {
	document.title = "Messages - Chirper";

	return (
		<Container>
			<Row>
				<Col className="menu">
					<Menu activeKey="/messages" />
				</Col>

				<Col>
					<ChatList />
				</Col>

				<Col>
					<Trending />
				</Col>
			</Row>
		</Container>
	);
}

export default Messages;
