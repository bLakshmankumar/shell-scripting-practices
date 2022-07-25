#!bin/bash
# purpose: Arthemetic Operators
# Version: 1.4
# created date: Monday July 25 18:12:42 IST 2022
# MOdified Date:
# Author: Lakshman
# START #
echo -e "please enter some value: \c"
read -r a
echo -e "please enter another value: \c"
read -r b

# Now i wanna calculate the arthemetic things using the echo command.

echo "a+b value is $(($a+$b))"
echo "a-b value is $(($a-$b))"
echo "a*b value is $(($a*$b))"
echo "a/b value is $(($a/$b))"
echo "a%b value is $(($a%$b))"

echo " The Script is Completed Successfully"

#Note-: This is the one way of doing arthemetic operations on the command line 
#       (or) on the shell script.
#...............................................................................................

# There is an another way to we can also do using the another commands let's go and create 
# another template file with name of arthoperators1.sg for do an arthementic opertations.
