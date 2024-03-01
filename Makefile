compose-setup: prepare-env compose-build compose-install

compose-build:
	docker compose build

compose-install:
	docker compose run app make setup

compose:
	docker compose up --abort-on-container-exit

compose-bg:
	docker compose up -d --abort-on-container-exit

compose-bash:
	docker compose run --rm app bash

compose-logs:
	docker compose logs -f

compose-down:
	docker compose down --remove-orphans || true

compose-stop:
	docker compose stop || true

compose-clear:
	docker compose down -v --remove-orphans || true

compose-test:
	docker compose run app make test

compose-test-ci:
	docker compose -f docker-compose.yml build app
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

prepare-env:
	cp -n .env.example .env || true
