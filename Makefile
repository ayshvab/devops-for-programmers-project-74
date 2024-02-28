env: 
	cp .env.example .env


app-install:
	docker compose run --rm app npm ci

compose:
	docker compose up -d

compose-fg:
	docker compose up

compose-build:
	docker compose build

compose-logs:
	docker compose logs -f

compose-down:
	docker compose down --remove-orphans || true

compose-stop:
	docker compose stop || true

compose-clear:
	docker compose down -v --remove-orphans || true

compose-prod-build:
	docker compose -f docker-compose.yml build app

ci: compose-prod-build
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

compose-prod-push:
	docker compose -f docker-compose.yml push app
