ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'lib/love.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'coveralls'
require 'simplecov'
require 'dm-rspec'
require 'database_cleaner'

def create_products
  Product.create(:brand => "Pågen", :product_name => "Lingongrova", :category => "Mörkt bröd", :barcode => "1212526767676", :sugar_content_gram => 8.6)
  Product.create(:brand => "Pågen", :product_name => "Tekaka", :category => "Ljust bröd", :barcode => "1212526767677", :sugar_content_gram => 11.2)
  Product.create(:brand => "Pågen", :product_name => "Rågbröd", :category => "Mörkt bröd", :barcode => "1212526767678", :sugar_content_gram => 4.2)
  Product.create(:brand => "Pågen", :product_name => "Rostbröd", :category => "Ljust bröd", :barcode => "1212526767679", :sugar_content_gram => 15.2)
end

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


  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
