#!/bin/bash

arr=( "$@" )

for x in "${arr[@]}" ;
do
  echo $x
done
