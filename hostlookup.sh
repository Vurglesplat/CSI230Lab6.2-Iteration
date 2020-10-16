#!/bin/bash

# file hostlookup.sh
# brief checking if hosts are valid
# author brandon.boras
# date 10/15/2020

if [ $@ ]; then
	if [[ -f "$1" ]]; then
		all_invalid=true
		cat ${1} | while read line
		do
			out=$(host -W1 -t A $line)
			if [ $? -eq 0 ];then
				ip=$(echo $out | cut -d " " -f 4)
				echo ${line},$ip
				all_invalid=false
			else
				echo "${line},not found"
			fi
		done
		
		if $all_valid; then
			echo "None of the hosts were valid"
			exit 1
		fi
	else
		echo "That was not a file"
		exit 1
	fi
else
	echo "Nothing was passed!"
	exit 1
fi


