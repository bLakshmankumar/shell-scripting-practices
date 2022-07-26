#!bin/bash
# purpose: Logical Operators(OR Operaters)
# Version: 1.6
# created date: Tuesday July 26 13:38:22 IST 2022
# MOdified Date:
# Author: Lakshman
# START #  
echo -e "Enter First Numeric value: \C"
read -r t
echo -e "Enter Second numeric value: \c"
read -r b

if [ $t -le 20 -o $b -ge 30 ] ; then
echo "Statement  is true"
else 
echo "False, Statement Try Again."
fi

# If we provide any value in between so any one of the value will be True. for example.
# if we provide the value (less than 20 range) then the value will be True. (or)
# if we provide the (second value more than 30) and the value will be True. (or)  
# if we provide the value with in (20 in between 30) then the value will be Flase.

# END #
