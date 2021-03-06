Homespree::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false
  config.eager_load = false

  config.serve_static_assets = true

  # Care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "myhomespree.com",
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: ENV["GMAIL_USERNAME"],
    password: ENV["GMAIL_PASSWORD"]
  }
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  #config.after_initialize do
  #  Bullet.enable = true
  #  Bullet.alert = true
  #  Bullet.bullet_logger = true
  #  Bullet.console = true
  #
  #  Bullet.rails_logger = true
  #  Bullet.airbrake = true
  #end
end
