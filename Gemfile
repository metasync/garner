# frozen_string_literal: true

source 'http://rubygems.org'

git_source(:metasync) do |repo_name|
  "https://github.com/metasync/#{repo_name}.git"
end

# gem 'garnet', metasync: 'garnet', '~> 0.1'
gem 'garnet', path: '/gems/garnet'

gem 'pg', '~> 1.5'
gem 'tiny_tds', '~> 2.1'

gem 'async', '~> 2.8'

group :development do
  gem 'rubocop', '~> 1.60'
  # gem 'rubocop-rspec', '~> 2.20'
end
