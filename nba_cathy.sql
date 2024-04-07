
CREATE TABLE CurrentPlayerInfo (
	playerID INT PRIMARY KEY, 
	firstName VARCHAR(14) NOT NULL, 
	lastName VARCHAR(18) NOT NULL, 
	birthdate DATETIME NULL, 
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
	birthdate DATETIME NULL, 
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