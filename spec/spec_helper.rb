ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'lib/love.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'webmock/rspec'
require 'coveralls'
require 'simplecov'
require 'dm-rspec'
require 'database_cleaner'

WebMock.disable_net_connect!(allow_localhost: true)

SimpleCov.formatters = [
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

Capybara.app = Love

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include DataMapper::Matchers
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before(:each) do
    stub_request(:any, /api.dabas.com/).to_rack(FakeDabas)
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end

# Required to test basic HTTP authorization (near the top in love_feature_spec.rb)
def basic_auth(user, password)
  encoded_login = ["#{user}:#{password}"].pack("m*")
  page.driver.header 'Authorization', "Basic #{encoded_login}"
end
