build:
	docker build -t health_test .
run:
	docker run -it -d -p 8000:80 --name health health_test
inspect:
	docker inspect health

exec:
	docker exec -it health /bin/bash
ps:
	docker ps -a
img:
	docker images
rm:
	docker rm -f $$(docker ps -aq)
rmi:
	docker rmi -f $$(docker images -q)
