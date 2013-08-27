require 'rubygems'
require 'simplecov'
SimpleCov.start 'rails'


ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'mobylette/helmet'
require 'capybara/rspec'
require 'capybara/rails'
require 'draper/test/rspec_integration'

module ::RSpec::Core
  class ExampleGroup
    include Capybara::DSL
    include Capybara::RSpecMatchers
  end
end

#require 'simplecov'
#SimpleCov.start 'rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|

  #config.before(:all) do
  #  DeferredGarbageCollection.start
  #end
  #
  #config.after(:all) do
  #  DeferredGarbageCollection.reconsider
  #end

  # Configure Geocoder:
  Geocoder.configure(lookup: :test)

  Geocoder::Lookup::Test.set_default_stub(
    [
      {
        'latitude'     => 40.7143528,
        'longitude'    => -74.0059731,
        'address'      => 'New York, NY, USA',
        'state'        => 'New York',
        'state_code'   => 'NY',
        'country'      => 'United States',
        'country_code' => 'US'
      }
    ]
  )
  Geocoder::Lookup::Test.add_stub(
    "New York, NY", [
    {
      'latitude'     => 40.7143528,
      'longitude'    => -74.0059731,
      'address'      => 'New York, NY, USA',
      'state'        => 'New York',
      'state_code'   => 'NY',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
  )

  #Draper::ViewContext.test_strategy :fast do
  #  include ApplicationHelper
  #end

  class Warden::SessionSerializer
    def serialize(record)
      record
    end

    def deserialize(keys)
      keys
    end
  end

  config.mock_with :rspec

  config.include Rails.application.routes.url_helpers
  config.include ActionView::TestCase::Behavior, example_group: { file_path: %r{spec/presenters} }
  config.include FactoryGirl::Syntax::Methods

  config.include Mobylette::Helmet, :type => :controller
  config.include Devise::TestHelpers, :type => :controller

  config.order = "random"
  config.mock_with :rspec
  config.use_transactional_fixtures                      = false
  config.infer_base_class_for_anonymous_controllers      = false
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true


  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation, except: %w[project_types service_types project_fields]
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  #config.before(:all) do
  #  DeferredGarbageCollection.start
  #end
  #
  #config.after(:all) do
  #  DeferredGarbageCollection.start
  #end
  #
  #config.before(:each) do
  #  GC.disable
  #  DatabaseCleaner.start
  #end
  #
  #config.after(:each) do
  #  GC.enable
  #  DatabaseCleaner.clean
  #end
end
