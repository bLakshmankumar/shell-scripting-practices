#!bin/bash
# purpose: Arthemetic Operators using expr command
# Version: 1.4
# created date: Monday July 25 18:31:59 IST 2022
# MOdified Date:
# Author: Lakshman
# START #

echo -e "please enter some value: \c"
read -r a
echo -e "please enter another value: \c"
read -r b

# Now i wanna calculate the arthemetic things using the expr command.

echo "addition values `expr $a + $b`"
echo "minus values `expr $a - $b`"
echo "multiplied values `expr $a \* $b`"
echo "devided by values `expr $a / $b`"
echo "remainder values `expr $a % $b`"

echo "Successfully Executed"

# END #

