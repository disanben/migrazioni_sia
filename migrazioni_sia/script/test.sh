#!/bin/bash

#TEST_ARRAY=(A B C D)
TEST_ARRAY=""

TEST_ARRAY[0]="%"
TEST_ARRAY[1]="%"
TEST_ARRAY[2]="%"
TEST_ARRAY[3]="%"



stampaArray(){
   TEST=( `echo "$1"` )
   
   echo "${TEST[@]}"
   
   echo "TEST[0] ${TEST[0]}"
   echo "TEST[1] ${TEST[1]}"
   echo "TEST[2] ${TEST[2]}"
   echo "TEST[3] ${TEST[3]}"
}

stampaArray ${TEST_ARRAY[@]}

argomento=`echo ${TEST_ARRAY[@]}`
stampaArray "$argomento"
#echo ${pippo[@]}

   #echo "TEST_ARRAY[0] ${TEST_ARRAY[0]}"
   #echo "TEST_ARRAY[1] ${TEST_ARRAY[1]}"
   #echo "TEST_ARRAY[2] ${TEST_ARRAY[2]}"
   #echo "TEST_ARRAY[3] ${TEST_ARRAY[3]}"



