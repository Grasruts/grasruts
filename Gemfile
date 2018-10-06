# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
gem 'sass-rails'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'devise'
gem 'font-awesome-rails'
gem 'jquery-rails'
gem 'omniauth-facebook'
# gem 'omniauth-google-oauth2'
gem 'sidekiq'
# gem 'sidekiq-scheduler'
gem 'slim-rails'
gem 'wysiwyg-rails'
# gem 'elasticemail', git: "git://github.com/klebervirgilio/elasticemail.git"
# gem 'chartkick'
gem 'country_select', '~> 3.1'
gem 'discard', '~> 1.0'
gem 'dotenv-rails'
gem 'draper'
gem 'paperclip', '~> 6.0.0'
gem 'pg_search'
# gem 'pundit'
gem 'simple_form'
gem 'video_info'
gem 'rails_admin', '~> 1.3'
gem 'roo', '~> 2.7.0'
gem 'sentry-raven'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'rubocop'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'foreman'
  gem 'letter_opener'
  gem 'rails-erd'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
