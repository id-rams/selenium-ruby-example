require 'selenium-webdriver'
require 'test/unit'
require_relative '../../src/main/core/base_test'
require_relative '../../src/main/login_page/login_page'

module Test
  class TestLogin < BaseTest
    def test_success_login
      login_page = LoginPage.new
      login_page.login 'bons_@mail.ru', '123123'
      login_page.wait_link_log_out
      assert_equal $driver.title, 'Профиль компании', 'Title page is not correct!'
    end

    def test_error_login
      login_page = LoginPage.new
      login_page.login 'bons_@mail.ru', '123'
      error_message = login_page.error_login_message
      assert_equal error_message.text, 'Адрес электронной почты или пароль указаны неверно', 'Message about error login is not correct!'
    end
  end
end
