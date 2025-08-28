options="Shutdown\nReboot\nLock\nSleep"
output=$(echo -e $options | walker --dmenu -H)
if [[ "$output" == "Shutdown" ]]; then
  shutdown
elif [[ "$output" == "Reboot" ]]; then
  reboot
elif [[ "$output" == "Lock" ]]; then
  swaylock
elif [[ "$output" == "Sleep" ]]; then
  systemctl suspend
else
  echo "foo"
fi
  
