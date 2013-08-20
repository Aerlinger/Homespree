source 'https://rubygems.org'

gem 'rails', '4.0.0'
ruby '1.9.3'

# Let the party begin ------------------------------------------------------------------------------------------------
gem 'homespree'

             # Active Admin gems for rails 4:
gem 'devise',              github: 'plataformatec/devise'
gem 'responders',          github: 'plataformatec/responders'
gem 'inherited_resources', github: 'josevalim/inherited_resources'
gem 'ransack'#,             github: 'ernie/ransack', branch: 'rails-4'
gem 'activeadmin',         github: 'gregbell/active_admin', branch: 'rails4'
gem 'formtastic',          github: 'justinfrench/formtastic'
gem 'sass-rails'

# Server-side --------------------------------------------------------------------------------------------------------
gem 'libv8', '= 3.11.8.13'
gem 'therubyracer', :platforms => :ruby
gem 'delayed_job_active_record', '>= 4.0.0.beta2'
gem 'thin'
gem 'whenever', require: false
gem 'figaro', '>= 0.5.3'
gem 'stripe'

# Tools/utilities:  --------------------------------------------------------------------------------------------------
gem 'annotate'

# Mobile site optimization:  -----------------------------------------------------------------------------------------
gem 'mobylette'

# Tools used in User Profiles: ---------------------------------------------------------------------------------------
gem 'draper'
gem 'best_in_place', github: 'bernat/best_in_place'
gem 'geocoder'
gem 'gmaps4rails'
gem 'reform'  # TODO: Deprecated
gem 'simple_form'
gem 'friendly_id', git: "https://github.com/norman/friendly_id.git"
gem 'wicked'
gem 'acts_as_list'
gem 'rack-timeout'
gem 'mailboxer'
gem 'email_validator'
gem 's3_direct_upload'

# Misc.
gem 'email_validator'
gem 'protected_attributes'

# Views: -------------------------------------------------------------------------------------------------------------
gem 'turbolinks'
gem 'haml-rails'


# Assets
gem 'coffee-rails'
gem 'sass-rails'
gem 'jquery-turbolinks'
gem 'jquery-fileupload-rails'
gem 'jquery-ui-rails'
gem 'jquery-rails'

gem 'flexslider', :git => 'https://github.com/constantm/Flexslider-2-Rails-Gem.git'

gem 'uglifier'

gem 'less-rails' #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'less-rails-fontawesome'

gem 'twitter-bootstrap-rails'#, '2.2.6'


group :test, :development do
  gem 'rspec-rails', '>= 2.12.0'
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'zeus'

  gem 'shoulda-matchers'
  gem 'growl'
  gem 'meta_request'
  gem 'faker'
  gem 'rb-fsevent'
  gem 'rb-inotify', require: false
  gem 'rb-fchange', require: false
end

group :test do
  gem 'simplecov', '>=0.3.8', require: false
  gem 'shoulda-matchers'
  gem 'spork', '0.9.0'
  gem 'selenium-webdriver'
  gem 'database_cleaner', '0.7.0'
  gem 'capybara'
  gem 'capybara-webkit', require: false
  gem 'launchy', '2.1.0'
  gem 'timecop'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman'
  gem 'html2haml'
  gem 'quiet_assets'

  #gem 'bullet'   #FIXME: Bullet is throwing exceptions AirbrakeNotifier, disabled for now.
  gem 'guard'
  gem 'guard-rspec'
  #gem 'guard-zeus'
  gem 'guard-bundler'
end

group :staging, :production do
  gem 'newrelic_rpm', '>= 3.5.7'
  gem 'rails_12factor'
  gem 'pg'
end

group :staging do
  gem 'ruby-prof'
end
