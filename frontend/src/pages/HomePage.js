import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import TextField from '@mui/material/TextField';

function HomePage({ onSearch }) {
	const [query, setQuery] = useState('');
	const navigate = useNavigate();

	const handleSearch = (event) => {
		if (event.key === 'Enter') {
			navigate(`/teams/${encodeURIComponent(query)}`);
		}
	};

	return (
		<TextField
			type='text'
			onKeyDown={handleSearch}
			onChange={(e) => setQuery(e.target.value)}
			placeholder='Search for an NBA team'
			fullWidth
		/>
	);
}

export default HomePage;
