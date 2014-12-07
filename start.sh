#!/bin/bash

# Change USERNAME
# cat /id_rsa.pub| gitreceive upload-key USERNAME
cp -a /tmp/.ssh /root/
chown -R root. /root/.ssh
chmod 700 /root/.ssh
chmod 600 /root/.ssh/id_rsa
# Update
cd /usr/local/keys
git pull
# Generate the line
cat /id_rsa.pub| gitreceive upload-key $TARGETUSER
# Grab the originals
cp /usr/local/keys/keys /tmp/keys.new
cp /usr/local/keys/gitreceive-keys /tmp/gitreceive-keys.new
# Grab the new
cat /id_rsa.pub >>/tmp/keys.new
cat /home/git/.ssh/authorized_keys >>/tmp/gitreceive-keys.new
# Sort and uniq to prevent duplicates
cat /tmp/keys.new|sort|uniq>/tmp/keys.new.uniq
cat /tmp/gitreceive-keys.new|sort|uniq>/tmp/gitreceive-keys.new.uniq
# Show us the Adds
echo "----->>>> ADDing this keys on https://github.com/WebHostingCoopTeam/keys <<<<----"
diff /tmp/keys.new.uniq /usr/local/keys/keys
echo "------>>>> ADDing this gitreceive-keys on https://github.com/WebHostingCoopTeam/keys <<<<----"
diff /tmp/gitreceive-keys.new.uniq /usr/local/keys/gitreceive-keys
cd /usr/local/keys
cp /tmp/keys.new.uniq /usr/local/keys/keys
cp /tmp/gitreceive-keys.new.uniq /usr/local/keys/gitreceive-keys
git pull
git commit -am "adding $TARGETUSER to the team"
git status
git push
