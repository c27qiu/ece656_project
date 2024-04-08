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
		fetch(`http://127.0.0.1:8080/player/${playerId}`)
			.then((response) => response.json())
			.then((data) => setPlayerInfo(data))
			.catch((error) => console.error('Error:', error));
	}, [playerId]);

	console.log('Player Info:', playerInfo);

	return (
		<TableContainer component={Paper}>
			<h2>Player Info</h2>
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
					{playerInfo[0]
						? playerInfo.map((player, index) => (
								<TableRow key={index}>
									<TableCell>{player.playerID}</TableCell>
									<TableCell>{player.firstName}</TableCell>
									<TableCell>{player.lastName}</TableCell>
									<TableCell>{player.birthdate}</TableCell>
									<TableCell>{player.school}</TableCell>
									<TableCell>{player.country}</TableCell>
									<TableCell>
										{player.lastAffiliation}
									</TableCell>
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
									<TableCell>
										{player.activeFromYear}
									</TableCell>
									<TableCell>{player.activeToYear}</TableCell>
									<TableCell>
										{player.greatest75Flag}
									</TableCell>
								</TableRow>
						  ))
						: 'LOADING...'}
				</TableBody>
			</Table>
		</TableContainer>
	);
}

export default PlayerInfoPage;
