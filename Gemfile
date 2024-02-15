source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.8'

gem 'activerecord-jdbcsqlite3-adapter'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.7', '>= 6.1.7.6'

group :development do
  gem 'listen', '~> 3.3'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'factory_bot', '~> 5.0'
  gem 'factory_bot_rails', '~> 5.0'
  gem 'faker'
  gem 'rack-cors'
  gem 'rspec-rails'
end

gem 'activerecord-jdbcpostgresql-adapter', platform: :jruby
