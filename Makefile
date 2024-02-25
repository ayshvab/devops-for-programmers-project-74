compose-test: 
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

compose-up:
	docker compose up
