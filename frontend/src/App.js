import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import HomePage from './pages/HomePage';
import TeamStatsPage from './pages/TeamStatsPage';
import AllPlayersPage from './pages/AllPlayersPage';
import PlayerInfoPage from './pages/PlayerInfoPage';

function App() {
	return (
		<Router>
			<Routes>
				<Route path='/team/:teamId' element={<TeamStatsPage />} />
				<Route path='/player/:playerId' element={<PlayerInfoPage />} />
				<Route path='/players' element={<AllPlayersPage />} />
				<Route path='/' element={<HomePage />} />
			</Routes>
		</Router>
	);
}

export default App;
