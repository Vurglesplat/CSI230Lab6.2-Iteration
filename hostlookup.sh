#!/bin/bash

# file hostlookup.sh
# brief checking if hosts are valid
# author brandon.boras
# date 10/15/2020

for h in champlain.edu uvm.edu umd.edu doesnotexist.edu
do
	host -W1 -t A $h
done

