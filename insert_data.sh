#!/bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINGOALS OPGOALS
do
  if [[ $YEAR != "year" ]]
  then 
    # get team_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # if not found
      if [[ -z $WINNER_ID ]]
      then 
        # insert team
        INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
          if [[ $INSERT_TEAM == "INSERT 0 1" ]]
          then 
            echo Insered into teams
          fi
    # get new team_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  fi

   if [[ $OPPONENT != "name" ]]
  then 
    # get team_id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # if not found
      if [[ -z $OPPONENT_ID ]]
      then 
        # insert team
        INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
          if [[ $INSERT_TEAM == "INSERT 0 1" ]]
          then 
            echo Insered into teams
          fi 
    # get new team_id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      fi

    # insert games
    INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINGOALS', '$OPGOALS')")
      if [[ $INSERT_GAMES == "INSERT 0 1" ]]
      then
        echo Inserted into games
      fi
  fi
  fi
done
