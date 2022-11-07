## For restaring the entire cluster right from this repo itself
up-all:
	docker-compose  up -d
down-all:
	docker-compose down

start-all:
	docker-compose start
stop-all:
	docker-compose stop
restart-all:
	docker-compose down
	docker-compose up -d


## Please use below commands wisely as it will clean up most resources such
## as DB caching and redis etc... restarting the environment will be slower
clean-all:
	docker-compose down
	docker image prune --all -f
	docker volume prune -f

clean-rebuild:
	make clean-all
	make start-all