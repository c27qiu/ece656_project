# ece656_project


## Setup

* Download csv files from https://www.kaggle.com/datasets/wyattowalsh/basketball
* install csvkit - https://csvkit.readthedocs.io/en/0.9.1/install.html

## Bootstrapping schema from csv

```
csvsql --dialect mysql --snifflimit 100000 -d "," \
player.csv common_player_info.csv team.csv team_details.csv \
team_history.csv game.csv game_info.csv line_score.csv \
game_summary.csv > schema.sql
```



## Local testing for webapp


**Required**
* [python](https://www.python.org/downloads/)
* [mysql](https://dev.mysql.com/downloads/installer/)

**Setup**
```
# Start mysql
mongod

# install python dependencies
pip3 install -r src/requirements.txt

```

**Running the server**
```
python src/server.py --port 8080
```

open [localhost:8080](http://localhost:8080) in your browser 
