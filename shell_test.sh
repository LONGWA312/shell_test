#!/bin/bash

run_date="2019-11-25"
today_date=`date +"%Y-%m-%d"`
task="nginx"
while [ $run_date != $today_date ]
do 
        job_date=`ps -ef | grep $task | grep -v grep | grep -v master | awk '{print $(2)}'`
        if [ "$job_date" = "" ]
        then
                cmd="service nginx start"     
                ${cmd}  
                echo "start run $run_date data..."
                sleep 2
                run_date=`date -d "$run_date +1 day" +"%Y-%m-%d"`
		echo $run_date
        else
                echo "task is running, rerun date is: $job_date"
		cmd="service nginx stop"
		${cmd}
		sleep 2
        fi
done
