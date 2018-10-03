source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

#exact ruby version
ruby '2.4.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# bundler-audit provides patch-level verification for Bundled apps
gem 'bundler-audit', '~> 0.6.0', require: false
# Better Errors replaces the standard Rails error page with a much better and more useful error page
gem 'better_errors'
# necessary to use Better Errors' advanced features
gem 'binding_of_caller', platforms: :ruby
# Code coverage for Ruby
gem 'simplecov', require: false
# compare licenses against a user-defined whitelist, and give you an actionable exception report
gem 'license_finder', '~> 3.0', '>= 3.0.1', require: false
# Use for fighting the N+1 problem in Ruby
gem 'bullet'
# Brakeman is an open source static analysis tool which checks Rails applications for security vulnerabilities.
gem 'brakeman', require: false
# RuboCop configuration which has the same code style checking as official Ruby on Rails
gem 'rubocop', '~> 0.51.0', require: false

# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

#Bootstrap 4
gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'
gem 'comfy_bootstrap_form', '~> 4.0.0'

#password hashing
gem 'bcrypt'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # bundler-audit provides patch-level verification for Bundled apps
  gem 'bundler-audit', '~> 0.6.0', require: false
  # Bundler guard allows to automatically & intelligently install/update bundle when needed
  gem 'guard-bundler', '~> 2.1', require: false
  # compare licenses against a user-defined whitelist, and give you an actionable exception report
  gem 'license_finder', '~> 3.0', '>= 3.0.1', require: false
  # Brakeman is an open source static analysis tool which checks Rails applications for security vulnerabilities.
  gem 'brakeman', require: false
  # Better Errors replaces the standard Rails error page with a much better and more useful error page
  gem 'better_errors'
  # necessary to use Better Errors' advanced features
  gem 'binding_of_caller', platforms: :ruby
  # RuboCop configuration which has the same code style checking as official Ruby on Rails
  gem 'rubocop', '~> 0.51.0', require: false
  gem 'guard-rubocop', require: false
  # i18n-tasks helps you find and manage missing and unused translations
  gem 'i18n-tasks', require: false
  # IYE makes it easy to translate your Rails I18N files and keeps them up to date
  gem 'iye', require: false
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # Step-by-step debugging and stack navigation in Pry
  gem 'pry-byebug', platform: :ruby
  # Pry is a powerful alternative to the standard IRB shell for Ruby
  gem 'pry-rails'
  # Pretty print your Ruby objects with style -- in full color and with proper identation
  gem 'awesome_print'
  # Add a comment summarizing the current schema to the top or bottom of each of your ActiveRecord models, Specs, factory_girl factories...
  gem 'annotate'
  # Annotate guard runs the annotate gem when needed
  gem 'guard-annotate', '~> 2.3'
  # Use for fighting the N+1 problem in Ruby
  gem 'bullet'
  # Speedup RSpec + Cucumber by running parallel on multiple CPU cores
  gem 'parallel_tests'
end

group :test do
  # Guard is a command line tool to easily handle events on file system modifications
  gem 'guard'
  gem 'guard-minitest'
  # This gem brings back assigns to your controller tests as well as assert_template
  gem 'rails-controller-testing'
  # Strategies for cleaning databases in Ruby. Can be used to ensure a clean state for testing.
  gem 'database_cleaner'
  # Code coverage for Ruby
  gem 'simplecov', require: false
  # Collection of testing matchers extracted from Shoulda
  gem 'shoulda-matchers'
end

group :production do
  gem 'pg', '~> 0.18.4'
  # gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
