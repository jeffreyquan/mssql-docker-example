ENV_FILE = $(shell [ -e ".env" ] && echo ".env")

include $(ENV_FILE)

.PHONY: down up

down: stop

up: start

.PHONY: start
start:
	docker compose --env-file=$(ENV_FILE) -f compose.yaml up --build

.PHONY: stop
stop:
	docker compose --env-file=$(ENV_FILE) -f compose.yaml down