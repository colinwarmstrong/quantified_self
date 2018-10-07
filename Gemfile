source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'active_model_serializers', '~> 0.10.0'
gem 'coveralls', require: false
gem 'figaro'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.8'
  gem 'pry'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'codecov', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
