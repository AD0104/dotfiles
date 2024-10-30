#!/bin/bash
percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep percentage | awk -F: '{print $2}')
var=$(echo $percentage | awk -F% '{print $1}')
#echo $var

function print_percentage() {
    if [[ var -le 20 ]]; then
        echo  $percentage
        return
    elif [[ var -le 50 ]]; then
        echo  $percentage
        return
    else
        echo  $percentage
        return
    fi
}

print_percentage
