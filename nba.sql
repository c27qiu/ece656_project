-- Create tables to represent the data model

-- Drop existing tables
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Outcomes;
DROP TABLE IF EXISTS InactivePlayers;
DROP TABLE IF EXISTS OvertimePoints;
DROP TABLE IF EXISTS Broadcast;
DROP TABLE IF EXISTS Officials;


-- Create tables
CREATE TABLE Game (
	gameID DECIMAL(38, 0) NOT NULL, 
	seasonID DECIMAL(38, 0) NOT NULL, 
	gameDate TIMESTAMP NULL,
	gameTime VARCHAR(6),
	attendance DECIMAL(38, 0), 
	min DECIMAL(38, 0) NOT NULL, 
	season_type VARCHAR(14) NOT NULL,
	sequence DECIMAL(38, 0), 
    statusID DECIMAL(38, 0) NOT NULL, 
	statusText VARCHAR(20), 
	leadChanges DECIMAL(38, 0) NOT NULL, 
	timesTied DECIMAL(38, 0) NOT NULL, 
	whStatus BOOL NOT NULL,
    teamIDHome DECIMAL(38, 0) NOT NULL, 
	teamIDAway DECIMAL(38, 0) NOT NULL, 
	PRIMARY KEY (gameID)
);
-- FOREIGN KEY (teamFor) REFERENCES TeamInfo(teamID)
--FOREIGN KEY (gameID) REFERENCES Overtime(gameID),
--FOREIGN KEY (gameID) REFERENCES pointsPerQuarter(gameID),
--FOREIGN KEY (teamAgainst) REFERENCES TeamInfo(teamID),

CREATE TABLE Outcomes(
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
	videoAvailableHome BOOL NOT NULL,
	wlHome VARCHAR(1),
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
);

CREATE TABLE OvertimePoints (
    gameID DECIMAL(38, 0) NOT NULL, 
	otNumber INT NOT NULL, 
	pointsOtHome DECIMAL(38, 0), 
	pointsOtAway DECIMAL(38, 0), 
	PRIMARY KEY (gameID, otNumber) 
);
-- FOREIGN KEY (gameID) REFERENCES Game (gameID)
CREATE TABLE InactivePlayers (
    gameID DECIMAL(38, 0) NOT NULL, 
    playerID DECIMAL(38, 0) NOT NULL, 
	jerseyNum DECIMAL(38, 0) DEFAULT NULL, 
	teamID DECIMAL(38, 0) NOT NULL, 
    PRIMARY KEY (gameID, playerID)
    --	FOREIGN KEY (gameID) REFERENCES Game(gameID),
    --	FOREIGN KEY (playerID) REFERENCES PlayerInfo(playerID)
);
CREATE TABLE PointsPerQuarter (
    gameID DECIMAL(38, 0) NOT NULL, 
    quarterNumber INT NOT NUL,
    pointsQuarterHome DECIMAL(38, 0),
    pointsQuarterAway DECIMAL(38, 0),
    PRIMARY KEY(gameID, quartertNumber),
	FOREIGN KEY (gameID) REFERENCES Game(gameID)
)

CREATE TABLE Officials (
	gameID DECIMAL(38, 0) NOT NULL, 
	officialID DECIMAL(38, 0) NOT NULL, 
	firstName VARCHAR(11) NOT NULL, 
	lastName VARCHAR(13) NOT NULL, 
	jerseyNum DECIMAL(38, 0),
	PRIMARY KEY (gameID)
);

CREATE TABLE Arena (

);


CREATE TABLE CurrentPlayerInfo (
	playerID INT PRIMARY KEY, 
	firstName VARCHAR(14) NOT NULL, 
	lastName VARCHAR(18) NOT NULL, 
	birthdate TIMESTAMP NULL, 
	school VARCHAR(31), 
	country VARCHAR(24), 
	lastAffiliation VARCHAR(41) NOT NULL, 
	heightFt VARCHAR(4), 
	heightIn VARCHAR(4), 
	weight DECIMAL(38, 0), 
	seasonExp DECIMAL(38, 0) NOT NULL, 
	jersey VARCHAR(7), 
	position VARCHAR(14), 
	rosterStatus VARCHAR(8) NOT NULL, 
	gamesPlayedCurrentSeason BOOL NOT NULL, 
	teamID INT NOT NULL, 
	activeFromYear DECIMAL(38, 0), 
	activeToYear DECIMAL(38, 0), 
	greatest75Flag BOOL NOT NULL
	FOREIGN KEY (teamID) REFERENCES Team(teamID),
);

