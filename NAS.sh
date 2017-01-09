#!/bin/bash

RAW=/home/colby/NAS/raw.txt
CLN=/home/colby/NAS/clean.txt
TAB=/home/colby/NAS/tab.txt
IMP=/home/colby/NAS/import.txt

#Login and grab info
/home/colby/NAS/login.sh > $RAW

#Get just fields and folders
cat $RAW | grep '^[0-9]'| egrep -v '(.user|lost\+found)' | sed 's/\/share\/CACHEDEV1_DATA\///g' > $CLN


#Prepare for influxdb
cat $CLN | tr -s " " | awk -v OFS='\t' '{print "qnap,Folder="$2,"\t","SizeinK="$1}' > $TAB
cat -A $TAB | sed 's/\^M\^I\^I\^I/ /g; s/\$//g' > $IMP

#TESTING
#cat $IMP
#echo ""
#cat -A $IMP

#Import!
curl -i -XPOST 'http://localhost:8086/write?db=QNAP' --data-binary @$IMP
