.PHONY: pdf build force clean down

pdf:
	docker compose up --build --abort-on-container-exit --exit-code-from latex

build:
	docker compose build

force:
	docker compose run --rm force

clean:
	docker compose run --rm clean

down:
	docker compose down --remove-orphans
