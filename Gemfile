source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
gem 'devise'

# cron support for rails
# added by Matt
gem 'whenever'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

##CUSTOMIZED

# nicer html templating than erb
gem 'haml'
gem 'haml-rails'

group :test, :development do 
  gem 'rspec-rails'
  # travis needs rake explicitly installed!
  gem 'rake'
  # sqlite3 for test / devel ; postgres for production
  gem 'sqlite3'
  gem "factory_girl_rails", "~> 4.0"
  # show our test coverage
  gem 'simplecov', require: false
  # flog and flay to test complexity quickly and locally
  gem 'flog'
  gem 'flay'
end

group :production do
  # sqlite3 for test / devel ; postgres for production
  gem 'pg'
end

# upload book covers
gem 'carrierwave'
# process images
gem 'rmagick', require: false
