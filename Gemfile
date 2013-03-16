source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Server-specific:
gem 'devise'
gem 'activeadmin'
gem 'turbolinks'
gem 'capistrano'
gem 'newrelic_rpm'
gem 'thin'
gem 'libv8', '= 3.11.8.13'

# Mobile site optimization:
gem 'mobylette'

# Profile creation wizard:
gem 'wicked'

# Tools used in User Profiles:
gem 'redcarpet'
gem 'rmagick'
gem 'carrierwave'

gem 'jquery-rails'
gem 'geocoder'


group :test, :development do
  gem 'sqlite3'
  gem 'rspec-rails', '>= 2.12.0'
  gem 'capybara'
  gem 'turn', :require => false
  gem 'meta_request'

  gem 'faker'
  gem 'factory_girl_rails', '1.4.0'
  gem 'database_cleaner', '0.7.0'
  gem 'rb-fsevent'
  gem 'guard-rspec'
  gem 'guard-spork', '0.3.2'
  gem 'spork', '0.9.0'
  gem 'launchy', '2.1.0'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :production do
  gem 'pg'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'

  gem 'less-rails' #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem 'twitter-bootstrap-rails'
end



