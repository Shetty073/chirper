import React from 'react';
import {Editor, EditorState} from "draft-js";

const ChirpEditorComponent = () => {
	const [editorState, setEditorState] = React.useState(() =>
		EditorState.createEmpty()
	);

	const editor = React.useRef(null);
	const focusEditor = () => {
		editor.current.focus();
	}

	return (
		<div className="my-3 w-100">
			<div
				style={{ border: "1px solid lightgrey", minHeight: "6em", cursor: "text" }}
				className="p-1"
				onClick={focusEditor}
			>
			<Editor
				ref={editor}
				editorState={editorState}
				onChange={setEditorState}
				placeholder="What's on your mind?"
			/>
			</div>

		</div>
	);
}

export default ChirpEditorComponent;