CREATE TABLE League (
	draftID INT PRIMARY KEY,
	dleagueFlag BOOL NOT NULL, 
	nbaFlag BOOL NOT NULL, 
) 

CREATE TABLE HasDraftStats (
	season INT NOT NULL,
	roundNumber INT NOT NULL, 
	roundPick INT NOT NULL, 
	overallPick INT NOT NULL,
	teamID INT NOT NULL,
	FOREIGN KEY (teamID) REFERENCES TeamInfo(teamID),
)

CREATE TABLE DraftCombineStats (
	season INT PRIMARY KEY, 
	playerID INT PRIMARY KEY,
	position VARCHAR(5), 
	heightWOShoes DECIMAL(38, 2),
	heightWOShooesFtIn VARCHAR(10),
	heightWShoes DECIMAL(38, 2),
	heightWShoesFtIn VARCHAR(10),
	weight DECIMAL(38, 1),
	wingspan DECIMAL(38, 2),
	wingspanFtIn VARCHAR(10),
	standingReach DECIMAL(38, 1),
	standingReachFtIn VARCHAR(10),
	bodyFatPct DECIMAL(38, 2),
	handLength DECIMAL(38, 2),
	handWidth DECIMAL(38, 2),
	standingVerticalLeap DECIMAL(38, 2),
	maxVerticalLeap DECIMAL(38, 1),
	laneAgilityTime DECIMAL(38, 2),
	modifiedLaneAgilityTime DECIMAL(38, 2),
	threeQuarterSprint DECIMAL(38, 2),
	benchPress DECIMAL(38, 0),
	spotFifteenCornerLeft VARCHAR(3),
	spotFifteenBreakLeft DATE,
	spotFifteenTopKey DATE,
	spotFifteenBreakRight VARCHAR(3),
	spotFifteenCornerRight DATE,
	spotCollegeCornerLeft VARCHAR(5),
	spotCollegeBreakLeft VARCHAR(3),
	spotCollegeTopKey VARCHAR(3),
	spotCollegeBreakRight DATE,
	spotCollegeCornerRight VARCHAR(3),
	spotNbaCornerLeft VARCHAR(3),
	spotNbaBreakLeft VARCHAR(3),
	spotNbaTopKey VARCHAR(3),
	spotNbaBreakRight VARCHAR(3),
	spotNbaCornerRight VARCHAR(3),
	offDribFifteenBreakLeft VARCHAR(3),
	offDribFifteenTopKey VARCHAR(3),
	offDribFifteenBreakRight VARCHAR(4),
	offDribCollegeBreakLeft VARCHAR(5),
	offDribCollegeTopKey DATE,
	offDribCollegeBreakRight DATE,
	onMoveFifteen VARCHAR(5),
	onMoveCollege VARCHAR(5),
	FOREIGN KEY (playerID) REFERENCES CurrentPlayerInfo(playerID),
);

CREATE TABLE TeamInfo (
	teamID INT PRIMARY KEY,
	abbreviation VARCHAR(3) NOT NULL, 
	nickname VARCHAR(13) NOT NULL, 
	city VARCHAR(13) NOT NULL, 
	state VARCHAR(20) NOT NULL, 
	owner VARCHAR(29) NOT NULL, 
	yearFounded DECIMAL(38, 0) NOT NULL, 
	yearActiveTill DECIMAL(38, 0) NOT NULL,
	generalManager VARCHAR(18) NOT NULL, 
	headCoach VARCHAR(16), 
	dLeagueAffiliation VARCHAR(33) NOT NULL, 
	facebook VARCHAR(41) NOT NULL, 
	instagram VARCHAR(37) NOT NULL, 
	twitter VARCHAR(35) NOT NULL,
)

