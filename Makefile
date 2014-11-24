all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""  CHANGE USERNAME in start.sh!!!
	@echo ""  Add your key to the basedir ./id_rsa.pub
	@echo "   1. make key       - build the gitreceivelinemaker image"

key: builddocker rundocker

build: builddocker beep

run: rundocker beep

clean: cleanvendor cleanbuilds

rundocker:
	docker run -t gitreceivelinemaker

builddocker:
	/usr/bin/time -v docker build -t gitreceivelinemaker .

beep:
	@echo "beep"
	@aplay /usr/share/sounds/alsa/Front_Center.wav
# @ogg123 /usr/share/sounds/KDE-Im-Irc-Event.ogg
