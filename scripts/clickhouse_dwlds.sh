#!/bin/sh

#Author : JeCelin
#Date : 16 Dec 2017
#Version : 1.0.0
#Description : Script to download the dataset for Clickhouse from Bureau of Stastics of America 


file_name=`basename $0`
echo "Starting Script ${file_name} .... @ : "  `date +"%d-%m-%Y:%T"`
echo " ###########################################################  "

date_now=`date +"%Y%m%d_%H%M%S"`

logfile_name=`echo $file_name | sed s/.sh$/_${date_now}.log/`
#echo $logfile_name


for s in `seq 1987 2016`
do
for m in `seq 1 12`
do
#printf `date +"%d-%m-%Y:%T"` 
#printf " : "
#printf "http://transtats.bts.gov/PREZIP/On_Time_On_Time_Performance_${s}_${m}.zip \n"
printf `date +"%d-%m-%Y:%T"` >> $logfile_name
printf " : " >> $logfile_name
printf "http://transtats.bts.gov/PREZIP/On_Time_On_Time_Performance_${s}_${m}.zip \n " >> $logfile_name
wget -a "clickhouse_exe_${date_now}.log" -rnv  http://transtats.bts.gov/PREZIP/On_Time_On_Time_Performance_${s}_${m}.zip
done
done

echo "Completed Script ${file_name} .... @ : "  `date +"%d-%m-%Y:%T"`
echo " ###########################################################  "

