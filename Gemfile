source 'https://rubygems.org'

gem 'rails', '3.2.11'

gem "devise"
gem "activeadmin"
gem "turbolinks"
gem "capistrano"
gem 'newrelic_rpm'
gem 'thin'
gem 'libv8', '= 3.11.8.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
group :test, :development do
  gem 'sqlite3'
  gem 'rspec-rails', ">= 2.12.0"
  gem 'capybara'
  gem 'turn', :require => false
end

group :development do
  gem "better_errors"
end

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'

  gem 'less-rails' #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem 'twitter-bootstrap-rails'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem '`jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# To use debugger
# gem 'debugger'
