#!/bin/bash

# file converter.sh
# brief checking and handling if a file is usable.
# author brandon.boras
# date 10/16/2020

usage()
{
	echo "$0 usage: [-f input filed] [-c U(pper) or L(lower)"
	exit 1
}

while getopts ":f:c:" options
do
	case "${options}" in
		f)
			f=$(OPTARG)
			# CHECK IF THE FILE IS THERE, HANDLE NO USAGE
			;;
		c)
			c=${OPTARG}
			if [[ ${c} == "U" || ${c} == "L" ]]; then
				echo "${f} - ${c}"
			else
				usage
			fi
			;;
		*)
			usage
			;;
	esac
done

#oncversion logic here

while read line
do
	if [ ${c} == "U" ]; then
		echo $line | tr [:lower:] [:upper:]
	else
		echo $line | tr [:upper:] [:lower:]
	fi

done < $f

exit 0


