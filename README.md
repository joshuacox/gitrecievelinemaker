gitrecievelinemaker
===================

###REQUIREMENTS
docker >1.3.1
apt-cacher

older versions of docker might work, unknown YMMV
apt-cacher is a necessity if you’re dev’ing with debian and docker or any other vm tech
give some relief to the repos up top and speed up your dls by using a cache
of note, I still have issues with ubuntu so I run a separate apt-cacher-ng on 3143
for ubuntu most of the time, I’ll most likely dockerize both soon.

###USAGE

Install gitreceive and make the proper key receive line for a keys repo associated with an octohost

clone this repo

place your id_rsa.pub in the root directory of this repo

`make key`

you will be prompted for everything else

if you have write access to our github account you will be automatically added

### notes
This is intended to be used with the keys repo for an octohost

because the default gitreceive thinks its binary is in /usr/local/bin
log into your octohost and symlink it i.e.
```
cd /usr/local/bin/
ln -s /usr/bin/gitreceive ./
```

http://octohost.io/

here is my key repo as an example:

https://github.com/WebHostingCoopTeam/keys

notice the addus.sh and octoaddus.sh scripts which might be of use to someone
