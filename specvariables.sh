#!bin/bash
#purpose: To learn Special Variables
#Version: 1.2
#created date: Monday July 25 15:09:35 IST 2022
#MOdified Date:
#Author: Lakshman
#START #
# The $* will store the complete setup positional parameters as a single string. 
#$#      > it is set to the number of arguments specified.
#        (that means how many argu/positional parameters we provide that arg number will be counted
#         with $#)

#$1      > first arguments/positional parameters
#$2      > second Arguments/positional parameters
#$0      > name of executed command.
#          (whatever the shell name you provide name will be captured with $0
 
#$@      > each quoted string treated as a seperate argument.
#$?      > exit status of last command.(it'll give the status of last command execution)
#$$      > PID of the current shell.(it'll tell us on which shell this script has been run)
#$!      > PID of the last background job.

echo "'$*' output is $*"
echo "$#' output is $#"
echo "'$1 & $2' output $1 and $2"
echo "'$@' output of $@"
echo "'$?' output is $?"
echo "'$$' output is $$"
sleep 400 &
echo "'$!' output is $!"

echo "'$0' your current program name is $0"
# END # 
