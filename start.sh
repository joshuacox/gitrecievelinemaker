#!/bin/bash

# Change USERNAME
#cat /id_rsa.pub| gitreceive upload-key USERNAME
cat /id_rsa.pub| gitreceive upload-key $TARGETUSER
echo "----->>>> ADD this keys on https://github.com/WebHostingCoopTeam/keys <<<<----"
cat /id_rsa.pub
echo "------>>>> ADD this gitreceive-keys on https://github.com/WebHostingCoopTeam/keys <<<<----"
cat /home/git/.ssh/authorized_keys
echo "Now run this"
echo "git clone https://github.com/WebHostingCoopTeam/keys.git"
echo "and add the above lines"
