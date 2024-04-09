-- Select database to connect to
USE nba_database;

-- Drop existing tables
DROP TABLE IF EXISTS CurrentPlayerInfo;
DROP TABLE IF EXISTS HasDraftStats;
DROP TABLE IF EXISTS DraftCombineStats;
DROP TABLE IF EXISTS TeamInfo;
DROP TABLE IF EXISTS tempTeamInfo;
DROP TABLE IF EXISTS PrevTeam;
DROP TABLE IF EXISTS tempTeamHistory;
DROP TABLE IF EXISTS GamePlays;
DROP TABLE IF EXISTS GameTmp;
DROP TABLE IF EXISTS GameSummaryTmp;
DROP TABLE IF EXISTS GameInfoTmp;
DROP TABLE IF EXISTS OtherStatsTmp;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Outcomes;
DROP TABLE IF EXISTS InactivePlayers;
DROP TABLE IF EXISTS OvertimePoints;
DROP TABLE IF EXISTS PointsPerQuarter;
DROP TABLE IF EXISTS Broadcast;
DROP TABLE IF EXISTS Officials;
DROP TABLE IF EXISTS LineScore


-- Create tables
CREATE TABLE CurrentPlayerInfo (
	playerID INT PRIMARY KEY, 
	firstName VARCHAR(14) NOT NULL, 
	lastName VARCHAR(18) NOT NULL, 
	birthdate DATE, 
	school VARCHAR(31), 
	country VARCHAR(24), 
	lastAffiliation VARCHAR(41) NOT NULL, 
	height VARCHAR(6), 
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
);

CREATE INDEX idx_currentplayerinfo_teamid
ON CurrentPlayerInfo(teamID);

CREATE TABLE HasDraftStats (
	season INT NOT NULL,
	roundNumber INT NOT NULL, 
	roundPick INT NOT NULL, 
	overallPick INT NOT NULL,
	teamID INT NOT NULL
)

CREATE TABLE DraftCombineStats (
	season INT,
	playerID INT,
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
	PRIMARY KEY (season, playerID)
);

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

CREATE INDEX idx_nickname_city ON TeamInfo (nickname, city);

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

CREATE TABLE PrevTeam (
	teamID INT, 
	city VARCHAR(17) NOT NULL, 
	nickname VARCHAR(13) NOT NULL, 
	yearFounded DECIMAL(38, 0) NOT NULL, 
	yearActiveTill DECIMAL(38, 0) NOT NULL,
    PRIMARY KEY(teamID, city, nickname, yearFounded)
)

CREATE TABLE tempTeamHistory (
	teamID DECIMAL(38, 0) NOT NULL, 
	city VARCHAR(17) NOT NULL, 
	nickname VARCHAR(13) NOT NULL, 
	yearFounded DECIMAL(38, 0) NOT NULL, 
	yearActiveTill DECIMAL(38, 0) NOT NULL
);

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
	player1_id INT, 
	player1_name VARCHAR(50), 
	player1_team_id INT, 
	player2_id INT, 
	player2_name VARCHAR(50), 
	player2_team_id INT,
	player3_id INT, 
	player3_name VARCHAR(50), 
	player3_team_id INT,
	videoAvailableFlag BOOL,
	PRIMARY KEY (gameID, eventNum)
)

CREATE TABLE Outcomes (
	gameID DECIMAL(38, 0) NOT NULL, 
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
    teamWinsLossesHome VARCHAR(5) NOT NULL
);

CREATE TABLE Arena (
	gameID DECIMAL(38, 0) NOT NULL, 
	name VARCHAR(11) NOT NULL, 
	capacity DECIMAL(38, 0)
);

CREATE TABLE Broadcast(
	gameID DECIMAL(38, 0) NOT NULL, 
	livePeriod DECIMAL(38, 0) NOT NULL, 
	livePCTime DATETIME, 
	natlTVBroadcasterAbbreviation VARCHAR(13), 
	livePeriodTimeBcast VARCHAR(24) NOT NULL, 
	whStatus BOOL NOT NULL,
	PRIMARY KEY (gameID)
);

