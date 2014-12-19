require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'rspec'
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'utils')

Capybara.default_driver = :selenium
Capybara.default_wait_time = 10
Capybara.app_host = "http://www.lazada.vn"
Capybara.configure do |config|
  config.javascript_driver = :selenium
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

After do 
	Capybara.reset_sessions!
end
