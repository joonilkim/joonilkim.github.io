JEKYLL_VERSION := 3.8

build:
	docker-compose run --rm app jekyll build

run:
	docker-compose run --rm --service-ports app jekyll serve
