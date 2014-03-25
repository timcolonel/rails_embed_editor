source 'https://rubygems.org'

gemspec path: '..'

gem 'rails', github: 'rails/rails', branch: '4-0-stable'

platforms :ruby do
  gem 'sqlite3'
end

gem 'jquery-rails'

gem 'turbolinks'

gem 'coveralls', '>= 0', require: false
