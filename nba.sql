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

DROP TABLE IF EXISTS CurrentPlayerInfo;

CREATE TABLE CurrentPlayerInfo (
	playerID INT PRIMARY KEY, 
	firstName VARCHAR(14) NOT NULL, 
	lastName VARCHAR(18) NOT NULL, 
	birthdate DATE, 
	school VARCHAR(31), 
	country VARCHAR(24), 
	lastAffiliation VARCHAR(41) NOT NULL, 
	height VARCHAR(4), 
	-- heightIn VARCHAR(4), 
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
	-- FOREIGN KEY (teamID) REFERENCES Team(teamID)
);

LOAD DATA LOCAL INFILE 'common_player_info.csv' 
INTO TABLE CurrentPlayerInfo 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES 
(
    playerID, 
    firstName, 
    lastName, 
    @display_first_last, 
    @display_last_comma_first, 
    @display_fi_last, 
    @player_slug, 
    birthdate,
    school, 
    country, 
    lastAffiliation, 
    height, 
    weight, 
    seasonExp, 
    jersey, 
    position, 
    rosterStatus, 
    gamesPlayedCurrentSeason, 
    teamID,
    @team_name, 
    @team_abbreviation, 
    @team_code, 
    @team_city, 
    @playercode, 
    activeFromYear, 
    activeToYear, 
    -- TODO: add this to the table
    @dleague_flag, 
    @nba_flag, 
    @games_played_flag,
    @draft_year, 
    @draft_round, 
    @draft_number, 
    greatest75Flag
)

DROP TABLE IF EXISTS HasDraftStats;

CREATE TABLE HasDraftStats (
	season INT NOT NULL,
	roundNumber INT NOT NULL, 
	roundPick INT NOT NULL, 
	overallPick INT NOT NULL,
	teamID INT NOT NULL
	-- FOREIGN KEY (teamID) REFERENCES TeamInfo(teamID)
)

LOAD DATA LOCAL INFILE 'draft_history.csv' 
INTO TABLE HasDraftStats 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES 
(
    @person_id,
	@player_name,
	season,
	roundNumber,
	roundPick,
	overallPick,
	@draft_type,
	teamID,
	@team_city,
	@team_name,
	@team_abbreviation,
	@organization,
	@organization_type,
	@player_profile_flag
)

DROP TABLE IF EXISTS DraftCombineStats;

CREATE TABLE DraftCombineStats (
	season INT,
	playerID INT,
	position VARCHAR(5), 
	heightWOShoes DECIMAL(38, 2),
	heightWOShooesFtIn VARCHAR(10),
	-- TODO: 0.00 should default to NULL
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
	-- drop these below?
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
	PRIMARY KEY (season, playerID)
	-- FOREIGN KEY (playerID) REFERENCES CurrentPlayerInfo(playerID),
);

LOAD DATA LOCAL INFILE 'draft_combine_stats.csv' 
INTO TABLE DraftCombineStats 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES 
(
    season, 
    playerID, 
    @first_name, 
    @last_name, 
    @player_name, 
    position, 
    heightWOShoes, 
    heightWOShooesFtIn, 
    heightWShoes, 
    heightWShoesFtIn, 
    weight, 
    wingspan, 
    wingspanFtIn, 
    standingReach, 
    standingReachFtIn, 
    bodyFatPct, 
    handLength, 
    handWidth, 
    standingVerticalLeap, 
    maxVerticalLeap, 
    laneAgilityTime, 
    modifiedLaneAgilityTime, 
    threeQuarterSprint, 
    benchPress,
    spotFifteenCornerLeft, 
    spotFifteenBreakLeft, 
    spotFifteenTopKey, 
    spotFifteenBreakRight, 
    spotFifteenCornerRight, 
    spotCollegeCornerLeft, 
    spotCollegeBreakLeft, 
    spotCollegeTopKey, 
    spotCollegeBreakRight, 
    spotCollegeCornerRight, 
    spotNbaCornerLeft, 
    spotNbaBreakLeft, 
    spotNbaTopKey, 
    spotNbaBreakRight, 
    spotNbaCornerRight, 
    offDribFifteenBreakLeft, 
    offDribFifteenTopKey,
    offDribFifteenBreakRight, 
    offDribCollegeBreakLeft, 
    offDribCollegeTopKey, 
    offDribCollegeBreakRight, 
    onMoveFifteen, 
    onMoveCollege
)

DROP TABLE IF EXISTS TeamInfo;

CREATE TABLE TeamInfo (
	teamID INT PRIMARY KEY,
	abbreviation VARCHAR(3) NOT NULL, 
	nickname VARCHAR(13) NOT NULL, 
	city VARCHAR(13) NOT NULL, 
	state VARCHAR(20) NOT NULL, 
	yearFounded DECIMAL(38, 0) NOT NULL, 
	owner VARCHAR(29) NOT NULL, 
	generalManager VARCHAR(18) NOT NULL, 
	headCoach VARCHAR(16), 
	dLeagueAffiliation VARCHAR(33) NOT NULL, 
	facebook VARCHAR(41) NOT NULL,
	instagram VARCHAR(37) NOT NULL,
	twitter VARCHAR(35) NOT NULL
)

