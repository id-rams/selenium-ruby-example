require 'selenium-webdriver'
require_relative '../core/base_test'


class LoginPage
  def login (login, password)
    $driver.find_element(:id, 'userEmail').send_key login
    $driver.find_element(:id, 'userPassword').send_key password
    $driver.find_element(:css, '.btn.btn-default').click
  end

  def wait_link_log_out
    $wait.until { $driver.find_element(:xpath, "//a[@href='/user/logout']").displayed? }
  end

  def error_login_message
    $wait.until { $driver.find_element(:css, '.col-sm-6 .alert.alert-danger') }
  end
end