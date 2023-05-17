#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){
if [[ $1 ]]
then
echo -e "\n$1"
fi

echo -e "\nWelcome to My Salon, how can I help you?\n"

#get services
SERVICESAVAILABLE=$($PSQL "SELECT service_id, name FROM services")

#display services
echo "$SERVICESAVAILABLE" | while read SERVICE_ID BAR SERVICE
do
echo "$SERVICE_ID) $SERVICE"
done

read SERVICE_ID_SELECTED

#get selected service
SERVICE_ID_SELECTED=$($PSQL "SELECT service_id FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")

#if not a service 
if [[ -z $SERVICE_ID_SELECTED ]]
then 

#return to service list
MAIN_MENU "I could not find that service."

else

#get customer phone number
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

#get customer name
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

#if no customer exists
if [[ -z $CUSTOMER_NAME ]]
then

#get customer name
echo -e "\nWhat's your name?"
read CUSTOMER_NAME

#insert new customer
INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
fi

#get service name
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")

#get appointment time
echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

#find customer_id
GET_CUSTOMER=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

#insert appointment
INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$GET_CUSTOMER', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")

echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME." 
fi
}

MAIN_MENU
