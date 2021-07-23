## Приложение "Скачиватель картинок"
#### Тестовое задание

#### Аннотация
Проект реализован на `Ruby on Rails (v6.1.4)` и `Ruby v2.7.2`.

#### Опробованные/использованные технологии:
+ ActiveStorage
+ gem HTTParty
+ Сервисные объекты

#### Установка и запуск
Перед запуском приложения необходимо выполнить установку всех необходимых гемов и подготовку базы данных. Для этого в консоли в директории с приложением необходимо выполнить команды:

```
sudo service postgresql start
make prepare
```

Или выполнить отдельно команды

```
bundle install
bundle exec rails db:create
bundle exec rails db:migrate
```

Для запуска локального сервера необходимо выполнить команду:

```
make server
```

Или

```
bundle exec rails s
```
