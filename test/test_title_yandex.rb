require 'selenium-webdriver'
require 'test/unit'
module Test
  class TestTitleYandex < Test::Unit::TestCase

    PATH_CHROME = 'resources\browser_driver\chromedriver.exe'

    BASE_URL = 'https://ya.ru/'

    def setup
      Selenium::WebDriver::Chrome.driver_path = PATH_CHROME
      @driver = Selenium::WebDriver.for :chrome
      @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
      @driver.get BASE_URL
    end

    def teardown
      @driver.quit
    end

    def test_page_title
      @wait.until do
        element = @driver.find_element(:id, 'text')
        element if element.displayed?
      end
      assert_equal @driver.title, 'Яндекс'
    end

  end
end
