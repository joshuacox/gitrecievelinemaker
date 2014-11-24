#!/bin/bash

# Change USERNAME
#cat /id_rsa.pub| gitreceive upload-key USERNAME
echo "----->>>> ADD this keys on https://github.com/WebHostingCoopTeam/keys <<<<----"
cat /id_rsa.pub
echo "------>>>> ADD this gitreceive-keys on https://github.com/WebHostingCoopTeam/keys <<<<----"
cat /home/git/.ssh/authorized_keys
