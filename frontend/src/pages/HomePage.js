import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Typography, Button, ListItemButton, ListItem } from '@mui/material';
import Autosuggest from 'react-autosuggest';

function HomePage({ onSearch }) {
	const [query, setQuery] = useState('');
	const [error, setError] = useState(false);
	const navigate = useNavigate();

	const [allTeamsInfo, setAllTeamsInfo] = useState([]);
	const [suggestions, setSuggestions] = useState([]);

	useEffect(() => {
		fetch(`http://127.0.0.1:8080/`)
			.then((response) => response.json())
			.then((data) => setAllTeamsInfo(data))
			.catch((error) => console.error('Error:', error));
	}, []);

	const teamsMapping = allTeamsInfo.reduce((acc, team) => {
		acc[team.teamID] = `${team.nickname} ${team.city}`;
		return acc;
	}, {});

	const onSuggestionsFetchRequested = ({ value }) => {
		setSuggestions(
			Object.values(teamsMapping).filter((team) =>
				team.toLowerCase().includes(value.toLowerCase())
			)
		);
	};

	const onSuggestionsClearRequested = () => {
		setSuggestions([]);
	};

	const inputProps = {
		placeholder: 'Search for an NBA team',
		value: query,
		onChange: (_, { newValue }) => {
			setQuery(newValue);
			setError(false);
		},
		onKeyDown: (event) => {
			if (event.key === 'Enter') {
				const teamId = Object.keys(teamsMapping).find(
					(key) => teamsMapping[key] === query
				);
				if (teamId) {
					navigate(`/team/${encodeURIComponent(teamId)}`);
				} else {
					setError(true);
				}
			}
		},
		style: {
			fontSize: '1em', // Increase font size
			padding: '10px', // Increase padding
			width: '500px', // Set a specific width
			marginBottom: '1rem', // Add some space at the bottom
		},
	};

	const handleSearch = (event) => {
		if (event.key === 'Enter') {
			navigate(`/team/${encodeURIComponent(query)}`);
		}
	};

	return (
		<div>
			{/* <TextField
				type='text'
				onKeyDown={handleSearch}
				onChange={(e) => setQuery(e.target.value)}
				placeholder='Search for an NBA team'
				fullWidth
			/> */}
			<Autosuggest
				suggestions={suggestions}
				onSuggestionsFetchRequested={onSuggestionsFetchRequested}
				onSuggestionsClearRequested={onSuggestionsClearRequested}
				getSuggestionValue={(suggestion) => suggestion}
				renderSuggestion={(suggestion) => (
					<ListItem>
						<ListItemButton>{suggestion}</ListItemButton>
					</ListItem>
				)}
				inputProps={inputProps}
			/>
			{error && (
				<Typography variant='body1' color='error'>
					Please enter a valid query
				</Typography>
			)}
			<div>OR</div>
			<Button
				onClick={() => navigate(`/players`)}
				variant='contained'
				color='primary'
				style={{ marginTop: '1rem' }}
			>
				Get all NBA players
			</Button>
		</div>
	);
}

export default HomePage;
