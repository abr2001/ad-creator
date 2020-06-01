# Ad Creator  Microservice

# Зависимости

- Ruby `2.6.6`
- Bundler `2.1.4`
- Sinatra `2.0.0`
- Sequel `5.32.0`
- Puma `4.3+`
- PostgreSQL `9.3+`

# Установка и запуск приложения

```
bundle install

createdb -h localhost -U postgres ads_microservice_development
bin/rake db:migrate
```

```
bin/puma
```

