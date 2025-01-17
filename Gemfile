source 'https://rubygems.org'

gem 'rails', '6.0.3.2'

# ==============================================================================
# gems supporting backward-compatibility with Rails 2 conventions:
gem 'rails-observers'
gem 'edge_rider'
# ==============================================================================

gem 'mysql2'

# production app server
gem 'passenger', '~> 6.0'
gem 'nokogiri'
gem 'curb', '0.9.11'
gem 'http_headers', '0.0.2.3'
gem 'geokit', '1.10.0', :require => 'geokit'
gem 'geokit-rails'
gem 'will_paginate', :require => 'will_paginate'
gem 'amatch', '0.2.11'
gem 'indefinite_article'
gem 'titleize' #updates ActiveSupport titleize with stop word support
gem 'rubyzip'
gem 'zip-zip' # will load compatibility for old rubyzip API.
gem 'fog-aws'
gem 'formtastic', "~> 2.1"
gem 'json'
gem 'ym4r', '0.6.1'
gem 'ffi-hunspell'
gem 'sassc', '2.1.0'

gem 'honeybadger', '~> 2.7.2'
gem 'sitemap_generator', '~> 1.5.0'

gem 'paperclip'
 # required by paperclip but unspecified version - this ensures a comptible version
gem 'mime-types', '~> 1.25', '>= 1.25.1'
gem 'aws-sdk-s3'
gem 'aws-sdk-cloudfront'
gem 'stevedore', '0.3.0'

# fork of delynn/userstamp plugin
gem 'activerecord-userstamp', git: 'https://github.com/criticaljuncture/userstamp', branch: 'rails_six'

gem 'active_hash', '~> 2.0'
gem 'acts_as_list'
gem 'bcrypt'
gem 'bootstrap-sass', '2.3.2.2'
gem 'will_paginate-bootstrap', '0.2.5'
gem 'authlogic'
gem 'bootsnap'
gem 'jquery-rails'

gem 'elasticsearch-persistence', '~> 7.0'

# wrapper around http requests that supports multiple backends
gem 'faraday'
# make multiple http requests concurrently
gem 'typhoeus', '~> 1.0', '>= 1.0.1'
gem 'ransack'
gem 'klarlack', '0.0.7',
  git: 'https://github.com/criticaljuncture/klarlack.git',
  ref: 'f4c9706cd542046e7e37a4872b3a272b57cbb31b'

gem "amazon-ec2", :require => false
gem 'popen4'

gem "net-scp", '1.1.0'
gem "net-ssh", '2.9.1'

gem "resque"
gem 'redis'
gem 'resque-throttler',
    git: 'https://github.com/criticaljuncture/resque-throttler.git',
    branch: 'master',
    require: 'resque/throttler'
# gem "resque-retry", '1.5.3'
# gem "resque-scheduler", '4.3.1'
gem 'sidekiq', '~> 5.2.9'
gem "sidekiq-throttled"

gem "httparty"
gem "httmultiparty", '~> 0.3.13'

gem "recaptcha", "0.3.1", :require => 'recaptcha/rails'
gem 'sendgrid'
gem 'modularity'
gem 'rdoc'
gem 'net-sftp'
gem 'diffy'
gem 'terrapin'
gem 'hoe'

# cron jobs
gem 'whenever', require: false

gem 'app_config', "=1.3.2",
  :git => 'https://github.com/fredwu/app_config.git',
  :branch => :master

gem 'googleauth'
# lock googleauth dependency to compatible version
gem 'addressable', '2.4.0'

gem 'memoist'

gem 'american_date'

# add methods to the ruby Process command via C-extensions
# (tracking memory usage)
gem 'proc-wait3'

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

gem 'open_calais'

gem 'uglifier'
gem 'sass-rails'
gem 'xmlrpc'
gem 'rinku'

gem 'fast_jsonapi'

group :test do
  gem 'factory_girl', '~> 2.5.2'
  gem 'timecop'
  gem 'mock_redis'
  gem 'vcr'
  gem 'fakeweb'
end

group :development do
  gem 'rubocop'
  gem 'better_errors'
  gem "binding_of_caller"
  gem 'listen' # Used for config.file_watcher
  gem 'letter_opener_web'
end

group :development, :test do
  gem 'pry'
  gem 'pry-remote'
  gem 'rspec-rails', '~> 3.6'
end
