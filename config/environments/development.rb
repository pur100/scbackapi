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

  config.active_storage.service = :cloudinary


  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # MAILER

  config.action_mailer.delivery_method = :smtp

  # FOR PROD
  #host = 'http://localhost:3000/' #replace with your own url
  #config.action_mailer.default_url_options = { host: host }

  # FOR DEV
  host = 'localhost:3000'
  config.action_mailer.default_url_options = { :host => 'localhost:3000', protocol: 'http' }

  # SMTP settings for gmail
  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :user_name            => "h.g.mancini@gmail.com",
    :password             => "qtjawrbknpneyvcj",
    :authentication       => "plain",
    :enable_starttls_auto => true
  }



  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load
end
