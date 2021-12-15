#!/bin/bash
echo $(whoami)
pm2 delete all
cd /home/ec2-user/build/
pm2 start app.js