import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import HomePage from './pages/HomePage';
import TeamStatsPage from './pages/TeamStatsPage';
import PlayerInfoPage from './pages/PlayerInfoPage';

function App() {
	return (
		<Router>
			<Routes>
				<Route path='/team/:id' element={<TeamStatsPage />} />
				<Route path='/player' element={<PlayerInfoPage />} />
				<Route path='/' element={<HomePage />} />
			</Routes>
		</Router>
	);
}

export default App;
