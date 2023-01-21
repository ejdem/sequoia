source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.6"
gem "rails", "~> 7.0.4", ">= 7.0.4.1"

gem "sprockets-rails"

gem "pg"

gem "puma", "~> 5.0"

gem "jbuilder"

gem "csv"

# Workers
gem 'redis'
gem 'sidekiq', '~> 6.4'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false


group :development, :test do
  gem 'pry'
  gem 'pry-rails'
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem 'minitest'
  gem 'minitest-rails'
end
