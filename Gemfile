source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby "2.4.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.0.2"
gem "pg"
# Use Puma as the app server
gem "puma", "~> 3.0"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby
gem "execjs"
# Use jquery as the JavaScript library
gem "jquery-rails"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# A Rails 5 dependency for Active Admin
gem "inherited_resources", git: "https://github.com/activeadmin/inherited_resources"
# Active Admin
gem "activeadmin", git: "https://github.com/activeadmin/activeadmin"
gem "devise"
gem "google_drive"
gem "ckeditor"

# Paperclip setup
gem "aws-sdk"
gem "paperclip"

gem "simple_form"
gem "client_side_validations"
gem "client_side_validations-simple_form"
gem "bootstrap-datepicker-rails"
gem "twitter-bootstrap-rails"
gem "country_select"
gem "mandrill-api"
gem "intercom-rails"
gem "omniauth-facebook"
gem "draper", "3.0.0.pre1"

gem "momentjs-rails", "~> 2.9",  :github => "derekprior/momentjs-rails"
gem "datetimepicker-rails", github: "zpaulovics/datetimepicker-rails", branch: "master", submodules: true

gem "wicked_pdf"
gem "wkhtmltopdf-binary"

#allow seeding data in staging and dev
group :development, :test, :staging do
  gem "faker"
  gem "factory_girl_rails"
end

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platform: :mri
  gem "dotenv-rails"
  gem "pry-rails"
  gem "pry"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "letter_opener"
end

group :test do
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'turnip'
  gem 'poltergeist'
  gem 'phantomjs', :require => 'phantomjs/poltergeist'
  gem 'capybara-screenshot'
end