CREATE TABLE OvertimePoints (
  gameID DECIMAL(38, 0) NOT NULL, 
	otNumber INT NOT NULL, 
	pointsOtHome DECIMAL(38, 0), 
	pointsOtAway DECIMAL(38, 0), 
	PRIMARY KEY (gameID, otNumber) 
);

CREATE TABLE InactivePlayers (
    gameID DECIMAL(38, 0) NOT NULL, 
    playerID DECIMAL(38, 0) NOT NULL, 
	jerseyNum DECIMAL(38, 0) DEFAULT NULL, 
	teamID DECIMAL(38, 0) NOT NULL, 
    PRIMARY KEY (gameID, playerID)
);

CREATE TABLE PointsPerQuarter (
    gameID DECIMAL(38, 0) NOT NULL, 
    quarterNumber INT NOT NULL,
    pointsQuarterHome DECIMAL(38, 0),
    pointsQuarterAway DECIMAL(38, 0),
    PRIMARY KEY(gameID, quarterNumber)
)

CREATE TABLE Officials (
	gameID DECIMAL(38, 0) NOT NULL, 
	officialID DECIMAL(38, 0) NOT NULL, 
	firstName VARCHAR(11) NOT NULL, 
	lastName VARCHAR(13) NOT NULL, 
	jerseyNum DECIMAL(38, 0),
	PRIMARY KEY (gameID)
);

