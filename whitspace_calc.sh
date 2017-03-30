#!/bin/bash
#Calculate a whitespace in given string
z=0
flag=0
echo "Please enter any String with space:- "
read temp
echo "The string entered is "\"$temp"\""
echo "Detecting whitespace..."
#foo="                string "
for (( i=0; i<${#temp}; i++ )); do
	echo "${temp:$i:1}"
if [[ "${temp:$i:1}" =~ " " ]]
then
	flag=1
	i=`echo $i \+ 1 | bc`
	echo "*** whitespace detected on $i position"	
	sleep 1;
	z=`echo $z \+ 1 | bc`
	i=`echo $i \- 1 | bc`
	flag=1
else
	continue
fi
done
if [ "$flag" == 1 ]
then
echo "There are total $z whitespaces in "\"$temp"\""
else
echo "There are no whitespaces in "\"$temp"\""
fi
