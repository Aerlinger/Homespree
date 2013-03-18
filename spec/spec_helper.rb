require 'rubygems'
require 'spork'

#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'
  require 'rspec/autorun'
  require 'mobylette/helmet'

  require 'simplecov'
  SimpleCov.start 'rails'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  module ::RSpec::Core
    class ExampleGroup
      include Capybara::DSL
      include Capybara::RSpecMatchers
    end
  end

  RSpec.configure do |config|
    config.mock_with :rspec
    config.include Mobylette::Helmet, :type => :controller
    config.include ActionView::TestCase::Behavior, example_group: {file_path: %r{spec/presenters}}
    config.include FactoryGirl::Syntax::Methods

    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"
    config.run_all_when_everything_filtered = true
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run :focus => true
  end
end

Spork.each_run do
  FactoryGirl.reload
end