CREATE TABLE LineScore (
	game_date_est DATETIME NULL, 
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

CREATE TABLE Game (
	gameID DECIMAL(38, 0) NOT NULL, 
	season DECIMAL(38, 0), 
	gameDate DATETIME ,
	gameTime VARCHAR(6),
	attendance DECIMAL(38, 0), 
	min DECIMAL(38, 0) , 
	seasonType VARCHAR(14) ,
	sequence DECIMAL(38, 0), 
    statusID DECIMAL(38, 0) , 
	statusText VARCHAR(20), 
	leadChanges DECIMAL(38, 0), 
	timesTied DECIMAL(38, 0), 
    teamIDHome DECIMAL(38, 0) NOT NULL, 
	teamIDAway DECIMAL(38, 0) NOT NULL, 
	PRIMARY KEY (gameID)
);

CREATE TRIGGER CheckTeamsAwayHome
BEFORE INSERT ON Game
FOR EACH ROW
BEGIN
    IF NEW.teamIDAway = NEW.teamIDHome THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'teamIDAway cannot be the same as teamIDHome';
    END IF;
END;

CREATE TABLE GameTmp (
	season_id DECIMAL(38, 0) NOT NULL, 
	team_id_home DECIMAL(38, 0) NOT NULL, 
	team_abbreviation_home VARCHAR(3) NOT NULL, 
	team_name_home VARCHAR(33) NOT NULL, 
	game_id DECIMAL(38, 0) NOT NULL, 
	game_date DATETIME NULL, 
	matchup_home VARCHAR(11) NOT NULL, 
	wl_home VARCHAR(1), 
	min DECIMAL(38, 0) NOT NULL, 
	fgm_home DECIMAL(38, 0), 
	fga_home DECIMAL(38, 0), 
	fg_pct_home DECIMAL(38, 3), 
	fg3m_home DECIMAL(38, 0), 
	fg3a_home DECIMAL(38, 0), 
	fg3_pct_home DECIMAL(38, 3), 
	ftm_home DECIMAL(38, 0), 
	fta_home DECIMAL(38, 0), 
	ft_pct_home DECIMAL(38, 3), 
	oreb_home DECIMAL(38, 0), 
	dreb_home DECIMAL(38, 0), 
	reb_home DECIMAL(38, 0), 
	ast_home DECIMAL(38, 0), 
	stl_home DECIMAL(38, 0), 
	blk_home DECIMAL(38, 0), 
	tov_home DECIMAL(38, 0), 
	pf_home DECIMAL(38, 0), 
	pts_home DECIMAL(38, 0) NOT NULL, 
	plus_minus_home DECIMAL(38, 0) NOT NULL, 
	video_available_home BOOL NOT NULL, 
	team_id_away DECIMAL(38, 0) NOT NULL, 
	team_abbreviation_away VARCHAR(3) NOT NULL, 
	team_name_away VARCHAR(33) NOT NULL, 
	matchup_away VARCHAR(9) NOT NULL, 
	wl_away VARCHAR(1), 
	fgm_away DECIMAL(38, 0), 
	fga_away DECIMAL(38, 0), 
	fg_pct_away DECIMAL(38, 3), 
	fg3m_away DECIMAL(38, 0), 
	fg3a_away DECIMAL(38, 0), 
	fg3_pct_away DECIMAL(38, 3), 
	ftm_away DECIMAL(38, 0), 
	fta_away DECIMAL(38, 0), 
	ft_pct_away DECIMAL(38, 3), 
	oreb_away DECIMAL(38, 0), 
	dreb_away DECIMAL(38, 0), 
	reb_away DECIMAL(38, 0), 
	ast_away DECIMAL(38, 0), 
	stl_away DECIMAL(38, 0), 
	blk_away DECIMAL(38, 0), 
	tov_away DECIMAL(38, 0), 
	pf_away DECIMAL(38, 0), 
	pts_away DECIMAL(38, 0) NOT NULL, 
	plus_minus_away DECIMAL(38, 0) NOT NULL, 
	video_available_away BOOL NOT NULL, 
	season_type VARCHAR(14) NOT NULL
);

CREATE TABLE GameSummaryTmp (
	game_date_est DATETIME NULL, 
	game_sequence DECIMAL(38, 0), 
	game_id DECIMAL(38, 0) NOT NULL, 
	game_status_id DECIMAL(38, 0) NOT NULL, 
	game_status_text VARCHAR(20), 
	gamecode VARCHAR(15) NOT NULL, 
	home_team_id DECIMAL(38, 0) NOT NULL, 
	visitor_team_id DECIMAL(38, 0) NOT NULL, 
	season DECIMAL(38, 0) NOT NULL, 
	live_period DECIMAL(38, 0) NOT NULL, 
	live_pc_time DATETIME, 
	natl_tv_broadcaster_abbreviation VARCHAR(13), 
	live_period_time_bcast VARCHAR(24) NOT NULL, 
	wh_status BOOL NOT NULL
);

CREATE TABLE GameInfoTmp (
	game_id DECIMAL(38, 0) NOT NULL, 
	game_date DATETIME NULL, 
	attendance DECIMAL(38, 0), 
	game_time VARCHAR(6)
);

CREATE TABLE OtherStatsTmp (
	game_id DECIMAL(38, 0) NOT NULL, 
	league_id DECIMAL(38, 0) NOT NULL, 
	team_id_home DECIMAL(38, 0) NOT NULL, 
	team_abbreviation_home VARCHAR(3) NOT NULL, 
	team_city_home VARCHAR(25) NOT NULL, 
	pts_paint_home DECIMAL(38, 0) NOT NULL, 
	pts_2nd_chance_home DECIMAL(38, 0) NOT NULL, 
	pts_fb_home DECIMAL(38, 0) NOT NULL, 
	largest_lead_home DECIMAL(38, 0) NOT NULL, 
	lead_changes DECIMAL(38, 0) NOT NULL, 
	times_tied DECIMAL(38, 0) NOT NULL, 
	team_turnovers_home DECIMAL(38, 0), 
	total_turnovers_home DECIMAL(38, 0), 
	team_rebounds_home DECIMAL(38, 0), 
	pts_off_to_home DECIMAL(38, 0), 
	team_id_away DECIMAL(38, 0) NOT NULL, 
	team_abbreviation_away VARCHAR(3) NOT NULL, 
	team_city_away VARCHAR(25) NOT NULL, 
	pts_paint_away DECIMAL(38, 0) NOT NULL, 
	pts_2nd_chance_away DECIMAL(38, 0) NOT NULL, 
	pts_fb_away DECIMAL(38, 0) NOT NULL, 
	largest_lead_away DECIMAL(38, 0) NOT NULL, 
	team_turnovers_away DECIMAL(38, 0), 
	total_turnovers_away DECIMAL(38, 0), 
	team_rebounds_away DECIMAL(38, 0), 
	pts_off_to_away DECIMAL(38, 0)
);

ALTER TABLE OtherStatsTmp
ADD FOREIGN KEY (team_id_home) REFERENCES TeamInfo(teamID);
ALTER TABLE OtherStatsTmp
ADD FOREIGN KEY (team_id_away) REFERENCES TeamInfo(teamID);
ALTER TABLE OtherStatsTmp
ADD FOREIGN KEY (game_id) REFERENCES Game(gameID);
ALTER TABLE GameInfoTmp
ADD FOREIGN KEY (game_id) REFERENCES Game(gameID);
ALTER TABLE GameSummaryTmp
ADD FOREIGN KEY (game_id) REFERENCES Game(gameID);
ALTER TABLE GameSummaryTmp
ADD FOREIGN KEY (home_team_id) REFERENCES Game(gameID);
ALTER TABLE CurrentPlayerInfo
ADD FOREIGN KEY (teamID) REFERENCES TeamInfo(teamID);
ALTER TABLE HasDraftStats
ADD FOREIGN KEY (teamID) REFERENCES HasDraftStats(teamID);
ALTER TABLE DraftCombineStats
ADD FOREIGN KEY (playerID) REFERENCES CurrentPlayerInfo(playerID);
ALTER TABLE tempTeamInfo
ADD FOREIGN KEY (teamID) REFERENCES TeamInfo(teamID);
ALTER TABLE Game
ADD FOREIGN KEY (teamIDHome) REFERENCES TeamInfo(teamID);
ALTER TABLE Game
ADD FOREIGN KEY (teamIDAway) REFERENCES TeamInfo(teamID);
ALTER TABLE PrevTeam
ADD FOREIGN KEY (teamID) REFERENCES TeamInfo(teamID);
ALTER TABLE tempTeamHistory
ADD FOREIGN KEY (teamID) REFERENCES TeamInfo(teamID);
ALTER TABLE LineScore
ADD FOREIGN KEY (team_id_home) REFERENCES TeamInfo(teamID);
ALTER TABLE LineScore
ADD FOREIGN KEY (team_id_away) REFERENCES TeamInfo(teamID);
ALTER TABLE Outcomes
ADD FOREIGN KEY (gameID) REFERENCES Game(gameID);
ALTER TABLE Arena
ADD FOREIGN KEY (gameID) REFERENCES Game(gameID);
ALTER TABLE Broadcast
ADD FOREIGN KEY (gameID) REFERENCES Game(gameID);
ALTER TABLE OvertimePoints
ADD FOREIGN KEY (gameID) REFERENCES Game(gameID);
ALTER TABLE GamePlays
ADD FOREIGN KEY (playerID) REFERENCES CurrentPlayerInfo(playerID);
ALTER TABLE GamePlays
ADD FOREIGN KEY (teamID) REFERENCES TeamInfo(teamID);
ALTER TABLE PointsPerQuarter
ADD FOREIGN KEY (gameID) REFERENCES Game(gameID);
ALTER TABLE Officials
ADD FOREIGN KEY (gameID) REFERENCES Game(gameID);
ALTER TABLE InactivePlayers
ADD FOREIGN KEY (gameID) REFERENCES Game(gameID);
ALTER TABLE InactivePlayers
ADD FOREIGN KEY (playerID) REFERENCES CurrentPlayerInfo(playerID);
ALTER TABLE PointsPerQuarter
ADD FOREIGN KEY (gameID) REFERENCES Game(gameID);


-- Load data into tables
-- Need to specify local path to csv files
LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/common_player_info.csv' 
INTO TABLE CurrentPlayerInfo 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
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

LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/draft_history.csv' 
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

LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/draft_combine_stats.csv' 
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

LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/team.csv'
INTO TABLE TeamInfo FIELDS TERMINATED BY ',' IGNORE 1 LINES (
	teamID, 
    @full_name, 
    abbreviation, 
    nickname, 
    city, 
    state, 
    yearFounded
)

LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/team_details.csv'
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

LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/play_by_play.csv'
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
    player1_id, 
    player1_name, 
    player1_team_id, 
    @player1_team_city, 
    @player1_team_nickname, 
    @player1_team_abbreviation, 
    @person2type, 
    player2_name, 
    player2_name, 
    player2_team_id,
    @player2_team_city, 
    @player2_team_nickname, 
    @player2_team_abbreviation, 
    @person3type, 
    player3_id, 
    player3_name,
    player3_team_id, 
    @player3_team_city, 
    @player3_team_nickname, 
    @player3_team_abbreviation, 
    videoAvailableFlag
)

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

LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/game.csv' IGNORE INTO
TABLE GameTmp FIELDS TERMINATED BY ',' IGNORE 1 LINES (
	season_id,team_id_home,team_abbreviation_home,team_name_home,game_id,@game_date,matchup_home,wl_home,min,fgm_home,fga_home,fg_pct_home,fg3m_home,fg3a_home,fg3_pct_home,ftm_home,fta_home,ft_pct_home,oreb_home,dreb_home,reb_home,ast_home,stl_home,blk_home,tov_home,pf_home,pts_home,plus_minus_home,video_available_home,team_id_away,team_abbreviation_away,team_name_away,matchup_away,wl_away,fgm_away,fga_away,fg_pct_away,fg3m_away,fg3a_away,fg3_pct_away,ftm_away,fta_away,ft_pct_away,oreb_away,dreb_away,reb_away,ast_away,stl_away,blk_away,tov_away,pf_away,pts_away,plus_minus_away,video_available_away,season_type
)
SET
game_date = STR_TO_DATE(@game_date ,'%Y-%m-%d %H:%i:%s');

LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/game_summary.csv' IGNORE INTO
TABLE GameSummaryTmp FIELDS TERMINATED BY ',' IGNORE 1 LINES ()

LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/game_info.csv' IGNORE INTO
TABLE GameInfoTmp FIELDS TERMINATED BY ',' IGNORE 1 LINES (
	game_id,game_date,attendance,@game_time
)
SET
game_time = IF(@game_time = '', NULL, game_time);

LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/other_stats.csv' IGNORE INTO
TABLE GameInfoTmp FIELDS TERMINATED BY ',' IGNORE 1 LINES ();

INSERT IGNORE INTO Game (
	gameID, 
	season,
	gameDate,
	gameTime,
	attendance,
	sequence, 
    statusID, 
	statusText,
	min, 
	seasonType,
	timesTied,
	leadChanges,
    teamIDHome, 
	teamIDAway
)
SELECT DISTINCT
    game_id as gameID,
    season as season,
    game_date as gameDate,
	GI.game_time as gameTime,
	GI.attendance AS attendance,
	game_sequence as sequence,
	game_status_id  AS statusID,
	game_status_text AS statusText,
    min,
    season_type as seasonType,
	OS.times_tied as timesTied,
	OS.lead_changes as leadChanges,
	team_id_home as teamIDHome,
	team_id_away as teamIDAway
FROM GameTmp
LEFT JOIN GameSummaryTmp USING (game_id)
LEFT JOIN (SELECT game_id, attendance, game_time FROM GameInfoTmp) AS GI using (game_id)
LEFT JOIN (SELECT game_id, lead_changes, times_tied from OtherStatsTmp) AS OS using (game_id);

LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/inactive_players.csv' IGNORE INTO
TABLE InactivePlayers FIELDS TERMINATED BY ',' IGNORE 1 LINES (
    gameID,playerID,@first_name,@last_name,jerseyNum,teamID,@team_city,@team_name,@team_abbreviation
)

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

LOAD DATA LOCAL INFILE 'officials.csv' IGNORE INTO
TABLE Officials FIELDS TERMINATED BY ',' IGNORE 1 LINES ();

LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/outcomes.csv'
INTO TABLE Outcomes 
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
    player1ID, 
    player1Name, 
    player1TeamID, 
    @player1_team_city, 
    @player1_team_nickname, 
    @player1_team_abbreviation, 
    @person2type, 
    player2ID, 
    player2Name, 
    player2TeamID,
    @player2_team_city, 
    @player2_team_nickname, 
    @player2_team_abbreviation, 
    @person3type, 
    player3ID, 
    player3Name,
    player3TeamID, 
    @player3_team_city, 
    @player3_team_nickname, 
    @player3_team_abbreviation, 
    videoAvailableFlag
)

