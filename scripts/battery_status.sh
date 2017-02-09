info_directory=/sys/class/power_supply

bat0_now=$(cat $info_directory/BAT0/energy_now)
bat0_full=$(cat $info_directory/BAT0/energy_full)
bat0_status=$(cat $info_directory/BAT0/status)

if [ -d "$info_directory/BAT1" ]
then
    bat1_now=$(cat $info_directory/BAT1/energy_now)
    bat1_full=$(cat $info_directory/BAT1/energy_full)
    bat1_status=$(cat $info_directory/BAT1/status)
    bat_now=$(echo $bat0_now + $bat1_now | bc)
    bat_full=$(echo $bat0_full + $bat1_full | bc)
else
    bat1_status="Unknown"
    bat_now=$bat0_now
    bat_full=$bat0_full
fi

percent=$(echo "$bat_now * 100 / $bat_full" | bc)

if [ "$bat0_status" = Discharging -o "$bat1_status" = Discharging ]
then
    symbol='-'
elif [ "$bat0_status" = Charging -o "$bat1_status" = Charging ]
then
    symbol='+'
elif  [ "$bat0_status" = Full -o "$bat1_status" = Full ]
then
    symbol='↯'
else
    symbol='?'
fi

echo "$symbol $percent%"

# ↯ + - ⌁ ?
