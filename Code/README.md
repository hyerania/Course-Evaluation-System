# CSCE606

## Setup Instructions

### Local Setup Instructions (Ruby 2.2.3)

```
bundle install
bin/rake db:create db:migrate db:seed
bin/rails s
open http://localhost:3000
```

### Heroku Setup Instructions (Ruby 2.2.3)

Create your app on heroku with the Postgres addon and then do:

```
heroku git:remote -a <my-heroku-app>
git push heroku master
heroku run rake db:migrate db:seed
heroku open
```