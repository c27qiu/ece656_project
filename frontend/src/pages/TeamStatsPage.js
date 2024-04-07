import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
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
import Button from '@mui/material/Button';

const useStyles = makeStyles({
	table: {
		minWidth: '30%', // Adjust this value to change the table width
		marginTop: '4rem',
	},
});

function TeamStatsPage() {
	const { teamId } = useParams();
	const decodedTeam = decodeURIComponent(teamId);
	const style = useStyles();
	const navigate = useNavigate();

	const [teamInfo, setTeamInfo] = useState([]);

	useEffect(() => {
		// Fetch the team's info when the component mounts
		fetch(`http://127.0.0.1:8080/team/${teamId}`)
			.then((response) => response.json())
			.then((data) => setTeamInfo(data))
			.catch((error) => console.error('Error:', error));
	}, []);

	// Here you would fetch and display the team's stats
	// For now, we'll just display the team's name
	return (
		<div>
			<h2>
				{decodedTeam
					? `Stats for ${decodedTeam}`
					: 'Please search for a team'}
			</h2>
			{decodedTeam && (
				<>
					<TableContainer component={Paper}>
						<Table>
							<TableHead>
								<TableRow>
									<TableCell>Team ID</TableCell>
									<TableCell>Abbreviation</TableCell>
									<TableCell>Nickname</TableCell>
									<TableCell>City</TableCell>
									<TableCell>State</TableCell>
									<TableCell>Owner</TableCell>
									<TableCell>Year Founded</TableCell>
									<TableCell>General Manager</TableCell>
									<TableCell>Head Coach</TableCell>
									<TableCell>D League Affiliation</TableCell>
									<TableCell>Facebook</TableCell>
									<TableCell>Instagram</TableCell>
									<TableCell>Twitter</TableCell>
								</TableRow>
							</TableHead>
							<TableBody>
								{teamInfo.map((team, index) => (
									<TableRow key={index}>
										<TableCell>{team.teamID}</TableCell>
										<TableCell>
											{team.abbreviation}
										</TableCell>
										<TableCell>{team.nickname}</TableCell>
										<TableCell>{team.city}</TableCell>
										<TableCell>{team.state}</TableCell>
										<TableCell>{team.owner}</TableCell>
										<TableCell>
											{team.yearFounded}
										</TableCell>
										<TableCell>
											{team.generalManager}
										</TableCell>
										<TableCell>{team.headCoach}</TableCell>
										<TableCell>
											{team.dLeagueAffiliation}
										</TableCell>
										<TableCell>{team.facebook}</TableCell>
										<TableCell>{team.instagram}</TableCell>
										<TableCell>{team.twitter}</TableCell>
									</TableRow>
								))}
							</TableBody>
						</Table>
					</TableContainer>
					<TableContainer component={Paper} className={style.table}>
						<h2>Team Players</h2>
						<Table>
							<TableHead>
								<TableRow>
									<TableCell>Player ID</TableCell>
									<TableCell>Name</TableCell>
									<TableCell>Position</TableCell>
									<TableCell>Number</TableCell>
									{/* Add more <TableCell> elements for each player attribute you have */}
								</TableRow>
							</TableHead>
							<TableBody>
								{/* You would replace this with your actual data */}
								<TableRow>
									<TableCell>1</TableCell>
									<TableCell>
										<Button
											onClick={() => navigate(`/player`)}
										>
											John Doe
										</Button>
									</TableCell>
									<TableCell>Forward</TableCell>
									<TableCell>10</TableCell>
								</TableRow>
							</TableBody>
						</Table>
					</TableContainer>
				</>
			)}
		</div>
	);
}

export default TeamStatsPage;
