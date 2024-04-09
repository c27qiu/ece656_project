USE ece656_project;

-- Create tables to represent the data model

-- Drop existing tables
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Outcomes;
DROP TABLE IF EXISTS InactivePlayers;
DROP TABLE IF EXISTS OvertimePoints;
DROP TABLE IF EXISTS PointsPerQuarter;
DROP TABLE IF EXISTS Broadcast;
DROP TABLE IF EXISTS Officials;

-- Create tables
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

CREATE TABLE Outcomes(
    gameID DECIMAL(38, 0) NOT NULL, 
	plusMinus DECIMAL(38, 0) NOT NULL, 
	videoAvailable BOOL NOT NULL, 
	wl VARCHAR(1), 
	fgm DECIMAL(38, 0), 
	fga DECIMAL(38, 0), 
	fgPct DECIMAL(38, 3), 
	fg3m DECIMAL(38, 0), 
	fg3a DECIMAL(38, 0), 
	fg3Pct DECIMAL(38, 3), 
	ftm DECIMAL(38, 0), 
	fta DECIMAL(38, 0), 
	ftPct DECIMAL(38, 3), 
	oreb DECIMAL(38, 0), 
	dreb DECIMAL(38, 0), 
	reb DECIMAL(38, 0), 
	ast DECIMAL(38, 0), 
	stl DECIMAL(38, 0), 
	blk DECIMAL(38, 0), 
	tov DECIMAL(38, 0), 
	pf DECIMAL(38, 0), 
	pts DECIMAL(38, 0) NOT NULL, 
    ptsPaint DECIMAL(38, 0) NOT NULL, 
	pts2ndChance DECIMAL(38, 0) NOT NULL, 
	ptsFb DECIMAL(38, 0) NOT NULL, 
	largestLead DECIMAL(38, 0) NOT NULL, 
	teamTurnovers DECIMAL(38, 0), 
	totalTurnovers DECIMAL(38, 0), 
	teamRebounds DECIMAL(38, 0), 
	ptsOffTo DECIMAL(38, 0),
    teamWinsLosses VARCHAR(5) NOT NULL, 
	pts DECIMAL(38, 0) NOT NULL,
    FOREIGN KEY (gameID) REFERENCES Game (gameID)
);



CREATE TABLE OvertimePoints (
    gameID DECIMAL(38, 0) NOT NULL, 
	otNumber INT NOT NULL, 
	pointsOtHome DECIMAL(38, 0), 
	pointsOtAway DECIMAL(38, 0), 
	PRIMARY KEY (gameID, otNumber) ,
    FOREIGN KEY (gameID) REFERENCES Game (gameID)
);

-- 
CREATE TABLE InactivePlayers (
    gameID DECIMAL(38, 0) NOT NULL, 
    playerID DECIMAL(38, 0) NOT NULL, 
	jerseyNum DECIMAL(38, 0) DEFAULT NULL, 
	teamID DECIMAL(38, 0) NOT NULL, 
    PRIMARY KEY (gameID, playerID),
    FOREIGN KEY (gameID) REFERENCES Game (gameID)
);

CREATE TABLE PointsPerQuarter (
    gameID DECIMAL(38, 0) NOT NULL, 
    quarterNumber INT NOT NULL,
    pointsQuarterHome DECIMAL(38, 0),
    pointsQuarterAway DECIMAL(38, 0),
    PRIMARY KEY(gameID, quarterNumber),
	FOREIGN KEY (gameID) REFERENCES Game(gameID)
);

CREATE TABLE Broadcast(
	gameID DECIMAL(38, 0) NOT NULL, 
	livePeriod DECIMAL(38, 0) NOT NULL, 
	livePCTime DATETIME, 
	natlTVBroadcasterAbbreviation VARCHAR(13), 
	livePeriodTimeBcast VARCHAR(24) NOT NULL, 
	whStatus BOOL NOT NULL,
	PRIMARY KEY (gameID),
    Foreign Key (gameID) REFERENCES Game(gameID)
);

CREATE TABLE Officials (
	gameID DECIMAL(38, 0) NOT NULL, 
	officialID DECIMAL(38, 0) NOT NULL, 
	firstName VARCHAR(11) NOT NULL, 
	lastName VARCHAR(13) NOT NULL, 
	jerseyNum DECIMAL(38, 0),
	PRIMARY KEY (gameID),
	FOREIGN KEY (gameID) REFERENCES Game(gameID)
);

CREATE TABLE Arena (
	gameID DECIMAL(38, 0) NOT NULL, 
	name VARCHAR(11) NOT NULL, 
	capacity DECIMAL(38, 0),
);

-- LOAD tables Game table

-- Create teamporary game table and load it 
DROP TABLE IF EXISTS GameTmp

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

-- DROP TABLE IF EXISTS Game;

LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/game.csv' IGNORE INTO
TABLE GameTmp FIELDS TERMINATED BY ',' IGNORE 1 LINES (
	season_id,team_id_home,team_abbreviation_home,team_name_home,game_id,@game_date,matchup_home,wl_home,min,fgm_home,fga_home,fg_pct_home,fg3m_home,fg3a_home,fg3_pct_home,ftm_home,fta_home,ft_pct_home,oreb_home,dreb_home,reb_home,ast_home,stl_home,blk_home,tov_home,pf_home,pts_home,plus_minus_home,video_available_home,team_id_away,team_abbreviation_away,team_name_away,matchup_away,wl_away,fgm_away,fga_away,fg_pct_away,fg3m_away,fg3a_away,fg3_pct_away,ftm_away,fta_away,ft_pct_away,oreb_away,dreb_away,reb_away,ast_away,stl_away,blk_away,tov_away,pf_away,pts_away,plus_minus_away,video_available_away,season_type
)
SET
game_date = STR_TO_DATE(@game_date ,'%Y-%m-%d %H:%i:%s');


DROP TABLE IF EXISTS GameSummaryTmp;

CREATE TABLE  GameSummaryTmp (
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
LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/game_summary.csv' IGNORE INTO
TABLE GameSummaryTmp FIELDS TERMINATED BY ',' IGNORE 1 LINES ()

DROP TABLE IF EXISTS GameInfoTmp;
CREATE TABLE GameInfoTmp (
	game_id DECIMAL(38, 0) NOT NULL, 
	game_date DATETIME NULL, 
	attendance DECIMAL(38, 0), 
	game_time VARCHAR(6)
);

LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/game_info.csv' IGNORE INTO
TABLE GameInfoTmp FIELDS TERMINATED BY ',' IGNORE 1 LINES (
	game_id,game_date,attendance,@game_time
)SET
game_time = IF(@game_time = '', NULL, game_time);

DROP TABLE IF EXISTS OtherStatsTmp;
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


-- Inactive Players
LOAD DATA LOCAL INFILE 'C:/Users/Cathy Qiu/Downloads/Github/ECE656/ece656_project/csv/inactive_players.csv' IGNORE INTO
TABLE InactivePlayers FIELDS TERMINATED BY ',' IGNORE 1 LINES (
    gameID,playerID,@first_name,@last_name,jerseyNum,teamID,@team_city,@team_name,@team_abbreviation
)
-- consider checks to make sure the ommited team fields are the same as the ones in the team table

-- Create temporary table LineScore
DROP TABLE IF EXISTS LineScore

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

DROP TABLE IF EXISTS GameTmp;

DROP TABLE IF EXISTS GameSummaryTmp;

DROP TABLE IF EXISTS GameInfoTmp;

DROP TABLE IF EXISTS OtherStatsTmp;


DROP TABLE IF EXISTS OtherStatsTmp;