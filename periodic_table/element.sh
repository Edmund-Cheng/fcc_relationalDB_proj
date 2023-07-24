#! /bin/bash

#PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"

SELECT="SELECT a.atomic_number, b.name, b.symbol, c.type, a.atomic_mass, a.melting_point_celsius, a.boiling_point_celsius FROM elements AS b INNER JOIN properties AS a USING(atomic_number) INNER JOIN types AS c USING(type_id)"

DISPLAY_ELEMENT() {
  # read the result from query and reformat to display
  echo "$SEARCH_RESULT" | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
  do
    echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
}

if [[ ! $1 ]]
then
  echo -e "Please provide an element as an argument."
else
  # if input is a number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # search element by atomic_number
    SEARCH_RESULT=$($PSQL "$SELECT"" WHERE atomic_number=$1")
    if [[ ! -z $SEARCH_RESULT ]]
    then
      DISPLAY_ELEMENT
    else
        echo -e "I could not find that element in the database."
    fi
  else
    # search element by symbol
    SEARCH_RESULT=$($PSQL "$SELECT"" WHERE symbol='$1'")
    if [[ ! -z $SEARCH_RESULT ]]
    then
      DISPLAY_ELEMENT
    else
      # search element by name
      SEARCH_RESULT=$($PSQL "$SELECT"" WHERE name='$1'")
      if [[ ! -z $SEARCH_RESULT ]]
      then
        DISPLAY_ELEMENT
      else
        echo -e "I could not find that element in the database."
      fi
    fi
  fi
fi