LOAD DATA LOCAL INFILE 'team.csv'
INTO TABLE TeamInfo FIELDS TERMINATED BY ',' IGNORE 1 LINES (
	teamID, 
    @full_name, 
    abbreviation, 
    nickname, 
    city, 
    state, 
    yearFounded
)

DROP TABLE IF EXISTS tempTeamInfo;

CREATE TEMPORARY TABLE tempTeamInfo (
    teamID INT,
    owner VARCHAR(29), 
    generalManager VARCHAR(18), 
    headCoach VARCHAR(16), 
    dLeagueAffiliation VARCHAR(33), 
    facebook VARCHAR(41), 
    instagram VARCHAR(37), 
    twitter VARCHAR(35)
);

LOAD DATA LOCAL INFILE 'team_details.csv'
INTO TABLE tempTeamInfo 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES 
(
    teamID, 
    @abbreviation, 
    @nickname, 
    @yearfounded, 
    @city, 
    @arena, 
    @arenacapacity, 
    owner, 
    generalManager, 
    headCoach, 
    dLeagueAffiliation, 
    facebook, 
    instagram, 
    twitter
)

UPDATE TeamInfo 
INNER JOIN tempTeamInfo ON TeamInfo.teamID = tempTeamInfo.teamID
SET 
    TeamInfo.owner = tempTeamInfo.owner, 
    TeamInfo.generalManager = tempTeamInfo.generalManager, 
    TeamInfo.headCoach = tempTeamInfo.headCoach, 
    TeamInfo.dLeagueAffiliation = tempTeamInfo.dLeagueAffiliation, 
    TeamInfo.facebook = tempTeamInfo.facebook, 
    TeamInfo.instagram = tempTeamInfo.instagram, 
    TeamInfo.twitter = tempTeamInfo.twitter;

-- DROP TABLE IF EXISTS PrevTeam;

-- CREATE TABLE PrevTeam (
-- 	teamID INT PRIMARY KEY, 
-- 	city VARCHAR(17) NOT NULL, 
-- 	nickname VARCHAR(13) NOT NULL, 
-- 	yearFounded DECIMAL(38, 0) NOT NULL, 
-- 	yearActiveTill DECIMAL(38, 0) NOT NULL
-- 	-- FOREIGN KEY (teamID) REFERENCES TeamInfo(teamID),
-- )

-- DROP TABLE IF EXISTS tempTeamHistory;

-- CREATE TABLE tempTeamHistory (
-- 	teamID DECIMAL(38, 0) NOT NULL, 
-- 	city VARCHAR(17) NOT NULL, 
-- 	nickname VARCHAR(13) NOT NULL, 
-- 	yearFounded DECIMAL(38, 0) NOT NULL, 
-- 	yearActiveTill DECIMAL(38, 0) NOT NULL
-- );

-- LOAD DATA LOCAL INFILE 'team_history.csv' IGNORE INTO
-- TABLE tempTeamHistory FIELDS TERMINATED BY ',' IGNORE 1 LINES ()

-- INSERT INTO PrevTeam (teamID, teamNum, city, nickname, yearFounded, yearActiveTill)
-- SELECT teamID, COUNT(*) OVER (PARTITION BY teamID ORDER BY yearFounded) as teamNum, city, nickname, yearFounded, yearActiveTill
-- FROM tempTeamHistory;

DROP TABLE IF EXISTS GamePlays;

CREATE TABLE GamePlays (
	gameID INT,
	eventNum INT,
	eventMsgType VARCHAR(5) NOT NULL,
	eventMsgActionType VARCHAR(5) NOT NULL,
	period INT NOT NULL,
	wctimestring VARCHAR(8) NOT NULL,
	pctimestring VARCHAR(8) NOT NULL,
	descriptionHome VARCHAR(200),
	descriptionNeutral VARCHAR(200),
	descriptionVisitor VARCHAR(200),
	score VARCHAR(10) NOT NULL,
	scoreMargin INT NOT NULL,
	videoAvailableFlag BOOL,
	PRIMARY KEY (gameID, eventNum)
	-- FOREIGN KEY (playerID) REFERENCES CurrentPlayerInfo(playerID),
	-- FOREIGN KEY (teamID) REFERENCES TeamInfo(teamID)
)

LOAD DATA LOCAL INFILE 'play_by_play.csv'
INTO TABLE GamePlays 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES 
(
    gameID, 
    eventNum, 
    eventMsgType, 
    eventMsgActionType, 
    period, 
    wctimestring, 
    pctimestring, 
    descriptionHome, 
    descriptionNeutral, 
    descriptionVisitor, 
    score, 
    scoreMargin, 
    @person1type, 
    @player1_id, 
    @player1_name, 
    @player1_team_id, 
    @player1_team_city, 
    @player1_team_nickname, 
    @player1_team_abbreviation, 
    @person2type, 
    @player2_id, 
    @player2_name, 
    @player2_team_id,
    @player2_team_city, 
    @player2_team_nickname, 
    @player2_team_abbreviation, 
    @person3type, 
    @player3_id, 
    @player3_name,
    @player3_team_id, 
    @player3_team_city, 
    @player3_team_nickname, 
    @player3_team_abbreviation, 
    videoAvailableFlag
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