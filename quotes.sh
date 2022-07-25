#!bin/bash
#purpose: Verifying the Difference bitween the quotation marks
#Version: 1.0
#created date: Monday July 25 11:16:55 IST 2022
#MOdified Date:
#Author: Lakshman
#START # (i provide varibles and it's values)
SHELL=123456
TEST=QUOTES

# Double Quotes (Both variables i calling from here with Double Quotes)
echo "Execute double qoutes $SHELL $TEST"

# Single Quotes (Both variables i calling from here with Single Quotes)
echo 'Execute Single Quotes $Shell $Test'

# Reverse Quotes(Both variables i calling from here with Reverse Quotes)
echo "This uptime status: `uptime`"
echo "This will check the uname: `uname`"
echo "This will print date: `date`"

#in this reverse quotes we execute a command called hostname.
#(we execute commands inside reverse quotes).

#END #
