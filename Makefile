DC = docker-compose

build:
	$(DC) build

up:
	$(DC) up web db

exec-web:
	docker exec -it template-rails-api_web bash

exec-db:
	docker exec -it template-rails-api_db bash

inspect-web:
	docker inspect web

inspect-db:
	docker inspect db

lint:
	$(DC) run --rm web-lint sh -c "bundle exec rubocop -A"

rspec:
	$(DC) run --rm web-test bundle exec rspec

clear:
	docker ps -aq | xargs -r docker stop
	docker ps -aq | xargs -r docker rm
	docker volume ls -q | xargs -r docker volume rm



db-create:
	$(DC) run --rm web bundle exec rails db:create

db-migrate:
	$(DC) run --rm web bundle exec rails db:migrate

db-setup:
	$(DC) run --rm web bundle exec rails db:setup