CREATE TABLE PrevTeam (
	teamID INT PRIMARY KEY, 
	city VARCHAR(17) NOT NULL, 
	nickname VARCHAR(13) NOT NULL, 
	yearFounded DECIMAL(38, 0) NOT NULL, 
	yearActiveTill DECIMAL(38, 0) NOT NULL,
	FOREIGN KEY (teamID) REFERENCES TeamInfo(teamID),
)

CREATE TABLE GamePlays (
	gameID INT PRIMARY KEY,
	eventNum INT PRIMARY KEY,
	eventMsgType VARCHAR(5) NOT NULL,
	eventMsgActionType VARCHAR(5) NOT NULL,
	period INT NOT NULL,
	wctimestring VARCHAR(8) NOT NULL,
	pctimestring VARCHAR(8) NOT NULL,
	descriptionHome VARCHAR(200),
	descriptionNeutral VARCHAR(200),
	descriptionVisitor VARCHAR(200),
	score VARCHAR(10) NOT NULL,
	scoremargin INT NOT NULL,
	videoAvailableFlag BOOL,
	FOREIGN KEY (playerID) REFERENCES CurrentPlayerInfo(playerID),
	FOREIGN KEY (teamID) REFERENCES TeamInfo(teamID),
)

CREATE TABLE GamePlaysPlayer (
	gameID INT PRIMARY KEY,
	eventNum INT PRIMARY KEY,
	playerNum INT NOT NULL,
	playerID INT NOT NULL,
	teamID INT NOT NULL,
	personType VARCHAR(5) NOT NULL,
	FOREIGN KEY (gameID) REFERENCES GamePlays(gameID),
	FOREIGN KEY (eventNum) REFERENCES GamePlays(eventNum),
)
CREATE TABLE CurrentPlayerInfo (
	playerID INT PRIMARY KEY, 
	firstName VARCHAR(14) NOT NULL, 
	lastName VARCHAR(18) NOT NULL, 
	birthdate TIMESTAMP NULL, 
	school VARCHAR(31), 
	country VARCHAR(24), 
	lastAffiliation VARCHAR(41) NOT NULL, 
	heightFt VARCHAR(4), 
	heightIn VARCHAR(4), 
	weight DECIMAL(38, 0), 
	seasonExp DECIMAL(38, 0) NOT NULL, 
	jersey VARCHAR(7), 
	position VARCHAR(14), 
	rosterStatus VARCHAR(8) NOT NULL, 
	gamesPlayedCurrentSeason BOOL NOT NULL, 
	teamID INT NOT NULL, 
	activeFromYear DECIMAL(38, 0), 
	activeToYear DECIMAL(38, 0), 
	greatest75Flag BOOL NOT NULL
	FOREIGN KEY (teamID) REFERENCES Team(teamID),
);

CREATE TABLE League (
	draftID INT PRIMARY KEY,
	dleagueFlag BOOL NOT NULL, 
	nbaFlag BOOL NOT NULL, 
) 

CREATE TABLE HasDraftStats (
	season INT NOT NULL,
	roundNumber INT NOT NULL, 
	roundPick INT NOT NULL, 
	overallPick INT NOT NULL,
	teamID INT NOT NULL,
	FOREIGN KEY (teamID) REFERENCES TeamInfo(teamID),
)

