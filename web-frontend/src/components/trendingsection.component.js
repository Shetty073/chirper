import {useEffect, useState} from "react";
import {default as axios} from "axios";
import {backendURIs} from "../utils";
import {Card, ListGroup, Row} from "react-bootstrap";

const TrendingsectionComponent = () => {
	const [loading, setLoading] = useState(true);
	const [trending, setTrending] = useState([]);

	useEffect(() => {
		setTrending([]);

		axios.get(backendURIs.getTrendingTags,
			{
				headers: {
					authorization: localStorage.getItem('authorization'),
				},
			}).then((response) => {
			if (response.status === 200) {
				setTrending(trending => [...trending, ...response.data.trending]);
			} else {
				console.error(response.data.message);
			}
		}).catch((error) => {
			if (error.response) {
				console.error(error.response.data.message);
			} else {
				console.error('Could not connect to the server. Please try again later.');
			}
		});

	}, [])


	useEffect(() => {
		if(trending.length > 0) {
			setLoading(false);
		}
	}, [trending]);

	let count = 1;

	return (
		<>
			<h5>Trending</h5>
			<Card style={{ width: '100%' }}>
				<ListGroup variant="flush">
				{!loading && <>
					{trending.map((ht) => <ListGroup.Item key={ht._id}>
						{count++}. {ht.tag}
					</ListGroup.Item>)}
				</>}
				</ListGroup>
			</Card>
		</>
	);
}

export default TrendingsectionComponent;
