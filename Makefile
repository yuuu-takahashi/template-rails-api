DC = docker-compose

build:
	$(DC) build

up:
	$(DC) up

down:
	$(DC) down

bundle-install:
	$(DC) run --rm web bundle install

bundle-add:
	$(DC) run --rm web bundle add $(filter-out $@,$(MAKECMDGOALS))

run:
	$(DC) run --rm web $(filter-out $@,$(MAKECMDGOALS))

clear:
	docker ps -aq | xargs -r docker stop
	docker ps -aq | xargs -r docker rm
	docker volume ls -q | xargs -r docker volume rm

exec-rails:
	docker exec -it template-rails-api-web bash

exec-mysql:
	docker exec -it template-rails-api-db bash

inspect-rails:
	docker inspect template-rails-api-web

inspect-mysql:
	docker inspect template-rails-api-db

# mysql -h 127.0.0.1 -P 3306 -u user -p
rubocop:
	$(DC) run --rm web bundle exec rubocop -A

rspec:
	$(DC) run --rm web bundle exec rspec

db-create:
	$(DC) run --rm web bundle exec rails db:create

db-migrate:
	$(DC) run --rm web bundle exec rails db:migrate

db-setup:
	$(DC) run --rm web bundle exec rails db:setup
	$(DC) run --rm web bundle exec rails db:migrate

migrate:
	$(DC) run --rm web bundle exec rails g migration $(filter-out $@,$(MAKECMDGOALS))