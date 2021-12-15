#!/bin/bash
source /home/ec2-user/.bash_profile

pm2 delete all
cd /home/ec2-user/build/
pm2 start app.js