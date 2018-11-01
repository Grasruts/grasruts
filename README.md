# Grasruts

An open source crowdfunding platform for Nepal.

See [the platform](http://grasruts.com) in action

# Install Locally

Make sure you are running postgresql 9.5

- Clone the repo
- rename `.env.sample` to `.env`
- add values to `.env`
- rake db:create
- rake db:migrate
- rake db:seed
- npm install
- rails s
- run `foreman start` in a new tab

# Deploying
Install nginx, postgresql, monit, redis, certbot

Install ruby compiled with jemalloc

Make necessary changes to `config/deploy.rb` and `config/deploy/`





