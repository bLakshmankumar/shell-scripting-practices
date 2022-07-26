#!bin/bash
# purpose:  Relational operators ( -lt -le -gt -ge -eq -ne)
# Version: 1.5
# created date: Tuesday July 26 11:59:35 IST 2022
# MOdified Date:
# Author: Lakshman
# START #  
# -lt >   less than                     (<)
# -le >   less than or equal to         (<=)
# -gt >   greater than                  (>)
# -ge >   greater than or equal to      (=>)
# -eq >   equal to                      (==)
# -ne >   no equal to                   (!=)

#  Script starts -:

echo -e "please provide one number: \c"
read -r h
echo -e "please provide one number: \c"
read -r g

test $h -lt $g; echo "$?";
test $h -le $g; echo "$?";
test $h -gt $g; echo "$?";
test $h -ge $g; echo "$?";
test $h -eq $g; echo "$?";
test $h -ne $g; echo "$?";
 
# END #

# Note-:what is  Relational Operators:

# Relational operators are those operators which define the relation between two operands.
# They give either true or false depending upon the relation.
