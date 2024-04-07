import React from 'react';
import TextField from '@mui/material/TextField';

function SearchBar({ onSearch }) {
	const handleSearch = (event) => {
		if (event.key === 'Enter') {
			onSearch(event.target.value);
		}
	};

	return (
		<TextField
			type='text'
			onKeyDown={handleSearch}
			placeholder='Search for an NBA team'
			fullWidth
		/>
	);
}

export default SearchBar;
