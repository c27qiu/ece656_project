import argparse
import json
import logging
from datetime import datetime
from flask import Flask, request, render_template, redirect, url_for, session, jsonify
from flask_session import Session
from flask_cors import CORS
import mysql.connector



#server_url = ""
parser =  argparse.ArgumentParser(
    prog="Front End Server",
    description="Runs the front end server")

parser.add_argument("--host", type=str, default="0.0.0.0", help="host of this server. e.g (localhost, 0.0.0.0, etc)")
parser.add_argument("--port", type=int, default=8080, help="port exposed by this server")
parser.add_argument("--mysql_user", type=str )
parser.add_argument("--mysql_password", type=str)
parser.add_argument("--mysql_host", type=str, default="localhost")

args = parser.parse_args()

app = Flask(__name__, template_folder='front_end/template', static_folder='front_end/static')
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
cors = CORS(app)
Session(app)

nbaDBConnection = mysql.connector.connect(
  host=args.mysql_host,
  user=args.mysql_user,
  password=args.mysql_password,
  database="NBA_NEW",
  port="3306",
)

def getAllTeams(dbConnection: mysql.connector.connection.MySQLConnection):
    cur = dbConnection.cursor()
    cur.execute("SELECT teamID, nickname, city FROM TeamInfo")
    row_headers=[x[0] for x in cur.description] #this will extract row headers
    rv = cur.fetchall()
    json_data=[]
    for result in rv:
        json_data.append(dict(zip(row_headers,result)))
    
    return jsonify(json_data)

def getTeam(dbConnection: mysql.connector.connection.MySQLConnection, teamId) :
    cur = dbConnection.cursor()
    
    cur.execute("SELECT * FROM TeamInfo WHERE teamID = %s", (teamId,))
    team_row_headers=[x[0] for x in cur.description] #this will extract row headers
    team_rv = cur.fetchall()
    team_json_data=[]
    for result in team_rv:
        team_json_data.append(dict(zip(team_row_headers,result)))
    
    # cur.execute("SELECT info.firstName, info.lastName FROM CurrentPlayerInfo info INNER JOIN (SELECT player1_id AS player_id FROM gameplays WHERE gameID IN (SELECT gameID FROM game WHERE season = 2022) AND player1_team_id = 1610612760 UNION SELECT player2_id FROM gameplays WHERE gameID IN (SELECT gameID FROM game WHERE season = 2022) AND player2_team_id = 1610612760 UNION SELECT player3_id FROM gameplays WHERE gameID IN (SELECT gameID FROM game WHERE season = 2022) AND player3_team_id = 1610612760 UNION SELECT DISTINCT playerID FROM inactiveplayers WHERE gameID IN (SELECT gameID FROM game WHERE season = 2022) AND teamID = 1610612760)AS players ON info.playerID = players.player_id;")
    # cur.execute("SELECT firstName, lastName, height, weight, jersey, position FROM CurrentPlayerInfo WHERE teamID = %s", (teamId,))
    cur.execute("""
    SELECT info.playerID, info.firstName, info.lastName, info.height, info.weight, info.jersey, info.position
    FROM CurrentPlayerInfo info 
    INNER JOIN (
        SELECT player1_id AS player_id 
        FROM gameplays 
        WHERE gameID IN (SELECT gameID FROM game WHERE season = 2022) 
        AND player1_team_id = %s 

        UNION 

        SELECT player2_id 
        FROM gameplays 
        WHERE gameID IN (SELECT gameID FROM game WHERE season = 2022) 
        AND player2_team_id = %s 

        UNION 

        SELECT player3_id 
        FROM gameplays 
        WHERE gameID IN (SELECT gameID FROM game WHERE season = 2022) 
        AND player3_team_id = %s 

        UNION 

        SELECT DISTINCT playerID 
        FROM inactiveplayers 
        WHERE gameID IN (SELECT gameID FROM game WHERE season = 2022) 
        AND teamID = %s
    ) AS players 
    ON info.playerID = players.player_id;
    """, (teamId, teamId, teamId, teamId))
    players_row_headers=[x[0] for x in cur.description] #this will extract row headers
    player_rv = cur.fetchall()
    player_json_data=[]
    for result in player_rv:
        player_json_data.append(dict(zip(players_row_headers,result)))
        
    return jsonify({'team': team_json_data, 'players': player_json_data})
    
def getAllPlayer(dbConnection: mysql.connector.connection.MySQLConnection) :
    cur = dbConnection.cursor()
    cur.execute("SELECT * FROM CurrentPlayerInfo")
    row_headers=[x[0] for x in cur.description] #this will extract row headers
    rv = cur.fetchall()
    json_data=[]
    for result in rv:
        json_data.append(dict(zip(row_headers,result)))
    return jsonify(json_data)

def getPlayer(dbConnection: mysql.connector.connection.MySQLConnection, playerId) :
    # cur = dbConnection.cursor()
    if not dbConnection.is_connected():
        dbConnection.reconnect(attempts=5, delay=3)
    cur = dbConnection.cursor()
    cur.execute("SELECT * FROM CurrentPlayerInfo WHERE playerID = %s", (playerId,))
    row_headers=[x[0] for x in cur.description] #this will extract row headers
    rv = cur.fetchall()
    json_data=[]
    for result in rv:
        json_data.append(dict(zip(row_headers,result)))
    return jsonify(json_data)
    
@app.route('/', methods=['GET'])
def index():
    logging.info("/%s: %s", request.method, datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    return getAllTeams(nbaDBConnection)

@app.route('/team/<id>', methods=['GET'])
def team(id):
    logging.info("/%s: %s", request.method, datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    return getTeam(nbaDBConnection, id)

@app.route('/players', methods=['GET'])
def all_players():
    logging.info("/%s: %s", request.method, datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    return getAllPlayer(nbaDBConnection)

@app.route('/player/<id>', methods=['GET'])
def player(id):
    logging.info("/%s: %s", request.method, datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    return getPlayer(nbaDBConnection, id)

if __name__ == '__main__':
   logging.basicConfig(
        level=logging.INFO,
        format=''
    )
   logging.info("Starting server on port %s", args.port)
   app.run(args.host, args.port)
