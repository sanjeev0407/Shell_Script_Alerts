# Shell_Script_Alerts

Set an executable permission to the file “disk-usage-alert.sh” :

# chmod +x /opt/script/diskalert.sh
Run the following script to see if it works as expected:

# sh /opt/script/diskalert.sh

Finally add a cronjob to automate this as shown below. It will run every 10 minutes

# crontab -e
*/10 * * * * /bin/bash /opt/diskalert.sh

Note: As the script is scheduled to run once every 10 minutes, you will receive an email alert every 10 minutes.

For example: if your system reaches the given limit after 16 minutes, you will receive an email alert in the second cycle, i.e. after 20 minutes (2nd 10 minute cycle).
