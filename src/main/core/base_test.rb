require 'selenium-webdriver'
require 'test/unit'
require_relative 'driver/custom_driver'
module Test
  class BaseTest < Test::Unit::TestCase

    BASE_URL = 'http://partner.reformart.ru/user/login/'

    def setup

      $driver = CustomDriver.get_driver
      $wait = Selenium::WebDriver::Wait.new(:timeout => 15)
      $driver.get BASE_URL

    end

    def teardown
      $driver.quit
    end
  end
end
