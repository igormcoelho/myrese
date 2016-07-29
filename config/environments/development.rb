Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # mailer configuration!
  config.action_mailer.default_url_options = { host: 'myrese.org', port: 80 }


  #require 'tlsmail'    
  #Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
  
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true
  config.action_mailer.smtp_settings = {
    :enable_starttls_auto => true,  
    :address            => 'smtp.gmail.com',
    :port               => 587,
    #:tls                  => true,
    #:domain             => 'gmail.com', #you can also use google.com
    # FOR GMAIL, YOU HAVE TO ALLOW 'LESS SECURE' APPLICATIONS IN YOUR PROFILE...
    :authentication     => :plain,
    :user_name          => ENV['GMAIL_USER'],
    :password           => ENV['GMAIL_PWD']
  }

  #host = 'localhost'#'myrese-imcoelho.c9.io'#'my_app.c9.io'
  #config.action_mailer.default_url_options = { host: host }
  #config.action_mailer.delivery_method = :smtp
  #config.action_mailer.smtp_settings = {
  #  :address        => 'smtp.mailgun.org',
  #  :port           => '2525',
  #  :authentication => :plain, #
  #  :user_name      => 'postmaster@sandboxffe25c7e90eb4f5a83002148d5470ade.mailgun.org',
  #  :password       => 'xxxxxxxxxxxxxxxxxxx',
  #  :domain         => 'sandboxffe25c7e90eb4f5a83002148d5470ade.mailgun.org',
  #  :enable_starttls_auto => true  
  #}

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true
  #config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
