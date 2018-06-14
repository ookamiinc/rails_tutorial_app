# frozen_string_literal: true

source 'https://rubygems.org'

gem 'bcrypt', '3.1.11'
gem 'bootstrap-sass', '3.3.7'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'carrierwave',             '1.2.2'
gem 'coffee-rails', '4.2.2'
gem 'dotenv-rails' # 環境変数を簡単に利用できるgem
gem 'faker', '1.7.3'
gem 'jbuilder',     '2.7.0'
gem 'jquery-rails', '4.3.1'
gem 'mini_magick', '4.7.0'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'puma', '3.9.1'
gem 'rails', '5.1.6'
gem 'sass-rails', '5.0.6'
gem 'turbolinks', '5.0.1'
gem 'uglifier', '3.2.0'
gem 'will_paginate', '3.1.6'

group :development, :test do
  gem 'byebug',  '9.0.6', platform: :mri
  gem 'sqlite3', '1.3.13'
end

group :development do
  gem 'listen', '3.1.5'
  gem 'rubocop', require: false # <--追加
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'web-console',           '3.5.1'
end

group :test do
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
  gem 'minitest-reporters',       '1.1.14'
  gem 'rails-controller-testing', '1.0.2'
end

group :production do
  gem 'fog', '1.42'
  gem 'pg', '0.20.0'
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
