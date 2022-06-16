# Shell_Script_Alerts

Set an executable permission to the file “Diskuage_alert.sh” :

# chmod +x /opt/script/Diskuage_alert.sh
Run the following script to see if it works as expected:

# sh /opt/script/Diskuage_alert.sh

Finally add a cronjob to automate this as shown below. It will run every 10 minutes

# crontab -e
*/10 * * * * /bin/bash /opt/Diskuage_alert.sh

Note: As the script is scheduled to run once every 10 minutes, you will receive an email alert every 10 minutes.

For example: if your system reaches the given limit after 16 minutes, you will receive an email alert in the second cycle, i.e. after 20 minutes (2nd 10 minute cycle).

Reference: https://www.2daygeek.com/shell-script-monitor-disk-space-usage-linux/
