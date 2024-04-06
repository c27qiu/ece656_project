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

def getPlayer(dbConnection: mysql.connector.connection.MySQLConnection) :
    cur = dbConnection.cursor()
    cur.execute("SELECT * FROM Player")
    row_headers=[x[0] for x in cur.description] #this will extract row headers
    rv = cur.fetchall()
    json_data=[]
    for result in rv:
        json_data.append(dict(zip(row_headers,result)))
    return jsonify(json_data)


@app.route('/', methods=['GET'])
def index():
    logging.info("/%s: %s", request.method, datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    return render_template('index.html')

@app.route('/team', methods=['GET'])
def team():
    logging.info("/%s: %s", request.method, datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    return render_template('index.html')
    

@app.route('/player', methods=['GET'])
def player():
    logging.info("/%s: %s", request.method, datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    return getPlayer(nbaDBConnection)

if __name__ == '__main__':
   logging.basicConfig(
        level=logging.INFO,
        format=''
    )
   logging.info("Starting server on port %s", args.port)
   app.run(args.host, args.port)
