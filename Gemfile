source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.0'

gem 'rails', '~> 6.0.6', '>= 6.0.6.1'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 4.1'
gem 'bootsnap', '>= 1.4.2', require: false
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'faraday', '~> 2.9.0'
gem 'opentelemetry-sdk', '~> 1.4.0'
gem 'opentelemetry-exporter-otlp', '~> 0.26.3'
gem 'opentelemetry-instrumentation-all', '~> 0.56.0'
gem 'psych', '< 4'
