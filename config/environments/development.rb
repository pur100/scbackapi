Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end


  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # config.action_mailer.raise_delivery_errors = true

  # config.action_mailer.delivery_method = :smtp

  # config.action_mailer.smtp_settings = {
  #   address: "smtp.gmail.com",
  #   port: 587,
  #   domain: "gmail.com",
  #   authentification: "plain",
  #   enable_starttls_auto: true,
  #   user_name: ENV["GMAIL_USERNAME"],
  #   user_password: ENV["GMAIL_PASSWORD"]
  # }

  # config.action_mailer.default_url_options = { :host => "localhost:3000" }

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load
end
