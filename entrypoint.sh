#!/bin/bash -l

result=$(($1 + $2))
echo "result=$result" >> $GITHUB_OUTPUT

echo "output file" >> containerOutputFile.txt 