CREATE TABLE DraftCombineStats (
	season INT PRIMARY KEY, 
	playerID INT PRIMARY KEY,
	position VARCHAR(5), 
	heightWOShoes DECIMAL(38, 2),
	heightWOShooesFtIn VARCHAR(10),
	heightWShoes DECIMAL(38, 2),
	heightWShoesFtIn VARCHAR(10),
	weight DECIMAL(38, 1),
	wingspan DECIMAL(38, 2),
	wingspanFtIn VARCHAR(10),
	standingReach DECIMAL(38, 1),
	standingReachFtIn VARCHAR(10),
	bodyFatPct DECIMAL(38, 2),
	handLength DECIMAL(38, 2),
	handWidth DECIMAL(38, 2),
	standingVerticalLeap DECIMAL(38, 2),
	maxVerticalLeap DECIMAL(38, 1),
	laneAgilityTime DECIMAL(38, 2),
	modifiedLaneAgilityTime DECIMAL(38, 2),
	threeQuarterSprint DECIMAL(38, 2),
	benchPress DECIMAL(38, 0),
	spotFifteenCornerLeft VARCHAR(3),
	spotFifteenBreakLeft DATE,
	spotFifteenTopKey DATE,
	spotFifteenBreakRight VARCHAR(3),
	spotFifteenCornerRight DATE,
	spotCollegeCornerLeft VARCHAR(5),
	spotCollegeBreakLeft VARCHAR(3),
	spotCollegeTopKey VARCHAR(3),
	spotCollegeBreakRight DATE,
	spotCollegeCornerRight VARCHAR(3),
	spotNbaCornerLeft VARCHAR(3),
	spotNbaBreakLeft VARCHAR(3),
	spotNbaTopKey VARCHAR(3),
	spotNbaBreakRight VARCHAR(3),
	spotNbaCornerRight VARCHAR(3),
	offDribFifteenBreakLeft VARCHAR(3),
	offDribFifteenTopKey VARCHAR(3),
	offDribFifteenBreakRight VARCHAR(4),
	offDribCollegeBreakLeft VARCHAR(5),
	offDribCollegeTopKey DATE,
	offDribCollegeBreakRight DATE,
	onMoveFifteen VARCHAR(5),
	onMoveCollege VARCHAR(5),
	FOREIGN KEY (playerID) REFERENCES CurrentPlayerInfo(playerID),
);

CREATE TABLE TeamInfo (
	teamID INT PRIMARY KEY,
	abbreviation VARCHAR(3) NOT NULL, 
	nickname VARCHAR(13) NOT NULL, 
	city VARCHAR(13) NOT NULL, 
	state VARCHAR(20) NOT NULL, 
	owner VARCHAR(29) NOT NULL, 
	yearFounded DECIMAL(38, 0) NOT NULL, 
	yearActiveTill DECIMAL(38, 0) NOT NULL,
	generalManager VARCHAR(18) NOT NULL, 
	headCoach VARCHAR(16), 
	dLeagueAffiliation VARCHAR(33) NOT NULL, 
	facebook VARCHAR(41) NOT NULL, 
	instagram VARCHAR(37) NOT NULL, 
	twitter VARCHAR(35) NOT NULL,
)

CREATE TABLE PrevTeam (
	teamID INT PRIMARY KEY, 
	city VARCHAR(17) NOT NULL, 
	nickname VARCHAR(13) NOT NULL, 
	yearFounded DECIMAL(38, 0) NOT NULL, 
	yearActiveTill DECIMAL(38, 0) NOT NULL,
	FOREIGN KEY (teamID) REFERENCES TeamInfo(teamID),
)

CREATE TABLE GamePlays (
	gameID INT PRIMARY KEY,
	eventNum INT PRIMARY KEY,
	eventMsgType VARCHAR(5) NOT NULL,
	eventMsgActionType VARCHAR(5) NOT NULL,
	period INT NOT NULL,
	wctimestring VARCHAR(8) NOT NULL,
	pctimestring VARCHAR(8) NOT NULL,
	descriptionHome VARCHAR(200),
	descriptionNeutral VARCHAR(200),
	descriptionVisitor VARCHAR(200),
	score VARCHAR(10) NOT NULL,
	scoremargin INT NOT NULL,
	videoAvailableFlag BOOL,
	FOREIGN KEY (playerID) REFERENCES CurrentPlayerInfo(playerID),
	FOREIGN KEY (teamID) REFERENCES TeamInfo(teamID),
)


-- LOAD tables

