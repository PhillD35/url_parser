console:
	bundle exec rails console

c: console

migration:
	bundle exec rails db:migrate

m: migration

prepare:
	bundle install
	bundle exec rails db:create
	bundle exec rails db:migrate

server:
	bundle exec rails server

s: server
