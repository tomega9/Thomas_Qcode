#!/bin/bash

# Schedule the script to run at 6 am GMT on weekdays (Monday to Friday)
(crontab -l 2>/dev/null; echo "0 6 * * 1-5 /bin/bash /C:\Thomas_Qcode/tick/schedule6am.sh") | crontab -

# Change directory to the folder containing the file
cd /C:\Thomas_Qcode\tick\schedual6am.sh

# Run the function
q -l feedhandler.q -q .z.ts1

