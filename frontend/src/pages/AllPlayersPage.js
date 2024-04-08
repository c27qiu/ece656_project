import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import TextField from '@mui/material/TextField';
import {
	Table,
	TableBody,
	TableCell,
	TableContainer,
	TableHead,
	TableRow,
	Paper,
} from '@mui/material';
import { makeStyles } from '@mui/styles';

const useStyles = makeStyles({
	table: {
		minWidth: 650,
	},
});

function PlayerInfoPage() {
	const { playerId } = useParams();
	const [playerInfo, setPlayerInfo] = useState([]);
	const style = useStyles();

	useEffect(() => {
		fetch(`http://127.0.0.1:8080/players`)
			.then((response) => response.json())
			.then((data) => setPlayerInfo(data))
			.catch((error) => console.error('Error:', error));
	}, []);

	console.log(playerInfo);
	// if (!playerInfo) {
	// 	// The player's info hasn't been loaded yet, so render a loading message
	// 	return <div>Loading...</div>;
	// }

	const rows = [
		{
			playerID: 1,
			firstName: 'John',
			lastName: 'Doe',
			birthdate: '2000-01-01',
			school: 'School 1',
			country: 'Country 1',
			lastAffiliation: 'Affiliation 1',
			height: '6\'0"',
			weight: 180,
			seasonExp: 2,
			jersey: '12',
			position: 'Guard',
			rosterStatus: 'Active',
			gamesPlayedCurrentSeason: true,
			teamID: 1,
			activeFromYear: 2018,
			activeToYear: 2020,
			greatest75Flag: false,
		},
		// Add more rows here...
	];

	return (
		<TableContainer component={Paper}>
			<Table className={style.table} aria-label='simple table'>
				<TableHead>
					<TableRow>
						<TableCell>Player ID</TableCell>
						<TableCell>First Name</TableCell>
						<TableCell>Last Name</TableCell>
						<TableCell>Birthdate</TableCell>
						<TableCell>School</TableCell>
						<TableCell>Country</TableCell>
						<TableCell>Last Affiliation</TableCell>
						<TableCell>Height</TableCell>
						<TableCell>Weight</TableCell>
						<TableCell>Season Exp</TableCell>
						<TableCell>Jersey</TableCell>
						<TableCell>Position</TableCell>
						<TableCell>Roster Status</TableCell>
						<TableCell>Games Played Current Season</TableCell>
						<TableCell>Team ID</TableCell>
						<TableCell>Active From Year</TableCell>
						<TableCell>Active To Year</TableCell>
						<TableCell>Greatest 75 Flag</TableCell>
					</TableRow>
				</TableHead>
				<TableBody>
					{playerInfo.map((player, index) => (
						<TableRow key={index}>
							<TableCell>{player.playerID}</TableCell>
							<TableCell>{player.firstName}</TableCell>
							<TableCell>{player.lastName}</TableCell>
							<TableCell>{player.birthdate}</TableCell>
							<TableCell>{player.school}</TableCell>
							<TableCell>{player.country}</TableCell>
							<TableCell>{player.lastAffiliation}</TableCell>
							<TableCell>{player.height}</TableCell>
							<TableCell>{player.weight}</TableCell>
							<TableCell>{player.seasonExp}</TableCell>
							<TableCell>{player.jersey}</TableCell>
							<TableCell>{player.position}</TableCell>
							<TableCell>{player.rosterStatus}</TableCell>
							<TableCell>
								{player.gamesPlayedCurrentSeason}
							</TableCell>
							<TableCell>{player.teamID}</TableCell>
							<TableCell>{player.activeFromYear}</TableCell>
							<TableCell>{player.activeToYear}</TableCell>
							<TableCell>{player.greatest75Flag}</TableCell>
						</TableRow>
					))}
				</TableBody>
			</Table>
		</TableContainer>
	);
}

export default PlayerInfoPage;
