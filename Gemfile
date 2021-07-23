# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'httparty'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'pry-rails'

  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  gem 'rubocop', require: false
end