-- Game table
--LOAD DATA LOCAL INFILE 'game.csv' IGNORE INTO
--TABLE Game FIELDS TERMINATED BY ',' IGNORE 1 LINES (
--    season_id,team_id_home,team_abbreviation_home,
--	team_name_home,game_id,game_date,matchup_home,wl_home,min,fgm_home,fga_home,fg_pct_home,fg3m_home,fg3a_home,fg3_pct_home,ftm_home,fta_home,ft_pct_home,oreb_home,dreb_home,reb_home,ast_home,stl_home,blk_home,tov_home,pf_home,pts_home,plus_minus_home,video_available_home,team_id_away,team_abbreviation_away,team_name_away,matchup_away,wl_away,fgm_away,fga_away,fg_pct_away,fg3m_away,fg3a_away,fg3_pct_away,ftm_away,fta_away,ft_pct_away,oreb_away,dreb_away,reb_away,ast_away,stl_away,blk_away,tov_away,pf_away,pts_away,plus_minus_away,video_available_away,season_type
--)

-- Inactive Players
LOAD DATA LOCAL INFILE 'inactive_players.csv' IGNORE INTO
TABLE InactivePlayers FIELDS TERMINATED BY ',' IGNORE 1 LINES (
    gameID,playerID,@first_name,@last_name,jerseyNum,teamID,@team_city,@team_name,@team_abbreviation
)
-- consider checks to make sure the ommited team fields are the same as the ones in the team table

-- Create temporary table LineScore
DROP TABLE IF EXISTS LineScore

CREATE TABLE LineScore (
	game_date_est TIMESTAMP NULL, 
	game_sequence DECIMAL(38, 0), 
	game_id DECIMAL(38, 0) NOT NULL, 
	team_id_home DECIMAL(38, 0) NOT NULL, 
	team_abbreviation_home VARCHAR(3) NOT NULL, 
	team_city_name_home VARCHAR(25) NOT NULL, 
	team_nickname_home VARCHAR(22) NOT NULL, 
	team_wins_losses_home VARCHAR(5) NOT NULL, 
	pts_qtr1_home DECIMAL(38, 0), 
	pts_qtr2_home DECIMAL(38, 0), 
	pts_qtr3_home DECIMAL(38, 0), 
	pts_qtr4_home DECIMAL(38, 0), 
	pts_ot1_home DECIMAL(38, 0), 
	pts_ot2_home DECIMAL(38, 0), 
	pts_ot3_home DECIMAL(38, 0), 
	pts_ot4_home DECIMAL(38, 0), 
	pts_ot5_home DECIMAL(38, 0), 
	pts_ot6_home DECIMAL(38, 0), 
	pts_ot7_home DECIMAL(38, 0), 
	pts_ot8_home DECIMAL(38, 0), 
	pts_ot9_home DECIMAL(38, 0), 
	pts_ot10_home DECIMAL(38, 0), 
	pts_home DECIMAL(38, 0) NOT NULL, 
	team_id_away DECIMAL(38, 0) NOT NULL, 
	team_abbreviation_away VARCHAR(3) NOT NULL, 
	team_city_name_away VARCHAR(25) NOT NULL, 
	team_nickname_away VARCHAR(25) NOT NULL, 
	team_wins_losses_away VARCHAR(5) NOT NULL, 
	pts_qtr1_away DECIMAL(38, 0), 
	pts_qtr2_away DECIMAL(38, 0), 
	pts_qtr3_away DECIMAL(38, 0), 
	pts_qtr4_away DECIMAL(38, 0), 
	pts_ot1_away DECIMAL(38, 0), 
	pts_ot2_away DECIMAL(38, 0), 
	pts_ot3_away DECIMAL(38, 0), 
	pts_ot4_away DECIMAL(38, 0), 
	pts_ot5_away DECIMAL(38, 0), 
	pts_ot6_away DECIMAL(38, 0), 
	pts_ot7_away DECIMAL(38, 0), 
	pts_ot8_away DECIMAL(38, 0), 
	pts_ot9_away DECIMAL(38, 0), 
	pts_ot10_away DECIMAL(38, 0), 
	pts_away DECIMAL(38, 0) NOT NULL,
	PRIMARY KEY(game_id)
);

