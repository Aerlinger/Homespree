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
gem 'geocoder'
gem 'simple_form'
gem 'friendly_id'
gem 'wicked'

gem 'jquery-rails', "2.3.0"
gem 'acts_as_list'
gem 'figaro', '>= 0.5.3'
gem 'haml-rails'
gem 'annotate'

gem 'mailboxer'
gem 'aws-s3'
gem 's3_direct_upload'

gem 'rmagick'
gem 'carrierwave'


group :test, :development do
  gem 'sqlite3'
  gem 'shoulda-matchers'
  gem 'rspec-rails', '>= 2.12.0'
  gem 'turn', :require => false
  gem 'meta_request'
  gem 'parallel_tests'
  gem 'zeus-parallel_tests'
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'rb-fsevent'
  gem 'launchy', '2.1.0'
end

group :test do
  gem 'guard-rspec'
  gem 'spork', '0.9.0'
  gem 'zeus'
  gem 'selenium-webdriver'
  gem 'simplecov', '>=0.3.8', :require => false
  gem 'database_cleaner', '0.7.0'
  gem 'capybara'
  #gem 'vcr'
  #gem 'fakeweb'
end

group :development do
  gem 'bullet'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman'
  gem 'html2haml'
  gem 'quiet_assets'
  gem 'meta_request'
end

group :production do
  gem 'pg'
end

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'sass-rails',   '~> 3.2.3'

  gem 'jquery-fileupload-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'

  gem 'less-rails' #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem 'less-rails-fontawesome'
  gem 'twitter-bootstrap-rails', '2.2.6'
end
