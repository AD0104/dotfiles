percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep percentage | awk -F: '{print $2}')
var=$(echo $percentage | awk -F% '{print $1}')
if [[ var -le 20 ]]; then
	echo  $percentage
elif [[ var -le 50 ]]; then
	echo  $percentage
else
	echo  $percentage
fi
echo $var
