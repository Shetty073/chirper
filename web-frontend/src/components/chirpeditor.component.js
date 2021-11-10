import React, {useState} from 'react';
import { MentionsInput, Mention } from 'react-mentions';
import {Button, Col} from "react-bootstrap";
import {backendURIs} from "../utils";
import {default as axios} from "axios";

const ChirpEditorComponent = () => {
	const [chirp, setChirp] = useState('');
	const [loading, setLoading] = useState(false);


	const submit = () => {
		setLoading(true);

		axios.post(
			backendURIs.createChirp,
			{
				chirp,
			},
			{
				headers: {
					authorization: localStorage.getItem('authorization'),
				},
			}
		).then((response) => {
			if (response.status === 200) {
				window.location.reload();
			} else {
				window.alert(response.data.message);
			}
		}).catch((error) => {
			if (error.response) {
				window.alert(error.response.data.message);
			} else {
				window.alert('Could not connect to the server. Please try again later.');
			}
		});

		setLoading(false);
	}

	const handleChange = (event, newValue, mentions) => {
		setChirp(newValue);
	}

	const fetchUsernameSuggestions = (query, callback) => {
		if (!query) return
		fetch(backendURIs.findUser, {
			method: 'post',
			body: JSON.stringify({
				username: query,
			}),
			headers: {
				'Content-Type': 'application/json',
				authorization: localStorage.getItem('authorization'),
			}
		})
		.then(res => res.json())
		.then(res => res.users.map(user => ({ display: `@${user.username}`, id: user.username })))
		.then(callback);

	}

	const fetchHashTagSuggestions = (query, callback) => {
		if (!query) return
		fetch(backendURIs.findHashTag, {
			method: 'post',
			body: JSON.stringify({
				tag: query,
			}),
			headers: {
				'Content-Type': 'application/json',
				authorization: localStorage.getItem('authorization'),
			}
		})
		.then(res => res.json())
		.then(res => {
			return res.hashtags.length > 0 ? res.hashtags.map(hashtag => ({ display: `#${hashtag.tag}`, id: hashtag.tag })) : [{display: `#${query}`, id: query}];
		})
		.then(callback);
	}

	const renderUsernameSuggestion = (suggestion, search, highlightedDisplay) => (
		<div className="user">{highlightedDisplay}</div>
	);

	const renderTagSuggestion = (suggestion, search, highlightedDisplay) => (
		<div className="tag">{highlightedDisplay}</div>
	);

	return (
			<div className="my-3 w-100" id="editor-js">
				<Col>
					<MentionsInput
						value={chirp}
						onChange={handleChange}
						placeholder={"What's on your mind?"}
						style={editorStyle}
						>
						<Mention
							trigger="@"
							data={fetchUsernameSuggestions}
							renderSuggestion={renderUsernameSuggestion}
							style={mentionStyle}
							appendSpaceOnAdd={true}
						/>
						<Mention
							trigger="#"
							data={fetchHashTagSuggestions}
							renderSuggestion={renderTagSuggestion}
							style={hashTagStyle}
							appendSpaceOnAdd={true}
						/>
					</MentionsInput>
					<Button variant="primary" className="mt-2" onClick={submit}>
						Chirp
					</Button>
				</Col>
			</div>
	);
}

const editorStyle = {
	input: {
		overflow: 'auto',
		height: 70,
		textRendering: 'geometricPrecision',
	},

	highlighter: {
		boxSizing: 'border-box',
		overflow: 'hidden',
		height: 70,
	},
};

const mentionStyle = {
	paddingLeft: 2,
	paddingBottom: 2,
	backgroundColor: '#fff',
	position: 'relative',
	zIndex: 1,
	color: '#0b5ed7',
	textShadow: '1px 1px 1px white, 1px -1px 1px white, -1px 1px 1px white,\n' +
		'\t-1px -1px 1px white',
	pointerEvents: 'none',
};

const hashTagStyle = {
	paddingLeft: 2,
	paddingBottom: 2,
	backgroundColor: '#fff',
	position: 'relative',
	zIndex: 1,
	color: '#85a4ea',
	textShadow: '1px 1px 1px white, 1px -1px 1px white, -1px 1px 1px white,\n' +
		'\t-1px -1px 1px white',
	pointerEvents: 'none',
};

export default ChirpEditorComponent;
