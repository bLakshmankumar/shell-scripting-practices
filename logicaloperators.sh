#!bin/bash
# purpose: Logical Operators(To write and Validate Multiple Conditions and execute the statement)
# Version: 1.5
# created date: Tuesday July 26 12:55:35 IST 2022
# MOdified Date:
# Author: Lakshman
# START #  

# A logical condition is created, when two or more conditioned produce a single result based on 
# them.
#Logical OR & AND operations are very useful where multiple conditions are used in our Scripts.

# We have 3 types of Logical Operators.
# 1) AND            (-a) (&&) - AND operator symbol of this is (-a) and this value key is (&&)
# 2) OR             (-o) (||) - This OR operator is representer using (-o) and OR operator symbol
#                               is (||)
#3) NotEqual to     (-n) (!)  - Not operator defined using (-n) ans in symbol we can use (!)

# HOW AND operators Works-:
#..........................
 
# if AND operators if first statement is true then second statement is true then result will true
# if the first statement is True and second statement is false that result will be false.
# T - T -F
# T - F - F
# F - T - F
# F - F - F

# How OR operators works-:
#.........................
# if first condition is true second condition is false result will be true.
# F - T - T
# F - T - T
# F - F - F
# T - T - T

# How the NOT operators works-:
#..............................
# In Not operators there is not like multiple conditions it's stateforward like TRUE AND FALSE 
# and FALSE AND TRUE.
# Which means we provide if we say if it's false it will print true statement.
# which means its opposite to the all the conditions like if its not false its execute true value

# Script-:
#---------
# Logical Operators/Boolean Operators
# we write a script for validation of student marks

echo -e "Enter your maths subj marks: \C"
read -r m
echo -e "Enter your physics Subj marks: \c"
read -r p
echo -e "Enter your Chemistry Subj marks: \c"
read -r c
echo -r "Enter your Social subj marks: \c"
read -r s

if test $m -ge 35 -a $p -ge 35 -a $c -ge 35 -a $s -ge 35
then
echo "Congratulations, You have passed in all subjects"
else
echo "Sorry you are not upto mark in one of the subject"
fi

# END #
