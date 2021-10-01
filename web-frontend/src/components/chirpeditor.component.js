import React, {useState} from 'react';
import { MentionsInput, Mention } from 'react-mentions';
import {Button, Col} from "react-bootstrap";

const ChirpEditorComponent = () => {
	const [chirp, setChirp] = useState('');
	const [chirpPlainText, setChirpPlainText] = useState('');
	const [mentionActive, setMentionActive] = useState(false);
	const [loading, setLoading] = useState(false);


	const submit = () => {
		setLoading(true);

		// TODO: Submit data code goes here

		setLoading(false);
	}

	const handleChange = (event, newValue, newPlainTextValue, mentions) => {
		setChirp(newValue);
		setChirpPlainText(newPlainTextValue);
	}

	const fetchUsernameSuggestions = (query, callback) => {
		// TODO: Replace this demo code with actual backend API call for username list
		if (!query) return
		fetch(`https://api.github.com/search/users?q=${query}`, { json: true })
			.then(res => res.json())
			// Transform the users to what react-mentions expects
			.then(res =>
				res.items.map(user => ({ display: user.login, id: user.login }))
			)
			.then(callback);
	}

	const fetchHashTagSuggestions = (query, callback) => {
		// TODO: Replace this demo code with actual backend API call for trending hashtags list
		if (!query) return
		fetch(`https://api.github.com/search/users?q=${query}`, { json: true })
			.then(res => res.json())
			// Transform the users to what react-mentions expects
			.then(res =>
				res.items.map(user => ({ display: user.login, id: user.login }))
			)
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
