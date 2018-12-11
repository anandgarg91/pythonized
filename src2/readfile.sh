#!/bin/bash

while IFS= read -r p; do
	echo "$p"
done <check.txt 
