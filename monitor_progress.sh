#!/bin/bash
# see also http://vitalidze.github.com/2012/11/25/Simple-progress-bar-in-bash/
to_monitor=$1
target_gb=$2
read_mb=0
while [ $read_mb -le $(( $target_gb*1024 )) ]
do
        read_mb=`du -sm $to_monitor | cut -f 1`
        read_gb=$(( $read_mb/1024 ))
        echo -ne '[ '
        for (( gb=0; gb<$target_gb; gb++ ))
                do
                        if [ $read_gb -ge $gb ]
                        then
                                echo -ne '#';
                        else
                                echo -ne ' '
                        fi
                done
        perc=$(( $read_mb*100/($target_gb*1024) ))
        echo -ne " $perc%] $read_mb of $(($target_gb*1024))\r"
        sleep 1
done