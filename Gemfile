source 'https://rubygems.org'

gem 'rails', '3.2.12'
ruby '1.9.3'

# Server-side --------------------------------------------------------------------------------------------------------
gem 'devise'
gem 'activeadmin'
gem 'turbolinks'
gem 'capistrano'
gem 'newrelic_rpm'
gem 'thin'
gem 'libv8', '= 3.11.8.13'
gem 'whenever', require: false
gem 'figaro', '>= 0.5.3'

# Image uploads and hosting-related ----------------------------------------------------------------------------------
#gem 'fog'
gem 's3_direct_upload'
gem 'rmagick'
gem 'carrierwave'
#gem 'carrierwave_direct'

# Tools/utilities:  --------------------------------------------------------------------------------------------------
gem 'annotate'

# Mobile site optimization:  -----------------------------------------------------------------------------------------
gem 'mobylette'

# Tools used in User Profiles: ---------------------------------------------------------------------------------------
gem 'draper'
gem 'best_in_place'
gem 'geocoder'
gem 'simple_form'
gem 'friendly_id'
gem 'wicked'
gem 'acts_as_list'
gem 'mailboxer'
gem 'aws-s3'
gem 's3_direct_upload'

# Views: -------------------------------------------------------------------------------------------------------------
gem 'haml-rails'
gem 'jquery-rails', '2.3.0'

group :test, :development do
  gem 'rspec-rails', '>= 2.12.0'
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'zeus'

  # Parallel tests have been giving me issues so I've disabled them temporarily
  #gem 'zeus-parallel_tests'
  #gem 'parallel_tests'

  gem 'growl'
  gem 'meta_request'
  gem 'faker'
  gem 'rb-fsevent'
  gem 'rb-inotify', require: false
  gem 'rb-fchange', require: false

end

group :test do
  gem 'shoulda-matchers'
  gem 'spork', '0.9.0'
  gem 'selenium-webdriver'
  gem 'database_cleaner', '0.7.0'
  gem 'capybara'
  gem 'capybara-webkit', require: false
  gem 'launchy', '2.1.0'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman'
  gem 'html2haml'
  gem 'quiet_assets'

  gem 'bullet'

  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-zeus'
  gem 'guard-bundler'
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

  # Gems used for markdown (Can we remove these please?)
  gem 'redcarpet' # Makes it possible to use a markdown filter within haml
  gem 'markdown-rails'
end
