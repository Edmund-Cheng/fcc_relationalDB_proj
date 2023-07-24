#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"

NUMBER=$(( RANDOM % 1000 + 1 ))
COUNT=0

echo "Enter your username:"
read USER_NAME;

GUESS_NUMBER() {
    if [[ $1 ]]
    then
        echo -e "$1"
    fi

    read NUMBER_TO_GUESS
    ((COUNT++))

    # input is not a number
    if [[ ! $NUMBER_TO_GUESS =~ ^[0-9]+$ ]]
    then
        ((COUNT--))
        GUESS_NUMBER "That is not an integer, guess again:"
    else
        if [[ "$NUMBER_TO_GUESS" -lt "$NUMBER" ]]
        then
            GUESS_NUMBER "It's higher than that, guess again:"
        else
            if [[ "$NUMBER_TO_GUESS" -gt "$NUMBER" ]]
            then
                GUESS_NUMBER "It's lower than that, guess again:"
            else
                # get user_id
                USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name='$USER_NAME'")
                INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, no_of_guess) VALUES($USER_ID,$COUNT)")
                
                echo "You guessed it in $COUNT tries. The secret number was $NUMBER. Nice job!"
            fi
        fi  
    fi
}

SEARCH_RESULT=$($PSQL "SELECT user_id, user_name FROM users WHERE user_name = '$USER_NAME'")
if [[ -z $SEARCH_RESULT ]]
then
    echo -e "Welcome, $USER_NAME! It looks like this is your first time here.\n"
    INSERT_RESULT=$($PSQL "INSERT INTO users(user_name) VALUES ('$USER_NAME')")
    if [[ $INSERT_RESULT == "INSERT 0 1" ]]
    then
        # get user_id
        USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name='$USER_NAME'")
    fi
else
    echo "$SEARCH_RESULT" | while read USER_ID BAR USER_NAME
    do
        GAME_RESULT=$($PSQL "SELECT COUNT(*), MIN(no_of_guess) FROM games WHERE user_id = $USER_ID GROUP BY user_id")
        echo "$GAME_RESULT" | while read GAMES_PLAYED BAR BEST_GAME
        do
            echo -e "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
        done
    done
fi

GUESS_NUMBER "Guess the secret number between 1 and 1000:"
