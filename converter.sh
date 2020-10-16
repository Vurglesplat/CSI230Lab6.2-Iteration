#!/bin/bash

# file converter.sh
# brief converting the cases of every letter in a file
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
			f=${2}
			if [[ ! -f "$0" ]]; then
				usage
			fi
			;;
		c)
			c=${4}
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

while read line
do
	if [ ${c} == "U" ]; then
		echo $line | tr [:lower:] [:upper:]
	else
		echo $line | tr [:upper:] [:lower:]
	fi
done < $f

exit 0


