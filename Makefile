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

clean: purge

	#docker run -t gitreceivelinemaker -v ~/.ssh:/root/.ssh
rundocker:
	@docker run --name=gitreceivelinemaker -p 10080:80 \
	  -v ~/.ssh:/tmp/.ssh \
	  -v ~/.gitconfig:/root/.gitconfig \
		-v /var/run/docker.sock:/run/docker.sock \
		-v $(shell which docker):/bin/docker \
	-t gitreceivelinemaker

builddocker:
	/usr/bin/time -v docker build -t gitreceivelinemaker .

stop:
	@echo "Stopping redmine..."
	@docker stop gitreceivelinemaker >/dev/null

purge: stop
	@echo "Removing stopped container..."
	@docker rm gitreceivelinemaker >/dev/null

logs:
	@docker logs -f gitreceivelinemaker

beep:
	@echo "beep"
	@aplay /usr/share/sounds/alsa/Front_Center.wav
# @ogg123 /usr/share/sounds/KDE-Im-Irc-Event.ogg
