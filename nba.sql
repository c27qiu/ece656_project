
CREATE TABLE Game (
	gameID DECIMAL(38, 0) NOT NULL, 
	seasonID DECIMAL(38, 0) NOT NULL, 
	gameDate TIMESTAMP NULL,
	gameTime VARCHAR(6),
	attendance DECIMAL(38, 0), 
	min DECIMAL(38, 0) NOT NULL, 
	season_type VARCHAR(14) NOT NULL
	sequence DECIMAL(38, 0), 
    statusID DECIMAL(38, 0) NOT NULL, 
	statusText VARCHAR(20), 
	leadChanges DECIMAL(38, 0) NOT NULL, 
	timesTied DECIMAL(38, 0) NOT NULL, 
	livePeriod DECIMAL(38, 0) NOT NULL, 
	livePCTime DATETIME, 
	livePeriodTimeBcast VARCHAR(24) NOT NULL,
	natlTVBroadcasterAbbreviation VARCHAR(13),  
	whStatus BOOL NOT NULL,
    teamIDHome DECIMAL(38, 0) NOT NULL, 
	teamIDAway DECIMAL(38, 0) NOT NULL, 
	
	plusMinusAway DECIMAL(38, 0) NOT NULL, 
	videoAvailableAway BOOL NOT NULL, 
	wlAway VARCHAR(1), 
	fgmAway DECIMAL(38, 0), 
	fgaAway DECIMAL(38, 0), 
	fgPctAway DECIMAL(38, 3), 
	fg3mAway DECIMAL(38, 0), 
	fg3aAway DECIMAL(38, 0), 
	fg3PctAway DECIMAL(38, 3), 
	ftmAway DECIMAL(38, 0), 
	ftaAway DECIMAL(38, 0), 
	ftPctAway DECIMAL(38, 3), 
	orebAway DECIMAL(38, 0), 
	drebAway DECIMAL(38, 0), 
	rebAway DECIMAL(38, 0), 
	astAway DECIMAL(38, 0), 
	stlAway DECIMAL(38, 0), 
	blkAway DECIMAL(38, 0), 
	tovAway DECIMAL(38, 0), 
	pfAway DECIMAL(38, 0), 
	ptsAway DECIMAL(38, 0) NOT NULL, 
    ptsPaintAway DECIMAL(38, 0) NOT NULL, 
	pts2ndChanceAway DECIMAL(38, 0) NOT NULL, 
	ptsFbAway DECIMAL(38, 0) NOT NULL, 
	largestLeadAway DECIMAL(38, 0) NOT NULL, 
	teamTurnoversAway DECIMAL(38, 0), 
	totalTurnoversAway DECIMAL(38, 0), 
	teamReboundsAway DECIMAL(38, 0), 
	ptsOffToAway DECIMAL(38, 0),
    teamWinsLossesAway VARCHAR(5) NOT NULL, 
	ptsAway DECIMAL(38, 0) NOT NULL,

    plusMinusHome DECIMAL(38, 0) NOT NULL, 
	videoAvailableHome BOOL NOT NULL,    wlHome VARCHAR(1), 
	fgmHome DECIMAL(38, 0), 
	fgaHome DECIMAL(38, 0), 
	fgPctHome DECIMAL(38, 3), 
	fg3mHome DECIMAL(38, 0), 
	fg3aHome DECIMAL(38, 0), 
	fg3PctHome DECIMAL(38, 3), 
	ftmHome DECIMAL(38, 0), 
	ftaHome DECIMAL(38, 0), 
	ftPctHome DECIMAL(38, 3), 
	orebHome DECIMAL(38, 0), 
	drebHome DECIMAL(38, 0), 
	rebHome DECIMAL(38, 0), 
	astHome DECIMAL(38, 0), 
	stlHome DECIMAL(38, 0), 
	blkHome DECIMAL(38, 0), 
	tovHome DECIMAL(38, 0), 
	pfHome DECIMAL(38, 0), 
	ptsHome DECIMAL(38, 0) NOT NULL, 
    ptsPaintHome DECIMAL(38, 0) NOT NULL, 
	pts2ndChance_home DECIMAL(38, 0) NOT NULL, 
	ptsFbHome DECIMAL(38, 0) NOT NULL, 
	largestLeadHome DECIMAL(38, 0) NOT NULL, 
	teamTurnoversHome DECIMAL(38, 0), 
	totalTurnoversHome DECIMAL(38, 0), 
	teamReboundsHome DECIMAL(38, 0), 
	ptsOffToHome DECIMAL(38, 0), 
    teamWinsLossesHome VARCHAR(5) NOT NULL, 
	ptsHome DECIMAL(38, 0) NOT NULL,

    --FOREIGN KEY (gameID) REFERENCES Overtime(gameID),
    --FOREIGN KEY (gameID) REFERENCES pointsPerQuarter(gameID),
    FOREIGN KEY (teamFor) REFERENCES TeamInfo(teamID),
    --FOREIGN KEY (teamAgainst) REFERENCES TeamInfo(teamID),
);

CREATE TABLE Overtime(
    gameID DECIMAL(38, 0) NOT NULL, 
    otNumber INT NOT NUL,
    pointsOtHome DECIMAL(38, 0),
    pointsOtAway DECIMAL(38, 0),
    PRIMARY KEY(gameID, otNumber),
    FOREIGN KEY (gameID) REFERENCES Game(gameID)
)

CREATE TABLE pointsPerQuarter(
    gameID DECIMAL(38, 0) NOT NULL, 
    quarterNumber INT NOT NUL,
    pointsQuarterHome DECIMAL(38, 0),
    pointsQuarterAway DECIMAL(38, 0),
    PRIMARY KEY(gameID, quartertNumber),
	FOREIGN KEY (gameID) REFERENCES Game(gameID)
)

CREATE TABLE inactive_players (
	gameID DECIMAL(38, 0) NOT NULL, 
	playerID DECIMAL(38, 0) NOT NULL,
    PRIMARY KEY(gameID, playerID),
	FOREIGN KEY (gameID) REFERENCES Game(gameID),
	FOREIGN KEY (playerID) REFERENCES PlayerInfo(playerID)
);
