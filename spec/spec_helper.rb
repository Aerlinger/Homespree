require 'rubygems'
require 'spork'

#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'


Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'
  require 'capybara/rails'
  require 'rspec/autorun'

  module ::RSpec::Core
    class ExampleGroup
      include Capybara::DSL
      include Capybara::RSpecMatchers
    end
  end

  require 'simplecov'
  SimpleCov.start 'rails'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec
    require 'mobylette/helmet'

    config.include ActionView::TestCase::Behavior, example_group: {file_path: %r{spec/presenters}}
    config.include FactoryGirl::Syntax::Methods

    config.include Mobylette::Helmet, :type => :controller
    config.include Devise::TestHelpers, :type => :controller

    config.order = "random"
    config.mock_with :rspec
    config.use_transactional_fixtures = false
    config.infer_base_class_for_anonymous_controllers = false
    config.run_all_when_everything_filtered = true
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run :focus => true

    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end
  end

end

Spork.each_run do
  FactoryGirl.reload
end
