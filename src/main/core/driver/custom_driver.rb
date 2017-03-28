require 'selenium-webdriver'

class CustomDriver

  def self.get_driver
    if ENV['driver'].eql? 'phantom'
      phantom_driver
    else
      chrome_driver
    end
  end

  def self.chrome_driver
    Selenium::WebDriver::Chrome.driver_path ='../../resources/browser_driver/chromedriver.exe'
    Selenium::WebDriver.for :chrome, switches: %w[--ignore-certificate-errors --disable-popup-blocking]
  end

  def self.phantom_driver
    Selenium::WebDriver.for :phantomjs
  end
end