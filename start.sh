#!/bin/bash

# Change USERNAME
#cat /id_rsa.pub| gitreceive upload-key USERNAME
cp -a /tmp/.ssh /root/
chown -R root. /root/.ssh
chmod 700 /root/.ssh
chmod 600 /root/.ssh/id_rsa
cat /id_rsa.pub| gitreceive upload-key $TARGETUSER
echo "----->>>> ADDing this keys on https://github.com/WebHostingCoopTeam/keys <<<<----"
cd /usr/local/keys
cat /id_rsa.pub keys
cat /id_rsa.pub >>keys
echo "------>>>> ADDing this gitreceive-keys on https://github.com/WebHostingCoopTeam/keys <<<<----"
cat /home/git/.ssh/authorized_keys
cat /home/git/.ssh/authorized_keys >>gitreceive-keys
git commit -am "adding $TARGETUSER to the team"
git status
git push
