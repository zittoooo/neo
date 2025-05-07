build:
	docker build -t centos .
run:
	docker run -it -d --name centos centos
history:
	docker history centos

exec:
	docker exec -it cmds /bin/bash
ps:
	docker ps -a
img:
	docker images
rm:
	docker rm -f $$(docker ps -aq)
rmi:
	docker rmi -f $$(docker images -q)