INSERT INTO Outcomes (
    plusMinusAway, 
    videoAvailableAway, 
    wlAway, 
    fgmAway, 
    fgaAway, 
    fgPctAway, 
    fg3mAway, 
    fg3aAway, 
    fg3PctAway, 
    ftmAway, 
    ftaAway, 
    ftPctAway, 
    orebAway, 
    drebAway, 
    rebAway, 
    astAway, 
    stlAway, 
    blkAway, 
    tovAway, 
    pfAway, 
    ptsAway, 
    ptsPaintAway, 
    pts2ndChanceAway, 
    ptsFbAway, 
    largestLeadAway, 
    teamTurnoversAway, 
    totalTurnoversAway, 
    teamReboundsAway, 
    ptsOffToAway, 
    teamWinsLossesAway, 
    plusMinusHome, 
    videoAvailableHome, 
    wlHome, 
    fgmHome, 
    fgaHome, 
    fgPctHome, 
    fg3mHome, 
    fg3aHome, 
    fg3PctHome, 
    ftmHome, 
    ftaHome, 
    ftPctHome, 
    orebHome, 
    drebHome, 
    rebHome, 
    astHome, 
    stlHome, 
    blkHome, 
    tovHome, 
    pfHome, 
    ptsHome, 
    ptsPaintHome, 
    pts2ndChanceHome, 
    ptsFbHome, 
    largestLeadHome, 
    teamTurnoversHome, 
    totalTurnoversHome, 
    teamReboundsHome, 
    ptsOffToHome, 
    teamWinsLossesHome
)
SELECT 
    g.plus_minus_away, 
    g.video_available_away, 
    g.wl_away, 
    g.fgm_away, 
    g.fga_away, 
    g.fg_pct_away, 
    g.fg3m_away, 
    g.fg3a_away, 
    g.fg3_pct_away, 
    g.ftm_away, 
    g.fta_away, 
    g.ft_pct_away, 
    g.oreb_away, 
    g.dreb_away, 
    g.reb_away, 
    g.ast_away, 
    g.stl_away, 
    g.blk_away, 
    g.tov_away, 
    g.pf_away, 
    g.pts_away, 
    o.pts_paint_away, 
    o.pts_2nd_chance_away, 
    o.pts_fb_away, 
    o.largest_lead_away, 
    o.team_turnovers_away, 
    o.total_turnovers_away, 
    o.team_rebounds_away, 
    o.pts_off_to_away, 
    g.wl_away, 
    g.plus_minus_home, 
    g.video_available_home, 
    g.wl_home, 
    g.fgm_home, 
    g.fga_home, 
    g.fg_pct_home, 
    g.fg3m_home, 
    g.fg3a_home, 
    g.fg3_pct_home, 
    g.ftm_home, 
    g.fta_home, 
    g.ft_pct_home, 
    g.oreb_home, 
    g.dreb_home, 
    g.reb_home, 
    g.ast_home, 
    g.stl_home, 
    g.blk_home, 
    g.tov_home, 
    g.pf_home, 
    g.pts_home, 
    o.pts_paint_home, 
    o.pts_2nd_chance_home, 
    o.pts_fb_home, 
    o.largest_lead_home, 
    o.team_turnovers_home, 
    o.total_turnovers_home, 
    o.team_rebounds_home, 
    o.pts_off_to_home, 
    g.wl_home
FROM 
    GameTmp g
INNER JOIN 
    OtherStatsTmp o ON g.game_id = o.game_id;

LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/other_stats.csv' IGNORE INTO
TABLE OtherStatsTmp FIELDS TERMINATED BY ',' IGNORE 1 LINES ();

LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/team_history.csv' IGNORE INTO
TABLE tempTeamHistory FIELDS TERMINATED BY ',' IGNORE 1 LINES ()

INSERT INTO PrevTeam(
	teamID, 
	city, 
	nickname, 
	yearFounded, 
	yearActiveTill
)
SELECT teamID AS teamID, city as city, nickname AS nickname, yearFounded AS yearFounded, yearActiveTill AS yearActiveTill FROM tempTeamHistory