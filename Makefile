ci: 
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

compose-up:
	docker compose up

compose-prod-build:
	docker compose -f docker-compose.yml build app

compose-prod-push:
	docker compose -f docker-compose.yml push app
