source 'https://rubygems.org'



# https://github.com/Eric-Guo/where-or
#gem 'where-or' # backport from Rails 5 to Rails 4.2

#gem 'httparty'

gem 'bootstrap-sass', '~> 3.3.6'

gem "paperclip", '4.3.7' #"~> 5.0.0"
#gem "paperclip", "~> 5.0.0.beta1"
#gem "paperclip", git: "git://github.com/thoughtbot/paperclip.git"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7.1'

#gem 'tlsmail'

gem 'mailgun_rails'

gem 'devise', '4.2.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'

gem 'postgresql' # why?

gem "recaptcha", require: "recaptcha/rails"

#gem 'ssl_requirement'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.

group :doc do
  gem 'sdoc', '~> 0.4.0'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'web-console', '3.1.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  #gem 'web-console', '~> 2.0'
  #gem 'puma', '2.11.1'
  #gem 'passenger'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'pg'
  gem 'puma', '2.11.1'
end
