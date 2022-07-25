#!bin/bash
# purpose: Counting Given positional parameters (it'll count current given files)
# Version: 1.3
# created date: Monday July 25 15:09:35 IST 2022
# MOdified Date:
# Author: Lakshman
# START #
# Script 1
#--------
# echo "Your current given parameters are $#"
# Note-: with help of this script we can count the num of files/directories are in a directrory

# ex-: i wanna check a files/directories count in a /etc directrory so what i do now is?
# i just execute the shell script.

# sh countgivenparameters.sh  /etc/* (it'll print the all files/directories count inside /etc dir)
#-----------------------------------------------------------------------------------------------

# Not only that we can also use this for programming a differnet formates.

# Example
#--------

# script_2
# Along with some condition variables we can use it over here

if [ $# -lt 1 ] ;then
echo "program Usage is'./scriptname.sh' Options"
else
echo "Program executed Succesfully"
fi

#Note-: If the positional perameter is not given 
# Then it should printout the validation saying that whatever the program you're executing
# You are not executing proparly.
# Then we are intructing the user to give some options (or) arguments.
# But if i provide any argument here (ex- sh countgivenparameters.sh argname(ex- test)
# Then it should say my program executed succesfully
# If we provide any option/argument then it shouldn't go nxt steps.

# END #
