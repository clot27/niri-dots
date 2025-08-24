options="Shutdown\nReboot\nLock"
output=$(echo -e $options | walker --dmenu -H)
if [[ "$output" == "Shutdown" ]]; then
  echo "shutdown"
elif [[ "$output" == "Reboot" ]]; then
  echo "reboot"
elif [[ "$output" == "Lock" ]]; then
  swaylock
else
  echo "foo"
fi
  
