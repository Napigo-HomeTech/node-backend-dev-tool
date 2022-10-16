start-all:
	docker-compose up -d;

stop-all:
	docker-compose down

restart: docker.stop-all docker.start-all


rebuild:
	echo "Rebuilding container : $(NAME)"
	docker-compose kill $(NAME)
	docker-compose up -d --build $(NAME)


## For restaring the entire cluster right from this repo itself
start-all:
	docker-compose  up -d
stop-all:
	docker-compose down

restart-all:
	docker-compose down
	docker-compose up -d


## Please use below commands wisely as it will clean up most resources such
## as DB caching and redis etc... restarting the environment will be slower
clean-all:
	docker-compose down
	docker image prune --all -f
	docker volume prune -f

clean-restart-all:
	make clean-all
	make start-all