source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

#social share buttons
gem 'social-share-button'
#friendly_id
gem 'friendly_id', '~> 5.2.4'
#translate routes
gem 'route_translator'
#charts
gem "chartkick"
gem 'groupdate'
#ahoy
gem 'ahoy_matey'
#plyr
gem 'plyr-rails'
#font awesome
gem "font-awesome-rails"
#faker
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
#paginate kaminari
gem 'kaminari'
#fuzzy-string-match
gem "fuzzy-string-match"
#meta tags
gem 'meta-tags'
#mini_magick
gem "mini_magick"
#AWS for storage
gem "aws-sdk-s3", require: false
#TinyMCE
#gem 'tinymce-rails'
#devise I18n
gem 'devise-i18n'
# rails I18n
gem 'rails-i18n'
#simple form
gem "simple_form", ">= 5.0.0"
#devise
#gem 'devise', '~> 4.6.2' REMOVED BECAUSE OF VULNERABILITY
gem "devise", ">= 4.7.1"
# jQuery
#gem 'jquery-rails'
# Bootstrap
#gem 'bootstrap', '~> 4.3.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0.rc2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'exception_handler', '~> 0.8.0.0'
gem 'sitemap_generator'

gem "rubyzip", ">= 1.3.0"
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.8'
  gem "capybara-webkit"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
