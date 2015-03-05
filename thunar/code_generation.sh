#!/bin/bash

destination="$1-`date +%y%m%d`-`date +%H%M%S`"

mkdir "$destination"
cd "$destination" 

dia2code -d "$destination" -t php5 $1

for file in *.php
do
   echo "file=$file"
   sed '/\*/d' "$file" >  ~/temp
   sed '/\#/d' ~/temp >  ~/temp2
   sed '/\//d' ~/temp2 >  "$file"
   rm ~/temp
   rm ~/temp2
done

