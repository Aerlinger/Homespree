source 'https://rubygems.org'

gem 'rails', '3.2.12'

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

gem 'mercury-rails'

# Tools used in User Profiles:
gem 'draper'
gem 'best_in_place'
gem 'introjs-rails'
gem 'rmagick'
gem 'carrierwave'
gem 'geocoder'
gem 'simple_form'


gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'figaro', '>= 0.5.3'
gem 'haml-rails'
gem 'paperclip'


group :test, :development do
  gem 'sqlite3'

  gem 'rspec-rails', '>= 2.12.0'

  gem 'turn', :require => false
  gem 'meta_request'

  gem 'faker'
  # Todo: Consider Fabrication as an alternative to FactoryGirl (Builder design pattern)
  gem 'factory_girl_rails', '1.4.0'

  gem 'rb-fsevent'
  gem 'guard-rspec'
  gem 'guard-spork', '0.3.2'
  gem 'spork', '0.9.0'
  gem 'launchy', '2.1.0'
end

group :test do
  gem 'simplecov', '>=0.3.8', :require => false
  gem 'database_cleaner', '0.7.0'
  gem 'capybara'
end

group :development do
  gem 'bullet'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman'
  gem 'html2haml'
end

group :production do
  gem 'pg'
end

gem 'coffee-rails', '~> 3.2.1'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'

  gem 'less-rails' #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem 'twitter-bootstrap-rails'
end
