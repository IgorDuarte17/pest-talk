include .env

help: 	 		## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build: 		 	## Build all docker containers.
	@docker-compose -f ./docker-compose.yml build --no-cache

up: 	 		## Up all docker containers.
	@docker-compose -f ./docker-compose.yml up -d

down: 	 		## Down all docker containers.
	@docker-compose -f ./docker-compose.yml down

in-php: 	 	## Inside php container.
	@docker exec -it -u root pest-talk-php bash

test: 	 		## Run test from pest.
	@docker exec -it -u root pest-talk-php vendor/bin/pest

coverage: 	 	## Run code coverage from pest.
	@docker exec -it -u root pest-talk-php vendor/bin/pest --coverage
