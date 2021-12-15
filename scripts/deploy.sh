#!/bin/bash
/home/ec2-user/.nvm/versions/node/v14.18.2/bin/pm2 delete all
cd /home/ec2-user/build/
/home/ec2-user/.nvm/versions/node/v14.18.2/bin/pm2 start app.js