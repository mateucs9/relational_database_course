
if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
  exit
fi

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


if [[ $1 == ?(-)+([0-9]) ]]
then
  ID=$($PSQL "SELECT atomic_number FROM ELEMENTS WHERE atomic_number = '$1'")
fi

if [[ -z $ID ]]
then
  ID=$($PSQL "SELECT atomic_number FROM ELEMENTS WHERE symbol = '$1'")
fi

if [[ -z $ID ]]
then
  ID=$($PSQL "SELECT atomic_number FROM ELEMENTS WHERE name = '$1'")
fi


if [[ -z $ID ]]
then 
  echo -e "I could not find that element in the database."
else
  NAME=$($PSQL "SELECT name FROM ELEMENTS WHERE atomic_number = '$ID'")
  SYMBOL=$($PSQL "SELECT symbol FROM ELEMENTS WHERE atomic_number = '$ID'")
  TYPE=$($PSQL "SELECT type FROM ELEMENTS INNER JOIN properties ON properties.atomic_number = elements.atomic_number INNER JOIN types on types.type_id = properties.type_id where elements.atomic_number = '$ID'")
  MASS=$($PSQL "SELECT atomic_mass FROM ELEMENTS INNER JOIN properties ON properties.atomic_number = elements.atomic_number where elements.atomic_number = '$ID'")
  MELTING=$($PSQL "SELECT melting_point_celsius FROM ELEMENTS INNER JOIN properties ON properties.atomic_number = elements.atomic_number where elements.atomic_number = '$ID'")
  BOILING=$($PSQL "SELECT boiling_point_celsius FROM ELEMENTS INNER JOIN properties ON properties.atomic_number = elements.atomic_number where elements.atomic_number = '$ID'")
  echo "The element with atomic number $ID is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
fi