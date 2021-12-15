#!/bin/bash
source /home/ec2-user/.bash_profile

pwd
cd /home/ec2-user/

echo "> Get Current Profile"
CURRENT_PROFILE=$(curl -s http://127.0.0.1/profile)
echo "> $CURRENT_PROFILE"

echo "> Find IDLE Profile"
if [ $CURRENT_PROFILE == set1 ]
then
  IDLE_PROFILE=profile2
elif [ $CURRENT_PROFILE == set2 ]
then
  IDLE_PROFILE=profile1
else
  echo "> Profile Not Matched"
  IDLE_PROFILE=profile1
fi

echo "> Get IDLE PID"
IDLE_PID=$(pgrep -f /home/ec2-user/build/app.js)
if [ -z $IDLE_PID ]
then
  echo "> No Running Application"
else
  echo "> stop pm2 process $IDLE_PID"
  pm2 stop $IDLE_PID
fi

echo "> $IDLE_PROFILE start"
pm2 start $IDLE_PROFILE.config.js