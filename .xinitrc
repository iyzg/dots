while true; do
   xsetroot -name "$( date +"%R" )"
   sleep 1m    # Update time every minute
done &

exec dwm