LOAD DATA LOCAL INFILE 'line_score.csv' IGNORE INTO
TABLE LineScore FIELDS TERMINATED BY ',' IGNORE 1 LINES ()

-- PointsPerQuarter
INSERT INTO PointsPerQuarter(
	gameID, 
	quarterNumber,
	pointsQuarterHome, 
	pointsQuarterAway
)
SELECT game_id AS gameID, 1 as quarterNumber, pts_qtr1_home AS pointsQuarterHome, pts_qtr1_away AS pointsQuarterAway FROM LineScore
UNION ALL
SELECT game_id AS gameID, 2 as quarterNumber, pts_qtr2_home AS pointsQuarterHome, pts_qtr2_away AS pointsQuarterAway FROM LineScore
UNION ALL
SELECT game_id AS gameID, 3 as quarterNumber, pts_qtr3_home AS pointsQuarterHome, pts_qtr3_away AS pointsQuarterAway FROM LineScore
UNION ALL
SELECT game_id AS gameID, 4 as quarterNumber, pts_qtr4_home AS pointsQuarterHome, pts_qtr4_away AS pointsQuarterAway FROM LineScore;
DROP TABLE IF EXISTS LineScore;

-- OvertimePoints
INSERT INTO OvertimePoints(
	gameID, 
	otNumber, 
	pointsOtHome, 
	pointsOtAway 
)
SELECT game_id AS gameID, 1 as otNumber, pts_ot1_home AS pointsOtHome, pts_ot1_away AS pointsOtAway FROM LineScore
UNION ALL
SELECT game_id AS gameID, 2 as otNumber, pts_ot2_home AS pointsOtHome, pts_ot2_away AS pointsOtAway FROM LineScore
UNION ALL
SELECT game_id AS gameID, 3 as otNumber, pts_ot3_home AS pointsOtHome, pts_ot3_away AS pointsOtAway FROM LineScore
UNION ALL
SELECT game_id AS gameID, 4 as otNumber, pts_ot4_home AS pointsOtHome, pts_ot4_away AS pointsOtAway FROM LineScore
UNION ALL
SELECT game_id AS gameID, 5 as otNumber, pts_ot5_home AS pointsOtHome, pts_ot5_away AS pointsOtAway FROM LineScore
UNION ALL
SELECT game_id AS gameID, 6 as otNumber, pts_ot6_home AS pointsOtHome, pts_ot6_away AS pointsOtAway FROM LineScore
UNION ALL
SELECT game_id AS gameID, 7 as otNumber, pts_ot7_home AS pointsOtHome, pts_ot7_away AS pointsOtAway FROM LineScore
UNION ALL
SELECT game_id AS gameID, 8 as otNumber, pts_ot8_home AS pointsOtHome, pts_ot8_away AS pointsOtAway FROM LineScore
UNION ALL
SELECT game_id AS gameID, 9 as otNumber, pts_ot9_home AS pointsOtHome, pts_ot9_away AS pointsOtAway FROM LineScore
UNION ALL
SELECT game_id AS gameID, 10 as otNumber, pts_ot10_home AS pointsOtHome, pts_ot10_away AS pointsOtAway FROM LineScore;

-- Broadcast
LOAD DATA LOCAL INFILE 'game_summary.csv' IGNORE INTO
TABLE Broadcast FIELDS TERMINATED BY ',' IGNORE 1 LINES (
    @game_date_est, 
	@game_sequence , 
	gameID, 
	@game_status_id , 
	@game_status_text, 
	@gamecode , 
	@home_team_id, 
	@visitor_team_id, 
	@season, 
	livePeriod, 
	livePCTime, 
	natlTVBroadcasterAbbreviation, 
	livePeriodTimeBcast,  
	whStatus
);

-- Officials
LOAD DATA LOCAL INFILE 'officials.csv' IGNORE INTO
TABLE Officials FIELDS TERMINATED BY ',' IGNORE 1 LINES ();



-- Drop temporary tables
DROP TABLE IF EXISTS LineScore;
