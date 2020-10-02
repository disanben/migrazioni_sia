#!/bin/bash
IFS=$'\n' read  -d'' -r -a inlines  < testinput
IFS=$'\n' read  -d'' -r -a  outlines < testoutput
counter=0
cat testinput | while read line;
do
    echo "$((${inlines[$counter]}-${outlines[$counter]}))"
    counter=$(($counter+1))
done
# OR Do like this
counter=0
readarray a < testinput
readarray b < testoutput
cat testinput | while read myline;
do
    echo value is: $((${a[$counter]}-${b[$counter]}))
    counter=$(($counter+1))
done
