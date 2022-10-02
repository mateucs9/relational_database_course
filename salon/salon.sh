#! /bin/bash

PSQL='psql --username=freecodecamp --dbname=salon --tuples-only -c '

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "\nWelcome to My Salon, how can I help you?\n"

SERVICES=$($PSQL "SELECT * FROM services")

SHOW_SERVICES(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done

  read SERVICE_ID_SELECTED
  SERVICE_EXISTS=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_EXISTS ]]
  then
    SHOW_SERVICES "I could not find that service. What would you like today?"
  fi

  echo -e "\n What's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    CREATE_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$NAME')")
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  
  echo -e "\n What time would you like your cut, $CUSTOMER_NAME?"
  read SERVICE_TIME

  ADD_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
  
  exit
}

SHOW_SERVICES