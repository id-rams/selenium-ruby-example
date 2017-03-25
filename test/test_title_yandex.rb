require 'selenium-webdriver'
require 'test/unit'

module Test
  class TestTitleYandex < Test::Unit::TestCase
    BASE_URL = 'https://ya.ru/'

    def setup
      @driver = Selenium::WebDriver.for :phantomjs
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
