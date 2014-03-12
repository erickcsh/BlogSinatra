require 'rack/test'
require 'capybara/rspec'
require 'database_cleaner'
require 'bundler/setup'
require_relative '../app.rb'

Sinatra::Application.environment = :test
Bundler.require :default, Sinatra::Application.environment
Capybara.app = Sinatra::Application

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include RSpecMixin

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
