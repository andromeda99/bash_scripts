#!/bin/bash
echo -e  "\e[1;38mPlease enter any Character/Integer/Alphanumeric Value:- \e[0m" 
read temp
echo -e "\e[1;38m\t\t********* Value entered is "\"$temp"\" *********\e[0m"
regex="^([A-Za-z]+)$"
regex1="^([0-9]+)$"
regex2="^([A-Za-z0-9]+)$"

if [[ "$temp" =~ $regex ]] 
then
	k=`echo -n "$temp" | wc -c`
	echo -e "\e[1;38m"\"$temp"\" is a $k character word/string. Each character holds 4 byte of memory.\e[0m"
	k=`echo $k \* 4 | bc`
	echo -e "\e[1;93m\t\t====== Size of "\"$temp"\" is $k bytes ======\e[0m"
elif [[ "$temp" =~ $regex1 ]]
then
	k=`echo -n "$temp" | wc -c`
	echo -e "\e[1;38m"\"$temp"\" is a $k digit integer. Each interger holds 2 byte of memory.\e[0m"
	k=`echo $k \* 2 | bc`
	echo -e "\e[1;93m\t\t====== Size of "\"$temp"\" is $k bytes ======\e[0m"
elif [[ "$temp" =~ $regex2 ]]
then
d=0
m=0
	echo -e "\e[1;93m\t\t====== "Its an alphanumeric value set" ======\e[0m"
	echo -e "\e[1;93m\tSize of an Integer:- 2 byte    Size of a Character:- 4 byte\e[0m"
	echo -e "\e[1;38mCalculation:-\e[0m"
	echo -e "\e[1;38m=============\e[0m"
	digit=$(grep -o "[0-9]" <<<"$temp")
	k=`echo $digit | wc -m`
	char=$(grep -o "[A-Za-z]" <<<"$temp")
        m=`echo $char | wc -m`
        m=`echo $m \* 2 | bc`
        echo -e "\e[1;38mSize of digits "\"$digit"\" is \e[1;93m$k \e[0m \e[1;38mbytes & Size of characters "\"$char"\" is \e[1;93m$m \e[0m \e[1;38mbytes\e[0m"
	k=`echo $k + $m | bc`
	echo -e "\e[1;93\tm===== Total size of string "\"$temp"\" is $k bytes =====\e[0m"
	
else
	echo "Invalid character set"
fi

