import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { TextField, Button } from '@mui/material';

function HomePage({ onSearch }) {
	const [query, setQuery] = useState('');
	const navigate = useNavigate();

	const handleSearch = (event) => {
		if (event.key === 'Enter') {
			navigate(`/team/${encodeURIComponent(query)}`);
		}
	};

	return (
		<div>
			<TextField
				type='text'
				onKeyDown={handleSearch}
				onChange={(e) => setQuery(e.target.value)}
				placeholder='Search for an NBA team'
				fullWidth
			/>
			<Button
				onClick={() => navigate(`/player`)}
				variant='contained'
				color='primary'
			>
				Get all NBA players
			</Button>
		</div>
	);
}

export default HomePage;
