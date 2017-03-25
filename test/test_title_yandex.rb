require 'selenium-webdriver'
require 'test/unit'
require 'os'
module Test
  class TestTitleYandex < Test::Unit::TestCase

    PATH_CHROME_WIN = 'resources\browser_driver\chromedriver.exe'
    PATH_CHROME_LINUX = 'resources\browser_driver\chromedriver'
    BASE_URL = 'https://ya.ru/'

    def setup
      Selenium::WebDriver::Chrome.driver_path = path_chrome
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

    def path_chrome
      if OS.windows?
        PATH_CHROME_WIN
      else
        PATH_CHROME_LINUX
      end
    end
  end
end
