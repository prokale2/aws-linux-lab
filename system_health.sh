#!/bin/bash

# Definiramo stazu do datoteke u koju spremamo izvješće
LOG_FILE="$HOME/projects/aws-linux-lab/health.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "=== System Health Check: $TIMESTAMP ===" >> $LOG_FILE

# 1. Zauzeće RAM memorije
echo "--- RAM Usage ---" >> $LOG_FILE
free -m | awk 'NR==2{printf "Zauzetost memorije: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }' >> $LOG_FILE

# 2. Zauzeće diska
echo "--- Disk Usage ---" >> $LOG_FILE
df -h / | awk 'NR==2{print "Zauzetost diska: " $3 "/" $2 " (" $5 ")"}' >> $LOG_FILE

# 3. Provjera rada Nginx poslužitelja
echo "--- Nginx Status ---" >> $LOG_FILE
if systemctl is-active --quiet nginx; then
    echo "Nginx servis: AKTIVAN (Radi)" >> $LOG_FILE
else
    echo "Nginx servis: NEAKTIVAN (Ugašen)" >> $LOG_FILE
fi

echo -e "\n" >> $LOG_FILE

