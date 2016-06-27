ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'

require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'
require 'ffaker'
require 'factory_girl_rails'
require 'database_cleaner'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.mock_with :rspec

  config.before(:suite) do
    FactoryGirl.lint
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
  config.around(:each) do |example|
   DatabaseCleaner.cleaning do
    example.run
   end
  end

  config.before(:suite) do
    $site = FactoryGirl.create(:site)
  end
end
