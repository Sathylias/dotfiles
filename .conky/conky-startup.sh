sleep 20s
killall conky
cd "/home/maxwell/.conky/LSD/lsd2"
conky -c "/home/maxwell/.conky/LSD/lsd2/conkyrc" &
cd "/home/maxwell/.conky/TODO"
conky -c "/home/maxwell/.conky/TODO/custom" &
cd "/home/maxwell/.conky/TODOLEARN"
conky -c "/home/maxwell/.conky/TODOLEARN/custom" &
