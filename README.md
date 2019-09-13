# README

## Requirements

- _Ruby_ > 2.6.3
- _MySQL_ > 8.0.15

## Set up project

```sh
git clone git@github.com:JuanmaLambre/myhealth-serv.git
cd myhealth-serv
bundle install
```

### Start Server

In order to start the server on http://localhost:3000/ you will need to run:

```sh
bundle exec rails s
```

### Use Console

```sh
bundle exec rails c
```

### Create database

```sh
cp config/database.example.yml config/database.yml
bundle exec rake db:create db:migrate db:seed
```

### Drop database

```sh
bundle exec rake db:drop
```

### Annotate Models

```sh
bundle exec annotate --exclude tests,fixtures,factories,serializers
```